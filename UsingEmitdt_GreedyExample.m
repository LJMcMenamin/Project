%% tolerance for stopping algorithm

tic 

tol = 1e-12;


%%  solar mass in geometrised units
Msun = 4.92549095e-6 ;

%% create set of training waveforms
%waveform length
wl = 1024;

%frequency range
freqmin = 48;
freqmax = 256;

freqs = linspace(freqmin, freqmax, wl);

%frequency steps
df = freqs(2)-freqs(1);

%chirp mass range (solar masses) for creating training waveforms
Mcmin = 1.5;
Mcmax = 2;
Mc = 0;

%modulatoin period range
periodmax = 1/99.995;
periodmin = 1/100;

%training set size 
tssize = 1000;
emitdt = zeros(tssize, wl);
 
for i = 1:tssize
     %get chirp masses
     Mc = (Mcmin^(5/3) + i*(Mcmax^(5/3)- Mcmin^(5/3))/(tssize-1))^(3/5);
     %get modulation period
	 modperiod = periodmin + ((periodmax-periodmin)*(rand()));
 
	 emitdt(i,:) = real_model(freqs, Mc, modperiod);

     %normalise training set
     dotty = DotProduct(df, emitdt(i,:), emitdt(i,:));
	 emitdt(i,:) = emitdt(i,:)/(sqrt(abs(dotty)));
end


%% reduced basis

RB_matrix = Greedy(emitdt, df, tol);

toc