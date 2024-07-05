function [XValidation] = CreateXValidation(adsValidation,afe2,params)

reduceDataset = params(1);
numHops = params(2); 
%numBands1 = params(3);
numBands2 = params(3);
segmentSamples = params(4);
numBands = numBands2;



if ~isempty(ver('parallel'))
    pool = gcp;
    numPar = numpartitions(adsValidation,pool);
else
    numPar = 1;
end
parfor ii = 1:numPar
    subds = partition(adsValidation,numPar,ii);
    XValidation = zeros(numHops,numBands,2,numel(subds.Files));
    for idx = 1:numel(subds.Files)
        x = read(subds);
        xPadded = [zeros(floor((segmentSamples-size(x,1))/2),1);x;zeros(ceil((segmentSamples-size(x,1))/2),1)];
        %XValidation(:,:,:,idx) = extract(afe,xPadded);
         %features1 = extract(afe1,xPadded);
         features2 = extract(afe2,xPadded);
         features = features2;
         XValidation(:,:,:,idx) = features;
    end
    XValidationC{ii} = XValidation;
end
XValidation = cat(4,XValidationC{:});

epsil = 1e-6;
XValidation = log10(XValidation + epsil);

end

