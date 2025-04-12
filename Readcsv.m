% Read the CSV file
data = csvread('density_1000.csv');

% Extract columns
x = data(:, 1);
y = data(:, 2);
z = data(:, 3);  % density

% Create a grid from scattered data
% This assumes x, y, z are in vector form
% You may need to adjust grid size (here using 200x200 as example)
xlin = linspace(min(x), max(x), 200);
ylin = linspace(min(y), max(y), 200);
[X, Y] = meshgrid(xlin, ylin);
Z = griddata(x, y, z, X, Y, 'linear');

% Plot the surface
figure;
surf(X, Y, Z);
shading interp;
colormap jet;
colorbar;
title('Density Distribution');
xlabel('X');
ylabel('Y');
zlabel('Density');

% Adjust the view angle
view(0, 90); % Top-down view

% Save the figure as JPEG
print('density_plot.jpg', '-djpeg');

