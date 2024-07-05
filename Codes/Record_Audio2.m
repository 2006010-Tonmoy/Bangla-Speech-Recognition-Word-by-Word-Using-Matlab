clc;
clear all;
close all;


% Set parameters
duration = 2;           % Duration of each recording in seconds
num_recordings = 5;     % Number of recordings
ftime=5;
folder_name = 'D:\2006031ss'; % Specify the D drive in the path, Change your_name to your Name and last 2 digit of your id.
fs=44100;
% Create folder if it doesn't exist
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
end

% Record and save audio
%fprintf('Get ready for 25 recordings.\n');

%recording for bame
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "Bangladesh".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 3:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end
folder_BUET = 'D:\recordings_your_name_last_2_digit_of_id/BUET';
if ~exist(folder_BUET, 'dir')
    mkdir(folder_BUET);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = zeros(ftime*fs,2);
    temp=getaudiodata(recorder);
    audio_data(1:length(temp),1) = temp(:,1);
    audio_data(1:length(temp),2) = temp(:,2);

    % Save audio to a WAV file
    filename = fullfile(folder_BUET, sprintf('BUET_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for KUET
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "Prokowshol".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 3:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_KUET = 'D:\recordings_your_name_last_2_digit_of_id/KUET';
if ~exist(folder_KUET, 'dir')
    mkdir(folder_KUET);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    
    audio_data = zeros(ftime*fs,2);
    temp=getaudiodata(recorder);
    audio_data(1:length(temp),1) = temp(:,1);
    audio_data(1:length(temp),2) = temp(:,2);

    % Save audio to a WAV file
    filename = fullfile(folder_KUET, sprintf('KUET_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for CUET
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "Buet".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 3:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_CUET = 'D:\recordings_your_name_last_2_digit_of_id/CUET';
if ~exist(folder_CUET, 'dir')
    mkdir(folder_CUET);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = zeros(ftime*fs,2);
    temp=getaudiodata(recorder);
    audio_data(1:length(temp),1) = temp(:,1);
    audio_data(1:length(temp),2) = temp(:,2);

    % Save audio to a WAV file
    filename = fullfile(folder_CUET, sprintf('CUET_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for RUET
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "cafeteria".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown =3:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_RUET = 'D:\recordings_your_name_last_2_digit_of_id/RUET';
if ~exist(folder_RUET, 'dir')
    mkdir(folder_RUET);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = zeros(ftime*fs,2);
    temp=getaudiodata(recorder);
    audio_data(1:length(temp),1) = temp(:,1);
    audio_data(1:length(temp),2) = temp(:,2);

    % Save audio to a WAV file
    filename = fullfile(folder_RUET, sprintf('RUET_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

%recording for DUET
fprintf('Please record 5 recordings.\n');
fprintf('Get ready to say "Nazrul".\n');
%fprintf('Wait until the code stops. When the record ends there will be a message for you.\n');
    % Display countdown timer
    fprintf('Recording will start in:\n');
    for countdown = 3:-1:1
        fprintf('%d...\n', countdown);
        pause(1);
    end

folder_DUET = 'D:\recordings_your_name_last_2_digit_of_id/DUET';
if ~exist(folder_DUET, 'dir')
    mkdir(folder_DUET);
end

for i = 1:num_recordings
    % Create recorder object
    recorder = audiorecorder(44100, 16, 2);

    fprintf('Recording %d of %d...\n', i, num_recordings);

    % Record audio
    recordblocking(recorder, duration);

    % Get audio data
    audio_data = zeros(ftime*fs,2);
    temp=getaudiodata(recorder);
    audio_data(1:length(temp),1) = temp(:,1);
    audio_data(1:length(temp),2) = temp(:,2);

    % Save audio to a WAV file
    filename = fullfile(folder_DUET, sprintf('DUET_%d.wav', i));
    audiowrite(filename, audio_data, recorder.SampleRate);

    %fprintf('Audio saved as %s\n', filename);
end

fprintf('Thanks for your co-operation');