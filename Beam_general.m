%% Read input file
input;

%% Global Stiffness matrix and Global Load Vector
% This function calculate Global stiffness matrix and global load vector
[K,F] = load_stiff(nele,ngauss,coord,connect,xivec,wvec,E,I,q0,L);

%% Point Load and Moment
% This function will add point load and point moment data to Global
% stiffness matrix and Global load vector 

F = point(F,P_load,P_moment);

%% Imposition of B.C.
K_glob = K;
F_glob = F;
% This function reduces Global stiffness matrix and load vector by imposing
% boundary conditions
[K,F] = impose_bc(K,F,BC_data);

%% Finding Solution
ureduce = inv(K)*F;
% Finding rection force
un = [0,0,ureduce];
Freac = K*un;

%% Post Processing: FEM displacement
xi = [-1:0.2:1]'; % distribution of data points
[xnume,unume] = postprocessing(nele,coord,connect,un,xi);

%% Writing output results in a file
fid=fopen('Problem  with 3 elements.txt','w');   %%fid=fopen('Problem name.txt','w');

fprintf(fid,'\n\nThe Final Solution\n');
fprintf(fid,'=========================\n\n');
fprintf(fid,'wn\n');
fprintf(fid,'--\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',un(i));
end

fprintf(fid,'\n\nThe Reaction Forces can be found from\n');
fprintf(fid,'=========================================\n\n');
fprintf(fid,'F = K*wn\n');
fprintf(fid,'---------\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',Freac(i));
end
save('filename111','fid')
















