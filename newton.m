% El mètode de Newton calcula el zero de la funció fun proper a
% un valor donat:
% 1) x0 és l'aproximació inicial del zero que busquem.
% 2) tol és la tolerància.
% 3) itmax és el nombre màxim d'iterats permesos.
% 4) dfun és la derivada de la funció fun.

% Els paràmetres de sortida són:
% 1) xk és el vector amb les aproximacions successives del zero.
% 2) res és el vector que conté els residus pel mètode de Newton.
% 3) it és el nombre d'iteracions del mètode que s'han dut a terme. 

function [xk, res, it] = newton(x0, tol, itmax, fun, dfun)
    xk = zeros(itmax,1);
    res = zeros(itmax,1);
    xk(1) = x0; 
    res(1) = fun(x0);
    it = 1;
    % La iteració s'atura quan superem el màxim d'iterats permesos o bé
    % quan abs(xn - xn-1) < tolerància:
    while(it < itmax & (it == 1 | abs(xk(it) - xk(it - 1)) >= tol))
        it = it + 1;
        xk(it) = xk(it-1) - fun(xk(it - 1))/dfun(xk(it - 1));
        res(it) = fun(xk(it));
    end

    if (it >= itmax)
        fprintf ("No hi ha convergència del mètode de Newton ");
    end
end
