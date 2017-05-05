N = 2048;
fe = 40960;
fs = fe/N;

f0 = [1000 2000 2412 2412];
f1 = [15000 2040 2600 2568];
a0 = [1 1 1 1];
a1 = [1 1 0.025 1];

n = 0:1:N-1;
v = fs * [-N/2:1:(N-1)/2];

w = hamming(N);

for i=1:4
  figure;
  subplot(2, 1, 1)
  y = a0(i) * sin( 2*pi*f0(i)* n/fe ) + a1(i) * sin( 2*pi*f1(i)* n/fe );
  plot(n/fe, y);
  % avec hamming
  y = y .* w';
  Y = abs(fft(y, N));
  Y2 = fftshift(Y);
  subplot(2, 1, 2)
  stem(v, Y2);
end

% On a une amplitude de 1024 on a le 1/2 * dirac * 1/NTe
% 1/2 à cause de la formule d'Euler
% 1/NTe à cause du peigne de Ricq;

% figure 1 on a bien 2 * 2 diracs associés aux fréquences données
% figure 2 idem
% figure 3 on ne comprends pas pourquoi ça marche moins qu'avec le 2.
% figure 4 on ne comprends pas pourquoi ça marche moins qu'avec le 2.


% Maintenant on sait que c'est à cause de fenêtre d'échantillonage.
% Une fenetre de hamming offre aucuns lobbes secondaires





pause;
