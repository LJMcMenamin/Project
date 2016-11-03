function [ source] = RaDecAl(N)
%Want to eventually use this function to create RA and dec combinations for
%the who sky

source.alpha = 2*pi*rand(N, 1);
source.delta = -(pi/2) + acos(2*rand(N, 1) - 1);



end

