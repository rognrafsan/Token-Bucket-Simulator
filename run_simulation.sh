#!/bin/bash
# run_simulation.sh
# This script runs the Scilab token bucket simulation and then executes the Python analysis.

# Run the Scilab simulation (adjust the command if needed for your Scilab CLI)
scilab-adv-cli -nb -f tbs.sce

# Move the generated CSV file to the python/data folder if needed
# For example, if the CSV is generated in the repository root:
mv simulation_output.csv simulation_output.csv

# Run the Python analysis script
python3 analyze_data.py
