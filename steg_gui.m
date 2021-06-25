function varargout = steg_gui(varargin)
% STEG_GUI MATLAB code for steg_gui.fig
%      STEG_GUI, by itself, creates a new STEG_GUI or raises the existing
%      singleton*.
%
%      H = STEG_GUI returns the handle to a new STEG_GUI or the handle to
%      the existing singleton*.
%
%      STEG_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEG_GUI.M with the given input arguments.
%
%      STEG_GUI('Property','Value',...) creates a new STEG_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before steg_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to steg_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help steg_gui

% Last Modified by GUIDE v2.5 22-Jun-2021 19:22:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @steg_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @steg_gui_OutputFcn, ...
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


% --- Executes just before steg_gui is made visible.
function steg_gui_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to steg_gui (see VARARGIN)

% Choose default command line output for steg_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes steg_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = steg_gui_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,          'visible','on');
set(handles.uipanel3,         'visible','off' );
set(handles.uipanel6,         'visible','off' );
set(handles.uipanel9,         'visible','off' );

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,          'visible','off');
set(handles.uipanel3,         'visible','on' );
set(handles.uipanel6,         'visible','off' );
set(handles.uipanel9,         'visible','off' );
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,          'visible','off');
set(handles.uipanel3,         'visible','off' );
set(handles.uipanel6,         'visible','on' );
set(handles.uipanel9,         'visible','off' );
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(~, ~, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,          'visible','off');
set(handles.uipanel3,         'visible','off' );
set(handles.uipanel6,         'visible','of' );
set(handles.uipanel9,         'visible','on' );

% --- Executes on button press in pushbutton21.
function patient_file_Callback(hObject, ~, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename,Pathname] = uigetfile('*.txt','Select Text File');
if isequal(Filename,0)
   disp('User selected Cancel')
else
       handles.filename_txt=fullfile(Pathname,Filename);
       set(handles.text_path,'String',handles.filename_txt);
       handles.text = fileread(handles.filename_txt);
       disp(handles.text)
    
        fr = fileread(handles.filename_txt);  % fileread 
        handles.filesize = numel(fr); %  count characters 
        set(handles.text_size,'String',num2str(handles.filesize));
  
        guidata(hObject,handles);

end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, ~, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

        textLabel = sprintf('Generating....');
        set(handles.textLabel, 'String', textLabel); 
        pause(0.4);
%----------------------Random 64 char key generation(key)------------------
        key = [dec2hex(floor(rand*2^96),24),dec2hex(floor(rand*2^96),24),dec2hex(floor(rand*2^64),16)];
                guidata(hObject,handles);
        save key key;
        handles.keysize = numel(key);
        guidata(hObject,handles);
%-------------------To display key in encode part (1st panel)--------------
        key_text = sprintf('%s', key);
        set(handles.key_text, 'String', key_text);
%--------------------------To get same key in decode part------------------
        key_decode = sprintf('%s', key);
        set(handles.key_decode, 'String', key_decode);
        
        textLabel = sprintf('key Generated....');
        set(handles.textLabel, 'String', textLabel);

% --- Executes on button press in Encode.
function Encode_Callback(~, ~, handles)
% hObject    handle to Encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%status.String = 'Starting...';
        textLabel = sprintf('Starting...');
        set(handles.textLabel, 'String', textLabel);
        
        pause(0.5);
        
         % status.String='Message to short';
        if handles.filesize<33
            handles.textLabel = sprintf('Message to short');
            %set(textLabel2, 'String', textLabel);
            return;
        end
        
        if handles.keysize < 64
           %status.String='Key wrong';
           handles.textLabel = sprintf('Key wrong');
           %set(handles.textLabel, 'String', textLabel);
           return;
        end
        
        patientDetailsToCrypt = fopen(handles.filename_txt,'r');
        RawData = fscanf(patientDetailsToCrypt, '%s');
        
        key_256 = get(handles.key_text,'String');
      
    Encode_path = Crypt(RawData,key_256);
    set(handles.Encode_path, 'String', Encode_path);
     encrypted_data=get(handles.Encode_path, 'string');
     encrypt_file = fopen('encrypted_msg.txt','w');
     fprintf(encrypt_file,encrypted_data);
     fclose(encrypt_file);
    waitfor(msgbox('Select path to save'));
    [file,~,~] = uiputfile('encrypted-msg.txt');
        if isequal(file,0)
            disp('User selected Cancel')
        else

          textLabel = sprintf('Encryption Done');
          set(handles.textLabel, 'String', textLabel);
        end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(~, ~, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_path,'String','');
set(handles.text_size,'String','');
set(handles.key_text,'String','');
set(handles.Encode_path,'String','');


% --- Executes on selection change in Encode_path.
function Encode_path_Callback(~, ~, ~)
% hObject    handle to Encode_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Encode_path contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Encode_path


% --- Executes during object creation, after setting all properties.
function Encode_path_CreateFcn(hObject, ~, ~)
% hObject    handle to Encode_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in validation.
function validation_Callback(~, ~, handles)
% hObject    handle to validation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%guidata(hObject, handles);
 histmod = handles.histmod;
 %Z=Z(:,:,3);
 out=handles.out;
 [r, c]=size(out);
 
MSE = sqrt(sum(sum((histmod - out).^2))/(r * c));
set(handles.text12,'string',MSE);
%%%%%%%%%%%%%%%%%%PSNR%%%%%%%%%%%
 PSNR = 10*log10((255*255)/MSE);
set(handles.text14,'string',PSNR);

% --- Executes on button press in clear_all.
function clear_all_Callback(~, ~, handles)
% hObject    handle to clear_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=ones([500 500]);
axes(handles.axes1);
imshow(a);

axes(handles.axes2);
imshow(a);

set(handles.text12,'string','');
set(handles.text14,'string','');


% --- Executes on button press in secret_key.
function secret_key_Callback(hObject, ~, handles)
% hObject    handle to secret_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
keygener=zeros(8,8);
key=[0 0 1 0 ;0 0 1 1 ;0 1 0 1; 0 1 1 1; 1 0 0 0; 1 0 1 0; 1 1 0 1; 1 0 1 1];
key1=[0 0 1 0 0 0 1 0 ;0 0 1 1 0 0 1 1 ;0 1 0 1 0 1 0 1; 0 1 1 1 0 1 1 1];
keygener(1:8,5:8)=key;
keygener(5:8,1:8)=key1;
orig_key=keygener;
save orig_key orig_key;
handles.orig_key=orig_key;
guidata(hObject, handles);
helpdlg('Secret key generated');

% --- Executes on button press in text_embed.
function text_embed_Callback(hObject, ~, handles)
% hObject    handle to text_embed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y=handles.Y;
orig_key=handles.orig_key;
[file, path]=uigetfile('*.txt','choose txt file');
if isequal(file,0) || isequal(path,0)
    warndlg('User Pressed Cancel');
else
    data1=fopen(file,'r');
    F=fread(data1);
    fclose(data1);
end
len=length(F);
count=1;
totalbits=8*len;
save totalbits totalbits;
a=128;
k=1;
[r, c]=size(Y);
for i=1:8:r-7
    for j=1:8:c-7
        block3=Y(i:i+7,j:j+7);
        for ii=1:8
            for jj=1:8
                if orig_key(ii,jj)==1
                    coeff=abs(block3(ii,jj));
                    [ block3(ii,jj),a,k,count]=bitlength(coeff,a,k,F,totalbits,count,len);
                    if count>totalbits
                        break;
                    end
                end
                if count>totalbits
                    break;
                end
            end
            if count>totalbits
                break;
            end
        end
        Y(i:i+7,j:j+7)=block3;
        Y=abs(Y);
        if count>totalbits
            break;
        end
    end
    if count>totalbits
        break;
    end
end
outpu_t=Y;
handles.outpu_t=outpu_t;
handles.totalbits=totalbits;
guidata(hObject, handles);
helpdlg('Process completed');

% --- Executes on button press in inv_transform.
function inv_transform_Callback(hObject, ~, handles)
% hObject    handle to inv_transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
Z=handles.Z;
outpu_t=handles.outpu_t;
%totalbits=handles.totalbits;

embededimage=outpu_t;
%embededimage=handles.embededimage;
[r, c]=size(embededimage);
m=1;
n=1;
for i=1:8:r-7
    for j=1:8:c-7
        bloc_k11=embededimage(i:i+7,j:j+7);
        LL=bloc_k11(m:m+3,n:n+3);
        LH=bloc_k11(m:m+3,n+4:n+7);
        HL=bloc_k11(m+4:m+7,n:n+3);
        HH=bloc_k11(m+4:m+7,n+4:n+7);
        Z(i:i+7,j:j+7)=reversedwt(LL,LH,HL,HH);
        out=Z;
    end
end


axes(handles.axes2);
imshow(out,[]);
save out out;
handles.out=out;
guidata(hObject, handles);
helpdlg('Inverse Transformation completed');
helpdlg('Output Image is obtained');


% --- Executes on button press in sel_image.
function sel_image_Callback(hObject, ~, handles)
% hObject    handle to sel_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.png;*.bmp;*.jpg','Pick an Image File');
if isequal(file,0) || isequal(path,0)
    warndlg('User Pressed Cancel');
else
    Z = imread(file);
    Z=imresize(Z,[256 256]);
[~, ~, p]=size(Z);
if p==3
    axes(handles.axes1);
    imshow(Z);
    %r=Z(:,:,1);
    %g=Z(:,:,2);
    b=Z(:,:,3);
    handles.b=b;
    handles.Z=Z;
    F=Z;
    handles.F=F;
    guidata(hObject, handles);
    helpdlg('input image is selected');
else
 warndlg('please select colour image');
end
end

% --- Executes on button press in histogram.
function histogram_Callback(hObject, ~, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
minvalue=15;
maxvalue=240;
b=handles.b;
[r, c]=size(b);
for i=1:r
    for j=1:c
        if b(i,j)<=minvalue
            b(i,j)=minvalue;
        elseif b(i,j)>=maxvalue
            b(i,j)=maxvalue;
        end
    end
end
histmod=b;
figure(11);
imshow(histmod);
handles.histmod=histmod;
guidata(hObject, handles);
helpdlg('histogram modification done');

% --- Executes on button press in int_transform.
function int_transform_Callback(hObject, ~, handles)
% hObject    handle to int_transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%----------------------------dividing the image into 8x8 block and IWT--------------------------------------%

histmod=handles.histmod;
[r ,c]=size(histmod);
for i=1:8:r-7
    for j=1:8:c-7
        bloc_k=histmod(i:i+7,j:j+7);
        %------------Apply Haar wavelet transform to the block to form subbands------------------------
        Y(i:i+7,j:j+7)=forward_lift(bloc_k);
    end
end
axes(handles.axes2);
imshow(Y,[]);
handles.Y=Y;
guidata(hObject, handles);
helpdlg('Transformation completed');



% --- Executes on button press in extract.
function extract_Callback(~, ~, ~)
% hObject    handle to extract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=load('YY');
YY=data.YY;
data=load('orig_key');
orig_key=data.orig_key;
data=load('totalbits');
totalbits=data.totalbits;
%load YY
%totalbits=handles.totalbits;
%orig_key=handles.orig_key;
fil_e=YY;
%totalbits=8*len;
a=128;
jjj=1;
count=1;
k=0;
[r, c]=size(YY);
for i=1:8:r-7
    for j=1:8:c-7
        block9=fil_e(i:i+7,j:j+7);
        for ii=1:8
            for jj=1:8
                if orig_key(ii,jj)==1
                    coeff=abs(block9(ii,jj));
                    %[ k,a,count,jjj,ff]=extrac_t(coeff,a,k,jjj,totalbits,count);
                    g=coeff;
                    if g>=64
                        bits=6;

                        h=32;
                    elseif g<64 && g>=32
                        bits=5;

                        h=16;
                    elseif g<32 && g>=16
                        bits=4;

                        h=8;
                    elseif g<16
                        bits=3;
                        h=4;
                    end
                    l=bits;
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    for iii=1:l
                        if bitand(g,h)==h
                            k= bitor(k,a);
                        end
                        count=count+1;
                        a=a/2;
                        h=h/2;
                        if a<1
                            R(jjj)=k;
                            fid=fopen('output.txt','wb');
                            fwrite(fid,char(R),'char');
                            fclose(fid);jjj=jjj+1;
                            k=0;
                            a=128;
                        end
                        if count>totalbits
                            break;
                        end
                    end
                    if count>totalbits
                        break;
                    end
                end
                if count>totalbits
                    break;
                end
            end
            if count>totalbits
                break;
            end
        end
        if count>totalbits
            break;
        end
    end
    if count>totalbits
        break;
    end
end
helpdlg('Secret data was obtained in text file');

% --- Executes on button press in output.
function output_Callback(~, ~, ~)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('output.txt');


% --- Executes on button press in stego_img.
function stego_img_Callback(~, ~, handles)
% hObject    handle to stego_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=load('out.mat');
out=data.out;
     [filename, pathname] = uigetfile('*.mat', 'Pick an M-file');
     if isequal(filename,0) || isequal(pathname,0)
        disp('User pressed cancel');        
     end
      axes(handles.axes5);
imshow(out,[]);
%load out
%     [filename, pathname] = uigetfile('*.mat', 'Pick an M-file');
%     if isequal(filename,0) || isequal(pathname,0)
%        disp('User pressed cancel')
%     else
%         
%     end
imshow(out,[]);



% --- Executes on button press in transform.
function transform_Callback(~, ~, ~)
% hObject    handle to transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=load('out');
out=data.out;
extractinpu_t=out;
[r, c]=size(extractinpu_t);
for i=1:8:r-7
    for j=1:8:c-7
        bloc_kextract=extractinpu_t(i:i+7,j:j+7);
        YY(i:i+7,j:j+7)=forward_lift(bloc_kextract);
    end
end
save YY YY
helpdlg('Transformation completed');


% --- Executes on selection change in Decode_path.
function Decode_path_Callback(~, ~, ~)
% hObject    handle to Decode_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Decode_path contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Decode_path


% --- Executes during object creation, after setting all properties.
function Decode_path_CreateFcn(hObject, ~, ~)
% hObject    handle to Decode_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, ~, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename2,Pathname2] = uigetfile('*.txt','Select Text File');
if isequal(Filename2,0)
   disp('User selected Cancel')
else
       handles.filename_txt2=fullfile(Pathname2,Filename2);
       set(handles.text_path2,'String',handles.filename_txt2);
       handles.text2 = fileread(handles.filename_txt2);
       disp(handles.text2)
    
        fr2 = fileread(handles.filename_txt2);  % fileread 
        handles.filesize2 = numel(fr2); %  count characters 
        set(handles.text_size2,'String',num2str(handles.filesize2));
  
        guidata(hObject,handles);

end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(~, ~, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 textLabel = sprintf('Starting...');
        set(handles.textLabel, 'String', textLabel);
        
        pause(0.5);
        
         % status.String='Message to short';
        if handles.filesize2<65
            handles.textLabel = sprintf('Encode to short');
            %set(textLabel2, 'String', textLabel);
            return;
        end
        
%         if handles.keysize < 64
%            %status.String='Key wrong';
%            handles.textLabel = sprintf('Key wrong');
%            %set(handles.textLabel, 'String', textLabel);
%            return;
%         end
        
        patientDetailsToDecrypt = fopen(handles.filename_txt2,'r');
        RawData = fscanf(patientDetailsToDecrypt, '%s');
        data=load('key');
         
        key_256 = data.key;
       
    Decode_path = Decrypt(key_256, RawData);
    set(handles.Decode_path, 'String', Decode_path);
     decrypted_data=get(handles.Decode_path, 'string');
     decrypt_file = fopen('decrypted_msg.txt','w');
     fprintf(decrypt_file,decrypted_data);
     fclose(decrypt_file);
    waitfor(msgbox('Select path to save'));
    [file,~,~] = uiputfile('decrypted-msg.txt');
        if isequal(file,0)
            disp('User selected Cancel')
        else

          textLabel = sprintf('Decryption Done');
          set(handles.textLabel, 'String', textLabel);
        end




% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(~, ~, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_path2,'String','');
set(handles.text_size2,'String','');
set(handles.Decode_path,'String','');

