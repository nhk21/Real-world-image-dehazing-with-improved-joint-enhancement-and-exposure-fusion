clear all
clc
InputPath1 = 'C:\Users\NHK\Desktop\Datasets\RESIDE\SOTS\outdoor\gt\';
InputPath2 = '.\result2\';

FileName1 = dir(strcat(InputPath1, '*.png'));
FileName2 = dir(strcat(InputPath2, '*.png'));

S=0; P=0;
for k=1:length(FileName1)
    tempFileName1 = FileName1(k).name;
    tempFileName2 = FileName2(k).name;
    ImPath1 = strcat(InputPath1, tempFileName1);
    ImPath2 = strcat(InputPath2, tempFileName2);
    img1 = im2double(imread(ImPath1));
    img2 = im2double(imread(ImPath2));
    P=P+psnr(img1,img2);
    S=S+ssim(img1,img2);
end