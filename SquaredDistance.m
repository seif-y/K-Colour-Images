function D = SquaredDistance(P,Q)
%This function returns the square of the geometric straight line distance
%between two 3D points
%
%INPUT: P, an array containing 3 elements representing a point in 3D space
%       Q, same as P but it is another point
%OUTPUT: D, the squared distance between P and Q
%
%Author: Seif Younes

D = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;
end

