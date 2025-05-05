n_gaussian = 15;
n_population = 50;
generation = 1;
maxGen = 10000;
mikos = n_gaussian*5;
population = zeros(n_population,mikos+1);
genes = zeros(1,mikos);
[f_max, f_min] = MaxMin;
u1_min = -1;
u1_max = 2;
u2_min = -2;
u2_max = 1;
c1_max = u1_max+1;
c1_min = u1_min-1;
c2_max = u2_max+1;
c2_min = u2_min-1;
s_max = 1.1;
s_min = 0.3;
k = 1;
fit_max = zeros(1,10000);


[f_max, f_min] = MaxMin;



for j = 1:n_population
    for i = 1:mikos
        switch mod(i,5)
            case 1
                genes(i) = f_min + (f_max - f_min)*rand;
            case 2
                genes(i) = c1_min + (c1_max - c1_min)*rand;
            case 3
                genes(i) = c2_min + (c2_max - c2_min)*rand;
            case 4
                genes(i) = s_min + (s_max - s_min)*rand;
            case 0
                genes(i) = s_min + (s_max - s_min)*rand;
        end


    end
    population(j, 1:mikos) = genes;
    
    % ypologizo tin fitness gia kathe atomo tou plithismou
    fitness = fit(genes, mikos);
    population(j, mikos + 1) = fitness;
end

best = population(50,1:end);
sorted_population = sortrows(population, mikos + 1);
while(k<maxGen&&best(mikos+1)<250)
    sorted_population = sortrows(population, mikos + 1);
    

    [selected,prob] = selection(population,n_population);
    

    [crossed] = crossover(selected,n_population); %kano diastavrosi
    crossed(1:10,:) = sorted_population(41:end,:);%kratao ta deka kalitera apo ton proigoumeno plithismo
    

population(:,:) = crossed(:,:);
%kano metalaxi
for w = 1:8
    index = randi(n_population);
    population(index,:) = mutation(population(index,:),mikos);
end

for j = 1:n_population
    fitness = fit(population(j,:), mikos);
    population(j, mikos + 1) = fitness;
end


population = sortrows(population, mikos + 1);
best = population(50,1:end);
fit_max(k) = best(end);


k = k+1;
end


figure;
plot(1:k, fit_max(1:k));
title('Best fitness function in each generation');
xlabel('Generation');
ylabel('Fitness');

u1_values = linspace(-1, 2, 100); 
u2_values = linspace(-2, 1, 100);


[u1, u2] = meshgrid(u1_values, u2_values);

% ypologismos tis timis tis sinartisis gia diafora u1 kai u2
value = zeros(size(u1));
for i = 1:numel(u1)
    value(i) = f_gausians(u1(i), u2(i), best(1:end-1), mikos);
end


value = reshape(value, size(u1));

% emfanisi tou grafimatos
figure;
surf(u1, u2, value);
title('f\_gausians(u1, u2) Surface Plot');
xlabel('u1');
ylabel('u2');
zlabel('Function Value');




