function [SStot,dataseqz]=spectrogram(datatot,M,NFFT,Fs);

% Input:
% datatot is a matrix where we want the spectrogram of each coloumn 
% M is the length of the hanning window
% NFFT number of used Fourier transforms

dataseqz=[];

h=hanning(M); % returns the hanning window (one vector)

[L,maxsyll]=size(datatot); 

NSTEP=4; % ?Sample step to the next frame: to speed up computations we dont calculate the spectrogram at each time point but rather we skip NSTEP ahead 

SStot=zeros(NFFT/2,fix(L/NSTEP),maxsyll); % dim of SStot: #freq(rows)= NFFT/2 

for syllno=1:maxsyll

    data=datatot(:,syllno);

data=data./sqrt(data'*data); %Normalization to total power one


% Initializing for spectrogram computation

mvect=[0:NFFT-1];
if abs(M/2-fix(M/2))<0.1
  data=[zeros(fix(M/2),1);data;zeros(fix(M/2),1)];
else
  data=[zeros(fix((M-1)/2),1);data;zeros(fix((M+1)/2),1)];
end
datal=length(data(:,1));


SS=zeros(NFFT/2,length([0:NSTEP:datal-M-1]));

FF=[];
for i=0:NSTEP:datal-M-1
     testdata=data(i+1:i+M);
     
     F=fft(h.*testdata,NFFT);
     FF=[FF F(1:NFFT/2)];
end
SS=abs(FF).^2; % Spectrogram  



syllno;
SStot(:,1:length(SS(1,:)),syllno)=SS;


end