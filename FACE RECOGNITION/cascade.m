function Viola_Jones_img( Img )
%Viola_Jones_img( Img )
% Img - input image
% Example how to call function: Viola_Jones_img(imread('name_of_the_picture.jpg'))

faceDetector = vision.CascadeObjectDetector;
bboxes = step(faceDetector, Img);
figure, imshow(Img), title('Detected faces');hold on
for i=1:size(bboxes,1)
    rectangle('Position',bboxes(i,:),'LineWidth',2,'EdgeColor','y');
end

end