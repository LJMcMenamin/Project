function [ northobasis ] = IMGS( orthobasis, RB)
% Iterative modified Gram-Schmidt algorithm.
% It inputs orthobasis (a vector containing a single orthonormal basis
% function), RB (a ndarray containing the current reduced basis), and wt (a
% single value or vector of weights)
% It outputs northobasis (a vector containing the new orthonormal basis)

%hardcoded condition
orthocondition = 0.5; 
nrm_prev = sqrt(abs(dot(orthobasis, orthobasis)));
flag = true;

%copy and normalise orthogonal basis vector
e = (orthobasis);
e = e/nrm_prev;

ru = zeros(size(RB,1));

while flag 
    northobasis = (e) ;
    [northobasis, rlast] = ModGramSchmidt(northobasis, RB);
    ru = ru + rlast;
    nrm_current = real(ru(1));

    northobasis = northobasis*(ru(1));

    if  (nrm_current/nrm_prev) < orthocondition;
         nrm_prev = nrm_current;
         e =(northobasis);
    else
         flag = false;
    end

nrm_current = sqrt(abs(dot(northobasis, northobasis)));
northobasis = northobasis/nrm_current;
ru(1) = nrm_current;
end

%return northobasis?


end

