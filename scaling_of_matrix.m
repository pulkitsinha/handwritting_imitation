count=1;
B=imread('A.png');
BW = im2bw(B, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
A=imresize(BW3,1);
prompt='Enter the dimension of the structuring element';
n=input(prompt);
t=size(A);
g=mod(t(1,1),n);
if(g==0)
    M=A;
else
    M=zeros((t(1,1)-g),(t(1,1)-g));
    
    for i=1:(t(1,1)-g)
        for j=1:(t(1,1)-g)
            M(i,j)=A(i,j);
        end
    end 
end
[x, y]=size(M);            %iteration points are h,k
S=zeros(n,n);               %iteration points are r,s and this is a auxillary matrix 
i=1;
j=1;
q=1;
i1=1;
i2=1;
 N=zeros();
for h=1:n:x
    j=1;
    for k=1:n:y
        a=h;        %temporary variables to store h,k are a,b    
        i1=1;    

        for r=1:n
             b=k;
             i2=1;
            for s=1:n
                S(r,s)=M(a,b);
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
size(N)
NOPISI=(x/n)*(y/n);
for count=1:NOPISI
   MOIP(:,:,count)=N(:,:,count);
end


       
        