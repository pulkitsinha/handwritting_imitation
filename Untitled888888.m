
B=imread('A.png');
BW = im2bw(B, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
A=imresize(BW3,1);
prompt='Enter the dimension of the structuring element';
n=input(prompt);
[x, y]=size(A);            %iteration points are h,k
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

 B=New;
BW = im2bw(B, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
A=imresize(BW3,1);
QQQ=A;
a=224;
b=204;
j=204;
A(280,198)=0;% remove a scenario which is not included in Nhl so the system does not go into a loop
while(j<221)
    A(227,j)=1;
    j=j+1;
end
imshow(A);

[T,U,K] = Check4(A,a,b);
%S=CTIC(T);


%          imshow(QQQ)
%figure, imshow(A)
%figure, imshow(S)
%WWW=A-S;
%figure, imshow(WWW)

    
        
 