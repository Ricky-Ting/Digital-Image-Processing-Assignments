function  midFilter(I)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
G=medfilt2(I,[5,5]);
G=uint8(log_convertion(G,5));
imshow(G);
imwrite(G,"mid.jpg");
end

