%---------- Data Structure
% --------------------------------------------------
% Song of two birds on three following years:

%1989:
%H7-3: Song 13B04
%V-99: Song 14A03

%1990:
%H7-3: Song 19A04
%V-99: Song 19A01 

%1991:
%H7-3: Song 23B05
%V-99: Song 23A01

%----------------------------------------------------
% Songs are stored in files Xmatxxxxx
% Birdsong is cut to smaller pieces "strophes" stored in Xmatxxxxx as Xmatxxxxx_nr
% Each stroph matrix "Xmatxxxxx_nr" consists of many syllables
% Syllables are found as coulumns in  Xmatxxxxx_nr(:, syllableNumber, 1)
% The corresponding indicies from the original song are found in Xmatxxxxx_nr(:, syllableNumber, 2)

% In labelfilexxxxx the corresponding true similarity scores between two subsequent syllables in a strophe are given as  1S for similar and T0x for not similar. 
%%

file='13B04' % Song file name
eval(['load  ' 'Xmat' file])  % Strophe matrices with syllables
eval(['labelfile' file])      % True labels for similarity of pairwise syllables

Fs=44100/4;  % Reduced sample frequency 11025 Hz
strono=7  % Strophe number 7 is shown
    
stroph=['Xmat' file '_' int2str(strono)]; % 'Xmat13B04_7'
eval(['Xmattest=' stroph ';']); % evaluates 'Xmattest=Xmat13B04_7;'

eval(['dataseqlong=' ['datamat' file '(:,' int2str(strono) ');']]) % 'dataseqlong=datamat13B04(:,7);'

dataseqds=decimate(dataseqlong,4); % this is the whole strophe 
    
[SStot,dataseq]=spectrogram(Xmattest(:,:,1),256,1024,Fs); % 256 sample, 23 ms window. Spectrogram for all the syllables separetly. we get 14 spectrograms for stroph 7

eval(['labelsong=' 'label' file '_' num2str(strono)]) % evaluates 'labelsong=label13B04_7'

for i=1:length(Xmattest(1,:,1))-1
    figure(1)
    plot([1:length(dataseqds)]/Fs,dataseqds,'b-') % Plotting the full strophe 
    hold on
    
    v=find(Xmattest(:,i,2)~=0); % find the indecies where this syllable (i) is located (where it is not zero)
    plot(Xmattest(v,i,2)/Fs,Xmattest(v,i,1),'g-') % Plot the syllable of interest in green
    if i+1<=length(Xmattest(1,:,1)) % if there is another syllable after the ith one then also plot it
      v=find(Xmattest(:,i+1,2)~=0); 
      plot(Xmattest(v,i+1,2)/Fs,Xmattest(v,i+1,1),'c-')
      % one or zero from labelsong in labelfile
      text(min(Xmattest(v,i+1,2)/Fs),0.3,num2str(labelsong(i))) % Add text at y = 0.3 x= start of syllable with values 0 or 1
    
    end
    title('A syllable pair (green-blue) and true similarity score (one or zero)')
    hold off
    figure(2)
    
    subplot(211)
    plotspectrogram(SStot(:,:,i),Fs) % show spectrogram of the first syllable
    title('Syllable green')
    subplot(212)
    plotspectrogram(SStot(:,:,i+1),Fs) % show spectrogram of the second syllable
    title('Syllable blue')
       
    pause
end