n = input('Introduceți n: ');
A = zeros(n, n);
for i = 1 : n
    A(i, i) = 2 + rand;  
% Elementele pe diagonala principala, am adunat 2 pentru a ma asigura ca am
% numere mai mari pe diagonala principala, deoarece vreau ca matricea sa
% fie pozitiv definita, toate valorile proprii sunt pozitive
    if i < n
        A(i, i + 1) = rand; 
% Elemente pe supradiagonala
        A(i + 1, i) = A(i, i + 1);      
% Elemente pe subdiagonala sunt la fel, deoarece vreau ca matricea sa fie
% simetrica
    end
end
%A este o matrice tridiagonala simetrica si pozitiv definita

L = zeros(n, n);
L(1, 1) = sqrt(A(1, 1));
for i = 2 : n
    L(i, i - 1) = A(i, i - 1) / L(i - 1, i - 1);
%calculez elementul de sub diagonala lui L (subdiagonala)
    L(i, i) = sqrt(A(i, i) - L(i, i - 1) ^ 2);
%calculez elementul de pe diagonala principala a lui L
end
%L este o matrice triunghiulara inferioara

norm(A - L * L')