%To detect face

FaceDetect = vision.CascadeObjectDetector('FrontalFaceCART');

 I= imread('rhnorm.12.jpg');

BBFaceDetect = step(FaceDetect,I);
figure(2);
imshow(I);hold on
for IFace = 1:size(BBFaceDetect,1)
rectangle('Position',BBFaceDetect(IFace,:),'LineStyle','-','EdgeColor','r','LineWidth',5)
end
title('Face Detection');
assignin('base','IFace',IFace);
hold off;

%To detect nose

NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',20);
BBNoseDetect = step(NoseDetect,I);
figure(3);
imshow(I);hold on
for INose = 1:size(BBNoseDetect,1)
        rectangle('Position',BBNoseDetect(INose,:),'LineStyle','-','EdgeColor','b','LineWidth',4)
end
title('Nose Detection');
assignin('base','INose',INose);
hold off;

%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',50);
BBMouthDetect=step(MouthDetect,I);
figure,
imshow(I);
for IMouth = 1:size(BBMouthDetect,1) 
rectangle('Position',BBMouthDetect(IMouth,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end 
title('Mouth Detection'); 
assignin('base','IMouth',IMouth);

hold off;



%To detect righteye
RightEye = vision.CascadeObjectDetector('RightEye','MergeThreshold',20);
BBRightEye=step(RightEye,I);
figure,
imshow(I);
for IRightEye = 1:size(BBRightEye,1) 
rectangle('Position',BBRightEye(IRightEye,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('RightEye Detection'); 
assignin('base','IRightEye',IRightEye);

hold off;


%To detect lefteye
LeftEye = vision.CascadeObjectDetector('LeftEye','MergeThreshold',40);
BBLeftEye=step(LeftEye,I);
figure,
imshow(I);
for ILeftEye = 1:size(BBLeftEye,1)
rectangle('Position',BBLeftEye(ILeftEye,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('LeftEye Detection');
assignin('base','ILeftEye',ILeftEye);

hold off;


xCentroid_Face=BBFaceDetect(1)+BBFaceDetect(3)/2;
yCentroid_Face=BBFaceDetect(2)+BBFaceDetect(4)/2;

assignin('base','xCentroid_Face',xCentroid_Face);
assignin('base','yCentroid_Face',yCentroid_Face);





xCentroid_Nose=BBNoseDetect(1)+BBNoseDetect(3)/2;
yCentroid_Nose=BBNoseDetect(2)+BBNoseDetect(4)/2;

assignin('base','xCentroid_Nose',xCentroid_Nose);
assignin('base','yCentroid_Nose',yCentroid_Nose);


xCentroid_Mouth=BBNoseDetect(1)+BBMouthDetect(3)/2;
yCentroid_Mouth=BBNoseDetect(2)+BBMouthDetect(4)/2;

assignin('base','xCentroid_Mouth',xCentroid_Mouth);
assignin('base','yCentroid_Mouth',yCentroid_Mouth);


xCentroid_RightEye=BBRightEye(1)+BBRightEye(3)/2;
yCentroid_RightEye=BBRightEye(2)+BBRightEye(4)/2;

assignin('base','xCentroid_RightEye',xCentroid_RightEye);
assignin('base','yCentroid_RightEye',yCentroid_RightEye);


xCentroid_LeftEye=BBLeftEye(1)+BBLeftEye(3)/2;
yCentroid_LeftEye=BBLeftEye(2)+BBLeftEye(4)/2;

assignin('base','xCentroid_LeftEye',xCentroid_LeftEye);
assignin('base','yCentroid_LeftEye',yCentroid_LeftEye);

Width_LeftEye=BBLeftEye(3);
Width_RightEyeEye=BBRightEye(3);
FaceHeight=BBFaceDetect(4);
EuclideandistanceRightEye_Nose = sqrt((xCentroid_Nose-xCentroid_RightEye)^2+(yCentroid_Nose-yCentroid_RightEye)^2);
EuclideandistanceLeftEye_Nose  = sqrt((xCentroid_Nose-xCentroid_LeftEye)^2+(yCentroid_Nose-yCentroid_LeftEye)^2);
EuclideandistanceRightEye_Mouth = sqrt((xCentroid_Mouth-xCentroid_RightEye)^2+(yCentroid_Mouth-yCentroid_RightEye)^2);
EuclideandistanceLeftEye_Mouth  = sqrt((xCentroid_Mouth-xCentroid_LeftEye)^2+(yCentroid_Mouth-yCentroid_LeftEye)^2);
EuclideandistanceNose_Mouth  = sqrt((xCentroid_Mouth-xCentroid_Nose)^2+(yCentroid_Mouth-yCentroid_Nose)^2);




