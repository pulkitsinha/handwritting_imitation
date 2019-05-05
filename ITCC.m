function [ Sequence,W ,K] = ITCC( A ,a,b)
%ITCC=Image To Code Converter
%Starting_point=[a,b];
temp=zeros(2,3);

temp(1,1)=a;
temp(2,1)=b;
%V             h,k
%condition = 1;
V=0;
o=1;
i_jun=0;
%count=1;
end_count=1;
junction=zeros(20,2);
while(o<1500)
   
h=a;k=b;
if(h==0 && k==0 )
break
end
[B1,B2]=Neighbours(A,h,k,temp(1,1),temp(2,1));
C1= B1==1;
C2=B2(C1);
D=size(C2);
E=D(1,2);
if(E==0)
    V=96;
    Sequence(1,o)=V;
    o=o+1;    
    Sequence(1,o)=h;
    o=o+1;
    Sequence(1,o)=k;    
    o=o+1;
    A(h,k)=0;
    if(end_count>i_jun-1)
        end_count=0;
    end
    end_count=end_count+1;         
    a=junction(end_count,1);
    b=junction(end_count,2);
    Sequence(1,o)=a;
    o=o+1;
    Sequence(1,o)=b; 
    o=o+1;
    continue
end
if(E==1 )              % For 1 neigbour active
    if(h==junction(end_count,1) && k==junction(end_count,2))
        V=88;
        Sequence(1,o)=V;    
        o=o+1;
        Sequence(1,o)=a;            
        o=o+1;    
        Sequence(1,o)=b;     
        o=o+1;
    end
    if(C2==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h-1,k-1,h,k);
      G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
       V=111;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
    
      end
    %  if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==6)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
     
          
     % end
    end
    if(C2==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      [F1,F2]=Neighbours(A,h-1,k,h,k);
      G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=112;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==6)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
      %end
    end
    if(C2==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h-1,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=113;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
    % if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==7)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
     % end
    end
    if(C2==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h,k-1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=114;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==4)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
     % end
     
    end
    if(C2==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=115;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)       
          if(I(1,1)==1)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==2)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==7)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
     % end
    end
    if(C2==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h+1,k-1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     
      if(size(I)==[1 0])
      V=116;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
     % end
     
    end
    
    if(C2==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      [F1,F2]=Neighbours(A,h+1,k,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=117;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
     % end
     
    end
    
    if(C2==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h+1,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=118;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==2)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
      %end
     
    end
end
if(E~=1 )
    Sequence(1,o)=65;
    o=o+1;
    i_jun=i_jun+1;
    junction(i_jun,1)=h;
    junction(i_jun,2)=k;
    J=[6 4 1 2 3 7 5 8];
    L=PS(J,C2);
    K=L;
   % if(i_jun>1)
    %if(junction(i_jun,1)==junction(i_jun-1,1) && junction(i_jun,2)==junction(i_jun-1,2))
   % K(1)=[];
   % end
   % end
    if(K(1,1)==1)           %1 2 3 4 6 equivalent to 1 2 3 4 5 
      temp(1,2)=h-1;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h-1,k-1,h,k);
      G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=111;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==6)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
     
          
     % end
    end
    if(K(1,1)==2)
      temp(1,2)=h-1;
      temp(2,2)=k;
      [F1,F2]=Neighbours(A,h-1,k,h,k);
      G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=112;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==6)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
     % end
    end
    if(K(1,1)==3)                   % 1 2 3 5 8 equivalent to 1 2 3 4 5
      temp(1,2)=h-1;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h-1,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=113;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-2;
          temp(2,3)=k;
          end
          if(I(1,1)==2)
          temp(1,3)=h-2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-2;
          temp(2,3)=k+2;
          end
          if(I(1,1)==4)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==5)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==7)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
     % end
    end
    if(K(1,1)==4)          %1 2 4 6 7 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h,k-1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
     I=PS(H,G2);
     if(size(I)==[1 0])
      V=114;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end 
     %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h-1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h-1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==4)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
     % end
     
    end
    if(K(1,1)==5)                   %2,3,5,7,8 equivalent to 1 2 3 4 5 
      temp(1,2)=h;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=115;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)       
          if(I(1,1)==1)
          temp(1,3)=h-1;
          temp(2,3)=k;
          end
          if(I(1,1)==2)
          temp(1,3)=h-1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h-1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==5)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==7)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
     % end
    end
    if(K(1,1)==6)          %1 4 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k-1;
      [F1,F2]=Neighbours(A,h+1,k-1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
      if(size(I)==[1 0])
      V=116;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      %if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h;
          temp(2,3)=k-2;
          end
          if(I(1,1)==2)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k-2;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k-2;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
     % end
     
    end
    
    if(K(1,1)==7)          %4 5 6 7 8  equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k;
      [F1,F2]=Neighbours(A,h+1,k,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=117;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==1)
          temp(1,3)=h;
          temp(2,3)=k-1;
          end
          if(I(1,1)==3)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k-1;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k+1;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k-1;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
     % end
     
    end
    
    if(K(1,1)==8)          %3 5 6 7 8 equivalent to 1 2 3 4 5  according to output of G
      temp(1,2)=h+1;
      temp(2,2)=k+1;
      [F1,F2]=Neighbours(A,h+1,k+1,h,k);
       G1= F1==1;
      G2=F2(G1);
      H=[6 4 1 2 3 7 5 8];
      I=PS(H,G2);
     if(size(I)==[1 0])
      V=118;
       A(h,k)=0;
       a=temp(1,2);b=temp(2,2);  
       Sequence(1,o)=V;
       o=o+1;
       continue
      end
      % if(I==1)
          if(I(1,1)==2)
          temp(1,3)=h;
          temp(2,3)=k+1;
          end
          if(I(1,1)==3)
          temp(1,3)=h;
          temp(2,3)=k+2;
          end
          if(I(1,1)==4)
          temp(1,3)=h+1;
          temp(2,3)=k;
          end
          if(I(1,1)==5)
          temp(1,3)=h+1;
          temp(2,3)=k+2;
          end
          if(I(1,1)==6)
          temp(1,3)=h+2;
          temp(2,3)=k;
          end
          if(I(1,1)==7)
          temp(1,3)=h+2;
          temp(2,3)=k+1;
          end
          if(I(1,1)==8)
          temp(1,3)=h+2;
          temp(2,3)=k+2;
          end
     % end
     
    end
  %  stops=stops+1;
  
end

%if(temp(1,3)==0 && temp(2,3)==0 && o>5 )
%    end_count=end_count+1;
%a=junction(end_count,1);
%b=junction(end_count,2);
%end 
    
temp(1,1)=a;
temp(2,1)=b; 
    
%disp(temp);
    

if(temp==[h h-1 h-2; k k-1 k-2])
    V=1;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k-1 k-1])
    V=2;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k-1 k])
    V=3;
    A(h,k)=0;
elseif (temp==[h h-1 h-1; k k-1 k-2])
    V=4;
    A(h,k)=0;
    elseif (temp==[h h-1 h-1; k k-1 k])
    V=5;
    A(h,k)=0;
elseif (temp==[h h-1 h; k k-1 k-2])
    V=6;
    A(h,k)=0;
    elseif (temp==[h h-1 h; k k-1 k-1])
    V=7;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k k-1])
    V=8;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k k])
    V=9;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k k+1])
    V=10;
    A(h,k)=0;
elseif (temp==[h h-1 h-1; k k k-1])
    V=11;
    A(h,k)=0;
elseif (temp==[h h-1 h-1; k k k+1])
    V=12;
    A(h,k)=0;
    elseif (temp==[h h-1 h-1; k k k-1])
    V=13;
    A(h,k)=0;
elseif (temp==[h h-1 h; k k k+1])
    V=14;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k+1 k])
    V=15;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k+1 k+1])
    V=16;
    A(h,k)=0;
elseif (temp==[h h-1 h-2; k k+1 k+2])
    V=17;
    A(h,k)=0;
    elseif (temp==[h h-1 h-1; k k+1 k])
    V=18;
    A(h,k)=0;
elseif (temp==[h h-1 h-1; k k+1 k+2])
    V=19;
    A(h,k)=0;
    elseif (temp==[h h-1 h; k k+1 k+1])
    V=20;
    A(h,k)=0;
elseif (temp==[h h-1 h; k k+1 k+2])
    V=21;
    A(h,k)=0;
elseif (temp==[h h h-1; k k-1 k-2])
    V=22;
    A(h,k)=0;
elseif (temp==[h h h-1; k k-1 k-1])
    V=23;
    A(h,k)=0;
    elseif (temp==[h h h-1; k k-1 k])
    V=24;
    A(h,k)=0;
elseif (temp==[h h h; k k-1 k-2])
    V=25;
    A(h,k)=0;
elseif (temp==[h h h+1; k k-1 k-2])
    V=26;
    A(h,k)=0;
elseif (temp==[h h h+1; k k-1 k-1])
    V=27;
    A(h,k)=0;
    elseif (temp==[h h h+1; k k-1 k])
    V=28;
    A(h,k)=0;
    elseif (temp==[h h h-1; k k+1 k])
    V=29;
    A(h,k)=0;
elseif (temp==[h h h-1; k k+1 k+1])
    V=30;
    A(h,k)=0;
elseif (temp==[h h h-1; k k+1 k+2])
    V=31;
    A(h,k)=0;
elseif (temp==[h h h; k k+1 k+2])
    V=32;
    A(h,k)=0;
    elseif (temp==[h h h+1; k k+1 k])
    V=33;
    A(h,k)=0;
elseif (temp==[h h h+1; k k+1 k+1])
    V=34;
    A(h,k)=0;
elseif (temp==[h h h+1; k k+1 k+2])
    V=35;
    A(h,k)=0;
elseif (temp==[h h+1 h; k k-1 k-2])
    V=36;
    A(h,k)=0;
    elseif (temp==[h h+1 h; k k-1 k-1])
    V=37;
    A(h,k)=0;
elseif (temp==[h h+1 h+1; k k-1 k-2])
    V=38;
    A(h,k)=0;
elseif (temp==[h h+1 h+1; k k-1 k])
    V=39;
    A(h,k)=0;
    elseif (temp==[h h+1 h+2; k k-1 k-2])
    V=40;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k-1 k-1])
    V=41;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k-1 k])
    V=42;
    A(h,k)=0;
    elseif (temp==[h h+1 h; k k k-1])
    V=43;
    A(h,k)=0;
elseif (temp==[h h+1 h; k k k+1])
    V=44;
    A(h,k)=0;
    elseif (temp==[h h+1 h+1; k k k-1])
    V=45;
    A(h,k)=0;
elseif (temp==[h h+1 h+1; k k k+1])
    V=46;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k k-1])
    V=47;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k k])
    V=48;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k k+1])
    V=49;
    A(h,k)=0;
    elseif (temp==[h h+1 h; k k+1 k+1])
    V=50;
    A(h,k)=0;
elseif (temp==[h h+1 h; k k+1 k+2])
    V=51;
    A(h,k)=0;
    elseif (temp==[h h+1 h+1; k k+1 k])
    V=52;
    A(h,k)=0;
elseif (temp==[h h+1 h+1; k k+1 k+2])
    V=53;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k+1 k])
    V=54;
    A(h,k)=0;
elseif (temp==[h h+1 h+2; k k+1 k+1])
    V=55;
    A(h,k)=0;
elseif (temp ==  [h h+1 h+2; k k+1 k+2])
    V=56;
    A(h,k)=0;

    
end
a=temp(1,2);b=temp(2,2);
%a
%b
Sequence(1,o)=V;
o=o+1;

%if([temp(1,2) temp(2,2)] == [204 224])
%condition=0;
%end

end
W=junction;
%for i=1:21
%    if(W(i,1)==0 || W(i,2)==0)
%        A(1,1)=0;
%    else
%    A(W(i,1),W(i,2))=0;
%    end
%end
h
k
o
imshow(A);

end


