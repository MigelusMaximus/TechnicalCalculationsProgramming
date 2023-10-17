%% PTV 7 - ZÁKLADY ZPRACOVÁNÍ SIGNÁLU

%% Úkol 1 - Filtrace signálu v časové oblasti 

% Vytvořte funkci, která bude realzovat mediánový a průměrující filtr. 
% Nápověda:
% Pro realizaci obou filtrů budete muset nejprve vytvořit tzv. plovoucí okno.
% Plovoucí umožní provádět statistické a další výpočty v lokálně omezené oblasti. 
% "Plovoucí okno" = v rámci for cyklu za pomoci indexů je vždy vymezena část vektoru, 
% která bude aktuálně analyzována = okno. V každé cyklu dojde v aktuálním okně k výpočtu 
% daného parametru = průměr/medián. Vypočtená hodnota bude uložena na prostřední
% pozici prostředního prvku okna.
% Jak správně okno indexovat ? Zpravidla si vystačíme pouze s indexem prostředního prvku okna a
% délkou okna – levý i pravý okraj jsou od prostředního prvku stejně vzdáleny, 
% a to o hodnotu n = (delkaOkna - 1)/2 (Platí pouze pokud je vstupem liché číslo, což
% většinou z praktických důvodů požadujeme).

% a) Vytvořte funkci mfiltr(). Funkce bude mít vstup "vstup" (vektor hodnot), typ filtru "typ"
% a "delkaokna". Výstupem funkce bude proměnná "vystup" (opět vektor čísel).

% b) Proveďte implementaci plovoucího okna pomocí for cyklu. Šířka okna (počet prvků, 
% které okno překrývá) bude dána vstupní proměnnou delkaokna. 
% Plovoucí okno se bude pohybovat po analyzovaném vektoru prvek po prvku. 
% Pozor na přesah okna mimo indexovatelnou oblast vektoru!

% c) Dle hodnoty proměnné typ (median, prumer) provedte odpovidajici
% vypocet pro prvky ktere se prave nachazeji uvnitr okna.
% Výsledek uložte do vektoru vystup na pozici, která odpovídá aktuálnímu indexu prostředního 
% prvku okna.

% d) Otestujte vytvořenou funkci. Stáhněte z e-learningu soubory sin_sum a také ecg250_50_drift.mat.
% Za pomoci funkce mfiltr() a proveďte filtraci tak abyste se co nejlépe zbavili rušení a zachovali 
% co nejvíce užitečné informace (tj. u signálů ze souboru sin_sum chceme získat, co nejhladší 
% sinusovou funkci, u EKG signálů, co nejlepší užitečný signál).

%% Úkol 2 - Filtrace signálu ve frekvenční oblasti

% Vytvořte filtr, který odstraní ze signálu všechny kompolenty EKG cyklu a 
% zvýraznění QRS komplex (QRS komplex je nejvýraznější komponentou v signálu).
% QRS komplexu se ve frekvenčí oblasti projevuje v pásmu 10-20Hz. 
% Vzorkovací frekvence signálu je 250 Hz.

% a) Navrhněte filtr - použijte FIR filtr, řádu 8 s mezními frekvencemi 10
% a 20 Hz. Správné použití filru vyhledejte v help.

% b) Realizujte filtraci. Příkaz filtfilt. Filtrujte signál
% ecg250_50_drift.mat.

% c) Vykreslete signál před a po filtraci

% d) Vykreslete frekvenční charakteristiku filtru.
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


%% Úkol 3 - Anotace signálu

% a) Anotujte QRS komplexy (jednotlivé srdeční stahy) v EKG signále.
% Vykreslete signál ecg. 
figure
plot(x)
pozice=ginput

% Použijte funkci ginput a označte QRS komplexy (velmi výrazné špičky v signále).
% b) Vykreslete do jednoho okna signál a vámi anotované pozice QRS komplexů.

%figure
%plot(ecg)
%hold on
%stem(pozice(:,1), pozice(:,2))

%% Úkol 4 - Detekce QRS komplexu

% a) Za pomoci funkce findpeaks realizujte automatickou detekci QRS komplexů. 
% Jak funkci použít, vyhledejte v nápovědě. 
% 
% b) Vykreslete výsledky.
% 
% c) Výsledky porovnejte s Vámi anotovanými pozicemi QRS komplexů z Úkolu 3)


