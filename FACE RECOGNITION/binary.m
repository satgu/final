a = imread('obeidn.12.jpg');



 b = rgb2gray(a);
  [x,y]=size(b);
 c=b(20:160,20:160)
 d=im2bw(c,0.2);
imshow(d)