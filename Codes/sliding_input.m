%% sliding input
clc;
clear all;
load('trained_net_male_dataset_25_July.mat');

fs = 48000;
nBits = 8;
NumChannels = 1;
device_ID = -1;

delay = 50 ;% in miliseconds
window_time = 2; %displayed data length in seconds

audio = zeros(1,window_time*fs);

%
command = 'none';
i = 1;
figure(55);
% set(gca,'visible','off');
memory = zeros(1,ceil(0.75*window_time*1000/delay));      % storing previous outcomes to neglect false detections
tol = 0.7; 
% percentage of the memory to be a particular command to be sure
while i <=  100
    tic
    recObj = audiorecorder(fs,nBits,NumChannels,device_ID);
    recordblocking(recObj,delay/1000);
    audiotemp = getaudiodata(recObj);
    audio = circshift(audio,-delay/1000*fs);
    audio = [audio(1:window_time*fs - delay/1000*fs) audiotemp'];
    plot(audio);
    title(command);
    axis([0 window_time*fs -1 1]);
    auditorySpect = MyhelperExtractAuditoryFeatures(audio',fs);
    size(auditorySpect);
    auditorySpect_cropped = auditorySpect(:,:);
    temp_command = classify(trainedNet,auditorySpect_cropped);
    disp(i);
    time = toc;
    %pause(delay/1000-time);
    i = i+1;
    disp(temp_command);
   %sound(audio,fs);
   %extra layer for false detection
   % 1 for shamne, 2 for pichone, 3 dane, 4 bame, 5 thamo
   memory = circshift(memory,-1);
   memory(end) = temp_command;
    if length(find(memory == memory(end))) > tol*length(memory)
        command = temp_command;
    end
end