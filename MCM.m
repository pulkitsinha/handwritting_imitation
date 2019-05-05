function [T ] = MCM( MOIP,h,k,n )
%MCM= Matrix at a coordinate of MOIP
%   Detailed explanation goes here
e=(k-1)*n+h;
T=MOIP(:,:,e);
end

