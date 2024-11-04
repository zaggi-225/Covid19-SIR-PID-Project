# Interpreting the Graphs from the PID-Controlled SIR Model Simulation

Understanding the graphs generated from your PID-controlled SIR model simulation involves analyzing the relationships between the different curves. Here’s a guide on how to read and interpret these graphs.

## 1. Graph Axes
- **X-axis (Time)**: Represents the time over which the simulation runs, typically measured in days or another time interval.
- **Y-axis (Proportion of Population)**: Shows the proportion of the population in each compartment (Susceptible, Infected, Recovered) or the intensity of lockdown measures.

## 2. Curves in the Graphs
- **Infected Curve (Red Line)**: Represents the proportion of the population that is infected at any given time.
  - **Key Points to Note**:
    - **Initial Rise**: An increase indicates a growing outbreak.
    - **Peak Infection**: The highest point represents the maximum number of infected individuals during the outbreak.
    - **Decline**: A decrease indicates that the infection is under control, likely due to effective public health measures (e.g., vaccinations, lockdowns).

- **Lockdown Intensity Curve (Blue Dashed Line)**: Shows how lockdown measures are adjusted over time based on infection levels.
  - **Key Points to Note**:
    - **High Values**: Indicates strict lockdown measures are implemented to control the spread.
    - **Low Values**: Reflects a relaxation of measures, possibly when infections are declining.

## 3. Analyzing the Relationships
- **Infection vs. Lockdown Intensity**: 
  - Typically, as the number of infections rises, lockdown intensity increases, showing that the PID controller reacts to current infection levels.
  - Conversely, when infection levels fall, lockdown intensity tends to decrease, indicating a return to normalcy.

## 4. Scenario Comparison
- Compare graphs from different scenarios to:
  - Look for variations in peak infection levels. Higher beta values usually lead to higher peaks.
  - Observe the effectiveness of the PID controller across different situations. In scenarios with high vaccination rates, the infected curve should display a lower peak and quicker decline.
  - Assess how quickly lockdown intensity adjusts in response to rising infections. More aggressive control strategies (higher Kp, Ki) lead to more rapid responses.

## 5. General Trends
- **Control Effectiveness**: Effective control measures should result in lower peak infections and quicker declines.
- **Timing of Interventions**: The timing of lockdown intensity adjustments impacts the outbreak's course. Quick responses to rising infections are generally more effective.
- **Long-Term Outcomes**: Analyze how different scenarios affect the eventual outcome—specifically, the number of individuals who recover and the overall disease dynamics.

## Conclusion
By carefully examining these graphs, you can gain insights into how disease dynamics behave under various public health interventions and control strategies. This analysis can help inform decision-making in real-world scenarios, illustrating the importance of timely interventions in managing infectious diseases.
