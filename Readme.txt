# CGflow Incompressible Navier-Stokes Multiphase VOF Solver with Surface Tension (Toy Code)

A computational fluid dynamics (CFD) toy code for incompressible two-phase flows with surface tension effects using the Volume of Fluid (VOF) method. **This is an educational toy code with simplified implementations intended for learning purposes only.**

## Overview

CGflow_IncompVOF_SurfaceTension is a toy code for simulating two-phase flows with surface tension effects. Developed primarily for educational purposes, this simplified solver demonstrates the interaction between immiscible fluids (such as air and water) in a 2D domain. The code implements a staggered grid arrangement with the Volume of Fluid (VOF) method for interface tracking and includes surface tension modeling through the Continuum Surface Force (CSF) approach.

**Note:** As a toy code, this solver is intended for academic learning and simple demonstrations rather than production-level CFD simulations. It contains simplifications that make it accessible for educational purposes but may limit its accuracy for complex real-world problems.

## Features

- Two-phase flow simulation with density and viscosity jumps
- Surface tension modeling with CSF method
- Staggered grid spatial discretization (MAC method)
- Fourth-order Runge-Kutta (RK4) time integration
- Pressure-velocity coupling using the projection method
- High Resolution Interface Capturing (HRIC) scheme for VOF advection
- Mass conservation enforcement
- Courant number-dependent flux limiting

## Numerical Methods and Schemes

### Spatial Discretization
- Staggered grid arrangement (Marker and Cell method)
- Finite difference approximations for spatial derivatives
- Second-order central differencing for diffusion terms
- Hybrid scheme for convection terms

### Temporal Discretization
- Fourth-order Runge-Kutta (RK4) method for momentum equations
- Explicit time stepping

### Pressure-Velocity Coupling
- Fractional step method (Projection method)
- Pressure Poisson equation solved using Successive Over-Relaxation (SOR)

### Interface Capturing Method
- Volume of Fluid (VOF) method for tracking the interface between fluids
- High Resolution Interface Capturing (HRIC) scheme with flux limiting for improved interface sharpness
- Courant number-dependent blending for stability at high velocities
- Local boundedness enforcement to prevent numerical oscillations
- Global mass conservation correction

### Surface Tension Modeling
- Continuum Surface Force (CSF) method
- Interface smoothing for normal vector calculations
- Curvature computation from divergence of normal vectors
- Surface tension force projection onto staggered grid velocities

## Simulation Cases

The code can simulate four primary test cases:

### 1. Dam Break
Simulates the collapse of a water column contained by a virtual dam. When the simulation starts, the dam is instantaneously removed, and the water column collapses under gravity.

**Input parameters:**
- Water distance in X-Direction
- Water distance in Y-Direction

### 2. Water Column Collapse
Simulates the collapse of two separate water columns that eventually merge.

**Input parameters:**
- Water distance in X-Direction side 1
- Water distance in Y-Direction side 1
- Water distance in X-Direction side 2
- Water distance in Y-Direction side 2

### 3. Falling Water Drop
Simulates a water droplet falling into a pool of water.

**Input parameters:**
- Water drop radius
- X-Direction drop location
- Y-Direction drop location
- Water distance in Y-Direction

### 4. Rising Air Bubble
Simulates an air bubble rising through water due to buoyancy.

**Input parameters:**
- Air bubble radius
- X-Direction bubble location
- Y-Direction bubble location
- Water distance in Y-Direction

## Usage

1. Compile the code using a C++ compiler:
   ```
   g++ -o CGflow_solver CGflow_IncompVOF_SurfaceTension.cpp
   ```

2. Run the executable:
   ```
   ./CGflow_solver
   ```

3. Follow the prompts to input parameters:
   - Domain size (Lx, Ly)
   - Gravity components (gx, gy)
   - Fluid properties (densities and viscosities)
   - Surface tension coefficient
   - Interface thickness parameter for CSF method
   - Numerical parameters (grid size, time step, etc.)
   - Simulation type (1-4 corresponding to the cases above)
   - Case-specific parameters

4. The simulation results are output as CSV files at regular intervals in the `output/timestep_X` directories:
   - `vof.csv` - Contains the VOF field data (interface location)
   - `pressure.csv` - Contains the pressure field data
   - `density.csv` - Contains the density field data
   - `velocity.csv` - Contains the velocity magnitude field data
   - `u_velocity.csv` - Contains the x-component velocity field data
   - `v_velocity.csv` - Contains the y-component velocity field data

## Visualization

The CSV output files can be visualized using external tools such as:
- ParaView
- MATLAB/Octave
- Python with matplotlib or similar libraries

## Physical Parameters

Default physical parameters for air-water systems:
- Air density: 0.001 (kg/m³)
- Water density: 1.0 (kg/m³)
- Air viscosity: 0.00001855 (Pa·s)
- Water viscosity: 0.00089 (Pa·s)
- Surface tension: 0.07 (N/m)
- Gravity: -9.81 m/s² in the Y-direction

## Numerical Parameters

Default numerical parameters:
- Grid size: 102 x 102 points
- Time step: 0.00005 s
- Number of time steps: 5000
- Maximum inner iterations for pressure solver: 9000
- Maximum allowable error rate: 0.00001
- SOR relaxation parameter: 1.2
- CSV output frequency: 200 timesteps
- Interface thickness parameter: 2.5 (multiplied by grid spacing)

## Contact

For any bugs or implementation questions, please contact: cgflowcfd@gmail.com

## Acknowledgements

This code was written by Ganesh Kumar and is provided for educational and research purposes.

## Limitations

As this is a toy code developed for educational purposes, it has several important limitations:

- Limited to 2D simulations only
- Fixed rectangular domain with simple boundary conditions (no complex geometries)
- No turbulence modeling capabilities
- Limited numerical stability for high Reynolds number flows
- Basic VOF implementation without geometric reconstruction methods
- Simplified CSF implementation for surface tension
- No adaptive time stepping or grid refinement capabilities
- No parallelization for large-scale simulations
- Limited validation against analytical solutions or experimental data
- Simplified numerical methods that prioritize readability over performance
- Not optimized for computational efficiency
- Lacks robust error handling for edge cases
- Not recommended for production or research-grade simulations requiring high accuracy
