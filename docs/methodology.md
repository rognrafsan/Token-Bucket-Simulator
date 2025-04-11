# Methodology

## Overview of the Token Bucket Algorithm
The Token Bucket algorithm is a network traffic shaping mechanism that regulates data transmission by permitting packets only if sufficient tokens are available. Each token grants permission to send a fixed data unit, and tokens are added to the bucket at a fixed or variable rate until a maximum capacity is reached. Excess tokens are discarded in the event of overflow, while the lack of tokens (underflow) delays or partially transmits traffic. This technique is used extensively for bandwidth management and congestion control.

## Program Structure and Flow of Execution

1. **Simulation Function (Scilab)**
   - **Inputs**: `bucketSize`, `initialTokenRate`, `timeDuration`, `burstyTraffic`, and optional `variableTokenRate`.
   - **Operation**: At each time step, tokens are replenished based on the defined rate. Traffic is processed based on token availability, updating tokens, and tracking overflow/underflow events.
   - **Data Export**: The simulation writes detailed results (time, output traffic, token availability) to a CSV file.

2. **Visualization and Analysis (Python)**
   - The Python script reads the CSV file generated during simulation.
   - It analyzes performance metrics such as compliance ratio, average traffic rates, overflow, and underflow counts.
   - It generates various plots to provide a visual representation of the simulation results.

3. **Main Driver**
   - A shell script orchestrates the simulation by invoking the Scilab simulation followed by the Python analysis.

This modular design ensures code clarity, ease of debugging, and extensibility.
