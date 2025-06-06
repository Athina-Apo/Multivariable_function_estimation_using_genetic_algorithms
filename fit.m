%fitness funcion
function fitness = fit(genes,mikos)
value = 0;

for u1 = linspace(-1,2,30)
    for u2 = linspace(-2,1,30)
        value = value + (f(u1,u2) - f_gausians(u1,u2,genes,mikos))^2;
    end
end
error = value/900;
fitness = 1/error;

end