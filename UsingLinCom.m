%This script 




%% Set up
%emitdt size
size = 1000;

%waveform length
wl = 1000;

%vector to fill with the times taken for each iteration of the loop
interpend = zeros(size,1);

%vector to fill with the created version of emitdt, 'emitdtest'
emitdtest = zeros(size,wl);

Usable_RB_matrix = RB_matrix(:,(round(linspace(1,length(RB_matrix), size)))); 

%% Create version of emitdt form the coefficients 'emitdtest'

for i = 1:size

    
    %start timing how long each interpolation iteration takes
    interpstart = tic;
   
    %use 'LinCom' to re-create emitdt as emitdtest as a linear combination 
    %of the vectors in the reduced basis
    emitdtest(:,i) = LinCom(emitdt(:,i), Usable_RB_matrix);
    
    %
    interpend(i) = toc(interpstart);
end



%% Make graphs

%find the maximum difference between the original emitdt and the newly
%created emitdt
MaxDif = max(abs(emitdt-emitdtest));

%create a histogram of the maximum differences between the old and new
%emitdt
figure
hist(MaxDif)
title('differences')
xlabel('difference')
ylabel('occurrences')

%create a histogram of the times taken to create each emitdtest vector
figure
hist(interpend)
title('interpolation method times')
xlabel('time taken to recreate emitdt vector')
ylabel('occurrences')
