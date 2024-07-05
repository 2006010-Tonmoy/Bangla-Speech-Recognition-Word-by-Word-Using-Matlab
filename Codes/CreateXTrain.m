function [XTrain] = CreateXTrain(adsTrain, afe2, params)

reduceDataset = params(1);
numHops = params(2); 
%numBands1 = params(3);
numBands2 = params(3);
segmentSamples = params(4);
numBands = numBands2;
%%
% In this example, you post-process the auditory
% spectrogram by applying a logarithm. Taking a log of small numbers can
% lead to roundoff error.
%

%%
% To speed up processing, you can distribute the feature extraction across
% multiple workers using |parfor|. 
%
% First, determine the number of partitions for the dataset. If you do not
% have Parallel Computing Toolbox(TM), use a single partition.
if ~isempty(ver('parallel')) && ~reduceDataset
    pool = gcp;
    numPar = numpartitions(adsTrain,pool);
else
    numPar = 1;
end

%%
% For each partition, read from the datastore, zero-pad the signal, and
% then extract the features.

parfor ii = 1:numPar
    subds = partition(adsTrain,numPar,ii);
    XTrain = zeros(numHops,numBands,2,numel(subds.Files)); %1=2
    for idx = 1:numel(subds.Files)
        x = read(subds);
        xPadded = [zeros(floor((segmentSamples-size(x,1))/2),1);
                   x;
                   zeros(ceil((segmentSamples-size(x,1))/2),1)];  %1==2
         %XTrain(:,:,:,idx) = extract(afe1,xPadded); 
         %features1 = extract(afe1,xPadded);
         features2 = extract(afe2,xPadded);
         %features = cat(2,features1,features2);
         features = features2;
         XTrain(:,:,:,idx) = features;
    end
    XTrainC{ii} = XTrain;
end

%%
% Convert the output to a 4-dimensional array with auditory spectrograms
% along the fourth dimension.

XTrain = cat(4,XTrainC{:});

%%
% Scale the features by the window power and then take the log. To obtain
% data with a smoother distribution, take the logarithm of the spectrograms
% using a small offset.

epsil = 1e-6;
XTrain = log10(XTrain + epsil);
end

