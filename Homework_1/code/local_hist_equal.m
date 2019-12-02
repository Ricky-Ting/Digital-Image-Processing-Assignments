function [output3] = local_hist_equal(input_channel)
        B = 31;  %the range of the block.
        L = 256;
        
        [M,N] = size(input_channel);
        
        G = input_channel;
        G = uint32(G);
        mean_G = sum(sum(G))/(M*N);  %the mean of the whole graph
        G2 = G.*G;                      %the square of the whole graph
        mean_G2 = sum(sum(G2))/(M*N);   %the mean of the square of the whole graph
        sigma2_G = mean_G2 - mean_G*mean_G  %the variance of the whole graph
        
        k_0 = 0.8;  %coefficient
        k_1 = 0.01; %coefficient
        k_2 = 0.1;  %coefficient
        output3 = input_channel;
        
        
        for i = 1:M-B+1
            for j = 1:N-B+1    %move the block in the whole graph step by step
                H = zeros(B*B,1,'uint32'); %H to record the pixels of the block
                index = 1;        %the index to H 
                for k = i:i+B-2 
                    for l = j:j+B-2     %scan the block
                        H(index) = input_channel(k,l);
                        index = index+1;
                    end
                end
                H = sort(H);                %sort H in ascending order
                H2 = H.*H;                  %the square of the H
                mean_H = sum(H)/(B*B);      %the mean of H
                mean_H2 = sum(H2)/(B*B);    %the mean of H2
                sigma2_S = mean_H2 - mean_H*mean_H; %the variance of H
                
                index = 1;
                while index<=B*B && H(index)<=input_channel(i+(B-1)/2,j+(B-1)/2)
                    index = index + 1;
                    % find the number of pixels whose greyscale is less
                    % than that of the block center.
                end
                
                %if(mean_H<k_0*mean_G &&  sigma2_S>k_1*sigma2_G && sigma2_S<k_2*sigma2_G)
                    output3(i+(B-1)/2,j+(B-1)/2) = (L-1)*index/(B*B);
                    %do the convertion to the block center.
                %end
                
            end
        end
        
                 
        
        
