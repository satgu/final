function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 31-Aug-2017 20:29:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
I  = imread('9336923.1.jpg');

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Create a cascade detector object.








      
        
        
        
        







% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)








% --- Executes on button press in btn_train.
function btn_train_Callback(hObject, eventdata, handles)
% hObject    handle to btn_train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




evalin('base','load(''Neural.mat'')'); 
pathname=getappdata(0, 'pathname');
filename=getappdata(0, 'filename');

I = imread('D:\FACE RECOGNITION SYSTEM\FEMALE\astefa\astefa.6.jpg');

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
RightEye = vision.CascadeObjectDetector('RightEye','MergeThreshold',30);
BBRightEye=step(RightEye,I);
figure(4),
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
figure(5),
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
Width_RightEye=BBRightEye(3);
FaceHeight=BBFaceDetect(4);
EuclideandistanceRightEye_Nose = sqrt((xCentroid_Nose-xCentroid_RightEye)^2+(yCentroid_Nose-yCentroid_RightEye)^2);
EuclideandistanceLeftEye_Nose  = sqrt((xCentroid_Nose-xCentroid_LeftEye)^2+(yCentroid_Nose-yCentroid_LeftEye)^2);
EuclideandistanceRightEye_Mouth = sqrt((xCentroid_Mouth-xCentroid_RightEye)^2+(yCentroid_Mouth-yCentroid_RightEye)^2);
EuclideandistanceLeftEye_Mouth  = sqrt((xCentroid_Mouth-xCentroid_LeftEye)^2+(yCentroid_Mouth-yCentroid_LeftEye)^2);
EuclideandistanceNose_Mouth  = sqrt((xCentroid_Mouth-xCentroid_Nose)^2+(yCentroid_Mouth-yCentroid_Nose)^2);


assignin('base','Width_LeftEye',Width_LeftEye);
assignin('base','Width_RightEye',Width_RightEye);
assignin('base','FaceHeight',FaceHeight);
assignin('base','EuclideandistanceRightEye_Nose',EuclideandistanceRightEye_Nose);
assignin('base','EuclideandistanceLeftEye_Nose',EuclideandistanceLeftEye_Nose);
assignin('base','EuclideandistanceRightEye_Mouth',EuclideandistanceRightEye_Mouth);
assignin('base','EuclideandistanceLeftEye_Mouth',EuclideandistanceLeftEye_Mouth);
assignin('base','EuclideandistanceNose_Mouth',EuclideandistanceNose_Mouth);



















% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function btn_load_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 

   
  %  figure(1);
 %imshow(I);
axes(handles.axes6);
imshow(I);
set(handles.pushbutton13,'Enable','on')

helpdlg('Image has been Loaded Successfully. Choose an algorithm and train the network  ',...
        'Load Image');



% --- Executes on button press in btn_load.
function btn_load_Callback(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 

   
  %  figure(1);
 %imshow(I);
axes(handles.axes4);
imshow(I);
set(handles.pushbutton13,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes on button press in btn_camera.
function btn_camera_Callback(hObject, eventdata, handles)
% hObject    handle to btn_camera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5


% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EXIT_Callback(hObject, eventdata, handles)
% hObject    handle to EXIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
