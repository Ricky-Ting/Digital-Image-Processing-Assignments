function [output] = prewitt(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer=double((-1).^idx);
    f2=fft2(double(img).*transfer,2*m,2*n);
  
    prewittFunc = [1 1 1;0 0 0;-1 -1 -1];
    prewittFuncPad = padding(prewittFunc, m,n);
    prewittFilter = ((fft2(prewittFuncPad.*transfer,2*m,2*n)));
    
    
    filter=f2.*prewittFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m,1:n);
    i_new_new = uint8((real(i_new).*transfer));
    
    imshow(i_new_new,[]);
    imwrite(i_new_new,"prewitt_freq.jpg");
    
    img=padding(img,m+2,n+2);
    prewittFuncPadd = padding(prewittFunc,m+2,n+2);
    i_space = (conv2(img,prewittFuncPadd));
    i_space = uint8(i_space(1:m,1:n));
    imshow(i_space,[]);
    imwrite(i_space, "prewitt_space.jpg");
    
    filter_jpg = (fftshift(log(1+abs((prewittFilter)))));
    imshow((filter_jpg),[]); % prewitt freq graph
    filter_jpg = (fftshift(log(1+abs((filter)))));
    imshow((filter_jpg),[]); % after prewitt freq graph

end

