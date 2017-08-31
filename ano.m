
evalin('base','load(''matlab-input.mat'')'); 
pathname=getappdata(0, 'pathname');
filename=getappdata(0, 'filename');


FaceDetect = vision.CascadeObjectDetector('FrontalFaceCART');
ImgFace=imread([pathname,filename]);
ImgFaceResize=imresize(ImgFace,[320,320]);
BBFaceDetect = step(FaceDetect,ImgFaceResize);
IFaces=insertObjectAnnotation(ImgFaceResize,'rectangle',BBFaceDetect,'Face');
assignin('base','IFaces',IFaces);







