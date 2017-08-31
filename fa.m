% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();


obj=imaq.VideoDevice('winvideo',2,'YUY2_320*240');
set(obj,'ReturnedColorSpace','rgb');


figure('menubar','none','tag','webcam');
while(true)
    frame=step(obj);
    bboxes            = step(faceDetector, videoFrame);
IFaces=insertObjectAnnotation(frame, 'rectangle', bboxes);
imshow(IFaces,'border','tight')
f=findobj('tag','webcam');
if(isempty(f))
    close(gcf)
    break
end
pause(0.05)
end

release(obj)