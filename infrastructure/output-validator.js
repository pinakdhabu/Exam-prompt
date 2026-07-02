/**
 * Output Validator for Exam Prompt Skills
 * Uses JSON Schema (AJV) to validate skill outputs
 * Catches hallucinations and format violations
 */

const Ajv = require('ajv');
const ajv = new Ajv({ strict: false });

/**
 * Universal Answer Writer Output Schema
 */
const ANSWER_WRITER_SCHEMA = {
  $schema: 'http://json-schema.org/draft-07/schema#',
  type: 'object',
  properties: {
    answer_text: {
      type: 'string',
      minLength: 50,
      description: 'Direct answer text without preamble'
    },
    marks_expected: {
      type: 'number',
      minimum: 1,
      maximum: 100,
      description: 'Expected marks this answer should fetch'
    },
    diagram_mermaid: {
      type: ['string', 'null'],
      description: 'Optional Mermaid diagram code'
    },
    diagram_ascii: {
      type: ['string', 'null'],
      description: 'Optional ASCII art diagram'
    },
    example_provided: {
      type: 'boolean',
      description: 'Whether answer includes concrete example'
    },
    structure: {
      type: 'string',
      enum: [
        'definition_only',
        'definition_points',
        'definition_points_diagram',
        'definition_points_diagram_example',
        'points_only',
        'comparison_table',
        'derivation',
        'numerical_solution',
        'design_proposal',
        'list_enumeration'
      ]
    },
    university_pattern: {
      type: 'string',
      description: 'SPPU_2019, SPPU_2024, VTU, etc.'
    },
    word_count: {
      type: 'number',
      minimum: 10
    }
  },
  required: ['answer_text', 'marks_expected', 'structure', 'word_count']
};

/**
 * Notes Generator Output Schema
 */
const NOTES_GENERATOR_SCHEMA = {
  $schema: 'http://json-schema.org/draft-07/schema#',
  type: 'object',
  properties: {
    notes_markdown: {
      type: 'string',
      minLength: 200,
      description: 'Complete study notes in Markdown'
    },
    format_type: {
      type: 'string',
      enum: [
        'bullet_points',
        'numbered_paragraphs',
        'definitions_and_notes',
        'concept_map_text',
        'question_answer',
        'comparison_tables',
        'visual_summary',
        'formula_reference',
        'timeline',
        'flowchart_text'
      ]
    },
    topics_covered: {
      type: 'array',
      items: { type: 'string' },
      minItems: 3,
      description: 'List of topics included'
    },
    estimated_read_time_mins: {
      type: 'number',
      minimum: 5
    },
    difficulty_level: {
      type: 'string',
      enum: ['beginner', 'intermediate', 'advanced']
    },
    university_pattern: {
      type: 'string'
    }
  },
  required: ['notes_markdown', 'format_type', 'topics_covered', 'estimated_read_time_mins']
};

/**
 * PYQ Analyzer Output Schema
 */
const PYQ_ANALYZER_SCHEMA = {
  $schema: 'http://json-schema.org/draft-07/schema#',
  type: 'object',
  properties: {
    analysis_summary: {
      type: 'string',
      minLength: 100
    },
    papers_analyzed: {
      type: 'number',
      minimum: 1
    },
    unit_wise_frequency: {
      type: 'object',
      additionalProperties: { type: 'number' }
    },
    mark_distribution: {
      type: 'object',
      properties: {
        '1_mark': { type: 'number' },
        '2_mark': { type: 'number' },
        '4_mark': { type: 'number' },
        '6_mark': { type: 'number' },
        '10_mark': { type: 'number' }
      }
    },
    blooms_distribution: {
      type: 'object',
      additionalProperties: { type: 'number' }
    },
    imp_topics: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          topic: { type: 'string' },
          frequency: { type: 'number' },
          probability: { type: 'number', minimum: 0, maximum: 1 }
        }
      },
      minItems: 5
    }
  },
  required: ['analysis_summary', 'papers_analyzed', 'unit_wise_frequency', 'imp_topics']
};

/**
 * Assignment Writer Output Schema
 */
const ASSIGNMENT_WRITER_SCHEMA = {
  $schema: 'http://json-schema.org/draft-07/schema#',
  type: 'object',
  properties: {
    assignment_content: {
      type: 'string',
      minLength: 300
    },
    assignment_type: {
      type: 'string',
      enum: ['theory', 'numerical', 'case_study', 'research', 'design', 'project_proposal']
    },
    marking_scheme: {
      type: 'object',
      additionalProperties: { type: 'number' },
      description: 'Criterion -> marks mapping'
    },
    submission_format: {
      type: 'string'
    },
    estimated_hours: {
      type: 'number',
      minimum: 0.5
    }
  },
  required: ['assignment_content', 'assignment_type', 'marking_scheme']
};

/**
 * Exam Paper Generator Output Schema
 */
const EXAM_PAPER_SCHEMA = {
  $schema: 'http://json-schema.org/draft-07/schema#',
  type: 'object',
  properties: {
    question_paper: {
      type: 'string',
      minLength: 500
    },
    total_questions: {
      type: 'number',
      minimum: 5
    },
    total_marks: {
      type: 'number',
      minimum: 50
    },
    marking_scheme: {
      type: 'object'
    },
    model_answers: {
      type: 'array',
      items: { type: 'string' }
    },
    university_pattern: {
      type: 'string'
    },
    duration_mins: {
      type: 'number'
    }
  },
  required: ['question_paper', 'total_questions', 'total_marks']
};

class OutputValidator {
  constructor() {
    this.schemas = {
      'universal-a-plus-answer-writer': ANSWER_WRITER_SCHEMA,
      'universal-notes-generator': NOTES_GENERATOR_SCHEMA,
      'universal-pyq-analyzer': PYQ_ANALYZER_SCHEMA,
      'universal-assignment-writer': ASSIGNMENT_WRITER_SCHEMA,
      'universal-exam-paper-generator': EXAM_PAPER_SCHEMA
    };

    this.validators = {};
    for (const [skill, schema] of Object.entries(this.schemas)) {
      this.validators[skill] = ajv.compile(schema);
    }
  }

  /**
   * Validate output against skill schema
   * @param {string} skillName - Skill identifier
   * @param {object} output - Output to validate
   * @returns {object} { valid: boolean, errors: array }
   */
  validate(skillName, output) {
    const validator = this.validators[skillName];

    if (!validator) {
      return {
        valid: false,
        errors: [`No schema registered for skill: ${skillName}`]
      };
    }

    const valid = validator(output);

    return {
      valid,
      errors: valid ? [] : validator.errors || [],
      skill: skillName
    };
  }

  /**
   * Validate and throw error if invalid
   * @param {string} skillName
   * @param {object} output
   */
  validateOrThrow(skillName, output) {
    const result = this.validate(skillName, output);
    if (!result.valid) {
      throw new Error(
        `[${skillName}] Output validation failed:\n` +
        result.errors.map(e => `  - ${e.instancePath || '.'}: ${e.message}`).join('\n')
      );
    }
    return output;
  }

  /**
   * Register custom schema for a skill
   * @param {string} skillName
   * @param {object} schema
   */
  registerSchema(skillName, schema) {
    this.schemas[skillName] = schema;
    this.validators[skillName] = ajv.compile(schema);
  }

  /**
   * Get registered schemas
   */
  getSchemas() {
    return Object.keys(this.schemas);
  }
}

module.exports = {
  OutputValidator,
  ANSWER_WRITER_SCHEMA,
  NOTES_GENERATOR_SCHEMA,
  PYQ_ANALYZER_SCHEMA,
  ASSIGNMENT_WRITER_SCHEMA,
  EXAM_PAPER_SCHEMA
};
