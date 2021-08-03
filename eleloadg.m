function fe = eleloadg(xi,q0,L,x)

N1 = (2-3*xi+xi^3)/4;
N2 = (1-xi-xi^2+xi^3)/4;
N3 = (2+3*xi-xi^3)/4;
N4 = (-1-xi+xi^2+xi^3)/4;

le = x(2) - x(1);
N = [N1, le*N2/2, N3, le*N4/2];

N1x = (1-xi)/2;
N2x = (1+xi)/2;

xe = [N1x N2x]*x';

q = q0*(1-xe/L);

fe = N'*q*le/2; 