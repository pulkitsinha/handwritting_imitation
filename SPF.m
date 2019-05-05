function [ h,k ] = SPF( A,t )
%Start Point Finder
% A=Matrix in which the starting point is to befound
%t= the neighbour from which you want to start
[a,b]=size(A);
if (a~=b)
    B=zeros(max(a,b),max(a,b));
    for i=1:max(a,b)
        for j=1:max(a,b)
            B(i,j)=A(i,j);
        end
    end
else 
    B=A;
end
[~,c]=size(B);
d=mod(c,3);
if(d~=0)
    C=zeros(c+3-d,c+3-d);
    for i=1:c+3-d
        for j=1:c+3-d
            C(i,j)=B(i,j);
        end
    end
else
    C=B;
end
[~,e]=size(C);
[D,E]=SOI(C,(e/3));

if(t==1)
    for(i=1:3)
        for(j=1:3)
         if (D(i,j))==1
             f=[i j];
         else
         
         end
         
        end
    end
elseif(t==2)
    
elseif(t==3)

elseif(t==4)

elseif(t==5)

elseif(t==6)

elseif(t==7)

elseif(t==8)
    
end


end

