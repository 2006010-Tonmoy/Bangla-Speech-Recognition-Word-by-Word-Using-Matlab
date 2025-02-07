%% Loading the data
%Set the current matlab directory to 'Dataset' folder


%name of all the folder
dataFolders = {'L1'};  %'bame','dane','pichone','shamne','thamo' {'L1','L2','L3','L4','L5'}


%Loading all the original data file location in workspace
for i=1:length(dataFolders)
    ADS{i} = audioDatastore(sprintf('Dataset/%s',dataFolders{i}),...
    'FileExtensions','.wav','IncludeSubfolders',true,....
     'LabelSource', 'foldernames');
end
fs=44100;
duration=5;
desiredLength=duration*fs;
 
 %% Batch Augmentation
aug = audioDataAugmenter('AugmentationParameterSource','random', ...
    "AugmentationMode","sequential", ...
    "NumAugmentations",10, ...
    ...
    "PitchShiftProbability",1.0, ...
    "SemitoneShiftRange", [-2 2],  ...
    ...
    "TimeShiftProbability",1.0, ...
    "TimeShiftRange", [-0.5,0.5], ...%In sec
    ...
     "AddNoiseProbability",0.1, ...   %.2=.1
     "SNRRange", [0 0.05]); 



  

%11
    
%     "TimeStretchProbability",1.0, ...
%     "SpeedupFactorRange", [0.6,1.4], ...
    %...
    %"VolumeControlProbability",1.0, ...
    %"VolumeGainRange",[1,3], ...

    
    
    
 
 
 %Augmentation for each command
 for i=1:length(dataFolders)
     
     %Creating folder for augmented data
     dataFolder = strcat(dataFolders{i},'_aug');
     if ~exist(dataFolder,'dir')
        mkdir(sprintf('../Dataset/%s',dataFolder));
     end
     
     ads = ADS{i};
     while hasdata(ads)
        [audioIn,info] = read(ads);

        data = augment(aug,audioIn,info.SampleRate);

        [~,fn] = fileparts(info.FileName);
        for j = 1:size(data,1)
            augmentedAudio = data.Audio{j};

            % If augmentation caused an audio signal to have values outside of -1 and 1, 
            % normalize the audio signal to avoid clipping when writing.
            if max(abs(augmentedAudio),[],'all')>1
                augmentedAudio = augmentedAudio/max(abs(augmentedAudio),[],'all');
            end
            if length(augmentedAudio) >= desiredLength
        % If the augmented audio is longer, truncate
        augmentedAudio = augmentedAudio(1:desiredLength);
           
            else 
        % If the augmented audio is shorter, pad with zeros
        temp=zeros(desiredLength,2);
        temp(1:length(augmentedAudio))=augmentedAudio(1:length(augmentedAudio));
        augmentedAudio=temp;
%         augmentedAudio((length(augmentedAudio)+1):desiredLength) = 0;
           end
            audiowrite(sprintf('../Dataset/%s_aug/%s_aug%d.wav',...
                dataFolders{i},fn,j),...
                augmentedAudio, info.SampleRate)
            
        end
            
     end
 end


