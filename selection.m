function [selected, prob] = selection(population, n_population)
    value = 0;
    prob = zeros(1, n_population);
    
    
    for j = 1:n_population
        value = value + population(j, end); % i teleftaia stili einai i timi tis fitness
    end
    
    
    for i = 1:n_population
        if i == 1
            prob(i) = population(i, end) / value;
        else
            prob(i) = prob(i - 1) + population(i, end) / value;
        end
    end
    
     selected = zeros(n_population, size(population, 2)); 
    
    for i = 1:n_population
        x = rand;
        for j = 1:n_population
            if j == 1
                if x < prob(j)
                    selected(i, :) = population(j, :);
                    break;
                end
            elseif x > prob(j - 1) && x < prob(j)
                selected(i, :) = population(j, :);
                break;
            end
        end
    end
end

 