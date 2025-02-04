% Two subsequent syllables are marked with label 0 if different and with 1
% if equal. Label19A04_1 consists of the syllable pairs in strophe 1


label19A04_1=[0 0 0 0 1 1 1 1 0 1 0 1 0 1 1];
label19A04_2=[1 1 1 0 1 1 1 1 0 0 1 1 1];
label19A04_3=[0 0 1 0 1 0 1 0 1 1];
label19A04_4=[1 0 1 0 0 1 1 1 1 0 0 1 0 0 1 1 1 0 0 1 1 1 1 1 1];
label19A04_5=[1 1 0 1 1 1 0 0 0 1 1 1 0 1 1];
label19A04_6=[0 1 0 1 0 0 1 0 0 1 1 1 1 0];
label19A04_7=[1 1 1 0 0 1 0 1 0 1 0 1 1 0 1 1 1 1 1];
label19A04_8=[0 1 1 1 1 1 1];
label19A04_9=[1 1 0 0 1 1 1];
label19A04_10=[1 0 0 1 0 1 1 1 1 0 1 0];
label19A04_11=[0 1 0 1 1 1 1 1];
label19A04_12=[1 1 1 0 0 1 1 1 1 0];
label19A04_13=[1 0 1 1 0 1 1 1 1 0];
label19A04_14=[0 1 1 1 0 0 0];
label19A04_15=[1 1 1 1 1];
label19A04_16=[1 0 1 1 0 1 0 0];
label19A04_17=[0 1 0 1 0 1 1 1 1];
label19A04_18=[1 1 1 0 0 1 0 ];
label19A04_19=[0 0 1 1 1 1 0 1 0 1 1 1 0 1 1 1 1];
label19A04_20=[1 0 0 1 0 1];
label19A04_21=[1 1 1 0 0 1 1 1 1];
label19A04_22=[1 0 1 1 1 0 1 1 1 1 0 0 1 1 1 1];
label19A04_23=[1 1 1 1 0 1];
label19A04_24=[0 1 0 0 1 1 1 1 1 1];
label19A04_25=[0 0 1 1 1 1 1 0 1 0 1 0 1 1 1 1];
label19A04_26=[0 1 1 1 1];
label19A04_27=[0 1 0 0 1 1 1 1 0 0 1 1 1 1 1 0];
label19A04_28=[1 1 1 0 0 1 1 1 1 1];
label19A04_29=[1 0 1 1 0 1 0 1 1 1];
label19A04_30=[1 1 0 1 1 0 1 0 1 1 1];
label19A04_31=[1 1 1 0 0 1 1 1 0 1 0 1 0 1 1 1];
label19A04_32=[1 0 1 1 0 1 1 1 0 0 1 1 1 1 1 1 1 0 1];
label19A04_33=[1 1 1 1 0 1 1 1 1 0 1 0 1];
label19A04_34=[1 1 1 0 1 1 1 1 1 1 0 0 1 1 1 0 1 1 1];
label19A04_35=[1 0 0 0 1 1 1 1 1 0 1];

LL=0;
for i=1:35
    eval(['test=label19A04_' num2str(i)])
    LL=LL+length(find(abs(diff(test))>0))+1;
end

LL