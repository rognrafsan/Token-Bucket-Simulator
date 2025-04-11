# TCP/IP Token Bucket Simulator

**Author:** Akhil Rai
**Project Duration:** January 2024 – July 2024  
**Role:** Developer

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture & Repository Structure](#architecture--repository-structure)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Methodology](#methodology)
- [Simulation Details & Results](#simulation-details--results)
- [Conclusion](#conclusion)
- [Acknowledgments](#acknowledgments)
- [References](#references)

---

## Overview

The **TCP/IP Token Bucket Simulator** is a sophisticated tool developed to model the token bucket algorithm—a widely adopted traffic shaping mechanism used in network communications. Implemented primarily in **Scilab** for simulation and integrated with **Python** for data analysis and visualization, this project simulates the dynamic regulation of bursty TCP/IP network traffic. By configuring key parameters such as bucket size and token generation rate, the simulator demonstrates how data flow is effectively regulated, ensuring a balance between high-volume bursts and controlled transmission. This solution was developed and tested in a Linux environment and is designed for both educational purposes and real-world applications in bandwidth management and congestion control.

---

## Features

- **Dynamic Simulation:**  
  - Simulate network traffic using a configurable token bucket algorithm with options for dynamic token rates.
  - Process bursty input traffic and regulate it based on token availability.

- **Detailed Logging & Monitoring:**  
  - Log intermediate results, including token availability, overflow, and underflow events.
  - Real-time monitoring of token consumption and traffic shaping.

- **Comprehensive Visualization:**  
  - Generate multiple plots that display input vs. output traffic, token availability over time, and compliance ratios.
  - Graphical representation of overflow and underflow counts.

- **Modular Design:**  
  - Separated code modules for simulation (Scilab), data analysis (Python), and execution (Shell scripts) for ease of maintenance and extensibility.

- **Cross-Platform Deployment:**  
  - Developed in a Linux environment; code easily deployable on other operating systems.

---

## Architecture & Repository Structure

The repository is organized to clearly separate simulation, analysis, and documentation components:

```
token-bucket-simulator/
├── README.md                   # This documentation file
├── LICENSE                     # Project license (MIT or similar)
├── docs/
│   └── methodology.md          # Detailed project methodology
├── scilab/
│   └── token_bucket_simulator.sce  # Scilab simulation source code
├── python/
│   ├── analyze_data.py         # Python script for analysis and visualization
│   ├── requirements.txt        # Python dependencies (pandas, matplotlib)
│   └── data/                   # Folder for simulation output CSV data
├── scripts/
│   └── run_simulation.sh       # Shell script to run simulation and analysis
```

---

## Installation & Setup

### Prerequisites

- **Scilab:** Version supporting Scilab scripting (ensure `scilab-adv-cli` is installed).
- **Python:** Version 3.x with `pip` package manager.
- **Linux Environment:** The project has been developed and tested on Linux.

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/token-bucket-simulator.git
   cd token-bucket-simulator
   ```

2. **Install Python Dependencies**

   Navigate to the Python directory and install required packages:

   ```bash
   cd python
   pip install -r requirements.txt
   cd ..
   ```

3. **Make the Shell Script Executable**

   ```bash
   chmod +x scripts/run_simulation.sh
   ```

---

## Usage

To run the full simulation (Scilab simulation followed by Python data analysis and visualization), execute the provided shell script from the repository root:

```bash
./scripts/run_simulation.sh
```

- The Scilab simulation will run using the file `scilab/token_bucket_simulator.sce` and output a CSV file (`simulation_output.csv`) containing simulation results.
- The Python script located at `python/analyze_data.py` will then read this CSV, generate plots, and display analysis results.

---

## Methodology

The project follows a modular approach and is built around the following key components:

1. **Simulation Module (Scilab):**
   - **Input Parameters:**  
     - `bucketSize`: Maximum capacity of the token bucket.
     - `initialTokenRate`: Initial rate at which tokens are added.
     - `timeDuration`: Total duration of the simulation.
     - `burstyTraffic`: Array representing variable network traffic.
     - `variableTokenRate`: Optional array for dynamic token generation.
   - **Processing:**  
     - The simulation loop replenishes tokens, processes bursty traffic, and logs events (overflow/underflow) as tokens are consumed.
   - **Output:**  
     - Traffic shaping results, token availability over time, and performance metrics are exported to a CSV file.

2. **Visualization & Analysis Module (Python):**
   - **Data Analysis:**  
     - The Python script reads the simulation data and computes key metrics (e.g., average traffic rates, compliance ratio, overflow/underflow counts).
   - **Plotting:**  
     - Generates time-series plots for traffic comparison, token availability, and compliance ratio to provide insights into network behavior.

3. **Execution Workflow:**
   - The main driver (`run_simulation.sh`) orchestrates the execution of the simulation and analysis in sequential order, ensuring a seamless and automated process.

---

## Simulation Details & Results

During the simulation, detailed logs are generated for each time step. Sample log output includes:

- **Initialization Logs:**
  ```
  "Starting Extended Token Bucket Simulation..."
  "Bucket Size: 10"
  "Initial Token Rate: 2"
  "Time Duration: 50"
  ```
- **Per-Time-Step Logs:**
  ```
  "Time 1: Tokens before traffic processing: 10"
  "  Full transmission allowed: 4 tokens left: 6"
  "Time 3: Tokens before traffic processing: 6"
  "  Partial transmission: 6 tokens depleted to zero."
  ```
- **Summary Logs:**
  ```
  "Simulation Complete."
  "Total Overflow Instances: 0"
  "Total Underflow Instances: 32"
  ```

These logs, combined with the generated plots (output vs. input traffic, token availability, compliance ratio, etc.), allow for a comprehensive analysis of the Token Bucket algorithm's performance in handling bursty TCP/IP traffic.

---

## Conclusion

The implementation and simulation of the Token Bucket algorithm in Scilab have provided deep insights into traffic shaping techniques critical in modern network environments. By dynamically adjusting parameters such as bucket size and token generation rate, the simulator effectively regulates data flow even during traffic surges. The results underscore the importance of token availability in controlling output data rates, with the algorithm demonstrating its capability to handle bursty traffic while maintaining network stability. This project not only serves as a robust educational tool but also as a practical framework for bandwidth management and congestion control, making it relevant for real-world applications in networking.

---

## Acknowledgments

We extend our heartfelt thanks to:

- **Dr. Raghavendra Pal:** For his mentorship, expertise, and constant encouragement throughout this project.
- **Faculty and Staff of the Electronics Department:** For providing a conducive learning environment and the necessary resources.
- **Peers, Friends, and Family:** For their unwavering support and motivation.

We also acknowledge the guidance of our academic advisors and the collaborative efforts of the project team.

---

## References

1. Tanenbaum, A. S., & Wetherall, D. J. (2011). *Computer networks*. Pearson Education.
2. Stallings, W. (2014). *Data and computer communications*. Prentice Hall.
3. Forouzan, B. A. (2017). *Data communications and networking*. McGraw-Hill.
4. SCILAB Official Documentation. (n.d.). Retrieved from [https://www.scilab.org/documentation](https://www.scilab.org/documentation)
5. Comer, D. E. (2013). *Internetworking with TCP/IP: Principles, protocols, and architecture*. Pearson Education.
6. Kurose, J. F., & Ross, K. W. (2021). *Computer networking: A top-down approach*. Pearson.
7. Token Bucket Algorithm Explained. (n.d.). Online Networking Tutorials. Retrieved from [https://www.networkingtutorials.com](https://www.networkingtutorials.com)
