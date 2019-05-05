function [ N,loc] = NHR( A , x , y,temp )
%NU=Neighbours_Horizontal_Right
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


N2=A(x-1,y);
N3=A(x-1,y+1);

N5=A(x,y+1);

N7=A(x+1,y);
N8=A(x+1,y+1);

N0=[ N2 N3 N5 N7 N8];
loc0=[  2 3  5  7 8];
h=temp(1,2);k=temp(2,2);
t=0;
if(h-x== -1 && k-y== 0)
t=2;
elseif(h-x== -1 && k-y==1 )
t=3;        
elseif(h-x== 0 && k-y==1 )
t=5;
elseif(h-x== 1 && k-y== 0)
t=7;
elseif(h-x== 1 && k-y==1 )
t=8;
end
N=N0;
loc=loc0;
if(t==0)
    N=N0;
    loc=loc0;
else
    N(t)=[];
    loc(t)=[];
end
end



