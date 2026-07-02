/**
 * Session Context Manager for Exam Prompt
 * Persists user profile, university, subject, and preferences across skill calls
 * Location: ~/.exam-prompt/session.json
 */

const fs = require('fs');
const path = require('path');
const os = require('os');

const SESSION_FILE = path.join(os.homedir(), '.exam-prompt', 'session.json');
const SESSION_DIR = path.dirname(SESSION_FILE);

/**
 * Default session profile template
 */
const DEFAULT_SESSION = {
  version: '1.0.0',
  created_at: new Date().toISOString(),
  updated_at: new Date().toISOString(),
  
  // University & Exam Pattern
  university: null,
  exam_pattern: null, // SPPU_2019, SPPU_2024, VTU, JNTU, etc.
  subject: null,
  semester_or_year: null,
  
  // Syllabus & Papers
  paths: {
    syllabus_pdf: null,
    pyq_directory: null,
    notes_output: null,
    cache_directory: null
  },
  
  // User Preferences
  preferences: {
    default_marks_level: 4,
    preferred_diagram_format: 'mermaid', // mermaid or ascii
    citation_style: 'harvard',
    language: 'en',
    timezone: 'Asia/Kolkata'
  },
  
  // Project Metadata
  project: {
    name: null,
    description: null,
    repository_url: null
  },
  
  // Session Stats
  stats: {
    skills_used: [],
    total_operations: 0,
    created_items_count: 0
  }
};

class SessionContext {
  constructor() {
    this.sessionFile = SESSION_FILE;
    this.sessionDir = SESSION_DIR;
    this.context = this.load();
  }

  /**
   * Ensure session directory exists
   */
  ensureDirectory() {
    if (!fs.existsSync(this.sessionDir)) {
      fs.mkdirSync(this.sessionDir, { recursive: true });
    }
  }

  /**
   * Load session from file or create default
   */
  load() {
    this.ensureDirectory();

    if (fs.existsSync(this.sessionFile)) {
      try {
        const data = JSON.parse(fs.readFileSync(this.sessionFile, 'utf8'));
        return { ...DEFAULT_SESSION, ...data };
      } catch (err) {
        console.warn(`[Session] Error loading session: ${err.message}, creating new`);
        return { ...DEFAULT_SESSION };
      }
    }

    return { ...DEFAULT_SESSION };
  }

  /**
   * Save session to file
   */
  save() {
    this.ensureDirectory();
    this.context.updated_at = new Date().toISOString();

    try {
      fs.writeFileSync(this.sessionFile, JSON.stringify(this.context, null, 2));
    } catch (err) {
      console.error(`[Session] Error saving session: ${err.message}`);
    }
  }

  /**
   * Get full session context
   */
  getContext() {
    return this.context;
  }

  /**
   * Set university and pattern
   */
  setUniversity(university, pattern = null) {
    this.context.university = university;
    if (pattern) this.context.exam_pattern = pattern;
    this.save();
    return this;
  }

  /**
   * Set subject and semester
   */
  setSubject(subject, semesterOrYear = null) {
    this.context.subject = subject;
    if (semesterOrYear) this.context.semester_or_year = semesterOrYear;
    this.save();
    return this;
  }

  /**
   * Set file paths
   */
  setPaths(paths) {
    this.context.paths = { ...this.context.paths, ...paths };
    this.save();
    return this;
  }

  /**
   * Update preferences
   */
  setPreferences(prefs) {
    this.context.preferences = { ...this.context.preferences, ...prefs };
    this.save();
    return this;
  }

  /**
   * Log skill usage
   */
  logSkillUsage(skillName) {
    if (!this.context.stats.skills_used.includes(skillName)) {
      this.context.stats.skills_used.push(skillName);
    }
    this.context.stats.total_operations += 1;
    this.save();
  }

  /**
   * Get specific value by dot-notation path
   * Example: get('university') or get('preferences.citation_style')
   */
  get(path) {
    return this.getNestedValue(this.context, path);
  }

  /**
   * Set specific value by dot-notation path
   */
  set(path, value) {
    this.setNestedValue(this.context, path, value);
    this.save();
    return this;
  }

  /**
   * Helper: get nested value
   */
  getNestedValue(obj, path) {
    return path.split('.').reduce((acc, part) => acc && acc[part], obj);
  }

  /**
   * Helper: set nested value
   */
  setNestedValue(obj, path, value) {
    const parts = path.split('.');
    const last = parts.pop();

    let current = obj;
    for (const part of parts) {
      if (!current[part]) current[part] = {};
      current = current[part];
    }

    current[last] = value;
  }

  /**
   * Reset to defaults
   */
  reset() {
    this.context = { ...DEFAULT_SESSION };
    this.context.created_at = new Date().toISOString();
    this.save();
  }

  /**
   * Pretty print session
   */
  toString() {
    return JSON.stringify(this.context, null, 2);
  }
}

// Export singleton
const sessionContext = new SessionContext();

module.exports = {
  SessionContext,
  sessionContext,
  DEFAULT_SESSION,
  SESSION_FILE
};
