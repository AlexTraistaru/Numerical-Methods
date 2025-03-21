n = 100;
m = 10;
x = rand(1, n); %vectorul dat de cerinta

s = zeros(1, m); %vectorul de sume initializat cu toate valorile 0

for i = 1:m
    p = randperm(n); %numere de la 1 la 100 amestecate
    s(i) = sum(x(p));
end

format long 
disp(s)

x_sortat = sort(x);
rez = sum(x_sortat);
disp(rez)
%sortez vectorul pentru a nu avea erori in adunarea numerelor