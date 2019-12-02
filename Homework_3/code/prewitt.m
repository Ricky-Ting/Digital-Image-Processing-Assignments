function [output] = prewitt(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img);
    gausFilter=fspecial('gaussian',[13,13],2);
    img=imfilter(img,gausFilter,'conv');
    
    
    %X-direction prewitt filter
    prewittFilter=fspecial('prewitt');
    X=imfilter(img,prewittFilter,'conv');
    
    %Y-direction prewitt filter
    prewittFilter=prewittFilter';
    Y=imfilter(img,prewittFilter,'conv');
    
    
    %new_img=X+Y
    new_img=abs(X)+abs(Y);
    th=0.10*max(max(new_img));
    
    output=zeros([m,n],'double');
    for i=1:m
        for j=1:n
            if new_img(i,j)>th
                output(i,j)=1;
            end
        end
    end

   % imwrite(output,"prewitt_all_lena.png");
    
    

end

