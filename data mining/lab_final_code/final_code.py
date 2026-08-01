
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.tree import DecisionTreeClassifier
from sklearn import tree
from sklearn.model_selection import train_test_split
from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix
)


def connectCSV(path):
    dataset = pd.read_csv(path)
    return dataset



def classify(X_train, y_train):

    model = DecisionTreeClassifier(
        criterion="entropy",     # Similar to WEKA J48
        random_state=42
    )

    model.fit(X_train, y_train)

    return model


def displayTree(model, feature_names, class_names):

    plt.figure(figsize=(18,10))

    tree.plot_tree(
        model,
        feature_names=feature_names,
        class_names=class_names,
        filled=True,
        rounded=True,
        fontsize=10
    )

    plt.title("Decision Tree Visualization", fontsize=18)
    plt.show()



def main():

    # Change this path according to your computer
    file_path = "/Users/abdullahnazmus-sakib/Desktop/4-2/data mining/lab/Student_Performance_J48.csv"

    # Read Dataset
    data = connectCSV(file_path)

    print("\n========== DATASET ==========\n")
    print(data.head())

    # Features
    X = data[["FirstYear",
              "SecondYear",
              "ThirdYear",
              "AVG_Till_Now"]]

    # Target
    y = data["Performance_Class"]

    # Split Dataset
    X_train, X_test, y_train, y_test = train_test_split(
        X,
        y,
        test_size=0.20,
        random_state=42
    )

    # Train Model
    model = classify(X_train, y_train)

    # Predict Test Data
    y_pred = model.predict(X_test)

    # Accuracy
    accuracy = accuracy_score(y_test, y_pred)

    print("\n==============================")
    print("Model Accuracy")
    print("==============================")
    print(f"Accuracy : {accuracy*100:.2f}%")

    # Classification Report
    print("\n==============================")
    print("Classification Report")
    print("==============================")
    print(classification_report(y_test, y_pred))

    # Confusion Matrix
    print("\n==============================")
    print("Confusion Matrix")
    print("==============================")
    print(confusion_matrix(y_test, y_pred))

    # ----------------------------------
    # Predict New Student
    # ----------------------------------

    print("\n==============================")
    print("Prediction Example")
    print("==============================")

    sample = [[3.70, 3.80, 1.90, 3.75]]

    prediction = model.predict(sample)

    print("Input")
    print("-----------------------------")
    print("First Year   :", sample[0][0])
    print("Second Year  :", sample[0][1])
    print("Third Year   :", sample[0][2])
    print("AVG Till Now :", sample[0][3])

    print("\nPredicted Performance :", prediction[0])

    # ----------------------------------
    # Display Decision Tree
    # ----------------------------------

    displayTree(
        model,
        X.columns,
        model.classes_
    )


# ------------------------------------------
# Execute Program
# ------------------------------------------

if __name__ == "__main__":
    main()