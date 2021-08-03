% This function reduces Global stiffness matrix and load vector by imposing
% boundary conditions
function [K,F] = impose_bc(K,F,BC_data)
supp_dof = [];
% Modification of Load vector due to nonzero value 
for ii =1:size(BC_data,1)
    nd = BC_data(ii,1);
    dof= BC_data(ii,2);
    val= BC_data(ii,3);
    GDOF = 2*(nd-1)+dof;
    supp_dof = [supp_dof,GDOF];
    if val~=0
        for jj = 1:2*nnode
         F(jj) = F(jj)-K(jj,GDOF)*val;
        end
    end   
end

% Elimination of stiffness and load matrix
supp_dof = sort(supp_dof);
for ii = 1:size(supp_dof,2)
    dof = supp_dof(ii);
    if dof == 1
        K = K(dof+1:end,dof+1:end);
        F = F(dof+1:end);
    elseif dof = 2*nnode;
        K = K(1:dof-1,1:dof-1);
        F = F(1:dof-1);
    else 
        K = K([1:dof-1,dof+1:end],[1:dof-1,dof+1:end]);
        F = F(1:dof-1,dof+1:end);
    end
    if(ii~=size(supp_dof,2))
        supp_dof(ii+1:end) = supp_dof(ii+1:end)-1;
    end
end
