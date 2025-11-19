# DNS Tunneling Detection with PyTorch MLP

This project demonstrates a proof-of-concept Multi-Layer Perceptron (MLP) for detecting DNS-based data exfiltration using Python and PyTorch.

---

## Overview

Attackers often use DNS as a covert channel to exfiltrate data because:

- DNS is widely used and typically allowed through firewalls.
- Subdomains can carry encoded data (e.g., Base58 / Base32).
- DNS traffic is rarely monitored, making it ideal for stealthy exfiltration.

This project reproduces the DNS tunneling detection pipeline inspired by Splunk's approach.

---

## Model Architecture

- **Input Layer:** 98 features  
  (character counts, domain length, entropy, etc.)  
- **Hidden Layers:** Two fully connected layers with 256 units each, ReLU activation, 0.5 dropout  
- **Output Layer:** Single logit with Sigmoid activation for probability

---

## Dataset

- **Kaggle DNS Tunneling Dataset**  
  [Download here](https://www.kaggle.com/datasets/saurabhshahane/dns-tunneling-queries-classification)
- `training.csv` — labeled domains for training  
- `validating.csv` — labeled domains for validation  

> I believe Splunk’s original dataset is not publicly available :( but it's fine :')

---

## Preprocessing

- Convert domain names into feature vectors:
  - Count occurrences of printable characters
  - Compute domain length
  - Compute entropy of characters
- Concatenate features into a 98-dimensional input vector for the MLP

---

## Training

- **Train/Validation/Test Split:** 76% train / 12% validation / 12% test  
- **Loss Function:** Binary Cross-Entropy with logits, adjusted for class imbalance  
- **Optimizer:** Adam  
- **Metrics:** ROC-AUC, confusion matrix, classification report  

Training loop evaluates validation performance at the end of each epoch and saves the best model.

---

## Usage

```bash
git clone https://github.com/Francois-Coleongco/DNS_Tunneling_MLP.git
cd DNS_Tunneling_MLP
pip install -r requirements.txt
```

Go into the ipynb file, and run everything past cell 2!


*Exportation will be done when I have my ESP32 ready to hook up with an Access Point*