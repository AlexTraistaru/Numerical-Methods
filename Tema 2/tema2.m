n = input('Introduceti n: ');
%am folosit functia input pentru a i da utilizatorului libertatea de a
%alege ce n vrea
coeficienti = poly(1:n);
%functia poly calculeaza coeficientii unui polinom cu radacinile pe care i
%le precizez in paranteza. In cazul nostru radacinile sunt de la 1 la n,
%adica 1:n
radacini = roots(coeficienti);
%vectorul radacini retine radacinile unui polinom cu coeficientii precizati
%in paranteze. In cazul nostru ne folosim de coeficientii calculati
%anterior

disp('coeficientii: ');
format long
disp(coeficienti);
disp('radacinile: ');
disp(radacini);