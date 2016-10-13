function [ phase ] = calc_phase( frequency, Mchirp )
%Calculate the phase of the model over a range of frequencies and for a
%given chirp mass.

Msun = 4.92549095e-6;
phase =  (-0.25*pi) + (3./(128*((Mchirp*Msun*pi*frequency).^(5/3))));
 

end

