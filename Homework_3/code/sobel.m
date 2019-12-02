function [output] = sobel(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img);
    
    % Gaus FIlter
    gausFilter=fspecial('gaussian',[13,13],2);
    img=imfilter(img,gausFilter,'conv');
    
    %X-direction sobel filter
    sobelFilter=fspecial('sobel');
    X=imfilter(img,sobelFilter,'conv');
    
    
    %Y-direction sobel filter
    sobelFilter=sobelFilter';
    Y=imfilter(img,sobelFilter,'conv');
    
    
    %new_img=X+Y
    new_img=abs(X)+abs(Y);
    th=0.100*max(max(new_img));
    
    output=zeros([m,n],'double');
    for i=1:m
        for j=1:n
            if new_img(i,j)>th
                output(i,j)=1;
            end
        end
    end
   
    %imwrite(output,"sobel_all_noise.png");
    

end

