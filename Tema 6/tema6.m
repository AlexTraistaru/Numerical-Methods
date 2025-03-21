n = input("intoduceti n: ");
A = randn(n);
A = hess(A);
%cu ajutorul functiei hess, gasesc matricea Hessenberg a lui A
A_aux = A;
%A_aux este folosit in final pentru verificare, deoarece A o sa fie
%modificat in urma calcularii valorilor pentru matricele L si U

% Calculez prima linie a matricei U
for i = 2 : n
    A(1, i) = A(1, i) / A(1, 1);
end

for k = 2 : n
    % Calculez elementul de pe diagonala lui L
    A(k, k) = A(k, k) - A(k, k - 1) * A(k - 1, k);
    % Calculez elementele lui U
    for j = k + 1 : n
        A(k, j) = (A(k, j) - A(k, k - 1) * A(k - 1, j)) / A(k, k);
    end
end

L = tril(A);                
%functia tril imi da triunghiul inferior din A
U = triu(A, 1) + eye(n);    
%functia triu imi da triunghiul superior la care adun diagonala principala
%unitate
norm(L * U - A_aux)