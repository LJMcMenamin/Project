function [ source] = RaDecAl(N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


source.alpha = 2*pi*rand(N, 1);
source.delta = -(pi/2) + acos(2*rand(N, 1) - 1);



end

