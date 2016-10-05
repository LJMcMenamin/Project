function [ DotResult ] = DotProduct( weights, a, b )
%The weighted dot product of two vectors a and b (weights can either be a
%     vector or a single value. The vectors a and b can either be real or complex.


%so in python, numpy.vdot is how they do the dot product of two vectors
%so
if length(a) == length(b);
    DotResult = dot((a*weights), b);
end

%return?

end


