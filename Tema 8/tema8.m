m = 10; 
% numarul de măsurători
A = zeros(m, 2); 
%in A stochez ξ și f(ξ)

for i = 1 : m
    A(i, 1) = randn(1); 
    % generez ξ
    A(i, 2) = sin(A(i, 1)) + cos(A(i, 1)); 
    % calculez f(ξ)
end

alfa_gen = randn() 
% Parametrul α (aleator)
beta_gen = randn()
% Parametrul β (aleator)
eta = alfa_gen * A(:, 1) + beta_gen * A(:, 2) + 0.5 * randn(m, 1); 
% η = αξ + βf(ξ) dat de problema
% 0.5 * randn(m, 1) este "zgomotul", pentru a imita erorile din realitate

A(:, 1)

param = A \ eta; 
% Rezolvăm sistemul supradeterminat cu CMMP
alfa_est = param(1)
% Estimarea lui α
beta_est = param(2) 
% Estimarea lui β

xi = A(:, 1)
%valorile ξ

plot(xi, eta, 'o', 'MarkerSize', 6, 'MarkerEdgeColor', 'b'); 
hold on;
xi_sortat = sort(xi); 
% sortez valorile ξ pentru a obtine o linie continua ordonata, nu haotica

eta_est = alfa_est * xi_sortat + beta_est * (sin(xi_sortat) + cos(xi_sortat)); 
% Calculez valorile pe linia modelului
plot(xi_sortat, eta_est, '-r'); 
xlabel('\xi');
ylabel('\eta');
hold off;
