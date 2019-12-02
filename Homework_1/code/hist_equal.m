function [output2] = hist_equal(input_channel)
        % L = max(max(input_channel))+1%???????
        
        L =256;  %Suppose largest grayscale is 255, then L-1 = 255
       
        [M,N] = size(input_channel); %M:height, N:width of the picture
        H = zeros(L,1); % H(i) denotes the number of pixels with grayscale i
        
        for i = 1:M   
            for j = 1:N
                H(input_channel(i,j)+1) = H(input_channel(i,j)+1) + 1;
                % Calculate H
            end
        end
        
        output2 = zeros(M,N,'uint8'); %have to use type uint8
        
        T = zeros(L,1); %the map from the original greyscale to new greyscale
        sum = 0; 
        for i = 1:L
            sum = sum + H(i);
            s = round(sum*(L-1)/(M*N));
            if s>255
                T(i) = 255;
            else
                T(i) = s;
            end
            
        end
       
        for i = 1:M
            for j = 1:N
                output2(i,j) = T(input_channel(i,j)+1);
                %do the convertion to the image
            end
        end
        
        output2 = (output2);
   