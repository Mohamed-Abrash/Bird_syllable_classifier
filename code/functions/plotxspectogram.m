function [] = plotxspectogram(S,T,F,Fs)

    [NTFR2,M,L]=size(S);
    
    
    
      
    %S=10*log10(abs(S));
    TI=T.*1000;
    FI=F./1000;
    
    c=[min(min(S)) max(max(S))];
    pcolor(TI,FI,S(1:end,1:end))
    colormap('jet')

    
     %imagesc(TI,FI,MWSS)
     %set(gca,'ydir','normal')
    shading interp
    caxis(c)
      %axis off
    xlabel('Time/msec')
    ylabel('Frequency/kHz')
    boldify1
    title('Cros-Spectrum')
end