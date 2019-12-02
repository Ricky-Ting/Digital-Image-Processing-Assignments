function output = log_convertion(I,beta)

    [M,N] = size(I);
    
    %output = zeros(M,N,'uint8');
    I=double(I);
    I=I./255;
    for i=1:M
        for j=1:N
            I(i,j)=log(I(i,j)*(beta-1)+1)/log(beta);
        end
    end
    I=I.*255;
    output=uint8(I);
    
end

