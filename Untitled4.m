B=imread('A.png');
BW = im2bw(B, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
A=imresize(BW3,1);
a=224;
b=204;
j=204;
h=a;k=b;
temp=zeros(2,3);
[B1,B2]=Neighbours(A,h,k,temp);
C1= B1==1;
C2=B2(C1);
D=size(C2);
E=D(1,2);
%while(j<221)
  %  A(227,j)=1;
 %   j=j+1;
%end
imshow(A);