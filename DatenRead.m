function [Rohsignal,Idealsignal]=DatenRead(Messung,Path_Meas,Path_Gold)
N_Interp = 1; %%Interpolationsfaktor 511*16=8176
l=length(Messung);
s1=Messung(l-1:l);
s2='Gold';
Sdaten=Messung;
Gdaten=strrep(Messung,s1,s2);

Sdaten=strcat(Path_Meas,Sdaten);
Gdaten=strcat(Path_Gold,Gdaten);

load(Sdaten);
for ChNr=1:1:128
    Rohsignal1(:,ChNr) =Ch{ChNr}.Data(:,1);
    Rohsignal(:,ChNr) = interpft(Rohsignal1(:,ChNr), N_Interp*511);
    
end

load(Gdaten);
for ChNr=1:1:128
    Gold1(:,ChNr) =Ch{ChNr}.Data(:,1);
    Gold(:,ChNr) = interpft(Gold1(:,ChNr), N_Interp*511);
end

Idealsignal=Rohsignal-Gold;
end