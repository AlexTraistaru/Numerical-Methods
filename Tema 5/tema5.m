numar = 3;
aprox_init = numar;
v = zeros(1, 100);
v(1) = 1;
toleranta = 1e-7;
for i = 1 : 100
    aprox_urm = 0.5 * (aprox_init + numar / aprox_init);
    v (i + 1) = aprox_urm;
    if abs(aprox_init - aprox_urm) < toleranta
        break;
    end
    aprox_init = aprox_urm;
end
aprox_urm
sqrt(numar)

figure;
plot(1 : i, v(1 : i), '-o');
title(['Convergenta']);
xlabel('Iteratiile');
ylabel('Aproximarile');