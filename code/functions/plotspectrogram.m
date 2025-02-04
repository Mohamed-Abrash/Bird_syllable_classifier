function []=plotspectrogram(SS,Fs);


NSTEP=32;

[NTFR2,M,L]=size(SS);


for i=1:L

S=SS(:,:,i);    
S=10*log10(abs(S));
TI=([0:M-1]).*4./Fs*1000; %%% Hardcoded number (the 4 here account for the skipping in time that is done in the spectrogram calculations)
FI=[0:NTFR2-1]'/(2*NTFR2)*Fs/1000;

 c=[min(min(S)) max(max(S))];
 pcolor(TI,FI,S(1:end,1:end))
 colormap('jet')
 axis([0 max(TI)-350 0 5])
 %imagesc(TI,FI,MWSS)
 %set(gca,'ydir','normal')
  shading interp
  caxis(c)
  %axis off
  xlabel('Time/msec')
  ylabel('Frequency/kHz')
  boldify1
  
  






end