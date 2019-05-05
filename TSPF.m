function [ ts,tp ] = TSPF( NFS)
%TSPF=Temporary start point finder
% NFS=Number From Sequence
%ts=temporary start
%tp=temporary point
%g=PNFS=Previous Number From Sequence
V=NFS;
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
if(V==1||2||3||4||5||6||7||111)
    WP=1;                     %Wall Point    
elseif(V==8||9||10||11||12||13||14||112)
    WP=2;                       %Wall Point
elseif(V==15||16||17||18||19||20||21||113)
    WP=3;                     %Wall Point
elseif(V==22||23||24||25||26||27||28||114)
    WP=4;                     %Wall Point
elseif(V==29||30||31||32||33||34||35||115)
    WP=5;                     %Wall Point
elseif(V==36||37||38||39||40||41||42||116)
    WP=6;                     %Wall Point
elseif(V==43||44||45||46||47||48||49||117)
    WP=7;                     %Wall Point
elseif(V==50||51||52||53||54||55||56||118)
    WP=8;                     %Wall Point
end
end

