file='13B04' % Song file name
eval(['load  ' 'Xmat' file])  % Strophe matrices with syllables
eval(['labelfile' file])      % True labels for similarity of pairwise syllables

Fs=44100/4;  % Reduced sample frequency 11025 Hz
strono=7  % Strophe number 7 is shown
    
stroph=['Xmat' file '_' int2str(strono)];
eval(['Xmattest=' stroph ';']);


eval(['dataseqlong=' ['datamat' file '(:,' int2str(strono) ');']])

dataseqds=decimate(dataseqlong,4);
nwin =100;
[SStot,dataseq]=spectrogram(Xmattest(:,:,1),nwin,1024,Fs); % 256 sample, 23 ms window

eval(['labelsong=' 'label' file '_' num2str(strono)])

for i=1:length(Xmattest(1,:,1))-1
    


    v=find(Xmattest(:,i,2)~=0); % plot first syllable

    figure
    subplot(311)
    plot(Xmattest(v,i,2)/Fs,Xmattest(v,i,1),'g-')
    title(sprintf('Syllable nr %f, Similarity %d', i,labelsong(i)))

    hold on
    
    if i+1<=length(Xmattest(1,:,1))
      v2=find(Xmattest(:,i+1,2)~=0); 
      subplot(312)
      plot(Xmattest(v2,i+1,2)/Fs,Xmattest(v2,i+1,1),'c-')
      title(sprintf('Syllable nr %f ', i+1))
      subplot(313)
      plot(xcov(Xmattest(v,i,1),Xmattest(v2,i+1,1)))
      title('Cross covariance')
      hold off
    end
    
    hold off

    figure
    subplot(311)
    plotspectrogram(SStot(:,:,i),Fs)
    title('Syllable green')
    subplot(312)
    plotspectrogram(SStot(:,:,i+1),Fs)
    title('Syllable blue')
    subplot(313)
    nwin =256*0.5;
    [S,F,T] = xspectrogram(Xmattest(:,i,1),Xmattest(:,i+1,1),kaiser(nwin,30),nwin-1,1024,Fs,'centered','yaxis');
    plotxspectogram(S,T,F,Fs)
    title('Cross-Spectrogram')
    
   
    
    pause
    
    
end