# Matlab

# Parameter identification to assess enzyme performance:

Enzymes are biological molecules that are able to catalyze chemical reactions; that means that they enable and accelerate the occurrence of those chemical reactions. For instance, enzymes in your saliva and stomach catalyze reactions that break food into more basic molecules so your body can use them.
Although enzymes are originally found in nature, technological advances in molecular biology, chemical engineering, and biological engineering have made it possible for enzymes to be widely used in industrial applications such as detergents, starch and fuel, food, animal feed, beverage, textile, pulp and paper, fat oils, leather, personal care, etc. The worldwide value of the enzyme market was estimated at $7,082 million in 2017, and it is projected to reach $10,519 million by 2024 [Allied Market Research, 2018].
The detergent industry is the largest industry segment using enzymes, both in volume and value. The enzymes help remove protein stains, starch stains, oil and grease stains, and stains from other biological origins [Allied Market Research, 2018; Kirk et. al, 2002]. For instance, proteases, the most commonly used enzymes in detergents, are used to clean protein stains because they break down proteins to their most basic units, amino acids, which do not stick to fabric and dissolve in soapy water. Manufacturers continue to develop new versions of detergent enzymes to optimize their performance in specific detergent compositions and pH conditions and to function at low temperatures, which are desired for household laundering and dishwashing to save energy.
For a better understanding of the key terms in this project, watch the video linked here:
https://www.youtube.com/watch?v=23n4RNwptDg

Project Goals
This project supports learning to:
• apply basic programming concepts to the solution of engineering problems,
• represent and interpret data in multiple formats
• develop, select, modify, and justify mathematical models to solve an engineering problem,
• function effectively as a member of a team, and
• demonstrate habits of a professional engineer

# Enzyme performance and kinetic parameters
A way to characterize an enzyme’s performance is to calculate its kinetic parameters: maximum reaction velocity (𝑉 ) and Michaelis constant (𝐾 ). Under certain assumptions, enzyme kinetics can be
𝑚𝑎𝑥 𝑚
described using the Michaelis-Menten model, which states that the velocity of an enzyme-catalyzed reaction is dependent upon the substrate concentration [S] as shown in the figure below.
  

From the plot in Figure 1, initially, as the concentration of substrate increases, the velocity of reaction increases proportionally with it. However, as the concentration of substrate continues to increase, the velocity of reaction stops increasing proportionally and increases less and less. Finally, at high substrate concentrations, the reaction velocity reaches its maximum value and remains constant (stops increasing) regardless of the increase in substrate concentration. At this point, the enzyme is saturated with substrate.
A good analogy for this same dynamic is a toll plaza with five booths. Think of the booths as the enzyme and the cars as the substrate. When there are only a few cars (low substrate concentrations) the booths serve the cars as they come (one car arrives, one car is served and dispatched, etc.). However, as high numbers of cars get to the plaza, the rate at which cars can get through the booths is independent of the numbers of cars in the line, or in other words, there is a maximum speed that the booths can serve cars, and it is independent of the number of cars. At this point, the toll plaza (e.g., reaction) begins to back up and a constant rate is reached.
Using the Michaelis-Menten model to describe enzyme kinetics is valid under the following assumptions:
- The reaction catalyzed by the enzyme (𝐸) only involves one type of substrate (𝑆) and one type of
product (𝑃).
It is of the form 𝑆 → 𝑃 with the following intermediate steps and corresponding kinetic
constants:

E + S = ES -> E + P

where 𝑘1, 𝑘2, and 𝑘−1 are the rate constants for each reaction step.
- The reverse reaction (𝑆 ← 𝑃) does not take place (i.e., the product is not being converted into the
substrate and the product initial concentrations are zero or near zero).
𝐸
Figure 1: Michaelis-Menten plot
 Page 2 of 5

ENGR 132 NaturalCatalysts Project Spring 2023 - The 𝐸𝑆 complex is a steady-state intermediate, that is, the concentration of 𝐸𝑆 remains constant
because it is produced at the same rate that it is broken down. The Michaelis-Menten model is described by the following equation:
 Where
𝑣 = the velocity of the enzyme-catalyzed reaction (concentration/time, for example, μM/min) the concentration of substrate (amount of substance/volume, for example, μmol/L or μM) the maximum velocity of the reaction (concentration/time, for example, μM/min)
[𝑆] = the Michaelis constant, which is related to the affinity of the enzyme for the substrate. It has
𝑉max = the same units as the concentration of substrate. It corresponds to the substrate concentration
𝐾𝑚 = when the reaction velocity is half of the maximum reaction velocity (𝑉 ). 𝐾 is a combination of the rate constants of the chemical reaction, as follows:
𝑉 [𝑆] 𝑣= 𝑚𝑎𝑥
𝐾𝑚 + [𝑆]
𝐾𝑚 = 𝑘2 + 𝑘−1 𝑘1
𝑚𝑎𝑥 𝑚
 The important thing about this model is that we can use its parameters to evaluate and compare enzyme performance. For instance,
- Enzymes with a higher 𝑉 catalyze reactions faster. 𝑚𝑎𝑥
- A high 𝐾𝑚 indicates that the affinity of the enzyme for the substrate (how well it binds) is low, which translates into a poorly catalyzed reaction. On the other hand, enzymes with low 𝐾𝑚 have high affinity for the substrate, which translates into quick binding and a more effective reaction.


## Project Context
Background
NaturalCatalysts, Inc., an Indiana-based producer of commercial enzymes for the detergents industry, has
contracted your team to help analyze new generation enzymes under development. NaturalCatalysts
employees have been testing five new enzymes in the lab and need to perform their quality assurance
(QA) analysis to understand any difference in performance among enzymes. They ran 100 kinetic enzyme
test, 10 tests and 10 duplicates for each of the five different enzymes that they are evaluating. The five
enzymes have different kinetic constants (𝑉 and 𝐾 ), but the 10 tests run per each enzyme and their 𝑚𝑎𝑥 𝑚
duplicates should show similar performance. These five enzymes are intended for use in a specific
application as detailed in the memo; “fast-action, high-effective” enzymes are more expensive than
“slow-action, low-effective” ones, and NaturalCatalysts’ products are priced accordingly. Note that the
fast-action enzymes have a high maximum velocity (𝑉 ), and the high-effective enzymes have a low 𝑚𝑎𝑥
Michaelis constant (𝐾𝑚).
See the memo from NaturalCatalysts, Inc. president Avery D. Lion (available as a separate document).
NaturalCatalysts’ customers routinely purchase several batches of enzymes at one time, for use in a single application. Their customers expect that each enzyme batch will have essentially identical performances.

Here, “performance” means maximum velocity (𝑉 ) and Michaelis constant (𝐾 ). NaturalCatalysts’
𝑚𝑎𝑥 𝑚
customers rely on them to manufacture their products for predictable performance.
The consequences of a customer having poor enzyme performance can be significant. Hospitals, hotels, and restaurants rely on third parties to clean fabric that can be reusable. For instance, hospitals reuse cleaning blankets, sheets, pads, and scrubs. The most common type of stains in hospital materials are blood (which is the most critical one). Failure to clean these fabrics can result in serious contamination of patients and hospital personnel. Another example is bed sheets and towels at hotels. These linens come with significant amount of biological secretions, oils and grease from sunscreen and tanning products, and food. When enzymes in detergents do not perform properly, this can result in appearance of stains after cleaning, degradation of fabrics, or even skin allergies due to sensitivity or residues of chemicals or contaminants. Therefore, NaturalCatalysts plays a key role in their customers’ product success as well as their responsibility towards public safety and health.
NaturalCatalysts engineers will send you 100 kinetic enzyme curves, 10 curves and 10 duplicates for each of the five enzymes. An illustration of a generic kinetic enzyme curve for one concentration of substrate is shown in Figure 2a.
In their experiments, NaturalCatalysts engineers performed a classic kinetic-enzyme test using a reaction where the substrate 𝑆 is converted into the product 𝑃 by the enzyme, 𝐸. In the experiment, an initial concentration of substrate [𝑆]0 is mixed with a fixed amount of enzyme, [𝐸], and the concentration of the product [𝑃] is measured over time. This experiment is done for the same enzyme and the same enzyme concentration at multiple initial concentrations of substrate. In this case, NaturalCatalysts engineers used 10 different initial concentrations of substrate, [𝑆𝑖]0, in a range from [𝑆1]0 = 3.75 μM to [𝑆10]0 = 2,000 μM. After the data are collected, the initial velocity of reaction, 𝑣0𝑖 , is calculated from each of the 10 tests. The initial reaction velocity is the initial slope of the first part of the [𝑃] versus time plot (see illustration in Figure 2b to see the initial slope for the enzyme curve shown in Figure 2a).
A Michaelis-Menten plot shows the relationship between reaction velocity, 𝑣, and substrate concentration, [𝑆], for a particular enzyme experiment. To create a Michaelis-Menten plot, graph all 10 initial reaction velocities with their respective initial substrate concentrations and model the curve (see illustration in Figure 2c). The kinetic parameters, 𝑉 and 𝐾 , for each enzyme can then be estimated
from the Michaelis-Menten curve.
𝑚𝑎𝑥
𝑚
   (a)
    (b)
    (c)
    
    Figure 2. (a) Concentration of product vs time for a single initial substrate concentration. (b) Calculation of initial reaction velocity for a single initial substrate concentration. The initial reaction velocity is the slope of the initial part of the product vs time plot. (c) Michaelis-Menten plot: The initial reaction velocity is calculated for several initial concentrations of substrate and then, the initial reaction velocity is plotted against the concentration of substrate to build a Michaelis-Menten plot.

(See porject files to find the reference plots)

NaturalCatalysts wants to use their enzymes’ Michaelis-Menten plots to guide their characterization of enzyme performance in the sales literature for their customers. NaturalCatalysts would like to be able to claim to their customers that, based upon their in-house testing, their enzymes provide highly predictable behavior when degrading stains. Right now, NaturalCatalysts is unsure if their data would support that claim, and part of your job is to help them decide what claims they can make based upon the available data.
Deliverables
Your team is to provide NaturalCatalysts with a 2-page technical brief containing both technical analysis and expert recommendations as follows:
• A detailed description of your analysis of the dataset provided, including clear and easy-to- understand graphics that summarize the data.
• An error analysis that characterizes the accuracy of your approach to determining maximum velocity and Michaelis constant and other performance characteristics of the system.
• A recommendation about what NaturalCatalysts can honestly and ethically claim to its customers about the performance of the next generation of enzymes.
You will work toward these final deliverables according to the following milestone schedule.
Milestone Schedule
M1. Parameter Identification Brainstorming
M2. Algorithm Development
M3. Algorithm Evaluation and Improvements
M4. Algorithm Refinement and Final Deliverable
