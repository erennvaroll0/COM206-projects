# 📱 DiabeTech - Bolus Calculation System

**DiabeTech** is a specialized mobile utility designed for precise insulin dose management. The core mission of the system is to eliminate dosage errors—preventing both overdose and underdose scenarios—to maintain optimal blood glucose stability.

The application streamlines the decision-making process for prandial insulin therapy by integrating real-time carbohydrate counting with blood glucose correction factors. Its core mission is to reduce manual calculation errors and enhance glycemic control through a data-driven, user-centric interface.

---

## 🚀 Key Functionalities

- **Dose Calculation:** Automated bolus estimation based on Current Blood Glucose and Carbohydrate intake.
- **Ratio Discovery:** Precise determination of **ICR** and **ISF** via the 500 and 1800 clinical rules.
- **User Profile:** Personalized data management for optimized treatment parameters.

---

## ⚙️ How It Works (Algorithmic Logic)

The system operates based on established medical bolus calculation logic through the following engineering steps:

1.  **Input:** The user provides Current Blood Glucose (BG), Target BG, Carbohydrates (g), and personal ratios (ICR/ISF).
2.  **Processing:**
    - **Carb Dose:** Calculated via the formula `Carbohydrates / ICR`.
    - **Correction Dose:** Calculated via the formula `(Current BG - Target BG) / ISF`.
3.  **Validation:** To ensure user safety, if the total calculated dose results in a negative value (indicating low sugar), the system automatically resets the recommendation to `0.0` units.
4.  **Output:** The final recommended insulin dose is presented in real-time with single-decimal precision.

---

## 📉 Mathematical Foundation

The system implements established medical formulas to ensure mathematical precision:

- **ICR (Insulin-to-Carb Ratio):** $$500 / TDD$$
- **ISF (Insulin Sensitivity Factor):** $$1800 / TDD$$
- **Total Bolus Dose:** $$(Carbs / ICR) + ((Current BG - Target BG) / ISF)$$

---

## 🛠️ Technical Stack

- **Framework:** Flutter
- **Language:** Dart

---

## 📄 License
This project is open-source under the GNU GPL v3.0 License.