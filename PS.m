function [ A ] = PS( B,C)
% PS=Priority_Specifier
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%B=sequence array; C=to be arranged array
[~,y]=size(B);
[~,b]=size(C);

z=1;
D=zeros(1,b);
for k=1:b    
for i=1:y
if (C(1,k)==B(1,i))
    t=i;
end
end
D(1,k)=t;
end
if(issorted(D))
    A=C;
else
    for s=b:-1:1
        A(1,z)=C(1,s);
        z=z+1;
    end
end
end

