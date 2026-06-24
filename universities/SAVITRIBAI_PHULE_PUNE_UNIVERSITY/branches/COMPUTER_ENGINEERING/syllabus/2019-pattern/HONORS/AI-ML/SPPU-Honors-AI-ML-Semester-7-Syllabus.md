# SPPU B.E. Computer Engineering — Honors in AI & Machine Learning

## Semester VII Syllabus (2019 Pattern)

---

## Course Structure — Semester VII

| Course Code | Course Name                 |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | --------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 410301      | Machine Learning            |   3   |   —   |    3    |   30   |   70   |   100   |
| 410302      | Machine Learning Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                             | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 410301: Machine Learning

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Examination:** ISA: 30 Marks, ESA: 70 Marks

**Prerequisites:** Computational Statistics (310301), Deep Learning Fundamentals (310303)

### Course Objectives

- Understand supervised, unsupervised, and reinforcement learning paradigms
- Learn advanced ML algorithms and ensemble methods
- Develop skills for model evaluation, selection, and deployment

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Apply supervised learning algorithms for classification and regression |
| CO2 | Implement ensemble learning and dimensionality reduction techniques    |
| CO3 | Apply unsupervised learning for clustering and anomaly detection       |
| CO4 | Build reinforcement learning agents for decision-making                |
| CO5 | Evaluate, tune, and deploy machine learning models                     |

### Course Contents

#### Unit I: Supervised Learning — Regression and Classification (07 Hours)

- Linear Regression: Simple, Multiple, Polynomial
- Regularized Regression: Ridge, Lasso, Elastic Net
- Logistic Regression: Binary, Multiclass (Softmax)
- Decision Trees: ID3, C4.5, CART — Pruning Strategies
- Support Vector Machines: Linear, Kernel Methods (RBF, Polynomial)
- k-Nearest Neighbors: Distance Metrics, Weighted Voting

#### Unit II: Ensemble Learning (07 Hours)

- Bagging: Bootstrap Aggregating, Random Forest
- Boosting: AdaBoost, Gradient Boosting Machines (GBM)
- XGBoost, LightGBM, CatBoost
- Stacking: Blending, Meta-learners
- Voting Classifiers: Hard, Soft
- Ensemble Diversity: Bias-Variance Decomposition

#### Unit III: Unsupervised Learning (07 Hours)

- Clustering: K-Means, K-Medoids, Hierarchical (Agglomerative, Divisive)
- DBSCAN, OPTICS, Gaussian Mixture Models (GMM)
- Expectation-Maximization Algorithm
- Dimensionality Reduction: PCA (Kernel PCA, Incremental PCA)
- t-SNE, UMAP for Visualization
- Anomaly Detection: Isolation Forest, LOF, One-Class SVM

#### Unit IV: Reinforcement Learning (07 Hours)

- Markov Decision Processes (MDP): States, Actions, Rewards, Transitions
- Dynamic Programming: Policy Iteration, Value Iteration
- Monte Carlo Methods
- Temporal Difference Learning: SARSA, Q-Learning
- Deep Q-Networks (DQN): Experience Replay, Target Network
- Policy Gradient Methods: REINFORCE, Actor-Critic
- Exploration vs Exploitation: ε-greedy, Upper Confidence Bound

#### Unit V: Model Evaluation and Selection (07 Hours)

- Cross-Validation: k-Fold, Stratified, Leave-One-Out
- Performance Metrics: Accuracy, Precision, Recall, F1, ROC-AUC, PR-AUC
- Bias-Variance Tradeoff: Diagnosis and Remedies
- Hyperparameter Tuning: Grid Search, Randomized Search, Bayesian Optimization
- Feature Selection: Filter, Wrapper, Embedded Methods
- Imbalanced Learning: SMOTE, ADASYN, Class Weights

#### Unit VI: ML Pipeline and Deployment (07 Hours)

- ML Lifecycle Management: CRISP-DM, TDSP
- Feature Engineering Pipelines: Scikit-learn Pipelines, Feature Union
- Model Versioning: DVC, MLflow Model Registry
- Model Serving: REST APIs (Flask, FastAPI), Batch Inference
- Monitoring: Data Drift, Concept Drift, Model Degradation
- Fairness and Interpretability in ML Systems

### Learning Resources

#### Textbooks

1. Christopher M. Bishop, "Pattern Recognition and Machine Learning", Springer, 2006
2. Trevor Hastie, Robert Tibshirani, Jerome Friedman, "The Elements of Statistical Learning", 2nd
   Edition, Springer, 2009
3. Tom Mitchell, "Machine Learning", McGraw-Hill, 1997

#### Reference Books

1. Peter Flach, "Machine Learning: The Art and Science of Algorithms", Cambridge University Press,
   2012
2. Andreas C. Müller, Sarah Guido, "Introduction to Machine Learning with Python", O'Reilly, 2016
3. Richard S. Sutton, Andrew G. Barto, "Reinforcement Learning: An Introduction", 2nd Edition, MIT
   Press, 2018

---

## 410302: Machine Learning Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25 Marks, PR: 25 Marks

### Laboratory Experiments

1. Implement linear and logistic regression from scratch
2. Build decision tree and random forest classifiers
3. Implement SVM with different kernels for classification
4. Build gradient boosting (XGBoost/LightGBM) models
5. Implement K-Means clustering and evaluate using silhouette score
6. Perform PCA for dimensionality reduction and visualize results
7. Implement Q-learning agent for grid world environment
8. Build a complete ML pipeline with cross-validation and hyperparameter tuning
9. Deploy an ML model as a REST API
10. Mini-project: End-to-end ML solution for real-world problem

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
