function features = MyhelperExtractAuditoryFeatures(x,fs)

[afe2, afe_params] = DeclareAFE();

segmentSamples = afe_params(1);
frameSamples = afe_params(2);
hopSamples = afe_params(3);
overlapSamples = afe_params(4);


numSamples = size(x,1);
xPadded = [zeros(floor((segmentSamples - size(x,1))/2),1);
           x;
           zeros(ceil((segmentSamples-size(x,1))/2),1)];

%features1 = extract(afe1,xPadded);
features2 = extract(afe2,xPadded);
features = features2;
[numHops,numFeatures] = size(features);

% Determine the denormalization factor to apply.
epsil = 1e-6;

% Take the log. 
features = log10(features + epsil);