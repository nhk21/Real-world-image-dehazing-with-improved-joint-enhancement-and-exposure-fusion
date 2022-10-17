function C=normalization(D)
D=double(D);
D=D-min(min(min(D)));
C=uint8(255*D/max(max(max(D))));