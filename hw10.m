% aae 301 hw10 Nick Mondora
clc;
clear all;

%% question 1
t = linspace(0, 10, 1000); %time
freq = linspace(0, 10^3, 10^4); %frequency

numerator = conv([18,0], [1,-3]);
denominator = conv([1,1], [1,2]);
s = tf(numerator, denominator);

input = -3 +2*sin(4*t) - 6*cos(7*t);

mag = 18 .* freq .* sqrt((freq.^2 + 9)./((freq.^2 + 1).*(freq.^2 + 4)));
anglee = pi/2 + atan(-1/3 * freq) - atan(freq) - atan(freq/2);

figure(1)
subplot(2,1,1)
semilogx(freq, 20*log10(mag))
xlabel("Frequency [rad/s]")
ylabel("Magnitude [dB]")
title("Magnitude")
grid on
subplot(2,1,2)
semilogx(freq, rad2deg(anglee))
xlabel("Frequency [rad/s]")
ylabel("Phase Shift [deg]")
title("Phase Shift")
grid on
sgtitle("Bode Plot")

figure(2)
lsim(s, input, t);
grid on
title("Linear Simulation")


%% question 2
z = 16; % for w0 = 4
w = 0:.01:100;

mag = sqrt( (w.^4 + z.^2) ./ ( (1+w.^2) .* (4+w.^2)));

figure(3);
plot(w, mag);
grid on
xlabel("Frequency [rad/s]");
title("Filter Magnitude")
ylabel("Magnitude");


%% question 3
freq = linspace(0, 10^4, 10^6);

G = sqrt(1./(1 + freq.^2 ./ 100));
Gang = pi + atan(-1 .* freq) - atan (freq) - atan(freq ./10);
H = sqrt(100./(100 + freq.^2));
Hang =  -1 * atan(freq./10);

figure(4)
subplot (2,1,1); % create a 1x2 subplot grid
semilogx(freq, 20*log10(G), 'r'); 
hold on; 
semilogx(freq, 20*log10(H), 'b'); 
grid on; 
xlabel ('Frequency [rad/s]'); 
ylabel ('Magnitude [dB])'); 
legend(["Filter G", "Filter H"], 'location', 'best'); 
title("Amplitude"); 
subplot(2,1,2); 
semilogx(freq, rad2deg(Gang), 'r'); 
hold on; semilogx(freq, rad2deg(Hang), 'b'); 
grid on; 
xlabel ('Frequency [rad/s]'); 
ylabel ('Phase Shift (degrees)'); 
ylim([-180,180]); % set y-axis limits to +/- 180 degrees
legend(["Filter G", "Filter H"], 'location', 'best'); 
title("Phase Shift"); 
sgtitle("Bode Plots for Filters G and H");


