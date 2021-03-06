% Authors:  - Andrea Rizzo, andrearizzo [at] outlook.com
%           - Matteo Bruni, matteo.bruni [at] gmail.com
%             
% Date: 20/06/2013
%
% You are free to use, change, or redistribute this code in any way you
% want for non-commercial purposes. However, it is appreciated if you 
% maintain the name of the original author.
%
% (C) A.Rizzo, M. Bruni


function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 02-Jul-2013 11:27:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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



% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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

    % Browse for the image file.
    [baseFileName, folder] = uigetfile('*.*', 'Specify an image file');

    if ( baseFileName == 0 )
        set( handles.grid_button, 'Enable', 'off' );
        return;
    end
    
    % Create the full file name.
    fullImageFileName = fullfile(folder, baseFileName);
    set( handles.image_path ,'String', fullImageFileName );
    showGridImage(handles, imread(fullImageFileName));
    set( handles.grid_button, 'Enable', 'on' );
    

function image_path_Callback(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of image_path as text
%        str2double(get(hObject,'String')) returns contents of image_path as a double


% --- Executes during object creation, after setting all properties.
function image_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over image_path.
function image_path_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function num_rows_Callback(hObject, eventdata, handles)
% hObject    handle to num_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_rows as text
%        str2double(get(hObject,'String')) returns contents of num_rows as a double


% --- Executes during object creation, after setting all properties.
function num_rows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_cols_Callback(hObject, eventdata, handles)
% hObject    handle to num_cols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_cols as text
%        str2double(get(hObject,'String')) returns contents of num_cols as a double


% --- Executes during object creation, after setting all properties.
function num_cols_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_cols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on image_path and none of its controls.
function image_path_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to image_path (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function showGridImage(handles, url)
    
    % get the number of rows and columns
    num_region_rows = str2double( get( handles.num_rows, 'String' ) );
    num_region_cols = str2double( get( handles.num_cols, 'String' ) );

    % get the coordinates of (num_region_rows*num_region_cols) regions
    [ image, r_min, r_max, c_min, c_max ] = getGridMeasure( url, num_region_rows, num_region_cols);
    imshow(image);
    
    % prints the number for each region
    for k=0:(num_region_rows*num_region_cols-1)
        text(floor((c_max(k+1)+c_min(k+1))/2), floor((r_max(k+1)+r_min(k+1))/2), num2str(k))
    end
    axes(handles.axes1);


function correct_samples_Callback(hObject, eventdata, handles)
% hObject    handle to correct_samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of correct_samples as text
%        str2double(get(hObject,'String')) returns contents of correct_samples as a double


% --- Executes during object creation, after setting all properties.
function correct_samples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to correct_samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    global training_mean;
    global training_std;
    global test_statistic_measures;
    global reject;

    training_regions = str2num(get( handles.correct_samples, 'String' ))
    
    num_region_rows = str2double( get( handles.num_rows, 'String' ) );
    num_region_cols = str2double( get( handles.num_cols, 'String' ) );
    
    % get the number of lbp/histogram 
    %radii = [ 3 6 9 12 ];
    radii = str2num( get( handles.radii, 'String' ) );
    
    fullImageFileName = get( handles.image_path ,'String' );
    
    image =  imread(fullImageFileName); %rgb2gray(imread(fullImageFileName));
    
    sigma_coefficient = str2num( get( handles.sigma_coefficient, 'String' ) );
    
    [training_mean, training_std, test_statistic_measures, reject ] = computeRejectedRegions( image, training_regions, radii, num_region_rows, num_region_cols, sigma_coefficient );
    
    set( handles.reject_regions, 'String', strcat( 'Rejected regions:  ', num2str(reject) ) );
    
    test_statistic_measures = sortrows( test_statistic_measures,1 );
        
    [ b, r_min, r_max, c_min, c_max ] = getGridMeasure( image, num_region_rows, num_region_cols);
    out = writeResults( image, num_region_rows, num_region_cols, training_regions, reject );

    imshow(out);
    
    for k=0:(num_region_rows*num_region_cols-1)
        text( floor((c_max(k+1)+c_min(k+1))/2), floor((r_max(k+1)+r_min(k+1))/2), num2str(k) );
    end
    
    axes(handles.axes1);
    reject
    

function radii_Callback(hObject, eventdata, handles)
% hObject    handle to radii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of radii as text
%        str2double(get(hObject,'String')) returns contents of radii as a double


% --- Executes during object creation, after setting all properties.
function radii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kernel_size_Callback(hObject, eventdata, handles)
% hObject    handle to kernel_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kernel_size as text
%        str2double(get(hObject,'String')) returns contents of kernel_size as a double


% --- Executes during object creation, after setting all properties.
function kernel_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kernel_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma_coefficient_Callback(hObject, eventdata, handles)
% hObject    handle to sigma_coefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma_coefficient as text
%        str2double(get(hObject,'String')) returns contents of sigma_coefficient as a double


% --- Executes during object creation, after setting all properties.
function sigma_coefficient_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma_coefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grid_button.
function grid_button_Callback(hObject, eventdata, handles)
% hObject    handle to grid_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    fullImageFileName = get( handles.image_path ,'String' );
    showGridImage(handles, imread(fullImageFileName));


% --- Executes on button press in graph_button.
function graph_button_Callback(hObject, eventdata, handles)
% hObject    handle to graph_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    num = str2double(get( handles.num_graph, 'String' ) );

    global training_mean;
    global training_std;
    global test_statistic_measures;
    global reject;

    plotGaussians( training_mean, training_std, test_statistic_measures, reject, 1, num, 'Worst regions gaussian distribution' );
    plotGaussians( training_mean, training_std, test_statistic_measures, reject, length(reject)+1, num, 'Gaussian distribution of the worst correct regions' );


function num_graph_Callback(hObject, eventdata, handles)
% hObject    handle to num_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_graph as text
%        str2double(get(hObject,'String')) returns contents of num_graph as a double




% --- Executes during object creation, after setting all properties.
function num_graph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
