# Elevator Controller #
![Language](https://img.shields.io/badge/Language-SystemVerilog-blue) ![Tool](https://img.shields.io/badge/Tool-Xilinx_Vivado-orange) ![Status](https://img.shields.io/badge/Status-Simulation_Verified-success)
##  Project Overview

The circuit simulates the core logic of an elevator. It receives inputs indicating the target floor and a stop signal. Like a real elevator, traveling between non-adjacent floors involves passing through intermediate floors. It also tracks the total number of floor changes requested by the user.

### Key Features:
* **4-State FSM:** Represents the 4 floors (0 to 3), handling realistic transitions based on current state and user input.
* **Edge Detection:** Uses a custom `change_detector` module to register when a new floor button is pressed.
* **Parameterizable Counter:** A flexible counter module used to keep track of how many times the elevator has changed states.
* **Synchronous Design:** Built entirely using standard synchronous design practices (positive edge clocking, synchronous active-high resets).
* **Robust Testbench:** Includes a fully functional testbench (`elevator_tb`) that accurately stimulates the design to reproduce a specific, required verification waveform.

##  Module Architecture

The project is structured hierarchically:

* `elevator.sv` - **(Top Level for Simulation)** Integrates the FSM, detector, and counter.
  * `elevator_fsm.sv` - The core Finite State Machine controlling floor logic.
  * `change_detector.sv` - Compares current input to a registered previous input to generate a one-cycle pulse on change.
  * `counter.sv` - A parameterizable counter that increments whenever the `change_detector` fires.
## Schematic
<img width="1764" height="764" alt="image" src="https://github.com/user-attachments/assets/19bc4bed-a597-4b15-b5f1-8e8b9e305d7b" />

##  Waveform Verification

<img width="1662" height="263" alt="image" src="https://github.com/user-attachments/assets/d3a652db-311a-4ebe-a661-f646b7916cc7" />


The included testbench (`elevator_tb.sv`) is designed to rigorously test the FSM transitions, ensuring:
1. The elevator properly resets to Floor 0.
2. The elevator passes through intermediate floors (e.g., from Floor 0 to Floor 3, it visits 1 and 2).
3. The `stop` signal successfully halts the elevator at its current intermediate floor, overriding the initial request.
4. The `changes_count` increments exactly when a new, distinct input is provided.

##  Technologies Used
* **Hardware Description Language:** SystemVerilog
* **Target Application:** FPGA-based Digital Logic
