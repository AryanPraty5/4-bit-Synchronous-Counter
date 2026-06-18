# 4 bit Synchronous Counter 

A 4 bit Synchronous Counter implemented and simulated in AMD Xilinx Vivado

## Operations:

| Operation | Condition | Functional Behavior |
| :--- | :--- | :--- |
| **`clk` (Clock)** | `posedge` (Positive Edge) | **Synchronous Engine:** Every internal flip-flop is tied to this master clock line, ensuring all transitions happen simultaneously. |
| **`reset`** | Synchronous (Active-High) | **Master Override:** When high, the counter forces its value back to `4'b0000` on the next rising clock edge. Highest priority signal. |
| **`load`** | Synchronous (Active-High) | **Parallel Parallel Load:** When active, it bypasses the normal sequence and forces the counter to teleport to the value on the `data_in` bus. |
| **`enable`** | Input Signal | **Execution Gatekeeper:** If `1`, the counter advances its count sequence. If `0`, the counter freezes and holds its current state intact. |
| **`dirn` (Direction)** | Input Signal | **Direction Control:** Determines counting trajectory. When high (`1`), the module counts up; when low (`0`), it counts down. |

## Schematic:
![Schematic](assets/schematic.png)

## Simulation Waveform:
![Simulation_Result](assets/simulations.png)
