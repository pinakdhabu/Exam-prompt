# SPPU B.E. Computer Engineering — Honors in AI & Machine Learning

## Semester VI Syllabus (2019 Pattern)

---

## Course Structure — Semester VI

| Course Code | Course Name                           |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | ------------------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 310303      | Deep Learning Fundamentals            |   3   |   —   |    3    |   30   |   70   |   100   |
| 310304      | Deep Learning Fundamentals Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                                       | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 310303: Deep Learning Fundamentals

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Examination:** ISA: 30 Marks, ESA: 70 Marks

**Prerequisites:** Computational Statistics (310301), Machine Learning basics

### Course Objectives

- Understand neural network architectures and training algorithms
- Learn convolutional and recurrent neural networks
- Study advanced deep learning techniques and optimization

### Course Outcomes

| CO  | Description                                             |
| --- | ------------------------------------------------------- |
| CO1 | Explain neural network fundamentals and backpropagation |
| CO2 | Design and train CNNs for image-based tasks             |
| CO3 | Implement RNNs and LSTMs for sequential data            |
| CO4 | Apply transfer learning and generative models           |
| CO5 | Optimize deep learning models for performance           |

### Course Contents

#### Unit I: Neural Network Foundations (07 Hours)

- Biological Neuron vs Artificial Neuron
- Perceptron: Architecture, Limitations, Multilayer Perceptron
- Activation Functions: Sigmoid, Tanh, ReLU, Leaky ReLU, Softmax
- Loss Functions: MSE, Cross-Entropy, Hinge
- Backpropagation Algorithm: Chain Rule, Gradient Computation
- Gradient Descent Variants: SGD, Momentum, Adam, RMSprop
- Regularization: L1, L2, Dropout, Early Stopping, Batch Normalization

#### Unit II: Convolutional Neural Networks (07 Hours)

- CNN Architecture: Convolution, Pooling, Fully Connected Layers
- Convolution Operation: Padding, Stride, Dilated Convolution
- Pooling: Max, Average, Global Average Pooling
- Classical Architectures: LeNet-5, AlexNet, VGGNet, GoogLeNet
- Modern Architectures: ResNet, DenseNet, Inception, EfficientNet
- Transfer Learning: Feature Extraction, Fine-tuning
- Data Augmentation Techniques

#### Unit III: Recurrent Neural Networks (07 Hours)

- RNN Architecture: Sequence Modeling, Unfolding
- Vanishing and Exploding Gradients
- Long Short-Term Memory (LSTM): Gates, Cell State
- Gated Recurrent Unit (GRU)
- Bidirectional RNNs
- Sequence-to-Sequence Models
- Attention Mechanism: Additive, Multiplicative, Self-Attention

#### Unit IV: Generative Models (07 Hours)

- Autoencoders: Undercomplete, Denoising, Variational (VAE)
- Generative Adversarial Networks (GANs): Generator, Discriminator
- GAN Training: Min-Max Game, Nash Equilibrium
- DCGAN, Conditional GAN, CycleGAN
- Normalizing Flows
- Diffusion Models: Forward Process, Reverse Process

#### Unit V: Advanced Topics and Optimization (07 Hours)

- Hyperparameter Tuning: Grid Search, Random Search, Bayesian Optimization
- Model Deployment: TensorFlow Serving, ONNX, TFLite
- Interpretability: Grad-CAM, Saliency Maps, SHAP, LIME
- Federated Learning
- Few-Shot Learning, Zero-Shot Learning
- Ethical AI: Bias, Fairness, Accountability

#### Unit VI: Practical Deep Learning (07 Hours)

- TensorFlow 2.x and Keras: Model Building, Training, Evaluation
- PyTorch: Autograd, Modules, DataLoaders, Training Loop
- Distributed Training: Data Parallel, Model Parallel
- Mixed Precision Training
- Experiment Tracking: MLflow, Weights & Biases
- Best Practices: Reproducibility, Debugging, Profiling

### Learning Resources

#### Textbooks

1. Ian Goodfellow, Yoshua Bengio, Aaron Courville, "Deep Learning", MIT Press, 2016
2. Francois Chollet, "Deep Learning with Python", 2nd Edition, Manning, 2021

#### Reference Books

1. Aston Zhang et al., "Dive into Deep Learning", Cambridge University Press, 2023
2. Josh Patterson, Adam Gibson, "Deep Learning: A Practitioner's Approach", O'Reilly, 2017

---

## 310304: Deep Learning Fundamentals Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25 Marks, PR: 25 Marks

### Laboratory Experiments

1. Implement a perceptron and multilayer perceptron from scratch
2. Build an image classifier using CNN with TensorFlow/Keras
3. Implement transfer learning using pre-trained models (VGG16, ResNet)
4. Build an LSTM model for time series prediction
5. Implement a sequence-to-sequence model with attention
6. Build a variational autoencoder for image generation
7. Implement a DCGAN for image generation
8. Perform hyperparameter tuning using Grid Search/Random Search
9. Deploy a deep learning model using TensorFlow Serving
10. Mini-project: End-to-end deep learning application

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
