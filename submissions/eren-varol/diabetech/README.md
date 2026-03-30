# 📱 DiabeTech - Bolus Calculation System

**DiabeTech** is a specialized mobile utility designed for precise insulin dose management. The core mission of the system is to eliminate dosage errors—preventing both overdose and underdose scenarios—to maintain optimal blood glucose stability.

The application streamlines the decision-making process for prandial insulin therapy by integrating real-time carbohydrate counting with blood glucose correction factors. It aims to reduce manual calculation errors and enhance glycemic control through a data-driven, user-centric interface.

---

## 🚀 Key Functionalities

* **Dose Calculation:** Automated bolus estimation based on Current Blood Glucose and Carbohydrate intake.
* **Ratio Discovery:** Precise determination of **ICR** and **ISF** via the 500 and 1800 clinical rules.
* **Safety Validation:** To ensure user safety, if the total calculated dose results in a negative value (indicating low sugar), the system automatically resets the recommendation to `0.0` units.

---

## ⚙️ How It Works (Algorithmic Logic)

The system operates based on established medical bolus calculation logic through the following engineering steps:

1. **Input:** The user provides Current Blood Glucose (BG), Target BG, Carbohydrates (g), and personal ratios (ICR/ISF).
2. **Processing:**
    * **Carb Dose:** Calculated via the formula `Carbohydrates / ICR`.
    * **Correction Dose:** Calculated via the formula `(Current BG - Target BG) / ISF`.
3. **Validation:** If the total calculated dose results in a negative value, the system automatically resets the recommendation to `0.0` units for user safety.
4. **Output:** The final recommended insulin dose is presented in real-time with single-decimal precision.

---

## 📉 Mathematical Foundation

The system implements established medical formulas to ensure mathematical precision:

* **ICR (Insulin-to-Carb Ratio):** $$ICR = \frac{500}{TDD}$$
* **ISF (Insulin Sensitivity Factor):** $$ISF = \frac{1800}{TDD}$$
* **Total Bolus Dose:** $$Dose = \left(\frac{Carbs}{ICR}\right) + \left(\frac{Current BG - Target BG}{ISF}\right)$$

---

## 🛠️ Installation & Setup

Follow these steps to run the project locally:

### Requirements
* Flutter SDK (3.11.4 or higher)
* Dart SDK
* Android Studio or VS Code (with Flutter extension)

### Steps
1. **Clone the repository:**
    ```bash
    git clone [https://github.com/erennvaroll0/COM206-projects.git](https://github.com/erennvaroll0/COM206-projects.git)
    cd COM206-projects
    ```
2. **Install dependencies:**
    ```bash
    flutter pub get
    ```
3. **Run the application:**
    ```bash
    flutter run
    ```
---

## 📂 Project Structure

```text
lib/
├── screens/
│   ├── calculator_screen.dart # Bolus calculation interface
│   ├── home_screen.dart       # Main welcome dashboard
│   └── profile_screen.dart    # User parameters management
├── widgets/
│   └── quick_action_card.dart # Reusable UI card components
└── main.dart                  # Application entry point
```

---

## 📄 License
This project is open-source under the **GNU GPL v3.0 License**.