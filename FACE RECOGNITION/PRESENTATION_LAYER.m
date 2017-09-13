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
function txt_password_CreateFcn(hObject, eventdata, handles)
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
 

% --- Executes during object creation, after setting all properties.
function btn_login_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function getlogin(handles)
Username = get(handles.txt_email, 'String');
Password = get(handles.txt_password, 'String');
    % h = msgbox(message, title , Icon);
    if isempty(Username) && isempty(Password)
        msgbox('Please Enter your Username and Password to continue','Message');
    else
 
    msg = loginConnection(Username, Password);
    
     
        if msg == 1
            close;
            msgbox('Welcome to ICBT Login','Message');
            run(untitled);
            else
            msgbox('Unauthorised Access');
        end
     
    end  


% --- Executes on button press in btn_register.
function btn_register_Callback(hObject, eventdata, handles)
% hObject    handle to btn_register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


email=get(handles.txt_email,'string');
password=get(handles.txt_password,'string');



if  isempty(email)
  disp('no value');
  helpdlg('email field is empty',...
        'email-error');
 
elseif  isempty(password)
  disp('no value');
  helpdlg('password field is empty',...
        'password-error');
    
  
else
run('Registration.m')
end
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
