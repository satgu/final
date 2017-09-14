function varargout = PRESENTATION_LAYER(varargin)
% PRESENTATION_LAYER MATLAB code for PRESENTATION_LAYER.fig
%      PRESENTATION_LAYER, by itself, creates a new PRESENTATION_LAYER or raises the existing
%      singleton*.
%
%      H = PRESENTATION_LAYER returns the handle to a new PRESENTATION_LAYER or the handle to
%      the existing singleton*.
%
%      PRESENTATION_LAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESENTATION_LAYER.M with the given input arguments.
%
%      PRESENTATION_LAYER('Property','Value',...) creates a new PRESENTATION_LAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PRESENTATION_LAYER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PRESENTATION_LAYER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PRESENTATION_LAYER

% Last Modified by GUIDE v2.5 13-Sep-2017 06:41:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PRESENTATION_LAYER_OpeningFcn, ...
                   'gui_OutputFcn',  @PRESENTATION_LAYER_OutputFcn, ...
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


% --- Executes just before PRESENTATION_LAYER is made visible.
function PRESENTATION_LAYER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PRESENTATION_LAYER (see VARARGIN)

% Choose default command line output for PRESENTATION_LAYER
handles.output = hObject;
axes(handles.axes5)

imshow('logo-dark1.png')

% train network
dbConn = DATA_ACCESS_LAYER();
SELECT =strcat('SELECT * FROM features');
  curs=exec(dbConn,SELECT);
  curs=fetch(curs);
  allfeatures=transpose(curs.Data);
 
  output=cell2mat(allfeatures(1,:));
  input=cell2mat(allfeatures(2:27,:));
  
trainnet=Training(input,output);
  data=struct('net',trainnet);
  set(handles.btn_login,'userdata',data);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PRESENTATION_LAYER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PRESENTATION_LAYER_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_email_Callback(hObject, eventdata, handles)
% hObject    handle to txt_email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_email as text
%        str2double(get(hObject,'String')) returns contents of txt_email as a double


% --- Executes during object creation, after setting all properties.
function txt_email_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_password_Callback(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_password as text
%        str2double(get(hObject,'String')) returns contents of txt_password as a double


% --- Executes during object creation, after setting all properties.
function txt_password_CreateFcn(hObject, eventdata, ~)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

 
% --- Executes on button press in btn_login.
function btn_login_Callback(hObject, eventdata, handles)
% hObject    handle to btn_login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
neural=get(hObject,'userdata');
neuralcheck=neural.net;
email=get(handles.txt_email,'string');
password=get(handles.txt_password,'string');

if  isempty(email)
  disp('no value');
  helpdlg('email field is empty',...
        'email-error');
 
elseif isempty(password)
  disp('no value');
  helpdlg('password field is empty',...
        'password-error');
else
%     try to retrieve user from database
dbConn = DATA_ACCESS_LAYER();
SELECT =strcat('SELECT * FROM registration2 WHERE email=''',email,'''',' and password=''',password,'''');
  curs=exec(dbConn,SELECT);
  curs=fetch(curs);
  id=curs.Data;
  userid=id{1,1};
  if(strcmp(id,'No Data'))
     
  helpdlg('Username or Password Does Not Exist',...
        'Username and Password mismatch'); 
  else
      
      
   
  data1=get(handles.btn_upload1,'userdata');
  image1=data1.image;
  input1=Feature_extraction(image1, id{1,1},false);
  input1=input1(1,2:27);
  input1mat=transpose(cell2mat(input1));
  predict1=neuralcheck(input1mat);
  predict1=round(predict1);
  
  data2=get(handles.btn_upload2,'userdata');
  image2=data2.image;
  input2=Feature_extraction(image2, id{1,1},false);
    input2=input2(1,2:27);
  input2mat=transpose(cell2mat(input2));
   predict2=neuralcheck(input2mat);
  predict2=round(predict2);
   
  data3=get(handles.btn_upload3,'userdata');
  image3=data3.image;
  input3=Feature_extraction(image3, id{1,1},false);
  input3=input3(1,2:27);
  input3mat=transpose(cell2mat(input3));
  predict3=neuralcheck(input3mat);
  predict3=round(predict3);
  
  
    if predict1==predict2 && predict2==predict3 && predict3==userid
     helpdlg('Login Is Successful,Welcome To ICBT   ',...
        'Successful message');   
    else
    helpdlg('Unsuccessful',...
        'Your Username and password Doesnot Exist');       
  end
 

  end
 
  
  
   
    end

 

% --- Executes during object creation, after setting all properties.
function btn_login_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_register.
function btn_register_Callback(hObject, eventdata, handles)
% hObject    handle to btn_register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


email=get(handles.txt_email,'string');
password=get(handles.txt_password,'string');




run('Registration.m')
% --- Executes on button press in btn_upload1.
function btn_upload1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_upload1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 
data=struct('image',I);
set(hObject,'userdata',data);
   
  %  figure(1);
 %imshow(I);
axes(handles.axes1);
imshow(I);
set(handles.btn_upload1,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes on button press in btn_upload2.
function btn_upload2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_upload2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 
data=struct('image',I);
set(hObject,'userdata',data);
   
  %  figure(1);
 %imshow(I);
axes(handles.axes2);
imshow(I);
set(handles.btn_upload2,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes on button press in btn_upload3.
function btn_upload3_Callback(hObject, eventdata, handles)
% hObject    handle to btn_upload3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 
data=struct('image',I);
set(hObject,'userdata',data);
   
  %  figure(1);
 %imshow(I);
axes(handles.axes3);
imshow(I);
set(handles.btn_upload3,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes during object creation, after setting all properties.
