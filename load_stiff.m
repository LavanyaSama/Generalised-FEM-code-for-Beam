% This function calculate Global stiffness matrix and global load vector
function [K,F] = load_stiff(nele,ngauss,coord,connect,xivec,wvec,E,I,q0,L)

nnode = nele+1; % No.of nodes

% Global Stiffness matrix and Global Load Vector
K = zeros(2*nnode,2*nnode);
F = zeros(2*nnode,1);
             
% Calculation of element stiffness and load matrix (Generalisation)

for el = 1:nele  % Loop over elements
    nd1 = connect(el,2);
    nd2 = connect(el,3);
    x = [coord(nd1,2),coord(nd2,2)]; 
   vec = [2*nd1-1,2*nd1,2*nd2-1,2*nd2]; %Global D.O.F
   kele = zeros(4,4);
   fele = zeros(4);

    for gp = 1:ngauss  % Loop over Gauss elements
    xi = xivec(gp);  w = wvec(gp);
    kele(1:4,1:4) = kele(1:4,1:4) + elestiffg(xi,E,I,x)*w;
    fele(1:4,1:4) = fele(1:4) + eleloadg(xi,q0,L,x)*w;
    end
% Assembly using connectivity data
    for ii=1:4
        for jj=1:4
            K(vec(ii),vec(jj)) = K(vec(ii),vec(jj))+kele(ii,jj);
        end
        F(vec(ii)) =  F(vec(ii))+ fele(ii);
    end
end
