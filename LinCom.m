function [ newemitdt ] = LinCom( emitdt, RB_matrix )


%% Find coefficients

%Need to find m so that matrix dimensions agree
[m,n] = size(RB_matrix);

%Choose m ~evenly spaced entries from emitdt
spots = round(linspace(1,length(emitdt),m)); 
A = emitdt(spots);

B = A'
C = RB_matrix(:, 1:m);
coefficients= B\C;



%% We then want to build emitdt using the coefficients found

newemitdt = interp1(B,  ,RB_matrix, 

end

