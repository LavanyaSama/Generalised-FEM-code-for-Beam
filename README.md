# Generalisation of Matlab code for FEA of Beam :
### Project Description:
1. In this project, an in-house code is developed for solving beam subjected to general loading by Finite element Method in Matlab. The solution of Project yields displacments, slopes at every node which we can use to determine shear and bending moment at any section of beam and reaction forces at supports. 
2. We will create two matrices viz. connect and coord. The first matrix connect contains information about element number number and corresponding global node numbers and the second matrix have information of global node numbers and corresponding position coordinates. 
3. These matrices will help in generalising the code in creating element stiffness and load matrices, systematic assembly and postprocessing of the problem.
4. Another matrix named BC_data will have data relating node numbers and prescribed D.O.F at corresponding nodes. This will help in reducing the global stiffness and load matrices.
5. Finally, the post processing of the problems is done and plots of displacements vs shear forces and slopes vs Moments were plotted. 
