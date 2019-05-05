Q=[1 1 1 1 1 1];
x=unique(Q);
j=1;
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

S