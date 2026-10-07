# 🌡️ Fuzzy Fan Controller — MATLAB

A simple MATLAB project demonstrating a **Fuzzy Logic Controller** that adjusts fan speed based on temperature.

---

## ⚙️ How It Works

The controller uses three temperature membership functions:

- 🥶 **Cold** → Slow fan
- 🌤️ **Warm** → Medium fan
- 🔥 **Hot** → Fast fan

Instead of simply turning the fan **ON/OFF**, fuzzy logic allows intermediate outputs such as **65% fan speed**.

---

# Overview

<img width="2407" height="1191" alt="Temperature Membership Functions" src="https://github.com/user-attachments/assets/07a500f2-015d-4738-b3de-6634e6efa80c" />
Temperature Membership Functions

<img width="2413" height="1191" alt="Temperature and Fuzzy Output" src="https://github.com/user-attachments/assets/3669af47-9bad-4330-a6f2-672350a034fe" />
Temperature and Fuzzy Output

# 📁 Files
fuzzy_fan.m — Main simulation

membership_cold.m — Cold membership function

membership_warm.m — Warm membership function

membership_hot.m — Hot membership function

# 🛠️ Requirements
MATLAB

No additional toolbox required

# ▶️ Run
Open the project folder in MATLAB and run:

fuzzy_fan

The script plots:

🌡️ Temperature over time

🌀 Fan speed over time

📈 Temperature membership functions

# 🎓 Learning Goals
This project demonstrates:

Fuzzy sets

Membership functions

Fuzzification

Fuzzy rules

Defuzzification
