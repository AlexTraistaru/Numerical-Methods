f = @(x) x^3 - 4*x^2 + sin(x) - 1;

% Domeniul inițial de căutare
x_start = -10; 
% Limita inferioară a domeniului
x_end = 10; 
% Limita superioară a domeniului
pas = 0.1; 
% Pasul pentru verificarea intervalului

% Găsește automat un interval valid [a, b]
a = NaN; b = NaN; 
% am inițializat variabilele
for x = x_start:pas:x_end-pas
    if f(x) * f(x + pas) < 0
        a = x;
        b = x + pas;
        break;
    end
end

if isnan(a) || isnan(b)
    error('Nu s-a găsit un interval valid');
end

fprintf('Interval: a = %.2f, b = %.2f\n', a, b);

% Toleranță și număr maxim de iterații
toleranta = 1e-6;
nr_maxim_iteratii = 100;

% Metoda bisecției
i = 0;
while (b - a) / 2 > toleranta && i < nr_maxim_iteratii
    c = (a + b) / 2; 
    % Punctul de mijloc
    fc = f(c); 
    % Valoarea funcției în punctul c
    
    if fc == 0 || (b - a) / 2 < toleranta 
        % Soluție găsită
        break;
    elseif f(a) * fc < 0
        b = c; 
    else
        a = c;
    end
    
    i = i + 1;
end

% Soluția aproximativă
x0 = (a + b) / 2;
fprintf('\nSoluția este x = %.6f cu f(x) = %.6f\n', x0, f(x0));

x = -10:0.1:10; 
% Domeniul graficului
y = arrayfun(f, x); 
% functia "arrayfun" aplica functia mea fiecarui element din vector
% Calculăm valorile funcției
plot(x, y, 'b-'); 
grid on;
xlabel('x'); ylabel('f(x)');
title('Grafic');
hold on;
plot(x0, f(x0), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
plot(x, zeros(size(x)), 'r--'); % Ox
hold off;
