function [ Sequence ] = SGT( A )% only applicable for thinned images////
%SGT=Sequence_Generator_Thinned
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% 1 2 3
% 4 M 5
% 6 7 8
%We only go till e=3 coz for thinned max possible neighbours are 3
%Most of them are only compatible if starting point is correct otherwise
%some further cases need to be specified specially for e =2
% Also most of them are only valid if the state is going upward
[m,n]=size(A);
for j=n:-1:1
    for i=m:-1:1 
        if(A(i,j)==1 && Neighbours(A,i,j)~= zeroes(1,8) && Neighbours(A,i+1,j+1)~= zeroes(1,8))
          a=i; b=j;
          break
        end
    end
    break
end
Sp=[a b];
temp=zeros(2,3);

temp(1,1)=a;
temp(2,1)=b;
%V             h,k
condition = 1;
while(condition) 
h=a;k=b;
B=Neighbours(A,h,k,temp);
C=find(B==1);
D=size(C);
E=D(1,2);
if(E==1 )              % For 1 neigbour active
    if(C==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      F=NDUL(A,h-1,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
      end
    end
    if(C==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      F=NU(A,h-1,k,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
      end
    end
    if(C==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      F=NDUR(A,h-1,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
      end
    end
    if(C==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      F=NHL(A,h,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G==3)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G==5)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
      end
     
    end
    if(C==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      F=NHR(A,h,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)                         
          if(G==1)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(G==2)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G==4)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
      end
    end
    if(C==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      F=NDDL(A,h+1,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
      end
     
    end
    
    if(C==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      F=ND(A,h+1,k,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
      end
     
    end
    
    if(C==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      F=NDDR(A,h+1,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
      end
     
    end
end
if(E==2 )
    J=[6 4 1 2 3 5 7];
    K=PS(J,C);
     if(K(1,1)==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      F=NDUL(A,h-1,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
      end
    end
    if(K(1,1)==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      F=NU(A,h-1,k,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
      end
    end
    if(K(1,1)==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      F=NDUR(A,h-1,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(G==4)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
      end
    end
    if(K(1,1)==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      F=NHL(A,h,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G==3)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G==5)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
      end
     
    end
    if(K(1,1)==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      F=NHR(A,h,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)                         
          if(G==1)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(G==2)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G==4)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
      end
    end
    
    if(K(1,1)==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      F=NDDL(A,h+1,k-1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
      end
     
    end
    
    if(K(1,1)==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      F=ND(A,h+1,k,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
      end
     
    end
    
    if(K(1,1)==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      F=NDDR(A,h+1,k+1,temp);
      G=find(F==1);
      H=size(G);
      I=H(1,2);
      if(I==1)
          if(G==1)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G==2)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(G==3)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G==4)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(G==5)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
      end
     
    end
end

    
   
    
   


if(temp==[h h-1 h-2; k k-1 k-2])
    V=x1;
elseif (temp==[h h-1 h-2; k k-1 k-1])
    V=x2;
elseif (temp==[h h-1 h-2; k k-1 k])
    V=x3;
elseif (temp==[h h-1 h-1; k k-1 k-2])
    V=x4;
elseif (temp==[h h-1 h; k k-1 k-2])
    V=x5;
elseif (temp==[h h-1 h-2; k k k-1])
    V=x6;
elseif (temp==[h h-1 h-2; k k k])
    V=x7;
elseif (temp==[h h-1 h-2; k k k+1])
    V=x8;
elseif (temp==[h h-1 h-1; k k k-1])
    V=x9;
elseif (temp==[h h-1 h; k k k+1])
    V=x10;
elseif (temp==[h h-1 h-2; k k+1 k])
    V=x11;
elseif (temp==[h h-1 h-2; k k+1 k+1])
    V=x12;
elseif (temp==[h h-1 h-2; k k+1 k+2])
    V=x13;
elseif (temp==[h h-1 h-1; k k+1 k+2])
    V=x14;
elseif (temp==[h h-1 h; k k+1 k+2])
    V=x15;
elseif (temp==[h h h-1; k k-1 k-2])
    V=x16;
elseif (temp==[h h h-1; k k-1 k-1])
    V=x17;
elseif (temp==[h h h; k k-1 k-2])
    V=x18;
elseif (temp==[h h h+1; k k-1 k-2])
    V=x19;
elseif (temp==[h h h+1; k k-1 k-1])
    V=x20;
elseif (temp==[h h h-1; k k+1 k+1])
    V=x21;
elseif (temp==[h h h-1; k k+1 k+2])
    V=x22;
elseif (temp==[h h h; k k+1 k+2])
    V=x23;
elseif (temp==[h h h+1; k k+1 k+1])
    V=x24;
elseif (temp==[h h h+1; k k+1 k+2])
    V=x25;
elseif (temp==[h h+1 h; k k-1 k-2])
    V=x26;
elseif (temp==[h h+1 h+1; k k-1 k-2])
    V=x27;
elseif (temp==[h h+1 h+2; k k-1 k-2])
    V=x28;
elseif (temp==[h h+1 h+2; k k-1 k-1])
    V=x29;
elseif (temp==[h h+1 h+2; k k-1 k])
    V=x30;
elseif (temp==[h h+1 h+11; k k k-1])
    V=x31;
elseif (temp==[h h+1 h+1; k k k+1])
    V=x32;
elseif (temp==[h h+1 h+2; k k k-1])
    V=x33;
elseif (temp==[h h+1 h+2; k k k])
    V=x34;
elseif (temp==[h h+1 h+2; k k k+1])
    V=x35;
elseif (temp==[h h+1 h; k k+1 k+2])
    V=x36;
elseif (temp==[h h+1 h+1; k k+1 k+2])
    V=x37;
elseif (temp==[h h+1 h+2; k k+1 k])
    V=x38;
elseif (temp==[h h+1 h+2; k k+1 k+1])
    V=x39;
elseif (temp==[h h+1 h+2; k k+1 k+2])
    V=x40;
end
Sequence=V;   
a=temp(1,2);b=temp(2,2);
if([temp(1,2) temp(2,2)] == Sp)
condition=0;
end

end
end


