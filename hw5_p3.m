v = 4096;
tau = 1;
t = linspace(0,tau, v);

f = exp(t);
g = t;

fFour = ifft(f);
gFour = ifft(g);

%% Part A
% equal to tau * a0
partA = tau * fFour(1);

%% Part B
% equal to summation of abs value of every ak
partB = sum(abs(fFour) .^ 2);

%% Part C
% equal to summation of ak * bk_conjugte
gFourConj = conj(gFour);
partC = sum(fFour .* gFourConj);

%% Solutions
fprintf("a) %f + %fi\n", real(partA), imag(partA));
fprintf("b) %f + %fi\n", real(partB), imag(partB));
fprintf("c) %f + %fi\n", real(partC), imag(partC));