%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
%clc; clear all;
% Load the test image
imgTest = im2double(imread('rubberband_cap.png'));
imgTestGray = rgb2gray(imgTest);
figure; clf;
imshow(imgTestGray);

%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
%img_edge = edge(imgTestGray);
img_edge = my_edge(imgTestGray);
figure;clf;

imshow(img_edge);
background = im2bw(imgTest, 1);
imshow(background);
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
imtool(img_edge);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%Bxpc = bwtraceboundary(img_edge, [92, 47], 'N');


Bxpc = my_edgelinking(img_edge, 91, 47);
hold on
plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
Bxpc2 = my_edgelinking(img_edge, 213, 62);
hold on
plot(Bxpc2(:,2), Bxpc2(:,1), 'w', 'LineWidth', 1);
Bxpc3 = my_edgelinking(img_edge, 182, 173);
hold on
plot(Bxpc3(:,2), Bxpc3(:,1), 'w', 'LineWidth', 1);
Bxpc4 = my_edgelinking(img_edge, 299, 211);
hold on
plot(Bxpc4(:,2), Bxpc4(:,1), 'w', 'LineWidth', 1);
Bxpc5 = my_edgelinking(img_edge, 55, 252);
hold on
plot(Bxpc5(:,2), Bxpc5(:,1), 'w', 'LineWidth', 1);
Bxpc6 = my_edgelinking(img_edge, 176, 398);
hold on
plot(Bxpc6(:,2), Bxpc6(:,1), 'w', 'LineWidth', 1);
Bxpc7 = my_edgelinking(img_edge, 181, 416);
hold on
plot(Bxpc7(:,2), Bxpc7(:,1), 'w', 'LineWidth', 1);
Bxpc8 = my_edgelinking(img_edge, 176, 426);
hold on
plot(Bxpc8(:,2), Bxpc8(:,1), 'w', 'LineWidth', 1);



