%% PTV - EXERCISE 5 - DATA VISUALIZATION (PTV - CVIČENÍ 5 - VIZUALIZACE DAT)

%% 1. ZÁKLADNÍ PRÁCE S GRAFY
% Generate a vector of 20 random numbers
randomVector  = rand(1, 20);
%{
figure;
plot(randomVector);
xlabel('Time');
ylabel('Value');
title('plot');

% c) spojitý graf (plot) vykreslete také čárkovanou čárou zelené barvy
figure;
plot(randomVector, '--g');
xlabel('Time');
ylabel('Value');
title('plot');

% Using stem function with default settings
figure;
stem(randomVector);
xlabel('Time');
ylabel('Value');
title('stem');

% distkrétní graf (stem) vykreslete tak, aby značky byly ve tvaru hvězdy oranžové barvy
figure;
stem(randomVector, 'p', 'MarkerFaceColor', [1, 0.5, 0], 'MarkerEdgeColor', [1, 0.5, 0]);
xlabel('Time');
ylabel('Value');
title('stem');

% Using area function with default settings
figure;
area(randomVector);
xlabel('Time');
ylabel('Value');
title('area');

% graf plochy (area) vykreslete zelenou barvou
figure;
area(randomVector, 'FaceColor', 'g');
xlabel('Time');
ylabel('Value');
title('area'); 
%} 

%% 2. VYKRESLENÍ VÍCE GRAFŮ DO JEDNOHO OKNA 
% Grafy (celkem 6) z úkolu 1 vykreslete do jednoho okna (Figure), využijte funkci subplot. 
% Nezapomeňte na popisky os. Navíc přidejte do titulku každého grafu název použité 
% funkce
figure;

subplot(2, 3, 1);
plot(randomVector);
xlabel('Time');
ylabel('Value');
title('plot');

subplot(2, 3, 2);
plot(randomVector, '--g');
xlabel('Time');
ylabel('Value');
title('plot');

subplot(2, 3, 3);
stem(randomVector);
xlabel('Time');
ylabel('Value');
title('stem');

subplot(2, 3, 4);
stem(randomVector, 'p', 'MarkerFaceColor', [1, 0.5, 0], 'MarkerEdgeColor', [1, 0.5, 0]);
xlabel('Time');
ylabel('Value');
title('stem');

subplot(2, 3, 5);
area(randomVector);
xlabel('Time');
ylabel('Value');
title('area');

subplot(2, 3, 6);
area(randomVector, 'FaceColor', 'g');
xlabel('Time');
ylabel('Value');
title('area');

%% 3. 
% V grafu znázorněte zastoupnení účastníků mezinárodní konference.
% Na konferenci se dostavilo: 25 čechů (15 mužů a 10 žen), 30 italů (18 mužů a 12 žen), 
% 27 japonců (13 mužů a 14 žen), 14 američanů (10 žen a 4 muži)
% a) V koláčovém grafu znázorněte zastoupení národností. Popište jednotlivá pole.
% b) Ve sloupcovém grafu znázornětě zastoupení národností a v rámci nich počet mužů a žen.
% Na osu x vložte popisky národností, do legendy vložte popisek toho, které barvy odpovídá 
% mužům a ženám.
% c) Oba grafy vykreslete do jednoho Figure.
narodnosti = {'Češi', 'Italové', 'Japonci', 'Američané'};
pocet_lidi = [25, 30, 27, 14];
muzi = [15, 18, 13, 4];
zeny = [10, 12, 14, 10];

figure;

subplot(1, 2, 1);
pie(pocet_lidi);
legend(narodnosti, 'Location', 'Best');

subplot(1, 2, 2);
barData = [muzi; zeny]';
bar(barData, 'stacked');
set(gca, 'XTickLabel', narodnosti);
legend('Muži', 'Ženy', 'Location', 'Best');
xlabel('Národnosti');
ylabel('Počet účastníků');

% c) Oba grafy jsou vykresleny do jednoho Figure

%% 4. ANOTACE DAT
% a) Vykreslete funkci sin v intervalu 0 až 2*pi.
% b) Za pomoci funkce stem označete pozici jejího maxima (zjsitíte funkcí max)
% c) Maximum označte za pomoci funkce annotation. Označte ho slovním popisem a šipkou ukazující 
% na daný bod.

x=0:0.01:2*pi;
y=sin(x);
figure
plot(x,y)
[aa bb]=max(y);
hold on
stem(x(bb),aa)
%{ 
Harder version if you want to code everything yourself

% a) Vykreslení funkce sin v intervalu od 0 do 2*pi
x = linspace(0, 2*pi, 1000); % Generování hodnot x v intervalu [0, 2*pi]
y = sin(x); % Vypočet hodnot y jako sin(x)

figure; % Otevření nového Figure
plot(x, y); % Vykreslení grafu sin(x)
hold on; % Umožnění přidání dalších prvků do grafu

% b) Nalezení a označení maxima funkce sin
[max_value, max_index] = max(y); % Nalezení maximální hodnoty a jejího indexu
max_x = x(max_index); % Nalezení hodnoty x odpovídající maximu

stem(max_x, max_value, 'r', 'filled'); % Označení maxima červeným bodem
text(max_x, max_value, sprintf(' Max = %.2f', max_value), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right'); % Anotace maxima

% Nastavení grafu
xlabel('x'); % Popisek osy x
ylabel('sin(x)'); % Popisek osy y
title('Graf funkce sin(x) a její maximum'); % Titulek grafu
grid on; % Zobrazení mřížky
%}


%% 5. TVORBA GRAFU - FYZIKÁLNÍ ÚLOHA
% Vytvořte program, který bude za pomoci for cyklu vykreslovat různě velké čtverce. V každém forc cyklu přidejte 
% hodnotu 0.1 ke všem elementů tak, aby se vždy o tuto hodnotu zvětšil čtverec (počáteční velikost strany je 1)
% a stejně se o tuto hodnotu změnila pozice počátku vykreslení čtverce (počáteční pozice je [1,1]).
% Při spuštění programu se čtverce nebudou vykreslovat najednou, ale postupně, s 0.5 sec pauzou. Nezapomeňte správně 
% nastavit osy grafu.
t = 1:1:10;
T = 100;
k = 0.6;
S1 = 50;
S2 = 20;
Tt1 = S1 + (T - S1) * exp(-k * t);
Tt2 = S2 + (T - S2) * exp(-k * t);
figure;
plot(t, Tt1, 'LineWidth', 2, 'Color', 'b', 'LineStyle', '-');
hold on;
plot(t, Tt2, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '--');
xlabel('Time (minutes)');
ylabel('Temperature (°C)');
legend('S = 50°C', 'S = 20°C');
grid on;


%% 6. "KRESBA"
% Vytvořte program, který bude za pomoci for cyklu vykreslovat různě velké čtverce. V každém forc cyklu přidejte 
% hodnotu 0.1 ke všem elementů tak, aby se vždy o tuto hodnotu zvětšil čtverec (počáteční velikost strany je 1)
% a stejně se o tuto hodnotu změnila pozice počátku vykreslení čtverce (počáteční pozice je [1,1]).
% Při spuštění programu se čtverce nebudou vykreslovat najednou, ale postupně, s 0.5 sec pauzou. Nezapomeňte správně 
% nastavit osy grafu.
% 
figure;
size = 1;
position = [1, 1, size, size];
axis([0 20 0 20]);
axis equal;
for i = 1:20
    rectangle('Position', position, 'EdgeColor', 'b');
    pause(0.5);
    size = size + 0.1;
    position = position + [0.1, 0.1, 0.1, 0.1];
end

