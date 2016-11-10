%Hopefully this should run emitdt for 1000 random values of right ascension
%and declination, and then perform the greedy algorithm on the returned set
%to return a reduced basis.



tic
%% Set up
%stopping tolerance
tol = 1e-12;

%waveform length
wl = 1000;

%emitdt size 
size = 1000;

%skeleton emitdt to fill in the loop
emitdt = zeros(size, wl);

%time range over which to find emitdt
tgps = linspace(900000000, 900000000+86400, 1000);

%% Find emitdt for random values of RA and dec
 
for i = 1:size
    
    %create random RA
    source.alpha = 2*pi*rand(1);
    %create random Dec
    source.delta = -(pi/2) + acos(2*rand(1) - 1);

 
    %use get_barycenter to find emitdt
    [emitdt(i,:), ~, ~, ~, ~, ~, ~] = get_barycenter(tgps, 'H1', source, 'earth00-19-DE405.dat', 'sun00-19-DE405.dat');

    %normalise emitdt set
    DotProd = dot(emitdt(i,:), emitdt(i,:));
    emitdt(i,:) = emitdt(i,:)/(sqrt(abs(DotProd)));
    
    fclose all;
end


%% Find the reduced basis

RB_matrix = Greedy(emitdt, tol);
toc