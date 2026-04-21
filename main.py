import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import argparse as arg
import os

# Parsing arguments (entering filename)

parser = arg.ArgumentParser(description = 'k-means algorithm for metrics')
parser.add_argument('filename', help='Name of file with metrics')
args = parser.parse_args()
filename = args.filename

# Opening file

filepath = "data/" + filename
df = pd.read_csv(filepath)
