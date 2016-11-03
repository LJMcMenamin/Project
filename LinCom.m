function [ newemitdt ] = LinCom( emitdt, RB_matrix )


%% Find coefficients

%Need to find m so that matrix dimensions agree
[m,n] = size(RB_matrix);

%Choose m ~evenly spaced entries from emitdt
spots = round(linspace(1,length(emitdt),m)); 
A = emitdt(spots);

%Invert A so that the SoLE can be solved, then solve and find the
%coefficients which make emitdt from RB_matrix
B = A'
C = RB_matrix(:, 1:m);
coefficients= B\C;



%% We then want to build emitdt using the coefficients found

%First
%Build an m-long version of emitdt from RB_matrix and the coefficients
first = coefficients*RB_matrix;

%Second
%Somehow try to recreate entire emitdt from this

newemitdt = interp1(RB_matrix,1:1000, 'spline');

end

