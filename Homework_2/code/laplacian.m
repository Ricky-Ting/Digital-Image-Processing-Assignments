function [output] = laplacian(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % with alpha = 0.2


    [m,n]=size(img); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer=double((-1).^idx);
    f2=fft2(double(img).*transfer,2*m,2*n);
  
     laplacianFunc = [0.1667,0.6667,0.1667;0.6667,-3.3333,0.6667;0.1667,0.6667,0.1667];
     laplacianFuncPad = padding(laplacianFunc, m,n);
     laplacianFilter = ((fft2(laplacianFuncPad.*transfer,2*m,2*n)));
    
    
    filter=f2.*laplacianFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m,1:n);
    i_new_new = uint8((real(i_new).*transfer));
    
    imshow(i_new_new,[]);
    imwrite(i_new_new,"laplacian_freq.jpg");
    
    img=padding(img,m+2,n+2);
    laplacianFuncPadd = padding(laplacianFunc,m+2,n+2);
    i_space = (conv2(img,laplacianFuncPadd));
    i_space = uint8(i_space(1:m,1:n));
    imshow(i_space,[]);
    imwrite(i_space, "laplacian_space.jpg");
    
    filter_jpg = (fftshift(log(1+abs((laplacianFilter)))));
    imshow((filter_jpg),[]); % laplacian freq graph
    filter_jpg = (fftshift(log(1+abs((filter)))));
    imshow((filter_jpg),[]); % after laplacian freq graph

end

