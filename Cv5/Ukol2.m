low_cutoff = 10;  
high_cutoff = 20; 
Fs = 250; 
r=8;

low_cutoff = low_cutoff / (Fs / 2);
high_cutoff = high_cutoff / (Fs / 2);


b = fir1(n, [low_cutoff, high_cutoff], 'bandpass');

load('ekg250_50_drift.mat');
filtered_ekg_data = filtfilt(b, 1, x);
figure
plot(x,'b')
hold on
plot(filtered_ekg_data,'r')
legend("Puvodni signal", " Signal pro filtraci")


