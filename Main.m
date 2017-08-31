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

% Last Modified by GUIDE v2.5 30-Aug-2017 23:50:18

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









                      FirstFeature=Extracted_Face_Features(1);
                      SecondFeature=Extracted_Face_Features(2);
                      ThirdFeature=Extracted_Face_Features(3);
                      FourthFeature=Extracted_Face_Features(4);
                       FifthFeature=Extracted_Face_Features(5);
                      SixthFeature=Extracted_Face_Features(6);
                      SeventhFeature=Extracted_Face_Features(7);
                      EighthFeature=Extracted_Face_Features(8);
                      NinethFeature=Extracted_Face_Features(9);
                      TenthFeature=Extracted_Face_Features(10);
                      EleventhFeature=Extracted_Face_Features(11);
                      TwelvethFeature=Extracted_Face_Features(12);
                      ThirteenthFeature=Extracted_Face_Features(13);
                      FourteenthFeature=Extracted_Face_Features(14);
                      FifteenthFeature=Extracted_Face_Features(15);
                     SixteenthFeature=Extracted_Face_Features(16);
                     SeventeenthFeature=Extracted_Face_Features(17);
                     EighteenthFeature=Extracted_Face_Features(18);
                     NineteenthFeature=Extracted_Face_Features(19);
                     TwentythFeature=Extracted_Face_Features(20);
                     TwentyOneFeature=Extracted_Face_Features(21);
                     TwentyTwoFeature=Extracted_Face_Features(22);
                     TwentyThreeFeature=Extracted_Face_Features(23);
                     TwentyFourFeature=Extracted_Face_Features(24);
                     TwentyFiveFeature=Extracted_Face_Features(25);
                     TwentySixFeature=Extracted_Face_Features(26);
                     TwentySevenFeature=Extracted_Face_Features(27);
                     TwentyEightFeature=Extracted_Face_Features(28);
                     TwentyNineFeature=Extracted_Face_Features(29);
                     ThirtythFeature=Extracted_Face_Features(30);
                     ThirtyOneFeature=Extracted_Face_Features(31);
                     ThirtyTwoFeature=Extracted_Face_Features(32);
                     ThirtyThreeFeature=Extracted_Face_Features(33);
                     ThirtyFourFeature=Extracted_Face_Features(34);
                     ThirtyFiveFeature=Extracted_Face_Features(35);
                      ThirtySixFeature=Extracted_Face_Features(36);
                      ThirtySevenFeature=Extracted_Face_Features(37);
                      ThirtyEightFeature=Extracted_Face_Features(38);
                      ThirtyNineFeature=Extracted_Face_Features(39);
                      FortythFeature=Extracted_Face_Features(40);
                      FortyOneFeature=Extracted_Face_Features(41);
                      FortyTwoFeature=Extracted_Face_Features(42);
                      FortyThreeFeature=Extracted_Face_Features(43);
                      FortyFourFeature=Extracted_Face_Features(44);
                      FortyFiveFeature=Extracted_Face_Features(45);
                      FortySixFeature=Extracted_Face_Features(46);
                      FortySevenFeature=Extracted_Face_Features(47);
                      FortyEightFeature=Extracted_Face_Features(48);
                      FortyNineFeature=Extracted_Face_Features(49);
                      FiftythFeature=Extracted_Face_Features(50);
                      FiftyOneFeature=Extracted_Face_Features(51);
                      FiftyTwoFeature=Extracted_Face_Features(52);
                      FiftyThreeFeature=Extracted_Face_Features(53); 
                      FiftyFourFeature=Extracted_Face_Features(54);
                      FiftyFiveFeature=Extracted_Face_Features(55);
                      FiftySixFeature=Extracted_Face_Features(56);
                      FiftySevenFeature=Extracted_Face_Features(57);
                      FiftyEightFeature=Extracted_Face_Features(58); 
                      FiftyNineFeature=Extracted_Face_Features(59);

                      
                      
        
                      
                      
                              
set(handles.FirstFeature,'String',num2str(FirstFeature));
set(handles.SecondFeature,'String',num2str(SecondFeature));
set(handles.ThirdFeature,'String',num2str(ThirdFeature));
set(handles.FourthFeature,'String',num2str(FourthFeature));
set(handles.FourthFeature,'String',num2str(FourthFeature));
set(handles.SixthFeature,'String',num2str(SixthFeature));
set(handles.SeventhFeature,'String',num2str(SeventhFeature));
set(handles.EighthFeature,'String',num2str(EighthFeature));
set(handles.NinethFeature,'String',num2str(NinethFeature));
set(handles.TenthFeature,'String',num2str(TenthFeature));  
       
                      
   set(handles.  EleventhFeature,'String',num2str(EleventhFeature));
set(handles.TwelvethFeature,'String',num2str(TwelvethFeature));
set(handles.ThirteenthFeature,'String',num2str(ThirteenthFeature));
set(handles.FourteenthFeature,'String',num2str(FourteenthFeature));
set(handles.FifteenthFeature,'String',num2str(FifteenthFeature));
set(handles.SixteenthFeature,'String',num2str(SixteenthFeature));
set(handles.SeventeenthFeature,'String',num2str(SeventeenthFeature));
set(handles.EighteenthFeature,'String',num2str(EighteenthFeature));
set(handles.NineteenthFeature,'String',num2str(NineteenthFeature));
set(handles.TwentythFeature,'String',num2str(TwentythFeature));                  
                                         
 
    set(handles.TwentythFeature,'String',num2str(TwentythFeature));
set(handles.TwentyOneFeature,'String',num2str(TwentyOneFeature));
set(handles.TwentyTwoFeature,'String',num2str(TwentyTwoFeature));
set(handles.TwentyThreeFeature,'String',num2str(TwentyThreeFeature));
set(handles.TwentyFourFeature,'String',num2str(TwentyFourFeature));
set(handles.TwentyFiveFeature,'String',num2str(TwentyFiveFeature));
set(handles.TwentySixFeature,'String',num2str(TwentySixFeature));
set(handles.TwentySevenFeature,'String',num2str(TwentySevenFeature));
set(handles.TwentyFortyEightFeature,'String',num2str(TwentyEightFeature));
set(handles.TwentyNineFeature,'String',num2str(TwentyNineFeature));                  
                      
                     
set(handles.ThirtythFeature,'String',num2str(ThirtythFeature));
set(handles.ThirtyOneFeature,'String',num2str(ThirtyOneFeature));
set(handles.ThirtyTwoFeature,'String',num2str(ThirtyTwoFeature));
set(handles.ThirtyThreeFeature,'String',num2str(ThirtyThreeFeature));
set(handles.ThirtyFourFeature,'String',num2str(ThirtyFourFeature));
set(handles.ThirtyFiveFeature,'String',num2str(ThirtyFiveFeature));
set(handles.ThirtySixFeature,'String',num2str(ThirtySixFeature));
set(handles.ThirtySevenFeature,'String',num2str(ThirtySevenFeature));
set(handles.ThirtyEightFeature,'String',num2str(ThirtyEightFeature));
set(handles.ThirtyNineFeature,'String',num2str(ThirtyNineFeature));                
   

set(handles.FortythFeature,'String',num2str(FortythFeature));
set(handles.FortyOneFeature,'String',num2str(FortyOneFeature));
set(handles.FortyTwoFeature,'String',num2str(FortyTwoFeature));
set(handles.FortyThreeFeature,'String',num2str(FortyThreeFeature));
set(handles.FortyFourFeature,'String',num2str(FortyFourFeature));
set(handles.FortyFiveFeature,'String',num2str(FortyFiveFeature));
set(handles.FortySixFeature,'String',num2str(FortySixFeature));
set(handles.FortySevenFeature,'String',num2str(FortySevenFeature));
set(handles.FortyEightFeature,'String',num2str(FortyEightFeature));
set(handles.FortyNineFeature,'String',num2str(FortyNineFeature));


set(handles.FiftyFeature,'String',num2str(FiftyFeature));
set(handles.FiftyOneFeature,'String',num2str(FiftyOneFeature));
set(handles.FiftyTwoFeature,'String',num2str(FiftyTwoFeature));
set(handles.FiftyThreeFeature,'String',num2str(FiftyThreeFeature));
set(handles.FiftyFourFeature,'String',num2str(FiftyFourFeature));
set(handles.FiftyFiveFeature,'String',num2str(FiftyFiveFeature));
set(handles.FiftySixFeature,'String',num2str(FiftySixFeature));
set(handles.FiftySevenFeature,'String',num2str(FiftySevenFeature));
set(handles.FiftyEightFeature,'String',num2str(FiftyEightFeature));
set(handles.FiftyNineFeature,'String',num2str(FiftyNineFeature));

nnetwork=evalin('base','Neural');

outputresut=nnetwork([firstfeature;Width_LeftEye;
                       Width_RightEye;
                       FaceHeight;
                       EuclideandistanceRightEye_Nose;
                       EuclideandistanceLeftEye_Nose;
                       EuclideandistanceRightEye_Mouth;
                       EuclideandistanceLeftEye_Mouth;
                       EuclideandistanceNose_Mouth;])

outputresult=nnetwork([FirstFeature;SecondFeature;ThirdFeature;FourthFeature;FifthFeature;
                      SixthFeature;SeventhFeature;EighthFeature;NinethFeature;TenthFeature;
                      EleventhFeature;TwelvethFeature;ThirteenthFeature;FourteenthFeature;FifteenthFeature;
                     SixteenthFeature;SeventeenthFeature;EighteenthFeature;NineteenthFeature;TwentythFeature;
                     TwentyOneFeature;TwentyTwoFeature;TwentyThreeFeature;TwentyFourFeature;TwentyFiveFeature;
                     TwentySixFeature;TwentySevenFeature;TwentyEightFeature;ThirtyNineFeature;ThirtythFeature;
                     ThirtyOneFeature;ThirtyTwoFeature;ThirtyThreeFeature;ThirtyFourFeature;ThirtyFiveFeature;
                      ThirtySixFeature;ThirtySevenFeature;ThirtyEightFeature;ThirtyNineFeature;FortythFeature;
                      FortyOneFeature;FortyTwoFeature;FortyThreeFeature;FortyFourFeature;FortyFiveFeature;
                      FortySixFeature;FortySevenFeature;FortyEightFeature;FortyNineFeature;FiftythFeature;
                      FiftyOneFeature; FiftyTwoFeature; FiftyThreeFeature; FiftyFourFeature; FiftyFiveFeature;
                      FiftySixFeature; FiftySevenFeature; FiftyEightFeature; FiftyNineFeature;])
               
                  finaloutputresult=round(outputresult,-1);
                set(handles.NeuralNetOutput,'String',num2str(outputresult));
                set(handles.FinalResult,'String',num2str(finaloutputresult));
                  














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
