function [ emitdtest ] = LinCom( emitdt, RB_matrix )


%% Find coefficients

%Need to find m so that matrix dimensions agree
[m,n] = size(RB_matrix);

%Choose m ~evenly spaced entries from emitdt
spots = round(linspace(1,length(emitdt),m)); 
A = emitdt(spots);

%get the same points from each of the reduced bases and put them in a matrix
B = RB_matrix(:, spots)';

%solve and find the coefficients which make emitdt from RB_matrix
coefficients = inv(B)*A;

%% We then want to build emitdt using the coefficients found

%Build an version of emitdt from RB_matrix and the coefficients
emitdtest = sum(coefficients'*RB_matrix, 1);

end

