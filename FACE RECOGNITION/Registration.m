function varargout = Registration(varargin)
% REGISTRATION MATLAB code for Registration.fig
%      REGISTRATION, by itself, creates a new REGISTRATION or raises the existing
%      singleton*.
%
%      H = REGISTRATION returns the handle to a new REGISTRATION or the handle to
%      the existing singleton*.
%
%      REGISTRATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTRATION.M with the given input arguments.
%
%      REGISTRATION('Property','Value',...) creates a new REGISTRATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Registration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Registration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Registration

% Last Modified by GUIDE v2.5 12-Sep-2017 13:26:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Registration_OpeningFcn, ...
                   'gui_OutputFcn',  @Registration_OutputFcn, ...
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


% --- Executes just before Registration is made visible.
function Registration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Registration (see VARARGIN)

































































% Choose default command line output for Registration
handles.output = hObject;
axes(handles.axes7)

imshow('logo2.png')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Registration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Registration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;







function txt_firstname_Callback(hObject, eventdata, handles)
% hObject    handle to txt_firstname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_firstname as text
%        str2double(get(hObject,'String')) returns contents of txt_firstname as a double


% --- Executes during object creation, after setting all properties.
function txt_firstname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_firstname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_lastname_Callback(hObject, eventdata, handles)
% hObject    handle to txt_lastname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_lastname as text
%        str2double(get(hObject,'String')) returns contents of txt_lastname as a double


% --- Executes during object creation, after setting all properties.
function txt_lastname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_lastname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







function txt_retype_Callback(hObject, eventdata, handles)
% hObject    handle to lbl_retype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lbl_retype as text
%        str2double(get(hObject,'String')) returns contents of lbl_retype as a double

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_retype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns------------------ called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end













% --- Executes during object creation, after setting all properties.
function lbl_retype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lbl_retype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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
axes(handles.axes4);
imshow(I);
set(handles.btn_upload1,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes on button press in btn_upload2.53

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
axes(handles.axes5);
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
axes(handles.axes6);
imshow(I);
set(handles.btn_upload3,'Enable','on')

helpdlg('Image has been Loaded Successfully',...
        'Load Image');


% --- Executes during object creation, after setting all properties.



% --- Executes on button press in btn_submit.
function btn_submit_Callback(hObject, eventdata, handles)
% hObject    handle to btn_submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


firstname=get(handles.txt_firstname,'string');
lastname=get(handles.txt_lastname,'string');
email=get(handles.txt_email,'string');
password=get(handles.txt_password,'string');
retype=get(handles.txt_retype,'string');

if  isempty(firstname)
      disp('no value');
      helpdlg('firstname field is empty',...
            'firstname-error');
elseif  isempty(lastname)
          disp('no value');
          helpdlg('lastname field is empty',...
                'lastname-error');
elseif  isempty(email)
  disp('no value');
  helpdlg('email field is empty',...
        'email-error');
 
elseif  isempty(password)
  disp('no value');
  helpdlg('password field is empty',...
        'password-error');
    
   elseif  isempty(retype)
  disp('no value');
  helpdlg('retypepassword field is empty',...
        'retype-error');
    
elseif strcmp(password,retype)==0   
    
     helpdlg('password mismatch',...
        'password-error');
else

    

    

%Now making DB connection Object
dbConn = DATA_ACCESS_LAYER();
  colnames={'firstname','lastname','email','password'};
  data={firstname, lastname, email, password};

  
datainsert(dbConn, 'registration2', colnames, data);
  
  SELECT =strcat('SELECT UserID FROM registration2 WHERE email=''',email,'''');
  curs=exec(dbConn,SELECT);
  curs=fetch(curs);
  id=curs.Data;
 
  
  
  data1=get(handles.btn_upload1,'userdata');
  image1=data1.image;
  Feature_extraction(image1, id{1,1},true);
  
  data2=get(handles.btn_upload2,'userdata');
  image2=data2.image;
  Feature_extraction(image2, id{1,1},true);
  
  data3=get(handles.btn_upload3,'userdata');
  image3=data3.image;
  Feature_extraction(image3, id{1,1},true);
  
  
  helpdlg('Your Registration is successful',...
        'registration success message');
%  bringup login page
run('PRESENTATION_LAYER.m')
  
  
end 
    


% --- Executes during object creation, after setting all properties.
function btn_submit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
