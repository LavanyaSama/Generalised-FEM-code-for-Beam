% This function will add point load and point moment data to Global
% stiffness matrix and Global load vector 
function F = point(F,P_load,P_moment)
for ii = 1:size(P_load,1)
    nd = P_load(ii,1);
    F0 = P_load(ii,2);
    F(2*nd-1) =  F(2*nd-1)+F0;
end
for ii = 1:size(P_moment,1)
    nd = P_load(ii,1);
    M0 = P_load(ii,2);
    F(2*nd) =  F(2*nd)+M0;
end