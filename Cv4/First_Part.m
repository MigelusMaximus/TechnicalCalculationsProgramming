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

% Creating a single window (Figure) for all 6 plots
figure;

% Using subplot to place the first plot
subplot(2, 3, 1);
plot(randomVector);
xlabel('Time');
ylabel('Value');
title('plot');

% Using subplot to place the second plot
subplot(2, 3, 2);
plot(randomVector, '--g');
xlabel('Time');
ylabel('Value');
title('plot');

% Using subplot to place the third plot
subplot(2, 3, 3);
stem(randomVector);
xlabel('Time');
ylabel('Value');
title('stem');

% Using subplot to place the fourth plot
subplot(2, 3, 4);
stem(randomVector, 'p', 'MarkerFaceColor', [1, 0.5, 0], 'MarkerEdgeColor', [1, 0.5, 0]);
xlabel('Time');
ylabel('Value');
title('stem');

% Using subplot to place the fifth plot
subplot(2, 3, 5);
area(randomVector);
xlabel('Time');
ylabel('Value');
title('area');

% Using subplot to place the sixth plot
subplot(2, 3, 6);
area(randomVector, 'FaceColor', 'g');
xlabel('Time');
ylabel('Value');
title('area');