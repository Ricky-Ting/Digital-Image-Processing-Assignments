function [] = gaus(i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(i); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer= double((-1).^idx);
    f2=fft2(double(i).*transfer,2*m,2*n);
    [m,n]=size(f2);

    gausFilter = fspecial('gaussian',[m,n],100);
    filter=f2.*gausFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m/2,1:n/2);
    i_new_new = uint8(real(i_new).*transfer);
    
    imshow(i_new_new,[]);
end

