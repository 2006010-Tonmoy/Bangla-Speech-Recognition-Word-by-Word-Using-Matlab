%Real time Input

fs = 44100;
nBits = 16;
NumChannels = 2;
device_ID = -1;
thress=0.05;
%RECORD AUDIO

recObj = audiorecorder(fs,nBits,NumChannels,device_ID);
disp('Start speaking.')

recordblocking(recObj,5);
disp('End of Recording');
disp(' ');

x_real = getaudiodata(recObj);

%READ AUDIO

%  x_real = audioread('d.wav');

x_real(:,1)=x_real(:,1)./max(abs(x_real(:,1)));
x_real(:,2)=x_real(:,2)./max(abs(x_real(:,2)));
t=linspace(0,5,length(x_real));
figure(1)
plot(x_real);

%cutting in different lengths
tseg=0.01;
tt=5;
k=0;
avg1=zeros((tt/tseg),1);
for i=1:(tt/tseg)-1
    temp=0;
    
    for j=(i*fs*tseg):((i+1)*fs*tseg)
        temp=abs(x_real(j))+temp;   
    end
    avg=temp/441;    % 441==segment size;
    
    if(avg<thress)
        for k=(i*fs*tseg):((i+1)*fs*tseg)
        % x_real(k,1)=0;
        % x_real(k,2)=0;


        end
        k=k+1;
        avg=0;

    else
        k=0;
    end
    avg1(i)=avg;

end
index=zeros(1,50);
k=0;
c=0;
%temp=[temp1 temp2 temp3];
for i=1:length(avg1)
    y=avg1(i);
    if(y>0)
        c=0;
    end

    if(y==0)
        temp=0;
      
        for j=1:24
            if((i+j)<=500)
            temp=temp+avg1(i+j);
            end
        end
       if(temp==0)
           if(c<1)
            k=k+1;
            index(1,k)=i;
           end
            c=c+1;
           
       end
    else

    end
end

index=index(1:k);
index=index.*(tseg*fs)+12*(tseg*fs);

for i=1:length(index)-1

var_name = strcat('word',num2str(i));

var_value = zeros(3*fs,2);


var_value(1:(index(1,i+1)-index(1,i))+1,1)=x_real(index(1,i):index(1,i+1),1);
var_value(1:(index(1,i+1)-index(1,i))+1,2)=x_real(index(1,i):index(1,i+1),2);

% % NORMALIZATION

var_value_normalized1 = var_value(:,1) / max(abs(var_value(:,1)));
var_value_normalized2 = var_value(:,2) / max(abs(var_value(:,2)));

var_value_normalize=[var_value_normalized1,var_value_normalized2];
var_value = var_value_normalize;
eval([var_name ' = var_value;']);

figure(i+1);
plot(var_value);

auditorySpect = MyhelperExtractAuditoryFeatures(var_value,fs);
command = classify(trainedNet,auditorySpect);

StringsData=string(command);
disp(StringsData);
end




% % FILTER
% % 
% % Define the cutoff frequency (in Hz) for the low-pass filter
% cutoff_frequency = 5000; % Adjust as needed
% 
% % Design the FIR low-pass filter using fir1 function
% order = 100; % Adjust as needed
% lowpass_filter = fir1(order, cutoff_frequency/(fs/2), 'low');
% 
% % Apply the low-pass filter to the audio signal using filter function
% x_filtered = filter(lowpass_filter, 1, x_real);
% 
% x_real = x_filtered;


% % %Filter2
% 
% % Define the size of the local neighborhood for estimating the noise power spectrum
% m = 3; % Number of rows
% n = 3; % Number of columns
% 
% % Apply Wiener filtering
% clean_signal = wiener2(x_real, [m n]);
% x_real = clean_signal;


    