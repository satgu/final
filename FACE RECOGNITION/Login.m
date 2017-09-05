function varargout = Login(varargin)
% BTN_LOGIN MATLAB code for btn_login.fig
%      BTN_LOGIN, by itself, creates a new BTN_LOGIN or raises the existing
%      singleton*.
%
%      H = BTN_LOGIN returns the handle to a new BTN_LOGIN or the handle to
%      the existing singleton*.
%
%      BTN_LOGIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BTN_LOGIN.M with the given input arguments.
%
%      BTN_LOGIN('Property','Value',...) creates a new BTN_LOGIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are

%  
% 
%      applied to the GUI before Login_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Login_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help btn_login

% Last Modified by GUIDE v2.5 28-Aug-2017 23:39:14

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LoginInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @LoginInterface_OutputFcn, ...
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


% --- Executes just before btn_login is made visible.
function Login_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to btn_login (see VARARGIN)

% Choose default command line output for btn_login
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes btn_login wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Login_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_username_Callback(hObject, eventdata, handles)
% hObject    handle to txt_username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_username as text
%        str2double(get(hObject,'String')) returns contents of txt_username as a double


% --- Executes during object creation, after setting all properties.
function txt_username_CreateFcn(hObject, eventdata, handles)

% hObject    handle to txt_username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%See ISPC and COMPUTER.
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

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function getlogin(handles)
Username = get(handles.txt_username, 'String');
    Password = get(handles.txt_password, 'String');
    % h = msgbox(message, title , Icon);
    if isempty(Username) && isempty(Password)
        msgbox('Please Enter your Username and Password to continue','Message');
    else
 
    msg = loginConnection(UserName, Password);
    
     
        if msg == 1
            close;
            msgbox('Welcome to ICBT Login','Message');
            run(untitled);
            else
            msgbox('Unauthorised Access');
        end
     
    end
    

% --- Executes on button press in btn_login.
function btn_login_Callback(hObject, eventdata, handles)
% hObject    handle to btn_login (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_password as text
%        str2double(get(hObject,'String')) returns contents of txt_password as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
