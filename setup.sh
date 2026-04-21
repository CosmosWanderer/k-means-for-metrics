#!/bin/bash

echo "k-means env setup in progress"

python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

mkdir -p data
mkdir -p results

echo "Setup complete."
deactivate