function [ MI ] = I2MIC( I )
%I2MIC= Input 2 Maniputable Image Converter
%MI=Maniputable Image
%I =Input Image
BW = im2bw(I, 0.5);
BW3 = bwmorph(BW,'remove',Inf);
MI=imresize(BW3,1);


end

