@echo off
echo k-means env setup in progress

python -m venv venv
call venv\Scripts\activate.bat

python -m pip install --upgrade pip
pip install -r requirements.txt

mkdir data 2>nul
mkdir results 2>nul

echo Setup complete.
deactivate