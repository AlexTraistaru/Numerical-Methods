n = input('introduceti dimensiunea matricelor: ');
%numarul meu de la teams este par, deci o sa am o matrice superior
%triunghiulara
for i = 1 : n
    for j = 1 : n
        if i >= j
            A(i, j) = input('A: ');
        else
            A(i, j) = 0;
        end
    end
end

disp('vectorul D: ');
D = zeros(n, 1);
for i = 1 : n
    D(i) = input('D: ');
end

for i = 1 : n
    for j = 1 : i
        C(i, j) = A(i, j) * D(j);
    end
end

disp('matricea A:');
disp(A);
disp('vectorul D:');
disp(D);
disp('matricea rezultat C:');
disp(C);