function ke = elestiffg(xi,E,Ie,x)
%% Input
% xi = Gauss Point
% E = Young's modulus
% Ie = Area moment of Inertia
% x = Nodal coordinates of the element
%% Output
% ke = Element stiffness matrix

Le = x(2)-x(1);
B1 = 3*xi/2;
B2 = Le*(3*xi-1)/4;
B3 = -3*xi/2;
B4 = Le*(3*xi+1)/4;

B = (4/Le^2)*[B1,B2,B3,B4];

ke = (E*Ie*Le/2)*(B'*B);