function [ ChirpSignal ] = real_model( frequency, Mchirp, modperiod ) 
%     Calculate the chirp signal over a range of frequencies, for a given chirp mass
%     and modulation period

Msun = 4.92549095e-6;
ChirpSignal = ( frequency.^(-7/6) * (Mchirp*Msun).^(5/6) .* cos(calc_phase(frequency,Mchirp)) ).*sin(pi*frequency/modperiod);

end

%((frequency^(-7/6))*((Mchirp*Msun)^(5/6))*(cos(calc_phase(frequency,Mchirp))))*(sin(pi*frequency/modperiod))