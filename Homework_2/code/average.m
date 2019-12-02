function [output] = average(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(img); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer=double((-1).^idx);
    f2=fft2(double(img).*transfer,2*m,2*n);
  
    avgFunc = [0.111111,0.111111,0.111111;0.111111,0.111111,0.111111;0.111111,0.111111,0.111111];
    avgFuncPad = padding(avgFunc, m,n);
    avgFilter = ((fft2(avgFuncPad.*transfer,2*m,2*n)));
    
    
    filter=f2.*avgFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m,1:n);
    i_new_new = uint8((real(i_new).*transfer));
    
    imshow(i_new_new,[]);
    imwrite(i_new_new,"avg_freq.jpg");
    
    img=padding(img,m+2,n+2);
    avgFuncPadd = padding(avgFunc,m+2,n+2);
    i_space = (conv2(img,avgFuncPadd));
    i_space = uint8(i_space(1:m,1:n));
    imshow(i_space,[]);
    imwrite(i_space, "avg_space.jpg");
    
    
    filter_jpg = (fftshift(log(1+abs((avgFilter)))));
    imshow((filter_jpg),[]); % avg freq graph
    filter_jpg = (fftshift(log(1+abs((filter)))));
    imshow((filter_jpg),[]); % after avg freq graph
    

end

