#!/usr/bin/env python3
"""
analyze_data.py
Python script for analyzing and visualizing the token bucket simulation data.
"""

import pandas as pd
import matplotlib.pyplot as plt

# File path to the simulation CSV
csv_file = "data/simulation_output.csv"

def load_simulation_data(file_path):
    # Load the CSV file into a pandas DataFrame
    df = pd.read_csv(file_path, header=None, names=["Time", "OutputTraffic", "TokenAvailability"])
    return df

def plot_simulation_data(df):
    # Plot Output Traffic vs. Time
    plt.figure(figsize=(10, 8))

    plt.subplot(3, 1, 1)
    plt.plot(df["Time"], df["OutputTraffic"], 'b-', linewidth=2)
    plt.title("Output Traffic Over Time")
    plt.xlabel("Time")
    plt.ylabel("Output Traffic")

    # Plot Token Availability vs. Time
    plt.subplot(3, 1, 2)
    plt.plot(df["Time"], df["TokenAvailability"], 'g-', linewidth=2)
    plt.title("Token Availability Over Time")
    plt.xlabel("Time")
    plt.ylabel("Tokens Available")

    # Plot Compliance Ratio (Output / (Output + Lost tokens)) if desired
    # For simplicity, here we assume compliance ratio = OutputTraffic / bucketSize 
    # as bucketSize is constant (e.g., 10)
    bucket_size = 10
    df["ComplianceRatio"] = df["OutputTraffic"] / bucket_size

    plt.subplot(3, 1, 3)
    plt.plot(df["Time"], df["ComplianceRatio"], 'r-', linewidth=2)
    plt.title("Compliance Ratio Over Time")
    plt.xlabel("Time")
    plt.ylabel("Compliance Ratio")

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    # Load simulation data
    simulation_df = load_simulation_data(csv_file)
    # Plot the simulation results
    plot_simulation_data(simulation_df)
