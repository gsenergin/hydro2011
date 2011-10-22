function varargout = ScadaGUI(varargin)
% SCADAGUI M-file for ScadaGUI.fig
%      SCADAGUI, by itself, creates a new SCADAGUI or raises the existing
%      singleton*.
%
%      H = SCADAGUI returns the handle to a new SCADAGUI or the handle to
%      the existing singleton*.
%
%      SCADAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCADAGUI.M with the given input arguments.
%
%      SCADAGUI('Property','Value',...) creates a new SCADAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ScadaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ScadaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ScadaGUI

% Last Modified by GUIDE v2.5 22-Oct-2011 11:45:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ScadaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ScadaGUI_OutputFcn, ...
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


% --- Executes just before ScadaGUI is made visible.
function ScadaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ScadaGUI (see VARARGIN)

% Choose default command line output for ScadaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ScadaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ScadaGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function wReferencia_Callback(hObject, eventdata, handles)
% hObject    handle to wReferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wReferencia as text
%        str2double(get(hObject,'String')) returns contents of wReferencia as a double


% --- Executes during object creation, after setting all properties.
function wReferencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wReferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pReferencia_Callback(hObject, eventdata, handles)
% hObject    handle to pReferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pReferencia as text
%        str2double(get(hObject,'String')) returns contents of pReferencia as a double


% --- Executes during object creation, after setting all properties.
function pReferencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pReferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function consumo_Callback(hObject, eventdata, handles)
% hObject    handle to consumo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of consumo as text
%        str2double(get(hObject,'String')) returns contents of consumo as a double


% --- Executes during object creation, after setting all properties.
function consumo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to consumo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function potencia_Callback(hObject, eventdata, handles)
% hObject    handle to potencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of potencia as text
%        str2double(get(hObject,'String')) returns contents of potencia as a double


% --- Executes during object creation, after setting all properties.
function potencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to potencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tension_Callback(hObject, eventdata, handles)
% hObject    handle to tension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tension as text
%        str2double(get(hObject,'String')) returns contents of tension as a double


% --- Executes during object creation, after setting all properties.
function tension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frecuencia_Callback(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frecuencia as text
%        str2double(get(hObject,'String')) returns contents of frecuencia as a double


% --- Executes during object creation, after setting all properties.
function frecuencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frecuencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in listaVar.
function listaVar_Callback(hObject, eventdata, handles)
% hObject    handle to listaVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listaVar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listaVar


% --- Executes during object creation, after setting all properties.
function listaVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listaVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function varToPlot_Callback(hObject, eventdata, handles)
% hObject    handle to varToPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of varToPlot as text
%        str2double(get(hObject,'String')) returns contents of varToPlot as a double


% --- Executes during object creation, after setting all properties.
function varToPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to varToPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on ejecutar and none of its controls.
function ejecutar_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ejecutar (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


%-------------------FUNCIONES-------------------

% --- Executes on button press in ejecutar.
function ejecutar_Callback(hObject, eventdata, handles)
% hObject    handle to ejecutar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% W Referencia
wRef = get(handles.wReferencia,'String');%str2double(temp);
% P Referencia
pRef = get(handles.pReferencia,'String');
% Consumo
consumo = get(handles.consumo,'String');
% Potencia
potencia = get(handles.potencia,'String');
% Tension
tension = get(handles.tension,'String');
% Frecuencia
frecuencia = get(handles.frecuencia,'String');

% SIMULAR
ParametrosGenerador = ['[',potencia,' ',tension,' ',frecuencia,']'];

find_system('Name','ModeloTurbinaGovernorPID');
open_system('ModeloTurbinaGovernorPID');
%load_system('ModeloTurbinaGovernorPID');

set_param('ModeloTurbinaGovernorPID/velocidadRef','Value',wRef);
set_param('ModeloTurbinaGovernorPID/potenciaMecRef','Value',pRef);
set_param('ModeloTurbinaGovernorPID/redConsumo','Voltage',consumo);
set_param('ModeloTurbinaGovernorPID/generador','NominalParameters',ParametrosGenerador);
set_param(gcs,'SimulationCommand','Start');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param(gcs,'SimulationCommand','Stop');
%close_system('ModeloTurbinaGovernorPID', 1);
%varsToFind = ['who(','corrienteEstator,','potenciaMecRotor,','string,','tensionVaIn,','tensionVaOut,','velocidadRotor)'];
%varsToFind='who';
vars = evalin('base','who(''corrienteEstator'',''potenciaMecRotor'',''tensionVaIn'',''tensionVaOut'',''velocidadRotor'')');
%vars = who('corrienteEstator','potenciaMecRotor','tensionVaIn','tensionVaOut','velocidadRotor');
set(handles.listaVar,'String',vars);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
listaVariables = get(handles.listaVar,'String');
index = get(handles.listaVar,'Value');
nameVarToPlot = listaVariables{index(1)};
varToPlot = evalin('base',nameVarToPlot);
if strcmp(nameVarToPlot,'velocidadRotor') < 1 
    plot(handles.axes1,varToPlot.signals.values);
else
    plot(handles.axes1,varToPlot);
end
