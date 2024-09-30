# Grokking Machine Learning

### Artificial Inteligence - AI
In general, any time we see a computer solving a problem by itself.
In many cases, a computer makes these decisions by mimicking the ways a human makes decisions.
In other cases, they may mimic evolutionary processes, genetic processes, or physical processes.

### Machine Learning - ML
Machine learning is similar to artificial intelligence, and often their definitions are confused.
ML is a part of artificial intelligence, and we define it as follows:
The set of all tasks in which a computer can make decisions based on data.

### Deep Learning - DL
The field of machine learning that uses neural networks.
Deep learning is arguably the most used type of machine learning because it works really well.
If we are looking at any of the cutting-edge applications, such as image recognition, text generation, playing Go, or self-driving cars, very likely we are looking at deep learning in some way or another.

### How do human think?
Remember -> formulate -> predict

### Computer
Remember - Look at huge table data.
Formulate - Create models by going through many rules and formulas, and check which model fits the data best.
Predict - Use the model to make predictions about future data.

### Model
Representation of reality using a set of rules that mimic the existing data as closely as possible.

### Algorithm
The process that we used to build the model.

In short, a model is what we use to make predictions, and an algorithm is what we use to build the model.

### The main three families of machine learning models
• Supervised learning - is the most natural one to start learning and arguably the most used right now.
• Unsupervised learning.
• Reinforcement learning.

### Data point
Normally each row in the table is a data point.

### Feature 
Any property or characteristic of the data that the model can use to make predictions.
If our data is in a table, the features are the columns of the table.
Some features are special, though, and we call them labels.

### Label
Normally, if we are trying to predict a particular feature based on the other ones, that feature is the label.
If we are trying to predict the age of the pet, then the label is the age (a number).

### Prediction
The goal of a predictive machine learning model is to guess the labels in the data.
The guess that the model makes is called a prediction.

### Difference between labeled and unlabeled data
Labeled data is data that comes with labels. Unlabeled data is data that comes with no labels.
An example of labeled data is a dataset of emails that comes with a column that records whether the emails are spam or ham.
An example of unlabeled data is a dataset of emails that has no particular column we are interested in predicting.

Labeled data is data that comes with a tag, or label. That label can be a type or a number.
Unlabeled data is data that comes with no tag. 

Labeled and unlabeled data yield two different branches of machine learning called supervised and unsupervised learning.


## Supervised learning 
Is a type of machine learning that uses labeled data.
In short, the goal of a supervised learning model is to predict (guess) the labels.

In the example in figure 2.1 (page 18), the dataset on the left contains images of dogs and cats, and the labels are “dog” and “cat.” 
For this dataset, the machine learning model would use previous data to predict the label of new data points.
This means, if we bring in a new image without a label, the model will guess whether the image is of a dog or a cat, thus predicting the label of the data point.

### Numerical data 
Is any type of data that uses numbers such as 4, 2.35, or –199.
Examples of numerical data are prices, sizes, or weights.

### Categorical data
Is any type of data that uses categories, or states, such as male/female or cat/dog/bird.
For this type of data, we have a finite set of categories to associate to each of the data points.

### Regression models
The types of models that predict numerical data. The output of a regression model is a number, such as the weight of the animal.

### Classification models
The types of models that predict categorical data. The output of a classification model is a category, or a state, such as the type of animal (cat or dog).

## Unsupervised learning
The branch of machine learning that works with unlabeled data. The prediction feature not exist.
It differs from supervised learning in that the data is unlabeled. 
In other words, the goal of a machine learning model is to extract as much information as possible from a dataset that has no labels, or targets to predict.

For example, let’s go back to the cats and dogs example on the rightmost dataset in figure 2.1 (page 18). 
This dataset consists of images of cats and dogs, but it has no labels. 
Therefore, we don’t know what type of pet each image represents, so we can’t predict if a new image corresponds to a dog or a cat.
However, we can do other things, such as determine if two pictures are similar or different. 
This is something unsupervised learning algorithms do. 
An unsupervised learning algorithm can group the images based on similarity, even without knowing what each group represents. 
If done properly, the algorithm could separate the dog images from the cat images, or even group each of them by breed!

As a matter of fact, even if the labels are there, we can still use unsupervised learning techniques on our data to preprocess it and apply supervised learning methods more effectively.

The main branches of unsupervised learning are clustering, dimensionality reduction, and generative learning.

### Clustering algorithms 
The algorithms that group data into clusters based on similarity.
Is a branch of unsupervised machine learning that consists of the tasks that group the elements in our dataset into clusters where all the data points are similar.
After clustering the dataset, a human (or a combination of a human and a supervised learning algorithm) could label these clusters by categories such as “Personal,” “Social,” and “Promotions.”

- K-means clustering: this algorithm groups points by picking some random centers of
mass and moving them closer and closer to the points until they are at the right spots.

- Hierarchical clustering: this algorithm starts by grouping the closest points together and
continuing in this fashion, until we have some well-defined groups.

- Density-based spatial clustering (DBSCAN): this algorithm starts grouping points
together in places with high density, while labeling the isolated points as noise.

- Gaussian mixture models: this algorithm does not assign a point to one cluster but
instead assigns fractions of the point to each of the existing clusters. For example, if there
are three clusters, A, B, and C, then the algorithm could determine that 60% of a
particular point belongs to group A, 25% to group B, and 15% to group C.

### Dimensionality reduction algorithms 
The algorithms that simplify our data and faithfully describe it with fewer features (dimensions).

### Generative algorithms 
The algorithms that can generate new data points that resemble the existing data.

The field of generative learning consists of models that, given a dataset, can output new data
points that look like samples from that original dataset.

### Dimension
The fancy word for the number of columns.

### Cluster vs Dimension reducion
Therefore, we can use clustering to reduce the number of rows in our dataset and dimensionality reduction to reduce the number of columns.

### Matrix factorization and Singular value decomposition
Reduce both the rows and the columns at the same time.
These two algorithms express a big matrix of data into a product of smaller matrices.

### Reinforcement learning
Is a different type of machine learning in which no data is given, and we must get the computer to perform a task. Instead of data, the model receives an environment and an agent who is supposed to navigate in this environment. 
The agent has a goal or a set of goals.
The environment has rewards and punishments that guide the agent to make the right decisions
to reach its goal.


# Summary
• Several types of machine learning exist, including supervised learning, unsupervised
learning, and reinforcement learning.

• Data can be labeled or unlabeled. Labeled data contains a special feature, or label, that we
aim to predict. Unlabeled data doesn’t contain this feature.

• Supervised learning is used on labeled data and consists of building models that predict
the labels for unseen data.

• Unsupervised learning is used on unlabeled data and consists of algorithms that simplify
our data without losing a lot of information. Unsupervised learning is often used as a
preprocessing step.

• Two common types of supervised learning algorithms are called regression and classification.
    – Regression models are those in which the answer is any number.
    – Classification models are those in which the answer is of a type or a class.

• Two common types of unsupervised learning algorithms are clustering and dimensionality reduction.
    – Clustering is used to group data into similar clusters to extract information or make it easier to handle.
    – Dimensionality reduction is a way to simplify our data, by joining certain similar features and losing as little information as possible.
    – Matrix factorization and singular value decomposition are other algorithms that can simplify our data by reducing both the number of rows and columns.

• Generative machine learning is an innovative type of unsupervised learning, consisting of generating data that is similar to our dataset. Generative models can paint realistic faces, compose music, and write poetry.

• Reinforcement learning is a type of machine learning in which an agent must navigate an environment and reach a goal. It is extensively used in many cutting-edge applications.