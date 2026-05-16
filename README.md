# Elevator Controller 
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

##  Getting Started

### Prerequisites
To simulate and view the waveforms for this project, you will need a SystemVerilog-compatible simulator. Popular options include:
* Xilinx Vivado
* ModelSim / QuestaSim
* Icarus Verilog (iverilog) + GTKWave (Open Source)

### Running the Simulation
1. Clone this repository to your local machine.
2. Add all `.sv` files to your simulation project.
3. Set `elevator_tb.sv` as the top-level module for simulation.
4. Run the simulation for at least `180ns` to see the full test sequence.

##  Waveform Verification

The included testbench (`elevator_tb.sv`) is designed to rigorously test the FSM transitions, ensuring:
1. The elevator properly resets to Floor 0.
2. The elevator passes through intermediate floors (e.g., from Floor 0 to Floor 3, it visits 1 and 2).
3. The `stop` signal successfully halts the elevator at its current intermediate floor, overriding the initial request.
4. The `changes_count` increments exactly when a new, distinct input is provided.

##  Technologies Used
* **Hardware Description Language:** SystemVerilog
* **Target Application:** FPGA-based Digital Logic
