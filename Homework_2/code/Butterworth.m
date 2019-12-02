function [] = Butterworth(i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(i); idx = ones(m,n);
    for j=1:m
        idx(j,:)=(j-1)+(0:n-1);
    end
    transfer= double((-1).^idx);
    f2=fft2(double(i).*transfer,2*m,2*n);
    
    D0 =100; N=2;
    BwFilter = zeros(2*m, 2*n);
    tmp = D0^(2 * N);
    for i = 1 : 2*m
        for j = 1 : 2*n
            dis = (i-(m+1.0))^2 + (j-(n+1.0))^2;
            BwFilter(i, j) = 1 / (1 + (dis^N) / tmp);
        end
    end

    filter=f2.*BwFilter;
    i_new = ifft2(filter);
    i_new=i_new(1:m,1:n);
    i_new_new = uint8(real(i_new).*transfer);
    i_new_new=uint8(log_convertion(i_new_new,5));
    imshow(i_new_new,[]);
    imwrite(i_new_new,"Bw.jpg")
end

