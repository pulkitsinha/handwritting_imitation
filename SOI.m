function [ SI,MOIP ] = SOI( B,n )
%SOI=Scaled Output Image
%SI=Scaled Image
%MOIP=Matrix Of Individual Pixels
t=size(B);
g=mod(t(1,1),n);
if(g==0)
    A=B;
else
    A=zeros((t(1,1)-g),(t(1,1)-g));
    for i=1:(t(1,1)-g)
        for j=1:(t(1,1)-g)
            A(i,j)=B(i,j);
        end
    end 
end
[x, y]=size(A);            %iteration points are h,k
S=zeros(n,n);               %iteration points are r,s and this is a auxillary matrix 
NOPISI=(x/n)*(y/n);      %NOPISI=Number Of Pixels In Scaled Image
i=1;
j=1;
 N=zeros();
New=zeros(sqrt(NOPISI),sqrt(NOPISI));
for h=1:n:x
    j=1;
    for k=1:n:y
        a=h;        %temporary variables to store h,k are a,b    
        i1=1;    
        for r=1:n
             b=k;
             i2=1;
            for s=1:n
                S(r,s)=A(a,b);
                N(i1,i2,i,j)=S(r,s);
                b=b+1;
                i2=i2+1;
            end
            a=a+1;
            i1=i1+1;
        end
       j=j+1;     
    end
    i=i+1;
end
for a1=1:i-1
    for a2=1:j-1
if(N(:,:,a1,a2)==zeros(n,n))
    New(a1,a2)=0;
else
    New(a1,a2)=1;
end
    end
end
SI=New;
MOIP=zeros(n,n,NOPISI);
for count=1:NOPISI
    MOIP(:,:,count)=N(:,:,count);
end
end

