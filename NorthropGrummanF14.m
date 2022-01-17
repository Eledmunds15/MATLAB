%Initialize variables
s = 80; %wing area
b0 = 22; %span at 0 degrees
sweepAngle = [0:1:60]*pi/180;
b = cos(sweepAngle)*b0;

%Aspect ratio calculation
AR = (b.^2)/s

%Mean chord calculation
C_mean = b./AR

%For loop to find minimum difference between C_mean and AR

[minVal, index] = min(abs(AR-C_mean)); %lowest difference between C_mean and AR and index
intersection_lambda = sweepAngle(index)*180/pi %get sweepAngle with lowest difference between C_mean and AR

%Plotting AR and C_Mean against angle
f1 = figure(1)
plot(sweepAngle, AR, 'r', sweepAngle, C_mean, 'b');

%Graph settings
xlabel('Sweep Angle')
ylabel('Distances')
legend('Aspect Ratio', 'C_mean')