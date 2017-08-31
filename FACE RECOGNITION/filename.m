%To detect face


[fname,path]=uigetfile('.jpg','open a face as an input for training');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);

title('Face Detection');
c=input('Enter the class(numbers from 1-10)');
F=FeatureStatistical(im);
try 
    load db;
    F=[F c];
    db=[db:F]
    save db.mat db
catch
    db=[F c]
    save db.mat db
end
   