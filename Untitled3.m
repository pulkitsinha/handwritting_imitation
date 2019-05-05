B=imread('A.png');
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

