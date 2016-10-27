function [ thing ] = LinCom( emitdt, RB_matrix )
%No clue just yet
%   none


%so what i THINK we're doing is finding a way of representing emitdt as a
%linear combination of RB_matrix? And recording the A and B coefficients
%that do the combination?

X = emitdt;
C = RB_matrix;
thing= X\C


end

