function crossed = crossover(population, n_population)
    crossed = zeros(n_population, size(population, 2));
    
    for i = 1:n_population
        parent1 = population(randi([1, n_population]), :); % Tyxaia epilogi parent 1
        parent2 = population(randi([1, n_population]), :); % Tyxaia epilogi parent 2
        
        for j = 1:(size(population, 2)-1)
            crossed(i, j) = (parent1(j) + parent2(j)) / 2; % Mesos oros gonidion
        end
        
       
    end
end
          