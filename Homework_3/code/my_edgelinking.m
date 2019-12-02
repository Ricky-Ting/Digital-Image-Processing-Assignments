function output = my_edgelinking(binary_image, row, col)
%in this function, you should finish the edge linking utility.
%the input parameters are a matrix of a binary image containing the edge
%information and coordinates of one of the edge points of a obeject
%boundary, you should run this function multiple times to find different
%object boundaries
%the output parameter is a Q-by-2 matrix, where Q is the number of boundary 
%pixels. B holds the row and column coordinates of the boundary pixels.
%you can use different methods to complete the edge linking function
%the better the quality of object boundary and the more the object boundaries, you will get higher scores 


dire=[-1,0; -1,1; 0,1; 1,1; 1,0; 1,-1; 0,-1; -1,-1];
revdire=[5,6,7,8,1,2,3,4];
s=[row,col]; %start

%B(maxsize,2)=0;
B(1,:)=s;
B_sz=1;

p=s;
predire=1;
%curdire=1;
initialdire=1;
c=[row-1,col];
cnt=0;
while cnt<2 && ~( all(c==s) && (predire==initialdire))
   if(binary_image(c(1),c(2))==1)
       B_sz=B_sz+1;
       B(B_sz,:)=c;
       p=c
       predire= mod(predire+5-1,8)+1;
       if all(c==s)
           cnt=cnt+1;
       end
   end
   predire=mod(predire+1-1,8)+1;
   c=p+dire(predire,:);
end

output=B;








end



