
clc;clear all;close all;


radius = 5;
Epsilon = .1;
kappa = 2 ; %kappa=1.2 for synthetic images
scale = 1;

InputPath = '.\InputImages\';
FileName = dir(strcat(InputPath, '*.png'));
for k=1:length(FileName)
    tempFileName = FileName(k).name;
    ImPath = strcat(InputPath, tempFileName);
    img = im2double(imread(ImPath));
    
    BF1=SSIF(img,img,radius,Epsilon,kappa,scale);

    BF2=im2uint8(BF1);
    result = (ModifiedCEEF(BF2));
    
    imwrite(result, ['.\result\\', tempFileName(1:end-4), '_Proposed.png',]);
end