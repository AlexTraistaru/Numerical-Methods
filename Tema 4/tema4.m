n = input("n=");
d1 = randn(1, n);
d2 = randn(1, n - 1);
b = randn(n, 1);

A = diag(d1) + diag(d2, 1);
x = zeros(n, 1);

x(n) = b(n) / A(n, n);
for i = n - 1 : -1 : 1
    x(i) = (b(i) - A(i, i + 1) * x(i + 1)) / A(i, i);
end

norma = norm(A * x - b);
norma