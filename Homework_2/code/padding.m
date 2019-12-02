function [output] =padding(A,m,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    output=zeros(m,n);
    [x,y] =size(A);
    for i=1:x
        for j=1:y
            output(i,j)=A(i,j);
        end
    end
end

