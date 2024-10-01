# Kaggle study

# How models work

### Decision tree
There are fancier models that give more accurate predictions.
But decision trees are easy to understand, and they are the basic building block for some of the best models in data science.
You can capture more factors using a tree that has more "splits." These are called "deeper" trees.
The point at the bottom where we make a prediction is called a leaf.

### Fitting or training the model
The steps of capturing patterns from data.

### Training data
The data used to fit the model.

### Using the model
After the model has been fit, you can apply it to new data to make predictions.


# Basic data exploration

### Mean
Average.

### Std
Standard deviation, which measures how numerically spread out the values are.

### y
Predicition target

### X
Features
X.describe()
X.head()
X.<feature>.describe()
X.<feature>.mean()
X.<feature>.unique()
X.<feature>.value_counts()

### Validation data
The most straightforward way to do this is to exclude some data from the model-building process, and then use those to test the model's accuracy on data it hasn't seen before.

### Overfitting
When a model matches the training data almost perfectly, but does poorly in validation and other new data.

### Underfitting
When a model fails to capture important distinctions and patterns in the data, so it performs poorly even in training data.

### Map (on Series)
reviews.points.map(lambda p: p - review_points_mean)

### Apply (on DataFrame)
def remean_points(row):
    row.points = row.points - review_points_mean
    return row

reviews.apply(remean_points, axis='columns')

# Pandas
reviews_per_region = reviews.region_1.fillna('Unknown').value_counts().sort_values(ascending=False)

### Renaming and Combining
reviews.rename(columns={'points': 'score'})
reviews.rename(index={0: 'firstEntry', 1: 'secondEntry'})
reviews.rename_axis("wines", axis='rows').rename_axis("fields", axis='columns')
# Have the same filds (columns)
pd.concat([canadian_youtube, british_youtube])
# Diferent fields
left = canadian_youtube.set_index(['title', 'trending_date'])
right = british_youtube.set_index(['title', 'trending_date'])
left.join(right, lsuffix='_CAN', rsuffix='_UK')