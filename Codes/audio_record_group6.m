clc;
clear all;
close all;


% Set parameters
duration = 3;           % Duration of each recording in seconds
num_recordings = 5;     % Number of recordings

% Specify the D drive in the path, Change your_name to your Name and last 2
% digit of your id. example tonmoy10
folder_name = 'E:\BUET_CDI\31\312\project\10'; 

% Create folder if it doesn't exist
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
end

% Record and save audio
%fprintf('Get ready for 25 recordings.\n');

%recording for bame
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "bame".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 6:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end
folder_bame = 'D:\recordings_your_name_last_2_digit_of_id/bame';
if ~exist(folder_bame, 'dir')
    mkdir(folder_bame);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = getaudiodata(recorder);

    % Save audio to a WAV file
    filename = fullfile(folder_bame, sprintf('bame_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for dane
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "dane".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 6:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_dane = 'D:\recordings_your_name_last_2_digit_of_id/dane';
if ~exist(folder_dane, 'dir')
    mkdir(folder_dane);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = getaudiodata(recorder);

    % Save audio to a WAV file
    filename = fullfile(folder_dane, sprintf('dane_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for pichone
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "pichone".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 6:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_pichone = 'D:\recordings_your_name_last_2_digit_of_id/pichone';
if ~exist(folder_pichone, 'dir')
    mkdir(folder_pichone);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = getaudiodata(recorder);

    % Save audio to a WAV file
    filename = fullfile(folder_pichone, sprintf('pichone_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for shamne
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "shamne".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 6:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_shamne = 'D:\recordings_your_name_last_2_digit_of_id/shamne';
if ~exist(folder_shamne, 'dir')
    mkdir(folder_shamne);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = getaudiodata(recorder);

    % Save audio to a WAV file
    filename = fullfile(folder_shamne, sprintf('shamne_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for thamo
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "thamo".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 6:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_thamo = 'D:\recordings_your_name_last_2_digit_of_id/thamo';
if ~exist(folder_thamo, 'dir')
    mkdir(folder_thamo);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = getaudiodata(recorder);

    % Save audio to a WAV file
    filename = fullfile(folder_thamo, sprintf('thamo_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

fprintf('Thanks for your co-operation');