 function [ Sequence ] = Check2( A ,a,b)% only applicable for thinned images////


temp=zeros(2,3);

temp(1,1)=a;
temp(2,1)=b;
%V             h,k
%condition = 1;
V=0;
o=1;
while(o<1000)
   
h=a;k=b;
[B1,B2]=Neighbours(A,h,k,temp);
C1= B1==1;
C2=B2(C1);
D=size(C2);
E=D(1,2);
if(E==1 )              % For 1 neigbour active
    if(C2==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      [F1,F2]=NDUL(A,h-1,k-1,temp);
      G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
      end
    end
    if(C2==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      [F1,F2]=NU(A,h-1,k,temp);
      G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G2==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G2==5)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
      end
    end
    if(C2==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      [F1,F2]=NDUR(A,h-1,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G2==8)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
      end
    end
    if(C2==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      [F1,F2]=NHL(A,h,k-1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G2==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G2==4)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G2==7)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
      end
     
    end
    if(C2==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      [F1,F2]=NHR(A,h,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)                         
          if(G2==2)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(G2==3)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G2==7)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G2==8)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
      end
    end
    if(C2==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      [F1,F2]=NDDL(A,h+1,k-1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G2==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
      end
     
    end
    
    if(C2==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      [F1,F2]=ND(A,h+1,k,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==4)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(G2==5)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
      end
     
    end
    
    if(C2==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      [F1,F2]=NDDR(A,h+1,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
      end
     
    end
end
if(E==2 )
    J=[6 4 1 2 3 5 7];
    K=PS(J,C2);
    if(K(1,1)==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      [F1,F2]=NDUL(A,h-1,k-1,temp);
      G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
      end
    end
    if(K(1,1)==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      [F1,F2]=NU(A,h-1,k,temp);
      G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G2==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G2==5)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
      end
    end
    if(K(1,1)==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      [F1,F2]=NDUR(A,h-1,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(G2==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(G2==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G2==8)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
      end
    end
    if(K(1,1)==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      [F1,F2]=NHL(A,h,k-1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(G2==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(G2==4)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G2==7)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
      end
     
    end
    if(K(1,1)==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      [F1,F2]=NHR(A,h,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)                         
          if(G2==2)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(G2==3)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G2==7)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G2==8)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
      end
    end
    if(K(1,1)==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      [F1,F2]=NDDL(A,h+1,k-1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(G2==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
      end
     
    end
    
    if(K(1,1)==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      [F1,F2]=ND(A,h+1,k,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==4)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(G2==5)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
      end
     
    end
    
    if(K(1,1)==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      [F1,F2]=NDDR(A,h+1,k+1,temp);
       G1= F1==1;
      G2=F2(G1);
      H=size(G2);
      I=H(1,2);
      if(I==1)
          if(G2==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(G2==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(G2==6)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(G2==7)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(G2==8)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
      end
     
    end
end
if(E==3)
    
    
end
temp(1,1)=a;
temp(2,1)=b; 
    
disp(temp);
    

if(temp==[h h-1 h-2; k k-1 k-2])
    V=1;
elseif (temp==[h h-1 h-2; k k-1 k-1])
    V=2;
elseif (temp==[h h-1 h-2; k k-1 k])
    V=3;
elseif (temp==[h h-1 h-1; k k-1 k-2])
    V=4;
elseif (temp==[h h-1 h; k k-1 k-2])
    V=5;
elseif (temp==[h h-1 h-2; k k k-1])
    V=6;
elseif (temp==[h h-1 h-2; k k k])
    V=7;
elseif (temp==[h h-1 h-2; k k k+1])
    V=8;
elseif (temp==[h h-1 h-1; k k k-1])
    V=9;
elseif (temp==[h h-1 h; k k k+1])
    V=10;
elseif (temp==[h h-1 h-2; k k+1 k])
    V=11;
elseif (temp==[h h-1 h-2; k k+1 k+1])
    V=12;
elseif (temp==[h h-1 h-2; k k+1 k+2])
    V=13;
elseif (temp==[h h-1 h-1; k k+1 k+2])
    V=14;
elseif (temp==[h h-1 h; k k+1 k+2])
    V=15;
elseif (temp==[h h h-1; k k-1 k-2])
    V=16;
elseif (temp==[h h h-1; k k-1 k-1])
    V=17;
elseif (temp==[h h h; k k-1 k-2])
    V=18;
elseif (temp==[h h h+1; k k-1 k-2])
    V=19;
elseif (temp==[h h h+1; k k-1 k-1])
    V=20;
elseif (temp==[h h h-1; k k+1 k+1])
    V=21;
elseif (temp==[h h h-1; k k+1 k+2])
    V=22;
elseif (temp==[h h h; k k+1 k+2])
    V=23;
elseif (temp==[h h h+1; k k+1 k+1])
    V=24;
elseif (temp==[h h h+1; k k+1 k+2])
    V=25;
elseif (temp==[h h+1 h; k k-1 k-2])
    V=26;
elseif (temp==[h h+1 h+1; k k-1 k-2])
    V=27;
elseif (temp==[h h+1 h+2; k k-1 k-2])
    V=28;
elseif (temp==[h h+1 h+2; k k-1 k-1])
    V=29;
elseif (temp==[h h+1 h+2; k k-1 k])
    V=30;
elseif (temp==[h h+1 h+11; k k k-1])
    V=31;
elseif (temp==[h h+1 h+1; k k k+1])
    V=32;
elseif (temp==[h h+1 h+2; k k k-1])
    V=33;
elseif (temp==[h h+1 h+2; k k k])
    V=34;
elseif (temp==[h h+1 h+2; k k k+1])
    V=35;
elseif (temp==[h h+1 h; k k+1 k+2])
    V=36;
elseif (temp==[h h+1 h+1; k k+1 k+2])
    V=37;
elseif (temp==[h h+1 h+2; k k+1 k])
    V=38;
elseif (temp==[h h+1 h+2; k k+1 k+1])
    V=39;
elseif (temp ==  [h h+1 h+2; k k+1 k+2])
    V=40;
end
Sequence(1,o)=V;
o=o+1;
a=temp(1,2);b=temp(2,2);
%if([temp(1,2) temp(2,2)] == [204 224])
%condition=0;
%end

end
end


