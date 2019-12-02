%test histeq
I = imread('gray.jpg');
[J] = Histogram_equalization(I);
imwrite(J,"gray_power_converted.jpg")
figure, imshow(I)

figure, imshow(J)
