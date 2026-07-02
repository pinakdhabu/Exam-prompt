/**
 * Cache Manager for Exam Prompt
 * Handles TTL-based caching for expensive operations:
 * - PYQ analysis results
 * - University detection
 * - Document OCR/extraction
 * - Skill outputs
 *
 * Stores in: ~/.exam-prompt/cache/
 * Format: JSON with metadata (created_at, expires_at, confidence)
 */

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const os = require('os');

const CACHE_DIR = path.join(os.homedir(), '.exam-prompt', 'cache');
const DEFAULT_TTL = 7 * 24 * 60 * 60 * 1000; // 7 days in ms

class CacheManager {
  constructor(options = {}) {
    this.ttl = options.ttl || DEFAULT_TTL;
    this.enabled = options.enabled !== false;
    this.debug = options.debug || false;
    this.ensureCacheDir();
  }

  /**
   * Ensure cache directory exists
   */
  ensureCacheDir() {
    if (!fs.existsSync(CACHE_DIR)) {
      fs.mkdirSync(CACHE_DIR, { recursive: true });
      if (this.debug) console.log(`[Cache] Created cache directory: ${CACHE_DIR}`);
    }
  }

  /**
   * Generate cache key from input + metadata
   * @param {string} skillName - Skill identifier
   * @param {object} params - Input parameters
   * @returns {string} Hash key
   */
  generateKey(skillName, params) {
    const input = `${skillName}:${JSON.stringify(params || {})}`;
    return crypto.createHash('sha256').update(input).digest('hex');
  }

  /**
   * Get cached result if valid
   * @param {string} skillName - Skill identifier
   * @param {object} params - Input parameters
   * @returns {object|null} Cached data or null if expired/missing
   */
  get(skillName, params) {
    if (!this.enabled) return null;

    const key = this.generateKey(skillName, params);
    const cacheFile = path.join(CACHE_DIR, `${key}.json`);

    if (!fs.existsSync(cacheFile)) {
      if (this.debug) console.log(`[Cache] MISS: ${skillName} (key: ${key.substring(0, 8)}...)`);
      return null;
    }

    try {
      const cached = JSON.parse(fs.readFileSync(cacheFile, 'utf8'));

      // Check expiration
      if (Date.now() > cached.expires_at) {
        fs.unlinkSync(cacheFile);
        if (this.debug) console.log(`[Cache] EXPIRED: ${skillName}`);
        return null;
      }

      if (this.debug) {
        const age = Math.round((Date.now() - cached.created_at) / 1000);
        console.log(`[Cache] HIT: ${skillName} (age: ${age}s, key: ${key.substring(0, 8)}...)`);
      }
      return cached.data;
    } catch (err) {
      if (this.debug) console.error(`[Cache] Error reading cache:`, err.message);
      return null;
    }
  }

  /**
   * Set cache entry
   * @param {string} skillName - Skill identifier
   * @param {object} params - Input parameters
   * @param {*} data - Data to cache
   * @param {object} options - TTL and metadata
   */
  set(skillName, params, data, options = {}) {
    if (!this.enabled) return;

    const key = this.generateKey(skillName, params);
    const ttl = options.ttl || this.ttl;
    const cacheFile = path.join(CACHE_DIR, `${key}.json`);

    const entry = {
      skill: skillName,
      key,
      data,
      created_at: Date.now(),
      expires_at: Date.now() + ttl,
      ttl_ms: ttl,
      confidence: options.confidence || 1.0,
      metadata: options.metadata || {}
    };

    try {
      fs.writeFileSync(cacheFile, JSON.stringify(entry, null, 2));
      if (this.debug) console.log(`[Cache] SET: ${skillName} (expires in ${Math.round(ttl / 1000 / 60)}m)`);
    } catch (err) {
      if (this.debug) console.error(`[Cache] Error writing cache:`, err.message);
    }
  }

  /**
   * Clear all cache or specific skill
   * @param {string} skillName - Optional skill name to clear only that skill
   */
  clear(skillName = null) {
    try {
      if (!fs.existsSync(CACHE_DIR)) return;

      const files = fs.readdirSync(CACHE_DIR);
      let cleared = 0;

      for (const file of files) {
        if (skillName) {
          // Check if file belongs to this skill
          const cached = JSON.parse(fs.readFileSync(path.join(CACHE_DIR, file), 'utf8'));
          if (cached.skill === skillName) {
            fs.unlinkSync(path.join(CACHE_DIR, file));
            cleared++;
          }
        } else {
          // Clear all
          fs.unlinkSync(path.join(CACHE_DIR, file));
          cleared++;
        }
      }

      if (this.debug) console.log(`[Cache] Cleared ${cleared} entries`);
    } catch (err) {
      if (this.debug) console.error(`[Cache] Error clearing cache:`, err.message);
    }
  }

  /**
   * Get cache stats
   * @returns {object} Cache statistics
   */
  stats() {
    try {
      if (!fs.existsSync(CACHE_DIR)) return { entries: 0, size_bytes: 0 };

      const files = fs.readdirSync(CACHE_DIR);
      let total_size = 0;
      let expired = 0;

      for (const file of files) {
        const stats = fs.statSync(path.join(CACHE_DIR, file));
        total_size += stats.size;

        const cached = JSON.parse(fs.readFileSync(path.join(CACHE_DIR, file), 'utf8'));
        if (Date.now() > cached.expires_at) {
          expired++;
        }
      }

      return {
        entries: files.length,
        expired_entries: expired,
        size_mb: (total_size / 1024 / 1024).toFixed(2),
        directory: CACHE_DIR
      };
    } catch (err) {
      return { error: err.message };
    }
  }

  /**
   * Cleanup expired entries
   * @returns {number} Number of entries cleaned
   */
  cleanup() {
    try {
      if (!fs.existsSync(CACHE_DIR)) return 0;

      const files = fs.readdirSync(CACHE_DIR);
      let cleaned = 0;

      for (const file of files) {
        const cacheFile = path.join(CACHE_DIR, file);
        const cached = JSON.parse(fs.readFileSync(cacheFile, 'utf8'));
        
        if (Date.now() > cached.expires_at) {
          fs.unlinkSync(cacheFile);
          cleaned++;
        }
      }

      if (this.debug) console.log(`[Cache] Cleaned up ${cleaned} expired entries`);
      return cleaned;
    } catch (err) {
      if (this.debug) console.error(`[Cache] Error during cleanup:`, err.message);
      return 0;
    }
  }
}

// Export singleton instance and class
const cacheManager = new CacheManager({ debug: process.env.EXAM_PROMPT_DEBUG === '1' });

module.exports = {
  CacheManager,
  cacheManager,
  CACHE_DIR
};
