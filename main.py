import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import argparse as arg
import os
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from kneed import KneeLocator

# Parsing arguments (entering filename)

parser = arg.ArgumentParser(description = 'k-means algorithm for metrics')
parser.add_argument('filename', help='Name of file with metrics')
args = parser.parse_args()
filename = args.filename

# Opening file

filepath = "data/" + filename
df = pd.read_csv(filepath)
scaler = StandardScaler()
X = scaler.fit_transform(df)

# Finding optimal k using elbow method

inertias = []
k_range = range(1, 11)

for k in k_range:
    km = KMeans(n_clusters=k, random_state=42, n_init='auto')
    km.fit(X)
    inertias.append(km.inertia_)

knee = KneeLocator(k_range, inertias, curve='convex', direction='decreasing')
optimal_k = knee.elbow
print(f"Optimal k = {optimal_k}")

# Running k-means with optimal k

km_final = KMeans(n_clusters=optimal_k, random_state=42, n_init='auto')
df['cluster'] = km_final.fit_predict(X)

# Saving clusters in different files

os.makedirs("results", exist_ok=True)

for cluster_id, group in df.groupby('cluster'):
    group.drop(columns='cluster').to_csv(f"results/{filename[:-4]}_{cluster_id}.csv", index=False)

print(f"Clusters data saved as 'results/{filename[:-4]}_id.csv'")

