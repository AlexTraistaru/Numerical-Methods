% Definim funcția f(x)
f = @(x) x.^2 + 2.*x - x./3;

% Limitele de integrare
a = 2; % Limita inferioară
b = 3; % Limita superioară

% Numărul de subintervale (cu cât e mai mare, cu atât rezultatul e mai precis)
n = 1000;

% Lungimea fiecărui subinterval
dx = (b - a) / n;

% Vectorul de puncte din stânga fiecărui subinterval
x = linspace(a, b-dx, n);

% Aplicăm metoda dreptunghiurilor
integral = sum(f(x) * dx);

% Afișăm rezultatul
fprintf('Valoarea aproximativă a integralei definite este: %.6f\n', integral);
