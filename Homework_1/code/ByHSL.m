function output = ByHSL(input_image,HSL_bits)
    [M,N,tmp] = size(input_image);
    HSL = reshape(rgb2hsl(reshape(double(input_image)/255,[],3)),M,N,3); %convert rgb to hsv
    
    
    if HSL_bits&0x2
        s = HSL(:,:,2);  %I choose saturation to do the convertion
        s = 255.*s;      %As s \in [0,1], we need to multiply it by 255
        s = uint8(s);    %Convert it to uint8

        %You can choose to do either hist_equal or local_hist_equal.

        %s = local_hist_equal(s); 
        s = hist_equal(s);

        s = double(s);
        s = s./255;
        HSL(:,:,2) = s; 
    end
    
    if HSL_bits&0x1
        l = HSL(:,:,3);  %I choose saturation to do the convertion
        l = 255.*l;      %As s \in [0,1], we need to multiply it by 255
        l = uint8(l);    %Convert it to uint8

        %You can choose to do either hist_equal or local_hist_equal.

        %s = local_hist_equal(s); 
        l = hist_equal(l);

        l = double(l);
        l = l./255;
        HSL(:,:,3) = l; 
        
    end
        
        
    output = uint8(reshape(hsl2rgb(reshape(HSL,[],3)),M,N,3).*255); %Convert hsl to rgb