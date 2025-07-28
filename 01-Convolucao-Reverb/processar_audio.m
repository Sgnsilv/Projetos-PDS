
%Carrega a resposta ao impulso da igreja (h) e sua frequência de amostragem (Fs)
[h, Fs] = audioread('Church Schellingwoude.wav');

%Garante que o sinal da igreja seja mono, pegando apenas o primeiro canal
h_mono = h(:,1);

%Carrega o seu arquivo pré-gravado.
[x_stereo, Fs_voz] = audioread('voz_original.wav');

%Garante que o áudio de voz também seja mono para a convolução
if size(x_stereo, 2) > 1
    x = x_stereo(:,1);
else
    x = x_stereo;
end

y = conv(x, h_mono);

%Normaliza o áudio resultante
y = y / max(abs(y));

audiowrite('voz_processada.wav', y, Fs);

