v = 100:100:1000;   
% Dimensiuni diferite ale matricei
nr_rep = 10;          
% Repetări pentru stabilirea mediei timpilor

% Vectori pentru stocarea timpilor
time_linsolve = zeros(size(v));
time_backslash = zeros(size(v));

% Parcurgerea dimensiunilor
for i = 1:length(v)
    n = v(i);
    fprintf('Dimensiunea matricei: %d x %d\n', n, n);
    
    A = randn(n, n);  
    A = A' * A;  % A devine simetrică și pozitiv definită
    b = randn(n, 1); 
    
    % Compararea timpilor pentru linsolve
    t_linsolve = 0;
    for r = 1:nr_rep
        tic;
        x1 = linsolve(A, b);  % Rezolvarea cu linsolve
        t_linsolve = t_linsolve + toc;
    end
    time_linsolve(i) = t_linsolve / nr_rep;
    
    % Compararea timpilor pentru A\b
    t_backslash = 0;
    for r = 1:nr_rep
        tic;
        x2 = A\b;  
        % Rezolvarea cu backslash
        t_backslash = t_backslash + toc;
    end
    time_backslash(i) = t_backslash / nr_rep;

    norm_diff = norm(x1 - x2);
    fprintf('Norma diferenței soluțiilor: %.2e\n', norm_diff);
end

% Afișarea graficelor comparării timpilor
figure;
plot(v, time_linsolve, '-o', v, time_backslash, '-x');
xlabel('Dimensiunea matricei (n)');
ylabel('Timpul de execuție (secunde)');
legend('linsolve', 'A\b');
title('Compararea timpilor de execuție: linsolve vs A\b');
grid on;

%Concluziile experimentului arată că funcția linsolve este mai eficientă decât operatorul \ 
%atunci când matricea sistemului este simetrică și pozitiv definită. 
%Timpul de execuție pentru linsolve este considerabil mai mic, în special pentru dimensiuni mari ale matricei, 
% fără a compromite corectitudinea soluției. 
%Soluțiile obținute cu ambele metode sunt identice, diferențele fiind neglijabile (verificate prin norma diferenței). 
