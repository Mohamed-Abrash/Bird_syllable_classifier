file='13B04' % Song file name
eval(['load  ' 'Xmat' file])  % Strophe matrices with syllables
eval(['labelfile' file])      % True labels for similarity of pairwise syllables

Fs=44100/4;  % Reduced sample frequency 11025 Hz
strono=7  % Strophe number 7 is shown
    
stroph=['Xmat' file '_' int2str(strono)];
eval(['Xmattest=' stroph ';']);

eval(['dataseqlong=' ['datamat' file '(:,' int2str(strono) ');']])

dataseqds=decimate(dataseqlong,4);
    
[SStot,dataseq]=spectrogram(Xmattest(:,:,1),256,1024,Fs); % 256 sample, 23 ms window

eval(['labelsong=' 'label' file '_' num2str(strono)])

for i=1:length(Xmattest(1,:,1))-1
    
    figure(1)
    plot([1:length(dataseqds)]/Fs,dataseqds,'b-')
    hold on

    v=find(Xmattest(:,i,2)~=0);
    plot(Xmattest(v,i,2)/Fs,Xmattest(v,i,1),'g-')
    if i+1<=length(Xmattest(1,:,1))
      v=find(Xmattest(:,i+1,2)~=0); 
      plot(Xmattest(v,i+1,2)/Fs,Xmattest(v,i+1,1),'c-')
      % one or zero from labelsong in labelfile
      text(min(Xmattest(v,i+1,2)/Fs),0.3,num2str(labelsong(i)))
 
    end
    title('A syllable pair (green-blue) and true similarity score (one or zero)')
    hold off
    figure(2)

    subplot(211)
    plotspectrogram(SStot(:,:,i),Fs)
    title('Syllable green')
    subplot(212)
    plotspectrogram(SStot(:,:,i+1),Fs)
    title('Syllable blue')
   
    pause
    
end





