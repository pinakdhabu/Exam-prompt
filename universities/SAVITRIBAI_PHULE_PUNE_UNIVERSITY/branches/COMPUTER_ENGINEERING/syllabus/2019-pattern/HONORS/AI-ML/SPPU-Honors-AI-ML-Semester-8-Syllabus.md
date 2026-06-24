# SPPU B.E. Computer Engineering — Honors in AI & Machine Learning

## Semester VIII Syllabus (2019 Pattern)

---

## Course Structure — Semester VIII

| Course Code | Course Name                            |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | -------------------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 410303      | Natural Language Processing            |   3   |   —   |    3    |   30   |   70   |   100   |
| 410304      | Natural Language Processing Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                                        | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 410303: Natural Language Processing

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Examination:** ISA: 30 Marks, ESA: 70 Marks

**Prerequisites:** Machine Learning (410301), Deep Learning Fundamentals (310303)

### Course Objectives

- Understand linguistic fundamentals and text preprocessing techniques
- Learn statistical and neural approaches to language modeling
- Master modern NLP architectures including transformers

### Course Outcomes

| CO  | Description                                                |
| --- | ---------------------------------------------------------- |
| CO1 | Apply text preprocessing and feature extraction techniques |
| CO2 | Implement word embeddings and neural language models       |
| CO3 | Build sequence models for NLP tasks                        |
| CO4 | Apply transformer architectures for NLP                    |
| CO5 | Develop end-to-end NLP applications                        |

### Course Contents

#### Unit I: Text Processing and Linguistic Fundamentals (07 Hours)

- Regular Expressions, Text Normalization
- Tokenization: Word, Sentence, Subword (BPE, WordPiece)
- Stemming (Porter, Lancaster) and Lemmatization
- Part-of-Speech Tagging: HMM, CRF, TnT Tagger
- N-gram Language Models: Estimation, Smoothing (Laplace, Kneser-Ney)
- Text Classification: Naive Bayes, Logistic Regression

#### Unit II: Word Embeddings and Neural Language Models (07 Hours)

- Distributional Semantics: Distributional Hypothesis
- Word2Vec: CBOW, Skip-gram Architecture
- GloVe: Global Vectors for Word Representation
- FastText: Subword Information
- Evaluating Embeddings: Word Similarity, Analogy Tasks
- ELMo: Contextualized Embeddings

#### Unit III: Sequence Models for NLP (07 Hours)

- RNNs for Sequence Labeling: POS Tagging, NER
- LSTM and GRU: Architecture, Applications
- Bidirectional RNNs
- Sequence-to-Sequence Models: Encoder-Decoder Architecture
- Attention Mechanism: Bahdanau, Luong Attention
- Beam Search Decoding

#### Unit IV: Transformers and Pre-trained Models (07 Hours)

- Transformer Architecture: Self-Attention, Multi-Head Attention
- Positional Encoding, Layer Normalization
- BERT: Pre-training (Masked LM, NSP), Fine-tuning
- GPT: Autoregressive Pre-training, Zero/Few-Shot Learning
- RoBERTa, ALBERT, DistilBERT
- T5, BART: Text-to-Text Framework

#### Unit V: Information Extraction and Question Answering (07 Hours)

- Named Entity Recognition (NER): LSTM-CRF, BERT-based
- Relation Extraction: Pattern-based, Distant Supervision
- Coreference Resolution
- Question Answering: Extractive, Generative (SQuAD, Natural Questions)
- Text Summarization: Extractive, Abstractive

#### Unit VI: Advanced NLP Applications (07 Hours)

- Machine Translation: Statistical, Neural (Transformer-based)
- Sentiment Analysis: Aspect-based, Fine-grained
- Dialogue Systems: Retrieval-based, Generative, Task-oriented
- Text-to-Speech and Speech Recognition basics
- Large Language Models: Scaling Laws, Instruction Tuning, RLHF
- Ethical Considerations: Bias in Language Models, Hallucination

### Learning Resources

#### Textbooks

1. Daniel Jurafsky, James H. Martin, "Speech and Language Processing", 3rd Edition, Pearson, 2022
2. Jacob Eisenstein, "Introduction to Natural Language Processing", MIT Press, 2019

#### Reference Books

1. Yoav Goldberg, "Neural Network Methods in Natural Language Processing", Morgan & Claypool, 2017
2. Christopher D. Manning, Hinrich Schütze, "Foundations of Statistical Natural Language
   Processing", MIT Press, 1999

---

## 410304: Natural Language Processing Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25 Marks, PR: 25 Marks

### Laboratory Experiments

1. Implement text preprocessing pipeline (tokenization, stemming, lemmatization)
2. Build an n-gram language model with smoothing
3. Train Word2Vec embeddings and visualize them using t-SNE
4. Implement a text classifier using LSTM
5. Build a sequence-to-sequence model for machine translation
6. Fine-tune BERT for text classification
7. Implement named entity recognition using BERT
8. Build a question answering system using Hugging Face transformers
9. Implement text summarization using T5/BART
10. Mini-project: NLP application (chatbot, sentiment analyzer, text summarizer)

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
