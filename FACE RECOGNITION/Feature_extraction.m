 function allvalues=Feature_extraction(I,userid,ifsave)
 
% I = imread('D:\FACE RECOGNITION SYSTEM\Trained\WIN_20170911_120532 (2).jpg');

I=imread(I);

%To detect face

FaceDetect = vision.CascadeObjectDetector('FrontalFaceCART');
BBFaceDetect = step(FaceDetect,I);
figure(1);
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
figure(2);
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
figure(3),
imshow(I);
for IMouth = 1:size(BBMouthDetect,1) 
rectangle('Position',BBMouthDetect(IMouth,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end 
title('Mouth Detection'); 
assignin('base','IMouth',IMouth);

hold off;



%To detect righteye
Righteye = vision.CascadeObjectDetector('RightEye','MergeThreshold',30);
BBRighteye=step(Righteye,I)
figure(4),
imshow(I);
for IRighteye = 1:size(BBRighteye,1) 
rectangle('Position',BBRighteye(IRighteye,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('RightEye Detection'); 
assignin('base','IRighteye',IRighteye);

hold off;


%To detect lefteye
Lefteye = vision.CascadeObjectDetector('Lefteye','MergeThreshold',40);
BBLefteye=step(Lefteye,I);
figure(5),
imshow(I);
for ILefteye = 1:size(BBLefteye,1)
rectangle('Position',BBLefteye(ILefteye,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Lefteye Detection');
assignin('base','ILefteye',ILefteye);

hold off;


Xcentroid_Face=BBFaceDetect(1)+BBFaceDetect(3)/2;
Ycentroid_Face=BBFaceDetect(2)+BBFaceDetect(4)/2;

assignin('base','Xcentroid_Face',Xcentroid_Face);
assignin('base','Ycentroid_Face',Ycentroid_Face);





Xcentroid_Nose=BBNoseDetect(1)+BBNoseDetect(3)/2;
Ycentroid_Nose=BBNoseDetect(2)+BBNoseDetect(4)/2;

assignin('base','Xcentroid_Nose',Xcentroid_Nose);
assignin('base','Ycentroid_Nose',Ycentroid_Nose);


Xcentroid_Mouth=BBNoseDetect(1)+BBMouthDetect(3)/2;
Ycentroid_Mouth=BBNoseDetect(2)+BBMouthDetect(4)/2;

assignin('base','Xcentroid_Mouth',Xcentroid_Mouth);
assignin('base','Ycentroid_Mouth',Ycentroid_Mouth);


Xcentroid_Righteye=BBRighteye(1)+BBRighteye(3)/2;
Ycentroid_Righteye=BBRighteye(2)+BBRighteye(4)/2;

assignin('base','Xcentroid_Righteye',Xcentroid_Righteye);
assignin('base','Ycentroid_Righteye',Ycentroid_Righteye);


Xcentroid_Lefteye=BBLefteye(1)+BBLefteye(3)/2;
Ycentroid_Lefteye=BBLefteye(2)+BBLefteye(4)/2;

assignin('base','Xcentroid_Lefteye',Xcentroid_Lefteye);
assignin('base','Ycentroid_Lefteye',Ycentroid_Lefteye);







EcudlideandistanceLefteye_Mouth  = sqrt((Xcentroid_Lefteye-Xcentroid_Mouth)^2+(Ycentroid_Lefteye-Ycentroid_Mouth)^2);
EcudlideandistanceLefteye_Nose  = sqrt((Xcentroid_Lefteye-Xcentroid_Nose)^2+(Ycentroid_Lefteye-Ycentroid_Nose)^2);
EcudlideandistanceNose_Mouth  = sqrt((Xcentroid_Nose-Xcentroid_Mouth)^2+(Ycentroid_Nose-Ycentroid_Mouth)^2);
EcudlideandistanceRighteye_Lefteye = sqrt((Xcentroid_Righteye-Xcentroid_Lefteye)^2+(Ycentroid_Righteye-Ycentroid_Lefteye)^2);
EcudlideandistanceRighteye_Mouth = sqrt((Xcentroid_Righteye-Xcentroid_Mouth)^2+(Ycentroid_Righteye-Ycentroid_Mouth)^2);
EcudlideandistanceRighteye_Nose = sqrt((Xcentroid_Righteye-Xcentroid_Nose)^2+(Ycentroid_Righteye-Ycentroid_Nose)^2);

Hight_frontalface=BBFaceDetect(4);
Hight_Lefteye=BBLefteye(4);
Hight_Mouth=BBMouthDetect(4);
Hight_Nose=BBNoseDetect(4);
Hight_Righteye=BBRighteye(4);

Width_frontalface=BBFaceDetect(3);
Width_Lefteye=BBLefteye(3);
Width_Mouth=BBMouthDetect(3);
Width_Nose=BBNoseDetect(3);
Width_Righteye=BBRighteye(3);
Xcentroid_Face;
Xcentroid_Lefteye;
Xcentroid_Mouth;
Xcentroid_Nose;
Xcentroid_Righteye;
Ycentroid_Face
Ycentroid_Lefteye;
Ycentroid_Mouth;
Ycentroid_Nose;
Ycentroid_Righteye;


assignin('base','EcudlideandistanceLefteye_Mouth',EcudlideandistanceLefteye_Mouth);
assignin('base','EcudlideandistanceLefteye_Nose',EcudlideandistanceLefteye_Nose);
assignin('base','EcudlideandistanceNose_Mouth',EcudlideandistanceNose_Mouth);
assignin('base','EcudlideandistanceRighteye_Lefteye',EcudlideandistanceRighteye_Lefteye);
assignin('base','EcudlideandistanceRighteye_Mouth',EcudlideandistanceRighteye_Mouth);
assignin('base','EcudlideandistanceRighteye_Nose',EcudlideandistanceRighteye_Nose);


data={
      userid, ...
      EcudlideandistanceLefteye_Mouth, ...
      EcudlideandistanceLefteye_Nose, ...
      EcudlideandistanceNose_Mouth, ...
      EcudlideandistanceRighteye_Lefteye, ...
      EcudlideandistanceRighteye_Mouth, ...
      EcudlideandistanceRighteye_Nose, ...
      Hight_frontalface, ...
      Hight_Lefteye, ...
      Hight_Mouth, ...
      Hight_Nose, ...
      Hight_Righteye, ...
      Width_frontalface, ...
      Width_Lefteye, ...
      Width_Mouth, ...
      Width_Nose, ...
      Width_Righteye, ...
      Xcentroid_Face, ...
      Xcentroid_Lefteye, ...
      Xcentroid_Mouth, ...
      Xcentroid_Nose, ...
      Xcentroid_Righteye, ...
      Ycentroid_Face, ...
      Ycentroid_Lefteye, ...
      Ycentroid_Mouth, ...
      Ycentroid_Nose, ...
      Ycentroid_Righteye
    };
colnames={ 
               'UserID', ...
               'EcudlideandistanceLefteye_Mouth', ...
               'EcudlideandistanceLefteye_Nose', ...
               'EcudlideandistanceNose_Mouth', ...
               'EcudlideandistanceRighteye_Lefteye', ...
               'EcudlideandistanceRighteye_Mouth', ...
               'EcudlideandistanceRighteye_Nose', ...
               'Hight_frontalface',... 
               'Hight_Lefteye', ...
               'Hight_Mouth', ...
               'Hight_Nose', ...
               'Hight_Righteye', ...
               'Width_frontalface', ...
               'Width_Lefteye', ...
                'Width_Mouth', ...
                'Width_Nose', ...
                'Width_Righteye', ...
                'Xcentroid_Face', ... 
                'Xcentroid_Lefteye', ...
                'Xcentroid_Mouth', ...
                'Xcentroid_Nose', ...
                'Xcentroid_Righteye', ...
                'Ycentroid_Face', ...
                'Ycentroid_Lefteye', ...
                'Ycentroid_Mouth', ...
                'Ycentroid_Nose', ...
                'Ycentroid_Righteye'
              };
  
 allvalues=data;


if(ifsave==true)
dbConn = DATA_ACCESS_LAYER();
  
 
  datainsert(dbConn, 'features', colnames, data);
    
end








       
                      


