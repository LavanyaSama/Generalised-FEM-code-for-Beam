%% Input data
E = 200e9; I = 30*10^-6; q0=20000; P=10000; M0=15000;L = 3;
nele = 3;
nnode = nele+1;
%Gauss Points and weights
ngauss = 3;
xivec = [-0.774597,0,0.774597];
wvec = [5/9,8/9,5/9];

% Co-ordinates of elements
coord = [1,0.0;
        2,1.0;
        3,2.0;
        4,3.0];
connect = [1,1,2;
           2,2,3;
           3,3,4];

% Point Load and Moment
P_load = [4,50000]; % First Column is Node number and second column is point load value
P_moment = [4,15000]; % First Column is Node number and second column is point Moment value

% Boundary conditions suppressed
BC_data = [1,1,0; 
           1,2,0]; % First column is node number, Second column is prescribed dof and third is cloumn is value of prescribed dof
