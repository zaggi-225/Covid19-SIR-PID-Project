# PID-Controlled SIR Model Simulation

## Overview

This project implements a simulation of disease spread using the SIR (Susceptible, Infected, Recovered) model enhanced with a PID (Proportional-Integral-Derivative) controller. The model demonstrates how PID control can be applied to manage public health interventions, such as lockdown measures and vaccination rates, in response to changing infection levels.

## SIR Model

The SIR model is a mathematical model used to represent the spread of infectious diseases in a population. It divides the population into three compartments:
- **S (Susceptible)**: Individuals who are susceptible to the disease.
- **I (Infected)**: Individuals who are currently infected and can transmit the disease.
- **R (Recovered)**: Individuals who have recovered from the disease and are assumed to be immune.

The model uses differential equations to describe the transitions between these compartments based on parameters such as the transmission rate (beta) and recovery rate (gamma).

## PID Controller

The PID controller is utilized to adjust the lockdown intensity based on the current number of infected individuals. It aims to maintain a desired infection level (setpoint) by dynamically modifying public health measures:
- **Kp (Proportional Gain)**: Adjusts the response proportionally to the current error.
- **Ki (Integral Gain)**: Accounts for past errors to eliminate residual steady-state error.
- **Kd (Derivative Gain)**: Predicts future errors based on the rate of change.

## Scenarios

The simulation explores various scenarios to analyze the impact of different initial conditions and control parameters on disease spread. Each scenario is designed to represent a unique public health situation:

1. **Moderate Conditions**:
   - **Beta**: 0.3 (medium transmission)
   - **Gamma**: 0.1 (recovery rate)
   - **Vaccination Rate**: 0.01
   - **PID Parameters**: Moderate values to reflect a balanced approach.

2. **Aggressive Spread**:
   - **Beta**: 0.6 (high transmission)
   - **Gamma**: 0.1
   - **Vaccination Rate**: 0.005
   - **PID Parameters**: Increased to handle high infection rates effectively.

3. **Slow Spread**:
   - **Beta**: 0.1 (low transmission)
   - **Gamma**: 0.05
   - **Vaccination Rate**: 0.02
   - **PID Parameters**: Lower values suitable for slow-growing infections.

4. **No Vaccination**:
   - **Beta**: 0.25
   - **Gamma**: 0.08
   - **Vaccination Rate**: 0.0 (no vaccination efforts)
   - **PID Parameters**: Adjusted to show uncontrolled spread.

5. **High Vaccination Rate**:
   - **Beta**: 0.3
   - **Gamma**: 0.1
   - **Vaccination Rate**: 0.1 (high vaccination efforts)
   - **PID Parameters**: Focused on maintaining low infection levels.

6. **High Initial Infection**:
   - **S0**: 0.6, **I0**: 0.3 (initially high infection)
   - **Beta**: 0.35
   - **Gamma**: 0.1
   - **Vaccination Rate**: 0.02
   - **PID Parameters**: Increased to manage a more severe outbreak.

7. **Fluctuating Transmission**:
   - **Beta**: 0.3
   - **Gamma**: 0.1
   - **Vaccination Rate**: 0.01
   - **PID Parameters**: Variable beta to simulate real-world changes in transmission.

## Usage

To run the simulation, execute the Python script. It will generate plots showing the number of infected individuals over time and the corresponding lockdown intensity for each scenario. Adjust the parameters in the scenarios list to explore different conditions and control strategies.

## Requirements

- Python 3.x
- NumPy
- SciPy
- Matplotlib

## Conclusion

This simulation provides insights into the dynamics of disease spread and the effectiveness of PID-controlled interventions in managing public health crises. By analyzing different scenarios, users can better understand how various factors influence disease transmission and control strategies.
