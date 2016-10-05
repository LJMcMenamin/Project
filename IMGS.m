function [ northobasis ] = IMGS( orthobasis, RB, wt )
% Iterative modified Gram-Schmidt algorithm.
% It inputs orthobasis (a vector containing a single orthonormal basis
% function), RB (a ndarray containing the current reduced basis), and wt (a
% single value or vector of weights)
% It outputs northobasis (a vector containing the new orthonormal basis)

%hardcoded condition
orthocondition = 0.5; 
nrm_prev = sqrt(abs(dot_product(wt, orthobasis, orthobasis)));
flag = True;

%copy and normalise orthogonal basis vector
e = copy(orthobasis);
e = e/nrm_prev;

ru = zeros(size(RB,0));

while flag 
    northobasis = copy(e) ;
    [northobasis, rlast] = ModGramSchmidt(northobasis, RB, wt);
    ru = ru + rlast;
    nrm_current = real(ru(0));

    northobasis = northobasis*(ru(0));

    if  (nrm_current/nrm_prev) < orthocondition;
         nrm_prev = nrm_current;
         e = copy(northobasis);
    else
         flag = False;
    end

nrm_current = sqrt(abs(dot_product(wt, northobasis, northobasis)));
northobasis = northobasis/nrm_current;
ru(0) = nrm_current;
end

%return northobasis?


end

