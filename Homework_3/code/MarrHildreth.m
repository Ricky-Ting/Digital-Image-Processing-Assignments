function [output] = MarrHildreth(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img);
    gausFilter=fspecial('gaussian',[13,13],2);
    img=imfilter(img,gausFilter);
    LPFilter=[1,1,1;1,-8,1;1,1,1];
    img=imfilter(img,LPFilter);
    threshold=0.05500*(max(max(img)));
    
    output=zeros([m,n],'double');
    for i=2:m-1 %Calculate zero-crossing
        for j=2:n-1
            cnt=0;
            if img(i-1,j)*img(i+1,j)<0 && abs(img(i-1,j)-img(i+1,j))>threshold
                cnt=cnt+1;
            end
            if img(i,j-1)*img(i,j+1)<0 &&abs(img(i,j-1)-img(i,j+1))>threshold
                cnt=cnt+1;
            end
            if img(i-1,j-1)*img(i+1,j+1)<0 && abs(img(i-1,j-1)-img(i+1,j+1))>threshold
                cnt=cnt+1;
            end
            if img(i-1,j+1)*img(i+1,j-1)<0 && abs(img(i-1,j+1)-img(i+1,j-1))>threshold
                cnt=cnt+1;
            end
            if cnt>=1
                output(i,j)=1;
            end
        end
    end
    
    %imwrite(output,"MH_alpha=0.055_noise.png");
     
     
      
   
    
end

