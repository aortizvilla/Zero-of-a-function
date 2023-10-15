% El mètode de la Secant calcula el zero de la funció fun a l'interval 
% [a,b] on es troba l'arrel, a < b.
% 1) tol és la tolerància.
% 2) itmax és el nombre màxim d'iterats permesos.

% Els paràmetres de sortida són:
% 1) xk és el vector amb les aproximacions successives del zero.
% 2) res és el vector que conté els residus pel mètode de la Secant.
% 3) it és el nombre d'iteracions del mètode que s'han dut a terme. 

function [xk, res, it] = secant(a, b, tol, itmax, fun)
    xk = zeros(itmax,1);
    res = zeros(itmax, 1);
    xk(1) = a;
    res(1) = fun(a);
    xk(2) = b;
    res(2) = fun(b);
    it = 2;
    % La iteració s'atura quan superem el màxim d'iterats permesos o bé
    % quan abs(xn - xn-1) < tolerància:
    while(it < itmax + 1 & (it == 2 | abs(xk(it) - xk(it-1)) >= tol))
        xk(it + 1) = xk(it) - fun(xk(it))*(xk(it) - xk(it - 1))/(fun(xk(it)) - fun(xk(it - 1)));
        res(it + 1) = fun(xk(it + 1));
        it = it + 1;
    end
    
    if (it >= itmax + 1)
        fprintf ("No hi ha convergència del mètode de la Secant ");
    end
end