# k-means-for-metrics
A tool for clustering function calls by metrics.

## Setting up tool
### Linux
```bash
chmod +x setup.sh
./setup.sh
chmod +x run.sh
```
### Windows
```
setup.bat
```

## Running tool
### Linux
```bash
./run.sh metrics_example.csv
```
### Windows
```cmd
venv\Scripts\activate.bat
python main.py metrics_example.csv
deactivate
```

## Choosing metrics for clustering

You can choose which metrics are used in clustering. For example, lets assume there are 7 metrics in your data file, but you want to cluster data using two specific ones: "time_ns" and "cycles". Then specify metrics you want to use by adding their name after filename when calling python script.

```
python main.py metrics_example.csv time_ns cycles
```