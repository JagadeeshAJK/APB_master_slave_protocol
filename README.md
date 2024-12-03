# **APB Protocol**

This project implements the Advanced Peripheral Bus (APB) protocol for interfacing peripherals in ARM-based systems. The APB protocol is designed for low power, low bandwidth applications and is ideal for connecting peripherals like timers, UARTs, and other simple devices in embedded systems.

## **Overview**
The **APB Protocol Project** provides a Verilog/VHDL-based implementation of the APB protocol, including both master and slave interfaces. This project is designed to be flexible and easily integrated into larger systems. It includes:
- Master and slave APB interface models.
- Verilog/VHDL code for the APB protocol.
- A testbench for simulation and verification.

---

## **Features**
- **Master and Slave APB Interface:** Implementations for both the master and slave sides of the protocol.
- **Low Power Operation:** Designed with low-power operation in mind.

---

## **Project Structure**


## WRITE TRANSFER
This section describes the following types of write transfer:
-  With no wait states
-  With wait states
All signals shown in this section are sampled at the rising edge of Pclk.
## - Write Transfer with no wait state:
![WNwait](https://github.com/JagadeeshAJK/APB_master_slave_protocol/blob/main/Write_nowait_state.png)
## - Write Transfer with wait state:
![Wwait](https://github.com/JagadeeshAJK/APB_master_slave_protocol/blob/main/Write_wait_state.png)


## READ TRANSFER
This section describes the following types of read transfer:
-  With no wait states
-  With wait states
All signals shown in this section are sampled at the rising edge of Pclk.
## Read Transfer with no wait state :
![RNwait](https://github.com/JagadeeshAJK/APB_master_slave_protocol/blob/main/Read_nowait_state.png)
## Read Transfer with no wait state :
![Rwait](https://github.com/JagadeeshAJK/APB_master_slave_protocol/blob/main/Read_wait_state.png)
