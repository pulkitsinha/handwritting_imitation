function [ N,loc] = NDDL( A , x , y ,temp)
%%NDUL=Neighbours_Diagonal_Down_Left
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

N1=A(x-1,y-1);

N4=A(x,y-1);
N6=A(x+1,y-1);
N7=A(x+1,y);
N8=A(x+1,y+1);
N0=[N1 N4 N6 N7 N8];
loc0=[ 1 4  6 7 8];
h=temp(1,2);k=temp(2,2);
t=0;
if(h-x== -1 && k-y== -1)
t=1;
elseif(h-x==0  && k-y==-1 )
t=4;        
elseif(h-x== 1 && k-y== -1)
t=6;
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
