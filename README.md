# SSIF_CEEF

This package contains the MATLAB code which is associated with the following work. Please cite the paper if you use the code. 

N.H. Kaplan. "Real-World Image Dehazing with Improved Joint Enhancement and Exposure Fusion" 

*ABSTRACT

In this work, a single image dehazing method that improves the haze removal capacity of the Joint Contrast Enhancement and Exposure Fusion (CEEF) method with Smoothing-Sharpening Image Filter (SSIF) is presented. In this method, the hazy image is first sharpened with SSIF to obtain a sharper image. In this way, the difference between haze and objects is amplified. Then, the AHE procedure in CEEF is replaced by CLAHE to obtain an enhanced CEEF. The enhanced CEEF is applied to the filtering result to obtain the final dehazed image. Observations demonstrate that the proposed method obtains enhanced results while reducing the amount of haze. The visual and quantitative comparisons between the proposed method and state-of-the-art dehazing methods show that the proposed method has better dehazing performance and has a 50\% improvement in terms of the FADE metric compared to the closest result.*

Please visit the following pages for the original CEEF and SSIF implementations. 

The codes for CEEF: https://github.com/xiaohuiben/CEEF-TMM-2021 

The codes for SSIF: https://github.com/fergaletto/SSIF
