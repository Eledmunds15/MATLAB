%Initial varialble settings: length of the axes, number of points, etc
a = 1; %Semi-major axis length
b = 0.2; %Semi-minor axis length
N = 100; %Number of plot points for each half of the ellipse;

grid on
xlabel('x')
ylabel('y')
axis([-a a -b b])

%Call of the function asigning its output to the variables x, y1 and y2

[x, y1, y2] = ellipse(a, b, N)

%Plot the ellipse looking after the graphics and clarity of the plot. 

f1=figure(1)
plot(x, y1, 'r', x, y2, 'r')

%Append the function used at the end.

function [x, y1, y2]=ellipse(a, b, N)
    x = linspace(-a, a, N);
    y1 = sqrt(1 - x.^2/a)*b;
    y2 = -y1;

end