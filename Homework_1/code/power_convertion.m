function output = power_convertion(input_image,gamma)

    [M,N] = size(input_image);
    
    output = zeros(M,N,'uint8');
    
    for i=1:M
        for j=1:N
            
            output(i,j) = uint8( 255* power(double(input_image(i,j)),gamma)*(1/power(255,gamma)) );
        end
    end
end

