B=imread('A.png');
BW = im2bw(B, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
W=imresize(BW3,1);
[A,E]=SOI(W,5);
a=57;
b=36;
%j=204;
%A(280,198)=0;% remove a scenario which is not included in Nhl so the system does not go into a loop
%while(j<221)
%    A(227,j)=1;
%    j=j+1;
%end
%imshow(A);

[T,U,K] = Check7(A,a,b);
S=CTIC2(T,a,b);


%          imshow(QQQ)
figure, imshow(A)
figure, imshow(S)
%WWW=A-S;
%figure, imshow(WWW)

