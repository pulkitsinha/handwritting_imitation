function [  B ] = my_thinning( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% first stp is to label the neighbors
[Y,X]=size(A);
for i=2:X-1
    for j=2:Y-1
        count=0;
        N=Neighbours(A,j,i);
        [sy sx]=size(N);
        for q=1:sx
            if(N(1,q)==0)
                count=count+1;
            end
        end
        C(i,j)=count;
        if(A(i,j)==0 && C(i,j)==0)
            B(i,j)=1;
        else if(A(i,j)==0 && C(i,j)==1)
                
            
    end
end




end

