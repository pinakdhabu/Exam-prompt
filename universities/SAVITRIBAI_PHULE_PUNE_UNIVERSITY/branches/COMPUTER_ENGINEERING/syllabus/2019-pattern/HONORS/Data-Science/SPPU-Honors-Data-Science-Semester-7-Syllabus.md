# SPPU B.E. Computer Engineering — Honors in Data Science

## Semester VII Syllabus (2019 Pattern)

---

## Course Structure — Semester VII

| Course Code | Course Name                                  |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | -------------------------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 410501      | Machine Learning and Data Science            |   3   |   —   |    3    |   30   |   70   |   100   |
| 410502      | Machine Learning and Data Science Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                                              | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 410501: Machine Learning and Data Science

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03 | **ISA:** 30, **ESA:** 70

**Prerequisites:** Big Data Analytics (310503), Data Science and Visualization (310501)

### Course Objectives

- Apply machine learning algorithms for data-driven decision making
- Build scalable ML pipelines for production environments
- Master model deployment and monitoring strategies

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Build complete ML pipelines from data ingestion to model deployment    |
| CO2 | Apply advanced supervised and unsupervised learning techniques         |
| CO3 | Implement model selection, evaluation, and hyperparameter optimization |
| CO4 | Deploy and monitor ML models in production                             |
| CO5 | Apply MLOps practices for reproducible ML workflows                    |

### Course Contents

#### Unit I: ML Pipeline Architecture (07 Hours)

- End-to-End ML Pipeline Design
- Data Ingestion: Batch vs Streaming
- Feature Store: Feature Engineering, Serving, Versioning
- Model Training: Experiment Tracking, Hyperparameter Tuning
- Model Evaluation: Cross-validation, Holdout, Backtesting
- Model Deployment: Batch, Real-time (REST, gRPC)
- Model Monitoring: Performance, Data Drift, Concept Drift

#### Unit II: Advanced Supervised Learning (07 Hours)

- Gradient Boosting: XGBoost, LightGBM, CatBoost
- Bayesian Methods: Gaussian Processes, Bayesian Linear Regression
- Multi-label and Multi-output Classification
- Time Series Forecasting: ARIMA, Prophet, LSTM
- Survival Analysis: Kaplan-Meier, Cox Proportional Hazards
- Recommendation Systems: Collaborative Filtering, Content-based, Hybrid

#### Unit III: Advanced Unsupervised Learning (07 Hours)

- Gaussian Mixture Models: EM Algorithm
- Spectral Clustering
- Density-Based Clustering: HDBSCAN
- Topic Modeling: LSA, LDA, NMF
- Matrix Factorization: SVD, NMF for Recommendation
- Graph-based Learning: Graph Neural Networks Basics

#### Unit IV: ML at Scale (07 Hours)

- Distributed ML with Spark MLlib
- Feature Scaling with Dask and Ray
- GPU Accelerated ML: RAPIDS, cuML
- Online Learning: SGD, FTRL, Bandit Algorithms
- A/B Testing: Design, Analysis, Pitfalls
- Causal Inference in ML: Propensity Score, Uplift Modeling

#### Unit V: MLOps and Production ML (07 Hours)

- MLflow: Experiment Tracking, Model Registry, Serving
- Docker and Kubernetes for ML: Containerization, Orchestration
- CI/CD for ML: GitHub Actions, Jenkins, Kubeflow
- Model Versioning: DVC, Git LFS
- Feature Stores: Feast, Tecton
- Model Serving: TF Serving, TorchServe, BentoML, Ray Serve

#### Unit VI: ML Ethics and Governance (07 Hours)

- Fairness in ML: Demographic Parity, Equal Opportunity
- Interpretability: SHAP, LIME, Partial Dependence, Permutation Importance
- Privacy: Differential Privacy, Federated Learning
- Model Governance: Auditing, Compliance, Documentation
- Responsible AI: Principles, Frameworks, Tools
- Case Studies: Bias in Hiring, Credit Scoring, Criminal Justice

### Learning Resources

#### Textbooks

1. Andriy Burkov, "The Hundred-Page Machine Learning Book", 2019
2. Chip Huyen, "Designing Machine Learning Systems", O'Reilly, 2022

#### Reference Books

1. Mark Treveil, "Introducing MLOps", O'Reilly, 2020
2. Emmanuel Ameisen, "Building Machine Learning Pipelines", O'Reilly, 2021

---

## 410502: Machine Learning and Data Science Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25, PR: 25

### Laboratory Experiments

1. Build an end-to-end ML pipeline with feature engineering and model training
2. Implement XGBoost/LightGBM model with hyperparameter tuning
3. Build a recommendation system using collaborative filtering
4. Implement time series forecasting with Prophet
5. Containerize ML model with Docker and deploy with FastAPI
6. Set up MLflow for experiment tracking and model registry
7. Implement model interpretability using SHAP and LIME
8. Build a feature pipeline with Feast feature store
9. Implement A/B test analysis for ML model evaluation
10. Mini-project: Production-ready ML system with MLOps

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
