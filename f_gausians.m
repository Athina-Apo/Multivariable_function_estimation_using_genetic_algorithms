%Ypologismos tis timis tou grammikou sindiasmou ton Gaussian se ena simeio
function value = f_gausians(u1,u2,genes,mikos)

value = 0;
for i = 1:5:mikos
    A = genes(i);
    c1 = genes(i+1);
    c2 = genes(i+2);
    s1 = genes(i+3);
    s2 = genes(i+4);
    value = value + A * exp(-((u1-c1)^2/(2*s1^2) + (u2-c2)^2/(2*s2^2)));
end
     