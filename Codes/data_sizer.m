clc
clear all
close all
load handel.mat

%% loading Data and labeling 
cell_train = dataloader_train();
cell_test = dataloader_test();
cell_validation = dataloader_validation();

length_train = size(cell_train);
length_train = length_train(1);

length_test = size(cell_test);
length_test = length_test(1);

length_validation = size(cell_validation);
length_validation = length_validation(1);

%% cropping all audio file in same dimention

for i = 2:length_train
    cell_sized{i,2} = audio_length_crop(cell_train{i,2}, cell_train{i,3}, 2);
    cell_train{i,2} = cell_sized{i,2};
    
end

for i = 2:length_test
    cell_sized{i,2} = audio_length_crop(cell_test{i,2}, cell_test{i,3}, 2);
    cell_test{i,2} = cell_sized{i,2};
end

for i = 2:length_validation
    cell_sized{i,2} = audio_length_crop(cell_validation{i,2}, cell_validation{i,3}, 2);
    cell_validation{i,2} = cell_sized{i,2};
    audiowrite(cell_validation{i,1},cell_validation{i,2},cell_validation{i,3});
end

