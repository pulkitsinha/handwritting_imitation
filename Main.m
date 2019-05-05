% Main Analysis Part
Input_Image=imread('A.png');
MI=I2MIC(Input_Image);
[a,b]=SPF(MI);
n=5;%fill here when you decide what to do with n, for now n=5
[SI,MOIP]=SOI(MI,n);
[c,d]=SPF(SI);
[SFSI,~,~]=ITCC(SI,c,d);%SFSI=Sequence For Scaled Image
MOSPISI=MCM(MOIP,c,d,n);%Matrix Of Starting Point In Scaled Image
[e,f]=SPF(MOSPISI);
[~,size_SFSI]=size(SFSI);
for i=1:size_SFSI
    if(i>1)    
        PNFS=SFSI(1,i-1);%Previous Number From Sequence
    else
        PNFS=SFSI(1,i);%To be modified after writting the SPF function
    end
    PGFSM=PGFB(e,f,n,SFSI(1,i),MOIP);%Probability Generator For  Scaled Memory
    MPFSM=MVP();%Markov Probability For Scaled Memory
end