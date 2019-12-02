function output = ByHSV(input_image, HSV_bits)

    HSV = rgb2hsv(input_image); %convert rgb to hsv
    
    
    if HSV_bits&0x2
        s = HSV(:,:,2);  %I choose saturation to do the convertion
        s = 255.*s;      %As s \in [0,1], we need to multiply it by 255
        s = uint8(s);    %Convert it to uint8

        %You can choose to do either hist_equal or local_hist_equal.

        %s = local_hist_equal(s); 
        s = hist_equal(s);

        s = double(s);
        s = s./255;
        HSV(:,:,2) = s;
    end
    
    if HSV_bits&0x1
        v = HSV(:,:,3);  %I choose saturation to do the convertion
        v = 255.*v;      %As s \in [0,1], we need to multiply it by 255
        v = uint8(v);    %Convert it to uint8

        %You can choose to do either hist_equal or local_hist_equal.

        %s = local_hist_equal(s); 
        v = hist_equal(v);

        v = double(v);
        v = v./255;
        HSV(:,:,3) = v;
    end 
    
    
    output = hsv2rgb(HSV); %Convert hsv to rgb