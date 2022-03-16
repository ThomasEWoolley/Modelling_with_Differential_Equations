function varargout = Hysteresis_game(varargin)
% HYSTERESIS_GAME MATLAB code for Hysteresis_game.fig
%      HYSTERESIS_GAME, by itself, creates a new HYSTERESIS_GAME or raises the existing
%      singleton*.
%
%      H = HYSTERESIS_GAME returns the handle to a new HYSTERESIS_GAME or the handle to
%      the existing singleton*.
%
%      HYSTERESIS_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HYSTERESIS_GAME.M with the given input arguments.
%
%      HYSTERESIS_GAME('Property','Value',...) creates a new HYSTERESIS_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hysteresis_game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hysteresis_game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hysteresis_game

% Last Modified by GUIDE v2.5 06-Oct-2017 11:31:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Hysteresis_game_OpeningFcn, ...
    'gui_OutputFcn',  @Hysteresis_game_OutputFcn, ...
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


% --- Executes just before Hysteresis_game is made visible.
function Hysteresis_game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hysteresis_game (see VARARGIN)

% Choose default command line output for Hysteresis_game
clc
handles.output = hObject;
set(handles.E_out_box,'String',num2str(round(get(handles.E_slider,'Value'),2)));
% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
plot([0 100],[0 0],'k')
hold on
plot([0 0],[0 3],'k')
axis([0 100 0 3])
xlabel('Time','Interpreter','LaTex')
ylabel('Population size','Interpreter','LaTex')
hold off

% Find all static text UICONTROLS whose 'Tag' starts with latex_

handles.laxis = axes('parent',hObject,'units','normalized','position',[0 0 1 1],'visible','off');
lbls= findobj(hObject,'-regexp','tag','Latex_*');
% lbls(:,2) = findobj(hObject,'-regexp','tag','bar_bed_text');
for i=1:length(lbls)
    l = lbls(i);
    set(l,'units','normalized');
    s = get(l,'string');
    p = get(l,'position');
    t = get(l,'tag');
    delete(l);
    handles.(t) = text(p(1),p(2),s,'interpreter','latex','horizontalalignment','left','fontsize',11);
end

guidata(hObject, handles);

% UIWAIT makes Hysteresis_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hysteresis_game_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
set(handles.E_slider,'Value',0.8);
set(handles.E_out_box,'String',num2str(round(get(handles.E_slider,'Value'),2)));


t = linspace(0,100,500); % Length of time the equation is solved for.
T=0;
u0=3;
U=u0;
i=2;
E=0.5;
while (u0>0.01)&&(i<=length(t))
    set(handles.E_out_box,'String',num2str(round(get(handles.E_slider,'Value'),2)));
    [tt,u] = ode23(@(t,u)ODE(t,u,get(handles.E_slider,'Value')), [t(i-1),t(i)], u0); % Matlab ODE solver.
    u0=u(end);
    T=[T,tt(end)];
    U=[U,u(end)];
    E=[E,get(handles.E_slider,'Value')];
    axes(handles.axes1)
    plot([0 100],[0 0],'k')
hold on
plot([0 0],[0 3],'k')
axis([0 100 0 3])
xlabel('Time','Interpreter','LaTex')
ylabel('Population size','Interpreter','LaTex')
    plot(T,U,'b')
    drawnow
    hold off
    i=i+1;
end

set(handles.Average_effort_value,'String',num2str(round(mean(E),2)));





% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function E_slider_Callback(hObject, eventdata, handles)
% hObject    handle to E_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.E_out_box,'String',num2str(round(get(handles.E_slider,'Value'),2)));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function E_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function E_out_box_Callback(hObject, eventdata, handles)
% hObject    handle to E_out_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E_out_box as text
%        str2double(get(hObject,'String')) returns contents of E_out_box as a double


% --- Executes during object creation, after setting all properties.
function E_out_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E_out_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% function Multi_stability_game(varargin)
% tspan = linspace(0,100,1e4); % Length of time the equation is solved for.
% T=0;
% u0=4;
% U=u0;
% for i=2:1e4
% [t,u] = ode23(@ODE, [t(i-1),t(i)], u0); % Matlab ODE solver.
% end
% T=[T,t(end)];
% U=[U,u(end)];
% Plotter

function dydt = ODE(t,u,E)
% ODE equation to solve.
dydt = 2*u^2/(1+u^2)-E*u; % The Logistic equation.
