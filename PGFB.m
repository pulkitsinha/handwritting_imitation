function [ P] = PGFB( s,p,n,NFS,MOIP )
%Probability Generator for base case 
% NFS=Number From Sequence
%MOIP=Matrix Of Individual Pixels
%s=starting p=point
%n=dimension of structuring element
V=NFS;
h=s;k=p;j=1;
u=zeros(n,n);
if(V==1)
    temp=[h h-1 h-2; k k-1 k-2];
elseif (V==2)
    temp=[h h-1 h-2; k k-1 k-1];
elseif (V==3)
    temp=[h h-1 h-2; k k-1 k];
elseif (V==4)
    temp=[h h-1 h-1; k k-1 k-2];
elseif (V==5)
    temp=[h h-1 h-1; k k-1 k];
elseif (V==6)
    temp=[h h-1 h; k k-1 k-2];
elseif (V==7)
    temp=[h h-1 h; k k-1 k-1];
elseif (V==8)
    temp=[h h-1 h-2; k k k-1];
elseif (V==9)
    temp=[h h-1 h-2; k k k];
elseif (V==10)
    temp=[h h-1 h-2; k k k+1];
elseif (V==11)
    temp=[h h-1 h-1; k k k-1];
elseif (V==12)
    temp=[h h-1 h-1; k k k+1];
elseif (V==13)
    temp=[h h-1 h-1; k k k-1];
elseif (V==14)
    temp=[h h-1 h; k k k+1];
elseif (V==15)
    temp=[h h-1 h-2; k k+1 k];
elseif (V==16)
    temp=[h h-1 h-2; k k+1 k+1];
elseif (V==17)    
    temp=[h h-1 h-2; k k+1 k+2];
elseif (V==18)
    temp=[h h-1 h-1; k k+1 k];
elseif (V==19)
    temp=[h h-1 h-1; k k+1 k+2];
elseif (V==20)
    temp=[h h-1 h; k k+1 k+1];
elseif (V==21)
    temp=[h h-1 h; k k+1 k+2];
elseif (V==22)
    temp=[h h h-1; k k-1 k-2];
elseif (V==23)
    temp=[h h h-1; k k-1 k-1];
elseif ( V==24)
    temp=[h h h-1; k k-1 k];
elseif (V==25)
    temp=[h h h; k k-1 k-2];
elseif (V==26)
    temp=[h h h+1; k k-1 k-2];
elseif (V==27)
    temp=[h h h+1; k k-1 k-1];
elseif (V==28)
    temp=[h h h+1; k k-1 k];
elseif (V==29)
    temp=[h h h-1; k k+1 k];
elseif (V==30)
    temp=[h h h-1; k k+1 k+1];
elseif (V==31)
    temp=[h h h-1; k k+1 k+2];
elseif (V==32)
    temp=[h h h; k k+1 k+2];
elseif (V==33)
    temp=[h h h+1; k k+1 k];
elseif ( V==34)
    temp=[h h h+1; k k+1 k+1];
elseif (V==35)
    temp=[h h h+1; k k+1 k+2];
elseif (V==36)
    temp=[h h+1 h; k k-1 k-2];
elseif ( V==37)
    temp=[h h+1 h; k k-1 k-1];
elseif (V==38)
    temp=[h h+1 h+1; k k-1 k-2];
elseif (V==39)
    temp=[h h+1 h+1; k k-1 k];
elseif (V==40)
    temp=[h h+1 h+2; k k-1 k-2];
elseif (V==41)
    temp=[h h+1 h+2; k k-1 k-1];
elseif (V==42)
    temp=[h h+1 h+2; k k-1 k];
elseif ( V==43)
    temp=[h h+1 h; k k k-1];
elseif (V==44)
    temp=[h h+1 h; k k k+1];
elseif ( V==45)
    temp=[h h+1 h+1; k k k-1];
elseif (V==46)
    temp=[h h+1 h+1; k k k+1];
elseif (V==47)
    temp=[h h+1 h+2; k k k-1];
elseif (V==48)
    temp=[h h+1 h+2; k k k];
elseif (V==49)
    temp=[h h+1 h+2; k k k+1];
elseif (V==50)
    temp=[h h+1 h; k k+1 k+1];
elseif (V==51)
    temp=[h h+1 h; k k+1 k+2];
elseif (V==52)
    temp=[h h+1 h+1; k k+1 k];
elseif (V==53)
    temp=[h h+1 h+1; k k+1 k+2];
elseif (V==54)
    temp=[h h+1 h+2; k k+1 k];
elseif (V==55)
    temp=[h h+1 h+2; k k+1 k+1];
elseif (V==56)
    temp =  [h h+1 h+2; k k+1 k+2];
elseif(V==111)
    temp =  [h h-1 0; k k-1 0];
elseif(V==112)
    temp =  [h h-1 0; k k 0];
elseif(V==113)
    temp =  [h h-1 0; k k+1 0];
elseif(V==114)
    temp =  [h h 0; k k-1 0];
elseif(V==115)
    temp =  [h h 0; k k+1 0];
elseif(V==116)
    temp =  [h h+1 0; k k-1 0];
elseif(V==117)
    temp =  [h h+1 0; k k 0];
elseif(V==118)
    temp =  [h h+1 0; k k+1 0];
end
e=MCM(MOIP,h,k,n);
f=MCM(MOIP,temp(1,2),temp(2,2),n);
g=MCM(MOIP,temp(1,3),temp(2,3),n);
if(V==1)
    W=[g u u;u f u ;u u e ];
    
    Q=ITCC(W,s,p);
elseif (V==2)
    W=[u g u;u f u ;u u e ];
    
    Q=ITCC(W,s,p);
elseif (V==3)
    W=[u u g;u f u ;u u e ];
    
    Q=ITCC(W,s,p);
elseif (V==4)
    W=[u u u;g f u ;u u e ];
    
    Q=ITCC(W,s,p);
elseif (V==5)
    W=[u u u;u f g ;u u e ];
    
    Q=ITCC(W,s,p);
elseif (V==6)
    W=[u u u;u f u ;g u e ];
    
    Q=ITCC(W,s,p);
elseif (V==7)
    W=[u u u;u f u ;u g e ];
    
    Q=ITCC(W,s,p);
elseif (V==8)
    W=[g u u ; u f u; u e u];
    
    Q=ITCC(W,s,p);
elseif (V==9)
    W=[u g u ; u f u; u e u];
    
    Q=ITCC(W,s,p);
elseif (V==10)
    W=[u u g ; u f u; u e u];
    
    Q=ITCC(W,s,p);
elseif (V==11)
    W=[u u u ; g f u; u e u];
    
    Q=ITCC(W,s,p);
elseif (V==12)
    W=[u u u ; u f g; u e u];
    
    Q=ITCC(W,s,p);
elseif (V==13)
    W=[u u u ; u f u; g e u];
    
    Q=ITCC(W,s,p);
elseif (V==14)
    W=[u u u ; u f u; u e g];
    
    Q=ITCC(W,s,p);
elseif (V==15)
    W=[g u u ; u f u; e u u];
    
    Q=ITCC(W,s,p);
elseif (V==16)
    W=[u g u ; u f u; e u u];
    
    Q=ITCC(W,s,p);
elseif (V==17)    
    W=[u u g ; u f u; e u u];
    
    Q=ITCC(W,s,p);
elseif (V==18)
    W=[u u u ; g f u; e u u];
    
    Q=ITCC(W,s,p);
elseif (V==19)
    W=[u u u ; u f g; e u u];
    
    Q=ITCC(W,s,p);
elseif (V==20)
    W=[u u u ; u f u; e g u];
    
    Q=ITCC(W,s,p);
elseif (V==21)
    W=[u u u ; u f u; e u g];
    
    Q=ITCC(W,s,p);
elseif (V==22)
    W=[g u u ; u f e; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==23)
    W=[u g u ; u f e; u u u];
    
    Q=ITCC(W,s,p);
elseif ( V==24)
    W=[u u g ; u f e; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==25)
    W=[u u u ; g f e; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==26)
    W=[u u u ; u f e; g u u];
    
    Q=ITCC(W,s,p);
elseif (V==27)
    W=[u u u ; u f e; u g u];
    
    Q=ITCC(W,s,p);
elseif (V==28)
    W=[u u u ; u f e; u u g];
    
    Q=ITCC(W,s,p);
elseif (V==29)
    W=[g u u ; e f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==30)
    W=[u g u ; e f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==31)
    W=[u u g ; e f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==32)
    W=[u u u ; e f g; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==33)
    W=[u u u ; e f u; g u u];
    
    Q=ITCC(W,s,p);
elseif ( V==34)
    W=[u u u ; e f u; u g u];
    
    Q=ITCC(W,s,p);
elseif (V==35)
    W=[u u u ; e f u; u u g];
    
    Q=ITCC(W,s,p);
elseif (V==36)
    W=[g u e ; u f u; u u u];
    
    Q=ITCC(W,s,p);
elseif ( V==37)
    W=[u g e ; u f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==38)
    W=[u u e ; g f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==39)
    W=[u u e ; u f g; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==40)
    W=[u u e ; u f u; g u u];
    
    Q=ITCC(W,s,p);
elseif (V==41)
    W=[u u e ; u f u; u g u];
    
    Q=ITCC(W,s,p);
elseif (V==42)
    W=[u u e ; u f u; u u g];
    
    Q=ITCC(W,s,p);
elseif ( V==43)
    W=[g u u ; u e u; u f u];
    
    Q=ITCC(W,s,p);
elseif (V==44)
    W=[u g u ; u e u; u f u];
    
    Q=ITCC(W,s,p);
elseif ( V==45)
    W=[u u g ; u e u; u f u];
    
    Q=ITCC(W,s,p);
elseif (V==46)
    W=[u u u ; g e u; u f u];
    
    Q=ITCC(W,s,p);
elseif (V==47)
    W=[u u u ; u e g; u f u];
    
    Q=ITCC(W,s,p);
elseif (V==48)
    W=[u u u ; u e u; g f u];
    
    Q=ITCC(W,s,p);
elseif (V==49)
    W=[u u u ; u e u; u f g];
    
    Q=ITCC(W,s,p);
elseif (V==50)
    W=[e g u ; u f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==51)
    W=[e u g ; u f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==52)
    W=[e u u ; g f u; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==53)
    W=[e u u ; u f g; u u u];
    
    Q=ITCC(W,s,p);
elseif (V==54)
    W=[e u u ; u f u; g u u];
    
    Q=ITCC(W,s,p);
elseif (V==55)
    W=[e u u ; u f u; u g u];
    
    Q=ITCC(W,s,p);
elseif (V==56)
    W=[e u u ; u f u; u u g];
    
    Q=ITCC(W,s,p);
elseif(V==111)
    W=[u u u;u f u ;u u e ];
    
    Q=ITCC(W,s,p);
elseif(V==112)
    W=[u u u ; u f u; u e u];
     
    Q=ITCC(W,s,p);
elseif(V==113)
    W=[u u u ; u f u; e u u];
    
    Q=ITCC(W,s,p);
elseif(V==114)
    W=[u u u ; u f e; u u u];
    
    Q=ITCC(W,s,p);
elseif(V==115)
    W=[u u u ; e f u; u u u];
    
    Q=ITCC(W,s,p);
elseif(V==116)
    W=[u u e ; u f u; u u u];
    
    Q=ITCC(W,s,p);
elseif(V==117)
    W=[u u u ; u e u; g f u];
    
    Q=ITCC(W,s,p);
elseif(V==118)
    W=[e u u ; u f g; u u u];
    
    Q=ITCC(W,s,p);
end


x=unique(Q);
[~,X]=size(x);
S=zeros(X,X);
for g=1:X
    S(g,1)=x(1,g);
    t=find(Q==x(1,g));
    t=t+1;
    [~,T]=size(t);
for i=1:T-1
    y(1,j)=Q(1,t(1,i));
    S(g,j+1)=y(1,j);    
    j=j+1;
end
end

end