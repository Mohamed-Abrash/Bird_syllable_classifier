
label19A01_1=[1 1 1 0 0 0 0 0 1 1 1 1];
label19A01_2=[1 1 1 0 0 1 1 1 0 0 1 0 1 0 1 1 1 1 1 1];
label19A01_3=[1 1 1 0 0 1 1 0 0 1 1 1 1 1];
label19A01_4=[0 0 1 0 0 0 1 1 1 0 1 0 1 1 1 0 0 0];
label19A01_5=[1 1 1 1 0 0 1 0 0 1 1 1 1];
label19A01_6=[0 1 1 1 0 0 1 1 1 1];
label19A01_7=[0 1 1 1 0 0 1 1 0 0 1 1 1 1 1 1 1];
label19A01_8=[1 0 1 0 0 1 0 0 1 0 1 1 1];
label19A01_9=[1 1 1 0 1 0 0 1 0 0 1 1 1 1];
label19A01_10=[1 0 0 0 1 1 1 1];
label19A01_11=[0 1 1 1 0 1 0 1 1 0 1 0 1 1 1 1];
label19A01_12=[1 1 1 0 0 1 0 0 1 1 1 1 0 0 1 1 0 1 1 0 1 0 1 1 1 0 1 1];
label19A01_13=[1 0 0 1 0 1 1 0 0 1 1 1];
label19A01_14=[1 0 0 1 1 0 0 1 1 1 1 1 1];
label19A01_15=[0 1 1 1 0 1 1 0 1 0 1 1 1 1];
label19A01_16=[1 0 0 1 0 0 1 0 0 1 1 1 ];
label19A01_17=[1 1 1 1 1 0 0 1 1 0 0 1 0 0 1 1 1 0 0 1 1];
label19A01_18=[1 1 0 0 1 0 0 1 1 1 1 0 0 1 1 1 1 1];
label19A01_19=[1 1 1 1 1 0 0 1 0 0 1 1 1 0 0 1 1 0];
label19A01_20=[1 1 0 1 1 0 1 0 1 1 1 1 0 1 1 1];
label19A01_21=[0 1 1 1 1 0];
label19A01_22=[0 1 1 0 0 1 1 1 0 1 1 1 1 0 1 0 1 1 1 ];
label19A01_23=[1 0 0 1 1 1 0 0 1 0 1 1 1 1];
label19A01_24=[0 1 1 1 0 1 1 0 1 0 1 1 1 1 0 1 1 1 1 1 0 0 1 0 1 1 0 0 1 1 1];

LL=0;
for i=1:24
    eval(['test=label19A01_' num2str(i)])
    LL=LL+length(find(abs(diff(test))>0))+1;
end

LL


