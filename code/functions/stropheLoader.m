function [SStot, Xmattest,labelsong, Fs ] = stropheLoader(song, strophe_nr, dec, windnr,nfft,fs,spectrogramflag)

    file=song; % Song file name
   
    eval(['load  ' 'Xmat' file])  % Strophe matrices with syllables
    eval(['labelfile' file])      % True labels for similarity of pairwise syllables
    
    Fs=fs/dec;  % Reduced sample frequency 11025 Hz
    strono=strophe_nr;  % Strophe number 7 is shown
        
    stroph=['Xmat' file '_' int2str(strono) ';'];
    eval(['Xmattest=' stroph ';']);
    
    
    eval(['dataseqlong=' ['datamat' file '(:,' int2str(strono) ');']])
    
    dataseqds=decimate(dataseqlong,4);

    
    if spectrogramflag
        [SStot,dataseq]=spectrogram(Xmattest(:,:,1),windnr,nfft,Fs); % 256 sample, 23 ms window
    end
    if ~spectrogramflag
        SStot = 0;
    end
    
    eval(['labelsong=' 'label' file '_' num2str(strono) ';'] )

end