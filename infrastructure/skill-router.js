/**
 * Intelligent Skill Router
 * Auto-detects needed skills from user query using semantic understanding
 * and keyword matching, outputs ranked list with confidence scores
 */

const fs = require('fs');
const path = require('path');

class SkillRouter {
  constructor() {
    this.skillsRegistry = this.loadSkillsRegistry();
    this.queryPatterns = this.initializePatterns();
  }

  /**
   * Load skills from AGENTS.md or skills.json
   */
  loadSkillsRegistry() {
    try {
      const skillsPath = path.join(__dirname, '../skills/skills.json');
      if (fs.existsSync(skillsPath)) {
        return JSON.parse(fs.readFileSync(skillsPath, 'utf8')).skills || [];
      }
    } catch (err) {
      console.warn('[SkillRouter] Could not load skills registry:', err.message);
    }
    return [];
  }

  /**
   * Initialize query-to-skill pattern matching
   */
  initializePatterns() {
    return {
      // Answer-related
      answer: ['universal-a-plus-answer-writer', 0.95],
      'explain': ['universal-a-plus-answer-writer', 0.9],
      'question': ['universal-a-plus-answer-writer', 0.85],
      'define': ['universal-a-plus-answer-writer', 0.85],
      'describe': ['universal-a-plus-answer-writer', 0.85],

      // Notes-related
      notes: ['universal-notes-generator', 0.95],
      'study material': ['universal-notes-generator', 0.9],
      'summary': ['universal-notes-generator', 0.85],
      'study guide': ['universal-notes-generator', 0.9],

      // PYQ Analysis
      'past paper': ['universal-pyq-analyzer', 0.95],
      'past year': ['universal-pyq-analyzer', 0.95],
      'pyq': ['universal-pyq-analyzer', 0.95],
      'previous year': ['universal-pyq-analyzer', 0.95],
      'important topic': ['universal-pyq-analyzer', 0.9],
      'analyze pap': ['universal-pyq-analyzer', 0.85],
      'past question': ['universal-pyq-analyzer', 0.9],
      'year papers': ['universal-pyq-analyzer', 0.85],

      // Important topics
      'imp topic': ['universal-imp-topics-generator', 0.95],
      'important': ['universal-imp-topics-generator', 0.85],
      'what to study': ['universal-imp-topics-generator', 0.9],
      'preparation strategy': ['universal-imp-topics-generator', 0.85],

      // Study planning
      'study plan': ['universal-study-planner', 0.95],
      'schedule': ['universal-study-planner', 0.85],
      'time table': ['universal-study-planner', 0.85],
      'prepare for': ['universal-study-planner', 0.8],

      // MCQ Practice
      'mcq': ['universal-mcq-practice-generator', 0.95],
      'multiple choice': ['universal-mcq-practice-generator', 0.95],
      'objective': ['universal-mcq-practice-generator', 0.85],
      'practice question': ['universal-mcq-practice-generator', 0.8],

      // Assignments
      'assignment': ['universal-assignment-writer', 0.95],
      'project proposal': ['universal-assignment-writer', 0.9],
      'research paper': ['universal-assignment-writer', 0.85],
      'literature review': ['universal-assignment-writer', 0.85],

      // Exam paper
      'question paper': ['universal-exam-paper-generator', 0.95],
      'exam paper': ['universal-exam-paper-generator', 0.95],
      'generate paper': ['universal-exam-paper-generator', 0.9],

      // Last minute
      'last minute': ['universal-last-minute-crammer', 0.95],
      'emergency': ['universal-last-minute-crammer', 0.9],
      '1 hour': ['universal-last-minute-crammer', 0.85],
      '3 hour': ['universal-last-minute-crammer', 0.85],

      // Flashcards
      'flashcard': ['universal-flashcard-generator', 0.95],
      'anki': ['universal-flashcard-generator', 0.9],
      'quizlet': ['universal-flashcard-generator', 0.85],

      // Diagrams
      'diagram': ['universal-diagram-generator', 0.95],
      'flowchart': ['universal-diagram-generator', 0.85],
      'architecture': ['universal-diagram-generator', 0.85],

      // Formula sheets
      'formula': ['universal-formula-sheet-generator', 0.95],
      'reference sheet': ['universal-formula-sheet-generator', 0.85],

      // Case studies
      'case study': ['universal-case-study-solver', 0.95],
      'scenario': ['universal-case-study-solver', 0.85],

      // Grading
      'grade': ['universal-essay-grader', 0.95],
      'evaluate': ['universal-essay-grader', 0.9],
      'check answer': ['universal-essay-grader', 0.85],

      // Lab reports
      'lab report': ['universal-lab-report-writer', 0.95],
      'experiment': ['universal-lab-report-writer', 0.85],

      // Viva prep
      'viva': ['universal-viva-oral-exam-prep', 0.95],
      'oral exam': ['universal-viva-oral-exam-prep', 0.95],
      'interview': ['universal-viva-oral-exam-prep', 0.85],

      // Document processing
      'pdf': ['universal-document-reader', 0.85],
      'extract text': ['universal-document-reader', 0.9],

      // PDF generation
      'convert pdf': ['universal-document-generator', 0.95],
      'print': ['universal-document-generator', 0.85],
    };
  }

  /**
   * Route user query to appropriate skill(s)
   * @param {string} query - User's natural language query
   * @returns {array} Array of recommended skills with confidence scores
   */
  route(query) {
    if (!query || typeof query !== 'string') {
      return [];
    }

    const queryLower = query.toLowerCase();
    const scores = {};

    // Keyword matching
    for (const [pattern, [skill, confidence]] of Object.entries(this.queryPatterns)) {
      if (queryLower.includes(pattern)) {
        scores[skill] = (scores[skill] || 0) + confidence;
      }
    }

    // Multi-word pattern matching
    const multiPatterns = [
      { pattern: ['exam', 'prep', 'days'], skill: 'universal-study-planner', conf: 0.9 },
      { pattern: ['exam', 'answer'], skill: 'universal-a-plus-answer-writer', conf: 0.85 },
      { pattern: ['past', 'paper', 'analysis'], skill: 'universal-pyq-analyzer', conf: 0.9 },
      { pattern: ['quick', 'reference'], skill: 'universal-cheat-sheet-generator', conf: 0.85 },
      { pattern: ['study', 'material'], skill: 'universal-notes-generator', conf: 0.85 },
    ];

    for (const { pattern, skill, conf } of multiPatterns) {
      let matches = 0;
      for (const word of pattern) {
        if (queryLower.includes(word)) matches++;
      }
      if (matches === pattern.length) {
        scores[skill] = (scores[skill] || 0) + conf;
      }
    }

    // Convert to sorted array
    const recommendations = Object.entries(scores)
      .map(([skill, score]) => ({
        skill,
        confidence: Math.min(score, 1.0),
        reason: this.getReasonForSkill(skill, queryLower)
      }))
      .sort((a, b) => b.confidence - a.confidence);

    return recommendations;
  }

  /**
   * Get reason for skill recommendation
   */
  getReasonForSkill(skill, query) {
    const reasons = {
      'universal-a-plus-answer-writer': 'Matches exam answer keywords',
      'universal-notes-generator': 'Matches study material keywords',
      'universal-pyq-analyzer': 'Matches PYQ analysis keywords',
      'universal-imp-topics-generator': 'Matches important topics keywords',
      'universal-study-planner': 'Matches preparation planning keywords',
      'universal-mcq-practice-generator': 'Matches MCQ practice keywords',
    };
    return reasons[skill] || 'Skill match found';
  }

  /**
   * Smart workflow recommendation
   * Suggests multi-step workflows based on query
   */
  suggestWorkflow(query) {
    const routes = this.route(query);
    if (routes.length === 0) return null;

    const topSkill = routes[0].skill;

    // Map skills to workflows
    const workflows = {
      'universal-pyq-analyzer': [
        'universal-document-reader',
        'universal-pyq-analyzer',
        'universal-imp-topics-generator',
        'universal-study-planner'
      ],
      'universal-a-plus-answer-writer': [
        'universal-pyq-analyzer',
        'universal-a-plus-answer-writer',
        'universal-essay-grader'
      ],
      'universal-notes-generator': [
        'universal-notes-generator',
        'universal-flashcard-generator',
        'universal-mind-map-generator'
      ],
    };

    return workflows[topSkill] || [topSkill];
  }

  /**
   * Get all available skills
   */
  getAvailableSkills() {
    return this.skillsRegistry.map(s => ({
      name: s.name,
      description: s.description,
      directory: s.directory
    }));
  }
}

module.exports = {
  SkillRouter
};

// CLI for testing
if (require.main === module) {
  const router = new SkillRouter();
  const testQueries = [
    'I need to prepare for DSA exam in 10 days',
    'Explain ACID properties [6 marks]',
    'Analyze my past year papers',
    'Generate MCQ practice questions',
  ];

  console.log('🎯 Skill Router Test\n');
  for (const query of testQueries) {
    console.log(`Query: "${query}"`);
    const routes = router.route(query);
    const workflow = router.suggestWorkflow(query);
    console.log(`Recommendations:`, routes);
    console.log(`Workflow:`, workflow);
    console.log();
  }
}
