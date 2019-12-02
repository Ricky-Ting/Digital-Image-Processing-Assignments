function [output] = sobel(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer=double((-1).^idx);
    imgg=double(img);
    
    f2=fft2(uint8(imgg.*transfer),2*m,2*n);
   
    %sobelFunc = fspecial('sobel');
    sobelFunc = [1,2,1;0,0,0;-1,-2,-1];
    sobelFuncPad = padding(sobelFunc, m,n);
    sobelFilter = ((fft2(sobelFuncPad.*transfer,2*m,2*n)));
    
    
    
    
    
    f2_jpg = (fftshift(log(1+abs((f2)))));
    imshow(f2_jpg,[]);
    
    
    filter=f2.*sobelFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m,1:n);
    i_new_new = uint8((real(i_new).*transfer));
    
    
    
    filter_jpg = (fftshift(log(1+abs((sobelFilter)))));
    imshow((filter_jpg),[]); % sobel freq graph
    filter_jpg = (fftshift(log(1+abs((filter)))));
    imshow((filter_jpg),[]); % after sobel freq graph 
    
    
    imshow(i_new_new,[]);
    imwrite(i_new_new,"sobel_freq.jpg");
    
    
    img=padding(img,m+2,n+2);
    sobelFuncPadd = padding(sobelFunc,m+2,n+2);
    i_space = uint8(conv2(img,sobelFuncPadd));
    i_space = uint8(i_space(1:m,1:n));
    imshow(i_space,[]);
    imwrite(i_space, "sobel_space.jpg");
    

end

