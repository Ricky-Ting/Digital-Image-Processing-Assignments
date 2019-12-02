function [Dest] = RF(I)
%%%% !!!!!!!!!!!
%%%% The code below is from the Internet, 
%%%% and I did some revision.
%%%% !!!!!!!!!!!

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    I = double(I);
    H =real(double(imguidedfilter(uint8(I))) - I + 128);
    G = real(imfilter(H,fspecial('gaussian',[3 3],100)));
    opacity = 60;
    Dest = abs((I*(100 - opacity)+(I+2*G - 256)*opacity)/100);
    Dest = uint8(log_convertion(Dest,5));
    imshow([uint8(I) uint8(Dest)]);
    imwrite((Dest),"RF.jpg")


end

