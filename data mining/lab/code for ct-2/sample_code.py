# =====================================================
# Dengue Severity Prediction using Decision Tree
# COMPLETE FINAL 100% WORKING VERSION
# FOR MAC / VS CODE / JUPYTER
# =====================================================

import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import plot_tree
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix

# =====================================================
# 1. LOAD DATASET
# =====================================================

file_path = "/Users/abdullahnazmus-sakib/Downloads/combined_dengue_dataset_500_records.xlsx"

data = pd.read_excel(file_path)

print("\n✅ Dataset Loaded Successfully")

# =====================================================
# 2. SHOW DATASET COLUMNS
# =====================================================

print("\n📌 Dataset Columns:\n")
print(data.columns)

# =====================================================
# 3. REMOVE MISSING VALUES
# =====================================================

data = data.dropna()

print("\n✅ Missing Values Removed")

# =====================================================
# 4. REMOVE UNNECESSARY COLUMNS
# =====================================================

remove_columns = [
    "patient_id",
    "date_id",
    "visit_date",
    "location_id",
    "lab_id",
    "diagnosis_id",
    "source_id"
]

data.drop(columns=remove_columns, inplace=True)

print("\n✅ Unnecessary Columns Removed")

# =====================================================
# 5. ENCODE ALL CATEGORICAL/TEXT DATA
# =====================================================

label_encoders = {}

for col in data.columns:

    # Encode all NON-NUMERIC columns
    if not pd.api.types.is_numeric_dtype(data[col]):

        le = LabelEncoder()

        data[col] = le.fit_transform(
            data[col].astype(str)
        )

        label_encoders[col] = le

print("\n✅ Text Columns Encoded")

# =====================================================
# 6. TARGET COLUMN
# =====================================================

target_column = "severity_label"

# =====================================================
# 7. FEATURES AND LABELS
# =====================================================

X = data.drop(columns=[target_column])

y = data[target_column]

print("\n✅ Features and Labels Prepared")

# =====================================================
# 8. CHECK DATA TYPES
# =====================================================

print("\n📌 Data Types:\n")
print(X.dtypes)

# =====================================================
# 9. TRAIN TEST SPLIT
# =====================================================

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)

print("\n✅ Train-Test Split Completed")

# =====================================================
# 10. CREATE DECISION TREE MODEL
# =====================================================

model = DecisionTreeClassifier(
    criterion="entropy",
    max_depth=5,
    random_state=42
)

print("\n✅ Decision Tree Model Created")

# =====================================================
# 11. TRAIN MODEL
# =====================================================

model.fit(X_train, y_train)

print("\n✅ Model Trained Successfully")

# =====================================================
# 12. PREDICTION
# =====================================================

y_pred = model.predict(X_test)

# =====================================================
# 13. MODEL ACCURACY
# =====================================================

accuracy = accuracy_score(y_test, y_pred)

print("\n🎯 Accuracy:")
print(round(accuracy * 100, 2), "%")

# =====================================================
# 14. CLASSIFICATION REPORT
# =====================================================

print("\n📌 Classification Report:\n")

print(
    classification_report(
        y_test,
        y_pred
    )
)

# =====================================================
# 15. CONFUSION MATRIX
# =====================================================

print("\n📌 Confusion Matrix:\n")

print(
    confusion_matrix(
        y_test,
        y_pred
    )
)

# =====================================================
# 16. VISUALIZE DECISION TREE
# =====================================================

plt.figure(figsize=(35, 18))

plot_tree(
    model,
    feature_names=X.columns,
    class_names=[str(c) for c in model.classes_],
    filled=True,
    rounded=True,
    fontsize=8
)

plt.title(
    "Decision Tree for Dengue Severity Prediction",
    fontsize=20
)

plt.tight_layout()

# SAVE TREE IMAGE
plt.savefig("decision_tree.png")

print("\n✅ Decision Tree Saved as decision_tree.png")

# SHOW TREE
plt.show()

# =====================================================
# 17. FEATURE IMPORTANCE
# =====================================================

importance = pd.DataFrame({
    'Feature': X.columns,
    'Importance': model.feature_importances_
})

importance = importance.sort_values(
    by='Importance',
    ascending=False
)

print("\n📌 Feature Importance:\n")

print(importance)

# =====================================================
# 18. SAMPLE PREDICTION
# =====================================================

sample = X_test.iloc[[0]]

prediction = model.predict(sample)

print("\n📌 Sample Prediction:")

predicted_label = prediction[0]

# Decode predicted label if possible
if target_column in label_encoders:

    decoded_prediction = label_encoders[
        target_column
    ].inverse_transform([predicted_label])

    print(
        "Predicted Severity:",
        decoded_prediction[0]
    )

else:
    print(prediction)

# =====================================================
# 19. PROGRAM END
# =====================================================

print("\n✅ Program Finished Successfully")