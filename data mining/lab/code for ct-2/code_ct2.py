# import pandas as pd
# from sklearn.tree import DecisionTreeClassifier
# from sklearn import tree
# import matplotlib.pyplot as plt

# data = pd.read_csv("/Users/abdullahnazmus-sakib/Desktop/4-2/data mining/lab/Student_Performance_J48.csv")
# X = data[["FirstYear", "SecondYear", "ThirdYear", "AVG_Till_Now"]]
# y = data["Performance_Class"]

# model = DecisionTreeClassifier(
#     criterion="entropy",
#     max_depth=2,
#     random_state=42
# )

# # Train model
# model.fit(X, y)

# # Predict output
# prediction = model.predict([[3.7, 3.8, 1.9, 3.75]])

# print("Predicted Class:", prediction[0])

# # Visualize Decision Tree
# plt.figure(figsize=(16, 10))

# tree.plot_tree(
#     model,
#     feature_names=X.columns,
#     class_names=model.classes_,
#     filled=True,
#     rounded=True,
#     fontsize=12,
#     precision=3
# )

# plt.title("Decision Tree Visualization Using Python code", fontsize=18)

# plt.show()