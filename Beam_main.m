E = 210e9; I = 0.5*10^-6; q=2000; P=10000; M=3000;

%  Element 1
x = [0,2];
k1 = elestiff(E,I,x);

%  Element 2
x = [2,4];
k2 = elestiff(E,I,x);
f2 = eleload(q,x);

%  Element 3
x = [4,5];
k3 = elestiff(E,I,x);

%  Element 4
x = [5,6];
k4 = elestiff(E,I,x);

% Assembly
K = zeros(10,10);
F = zeros(10,1);

K(1:4,1:4) = k1(1:4,1:4);
K(3:6,3:6) = K(3:6,3:6) + k2(1:4,1:4);
K(5:8,5:8) = K(5:8,5:8) + k3(1:4,1:4);
K(7:10,7:10) = K(7:10,7:10) + k4(1:4,1:4);

F(3:6)=f2(1:4);
F(3) = F(3) + P;
F(8) = F(8) + M;

% Imposition of Boundary Conditions
Kreduce = K([2:8,10],[2:8,10]);
Freduce = F([2:8,10]);

% Finding Solution
ureduce = inv(Kreduce)*Freduce;

% Finding reaction force
un = [0;ureduce(1:7);0;ureduce(8)];
Fr = K*un;




