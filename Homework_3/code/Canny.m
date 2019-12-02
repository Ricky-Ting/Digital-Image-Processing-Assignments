function [output] = Canny(img)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


    % Gaus Filter
    [m,n]=size(img);
    gausFilter=fspecial('gaussian',[13,13],2);
    img=imfilter(img,gausFilter);

    
    % Calculate gradient and direction
    [dx,dy]=gradient(img);
    dy=dy.*(-1);
    grad=sqrt(dx.^2+dy.^2);
    alpha=atan2(dy,dx);
    
    
    % Non-maximum Suppression
    new_grad=grad;
    pi=3.1415926;
    for i=2:m-1
        for j=2:n-1
            tmp=alpha(i,j);
            if( (tmp<0.125*pi && tmp>-0.125*pi) || (tmp>0.875*pi || tmp<-0.875*pi))
                % gradient:horizontal,  edge:vertical
                if(grad(i,j)<grad(i,j-1) || grad(i,j)<grad(i,j+1))
                    new_grad(i,j)=0;
                end
            end
            
            if( (tmp<0.625*pi && tmp>0.375*pi) || (tmp>-0.625*pi && tmp<-0.375*pi))
                % gradient:vertical,  edge:horizontal
                if(grad(i,j)<grad(i-1,j) || grad(i,j)<grad(i+1,j))
                    new_grad(i,j)=0;
                end
            end
            
            if( (tmp<0.375*pi && tmp>0.125*pi) || (tmp>-0.875*pi && tmp<-0.625*pi))
                % gradient:+45,  edge:-45
                if(grad(i,j)<grad(i-1,j+1) || grad(i,j)<grad(i+1,j-1))
                    new_grad(i,j)=0;
                end
            end
            
            if( (tmp<0.875*pi && tmp>0.625*pi) || (tmp>-0.375*pi && tmp<-0.125*pi))
                % gradient:-45,  edge:+45
                if(grad(i,j)<grad(i-1,j-1) || grad(i,j)<grad(i+1,j+1))
                    new_grad(i,j)=0;
                end
            end
            
        end
    end
    
    %Hysteresis Thresholding 
    TL=0.01000;
    TH=0.0200;
    
    output=zeros([m,n],'double');
    for i=2:m-1
        for j=2:n-1
           if new_grad(i,j)>TH 
               output(i,j)=1;
               for a=-1:1
                   for b=-1:1
                       if(new_grad(a+i,b+j)>TL )
                           output(a+i,b+j)=1;
                       end
                   end
               end
           end
        end
    end
    
    
   %imwrite(output,"Canny_TH=0.015_TL=0.005_noise.png")
    
end

