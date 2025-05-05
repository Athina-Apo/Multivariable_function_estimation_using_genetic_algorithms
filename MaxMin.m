%Pairno to megisto kai to elaxisto tis f
function [max,min] = MaxMin
    max = f(-1,-2);
    min = f(-1,-2);
    for i = linspace(-1, 2, 100)
        for j = linspace(-2, 1, 100)
            if f(i,j)<min
                min = f(i,j);
            end
            if f(i,j)>max
                max = f(i,j);
            end
        end
    end
end
            

   