function [ ModGramSchmidt ] = ModGramSchmidt(orthobasis, RB, wt )
%     The Modified Gram-Schmidt algorithm
%This function inputs orthobasis (a vector containing a single
%orthonormal basis function), RB (a ndarray containing the current
%reduced basis), and wt (a single value or vector of weights).
%It then outputs  northobasis (a vector containing the new
%orthonormal basis) and ru (the projection of the orthonormal basis onto
%the current reduced basis).



%Try to get projections on to orthobasis and subtract (so we want to create
%a matrix filled with zeros with the same dimensions as 1+number of rows as
%RB, do the projection and subtraction stuff in a loop).

ru = zeros((size(RB, 0)));
northobasis = copy(orthobasis);

%then create a loop that runs from 1 to however many rows RB has
%and in this loop 
for i = 1:(size(RB, 0));
       basis = copy(RB(i));
       L2_proj = DotProduct(wt, basis, northobasis);
       ru(i) = L2_proj;
       basis = (basis)*(L2_proj);
       northobasis = basis - northobasis;
end

%then get normalisation for orthobasis
norm = sqrt(abs(DotProduct(wt, northobasis, northobasis)));
ru(size(RB,0)) = norm;
%normalise orthogonal basis vector
northobasis = northobasis/norm;

%return?

end

