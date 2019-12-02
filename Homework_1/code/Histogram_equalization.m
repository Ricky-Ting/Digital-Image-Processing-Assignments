function [output] = Histogram_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %here is just one method, if you have other ways to do the
    %equalization, you can change the following code
%     r=input_image(:,:,1);
%     v=input_image(:,:,2);
%     b=input_image(:,:,3);
%     r1 = local_hist_equal(r);
%     v1 = local_hist_equal(v);
%     b1 = local_hist_equal(b);
%     output = cat(3,r1,v1,b1);    
    
    sign = 'color'

    HSV_bits = uint8(3); %0x1:V, 0x2:S, 0x3:V+S
    HSL_bits = uint8(3); %0x1:L, 0x2:S, 0x3:L+S
 
    
    %output = ByHSV(input_image,HSV_bits); %Use HSV 
    output = ByHSL(input_image,HSL_bits);
    
else
    %this is a gray image
    sign ="gray"
    [output] = local_hist_equal(input_image);
    
    $[output] = log_convertion(input_image);
    $[output] = power_convertion(input_image,3);
    
end

    


    
end