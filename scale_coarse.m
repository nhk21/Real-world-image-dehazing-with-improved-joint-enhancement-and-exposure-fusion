% ========================================================================
% Fast Multi-Scale Structural Patch Decomposition for Multi-Exposure Image Fusion, TIP,2020
% algorithm Version 1.0
% Copyright(c) 2020, Hui Li, Kede Ma, Yongwei Yong and Lei Zhang
% All Rights Reserved.
% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is hereby
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------
% Please refer to the following paper:
% H. Li et al., "Fast Multi-Scale Structural Patch Decomposition for Multi-Exposure Image Fusion, 2020" In press
% IEEE Transactions on Image Processing
% Please kindly report any suggestions or corrections to xiaohui102788@126.com
%----------------------------------------------------------------------

function [fI3, i_meant,aa,N1] = scale_coarse(imgSeqColor,r)

[h,w,n]=size(imgSeqColor);
N = boxfilter(ones(h, w), r);

tem=ones(h, w);
tem(:,2:2:w)=0;
tem(2:2:h,:)=0;
N1= boxfilter(tem, r);

% N1=N;

p=6;

[WD, Cmax,i_mean2]= weight_cal_detail(imgSeqColor,p,r);

WD=WD.*repmat(Cmax,[1 1 n]);


% WD= weight_cal_gray(imgSeqColor,[0 0 0 1 1 0 0]);

% brightness='direct';
% brightness='gussian_lg';
%  brightness='gussian_l';
% brightness='truncated';
brightness='our';
% brightness='gamma';


WB= weight_cal_base(imgSeqColor,[0 0 0 0 1 1 0],brightness);

% WB_mask= weight_cal_gray(imgSeqColor,[0 0 0 0 0 0 1],brightness);
% WB=WB;


F_temp2_detail=zeros(h,w,n);
F_temp2_base=zeros(h,w,n);
F_temp2=zeros(h,w,n);


%% approximate aggregation through averaging(mean filter) the weight map
i_meant=zeros(ceil(h/2),ceil(w/2),2);

% tic
for i = 1:n
    
    
    aa=i_mean2(:,:,i).*tem;
    i_meant(:,:,i)=aa(1:2:h,1:2:w);
    
    %     W_D1=boxfilter(aa.*WD(:,:,i), r)./ N1;
    %     W_D2=boxfilter(WD(:,:,i).*tem, r)./ N1;
    %     W_B2=boxfilter(aa.*WB(:,:,i), r)./ N1;
    
    W_D1=boxfilter(i_mean2(:,:,i).*WD(:,:,i), r)./ N;
    W_D2=boxfilter(WD(:,:,i), r)./ N;
    W_B2=boxfilter(i_mean2(:,:,i).*WB(:,:,i), r)./ N;
    
    
    %     W_B2=boxfilter(imgSeqColor(:,:,i).*WB(:,:,i), r)./ N;
    
    
    
    F_temp2_detail(:,:,i)=W_D2.*(imgSeqColor(:,:,i))-W_D1;
    
    
    
    F_temp2_base(:,:,i)= W_B2;
    
    F_temp2(:,:,i)=F_temp2_detail(:,:,i)+F_temp2_base(:,:,i);
    
end



fI3=sum(F_temp2,3);
% toc

%figure, imshow(mat2gray(sum(F_temp2_detail,3)))
%figure, imshow(mat2gray(sum(F_temp2_base,3)))

end



