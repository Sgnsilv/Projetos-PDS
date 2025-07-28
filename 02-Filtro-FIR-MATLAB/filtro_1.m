%Parametros
M = 22;
fs = 44100;
Ts = 1/fs;

omega_a = 0.815 * pi;
omega_b = 0.909 * pi;

%vetor de amostras
n = 0:M;
nc = M/2;

%hd[n]
hd = zeros(1, M + 1);

for i = 0:M
  if i == nc
    hd(i + 1) = 1 - (omega_b - omega_a)/pi;
  else
    n_diff = (i - nc);
    hd(i + 1) = (sin(omega_a * n_diff) + sin(omega_b * n_diff) - sin(pi * n_diff)) / (pi * n_diff);
  end
end

%Hamming
w = 0.54 - 0.46 * cos(2 * pi * n / M);

h = hd .* w;

plotspec(h,Ts);
