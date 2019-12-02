function output = log_convertion(input_image)

    [M,N] = size(input_image);
    
    output = zeros(M,N,'uint8');
    
    for i=1:M
        for j=1:N
            log(1+double(input_image(i,j)));
            output(i,j) = uint8((255*(1/log(256))*log(1+double(input_image(i,j)))));
        end
    end
end

