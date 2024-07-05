 function [afe2, afe_params] = DeclareAFE()



fs = 44100;         %44100; % Known sample rate of the data set. 48000

segmentDuration = 3;
frameDuration = 0.025;
hopDuration = 0.0050;

segmentSamples = round(segmentDuration*fs);
frameSamples = round(frameDuration*fs);
hopSamples = round(hopDuration*fs);
overlapSamples = frameSamples - hopSamples;

FFTLength = 2048;
numBands1 = 32;   %50 numBands hobe
% numBands2 = 13;   %chilo na
numBands = numBands1;

% afe1 = audioFeatureExtractor( ...
%     'SampleRate',fs, ...
%     'FFTLength',FFTLength, ...
%     'Window',hann(frameSamples,'periodic'), ...
%     'OverlapLength',overlapSamples, ...       
%     'barkSpectrum',true);  %barkSpectrum

afe2 = audioFeatureExtractor( ...
    'SampleRate',fs, ...
    'FFTLength',FFTLength, ...
    'Window',hann(frameSamples,'periodic'), ...
    'OverlapLength',overlapSamples, ...       
    'barkSpectrum',true);  %barkSpectrum, mfcc

%pitch..........................

%setExtractorParams(afe1,"barkSpectrum",'NumBands',numBands1,'WindowNormalization',false);   %barkSpectrum afe1,"barkSpectrum",'NumBands',numBands1,'WindowNormalization',false 
%setExtractorParams(afe2,"mfcc",'numBands',numBands2,'WindowNormalization',false);  %chilo na

%numBands=numBands2+numBands1; %chilo na

afe_params = [segmentSamples,frameSamples,hopSamples,overlapSamples,numBands];
end

