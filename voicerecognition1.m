%% Project: Voice Recognition and Identification system

%--------------------------------------------------------------------------

%% Main Function Voice Recognition
function []=voicerecognition()
% For clear screen
clc;
% r is a variable used to directly set the minimum distance for
% speech recognition.
r=10;
% users is a variable used to directly set the maximum number of
% users stored in database
users=8;
% st, st1, st2, st3,  will be used for filenames related purposes reducing
% code redundancy.
char st; char st1; char st2; char st3;
disp('Project: Voice Recognition and Identification system');
disp('By Lakshya Sharma,Khaimchand Sharma,Nitij Agarwal ');
disp(' ');
pause(0.5);
disp('LOADING ');
pause(1);
disp('... ');
pause(1);
disp('... ');
pause(1);
disp('... ');
pause(1);
disp('... ');
msgbox(' !!!','Voice Recognition and Identification System');
msgbox('band of brothers');

% Preallocating array
str = {8}; fstr = {8}; nbtr = {8};
ste = {8}; fste = {8}; nbte = {8};
ctr = {8}; dtr={8};
cte = {8}; dte={8};
data = {users,4};
code = {8};

for i = 1:8

    % Read audio data from train folder for performing operations
    st=strcat('train\s',num2str(i),'.wav');
    [s1 fs1 nb1]=wavread(st);
    str{i} = s1; fstr{i} = fs1; nbtr{i} = nb1;

    % Read audio data from test folder for performing operations
    st = strcat('test\s',num2str(i),'.wav');
    [st1 fst1 nbt1] = wavread(st);
    ste{i} = st1; fste{i} = fst1; nbte{i} = nbt1;

end

% For making Choice
ch=0;
poss=11;
while ch~=poss

    ch=menu('Speaker Recognition System','1: Human speaker recognition',...
        '2: Technical data of samples',...
        '3: Power Spectrum','4: Power Spectrum with different M and N',...
        '5: Mel-Spaced Filter Bank');
    disp('                                                                  ');
    %----------------------------------------------------------------------

%% 1: Human speaker recognition
   

    if ch==1
        disp('>  1: Human speaker recognition');
        disp('Play each sound file in the TRAIN folder.');
        disp('Can you distinguish the voices of those eight speakers?');
        disp('Now play each sound in the TEST folder in a random order without looking at the file name ');
        disp('and try to identify the speaker using your knowledge of their voices that you have just heard,');
        disp('from the TRAIN folder. This is exactly what the computer will do in our system.');
        disp('                                                                                                  ');
        disp('                                                                                                   ');
        disp('All of us seem to be unable to recognise random people just by listening to their voice. ');
        disp('We also realize that we do not identify speakers by the frequencies with which they use to talk,  ');
        disp('but rather by other characteristics, like accent, speed, etc.');
        pause(1);

        ch2=0;
        while ch2~=4
            ch2=menu('Select Folder','Train','Test','User','Exit');

            if ch2==1

                ch3=0;
                while ch3~=9
                    ch3=menu('Train :','Signal 1','Signal 2','Signal 3',...
                        'Signal 4','Signal 5','Signal 6','Signal 7','Signal 8','Exit');
                    if ch3~=9
                        p=audioplayer(str{ch3},fstr{ch3},nbtr{ch3});
                        play(p);
                    end
                end
            end

            if ch2==2

                ch3=0;
                while ch3~=9
                    ch3=menu('Test :','Signal 1','Signal 2','Signal 3',...
                        'Signal 4','Signal 5','Signal 6','Signal 7','Signal 8','Exit');
                    if ch3~=9
                        p=audioplayer(ste{ch3},fste{ch3},nbte{ch3});
                        play(p);
                    end
                end
                close all;
            end

            if ch2==3

                if (exist('sound_database.dat','file')==2)
                    load('sound_database.dat','-mat');

                    ch32=0;
                    while ch32 ~=2
                        ch32=menu('Database Information','Database','Exit');

                        if ch32==1
                            st=strcat('Sound Database has : #',num2str(sound_number),'words. Enter a database number : #');
                            prompt = {st};
                            dlg_title = 'Database Information';
                            num_lines = 1;
                            def = {'1'};
                            options.Resize='on';
                            options.WindowStyle='normal';
                            options.Interpreter='tex';
                            an = inputdlg(prompt,dlg_title,num_lines,def);
                            an=cell2mat(an);
                            a = str2double(an);

                            if (isempty(an))

                            else

                                if (a <= sound_number)
                                    st=strcat('u',num2str(an));
                                    [s fs nb]=wavread(st);
                                    p=audioplayer(s,fs,nb);
                                    play(p);

                                else
                                    warndlg('Invalid Word ','Warning');
                                end
                            end
                        end
                        close all;
                    end

                else
                    warndlg('Database is empty.',' Warning ')
                end
            end

        end
    end

