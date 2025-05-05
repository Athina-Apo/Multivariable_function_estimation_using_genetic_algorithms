%Grafima tis f
u1_values = linspace(-1, 2, 100); 
u2_values = linspace(-2, 1, 100);


[u1, u2] = meshgrid(u1_values, u2_values);

z = sin(u1 + u2) .* sin(u2.^2);


figure;
surf(u1, u2, z);
title('Plot of sin(u1 + u2) * sin(u2^2)');
xlabel('u1');
ylabel('u2');
zlabel('Function Value');