function varargout = RGB2gray(varargin)
% RGB2GRAY MATLAB code for RGB2gray.fig
%      RGB2GRAY, by itself, creates a new RGB2GRAY or raises the existing
%      singleton*.
%
%      H = RGB2GRAY returns the handle to a new RGB2GRAY or the handle to
%      the existing singleton*.
%
%      RGB2GRAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB2GRAY.M with the given input arguments.
%
%      RGB2GRAY('Property','Value',...) creates a new RGB2GRAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB2gray_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB2gray_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB2gray

% Last Modified by GUIDE v2.5 04-Apr-2023 11:34:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB2gray_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB2gray_OutputFcn, ...
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


% --- Executes just before RGB2gray is made visible.
function RGB2gray_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB2gray (see VARARGIN)

% Choose default command line output for RGB2gray
handles.output = hObject;
handles.imgfilename = []; % 图片文件名字
handles.imgdata = [];     % 彩色图片的数据信息
handles.imgoutput = [];   % 转化的output文件

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB2gray wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB2gray_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[imgfilename imgpathname]=uigetfile({'*.jpg;*.png'},'Select a RGB image');
if imgfilename
    imgdata=imread([imgpathname '\' imgfilename]);
    axes(handles.axes1);imshow(imgdata); % 绘图函数（画布，文件数据）
    % 文件名和图片数据保存到结构体里
    handles.imgfilename=imgfilename;
    handles.imgdata=imgdata;    
end
guidata(hObject,handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 实现功能：把彩色图像转成灰度图像
if ~isempty(handles.imgfilename)
    imgoutput=rgb2gray(handles.imgdata);
    axes(handles.axes2);imshow(imgoutput); 
    colormap(handles.axes2,gray(256))
    handles.imgoutput=imgoutput;
end

guidata(hObject,handles) % 更新结构体
