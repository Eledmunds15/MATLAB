mat = readmatrix('P_and_T_sheffield.csv');
tempMat = mat(11:end, 5);
presMat = mat(11:end, 6);

Pressures = reshape(presMat, 24, 8);
Temperatures = reshape(tempMat, 24, 8);
hoursPerDay = 1:1:24;

%Plotting Temperatures
f1=figure()
plot(hoursPerDay, Pressures*10^-2)
title('Pressures Data')
xlabel('Hour of the day')
ylabel('Pressure (hPa)')
grid on

%Plotting Pressures
f2=figure()
plot(hoursPerDay, Temperatures)
title('Temperatures Data')
xlabel('Hour of the day')
ylabel('Temperature (Degrees C)')
grid on

%initializing variables
r = 8.3144598; %universal gas constant
g0 = 9.80665; %acceleration due to gravity
M = 0.0289644; %molar mass of Earth's air
Lb = -0.0065; %Temperature lapse rate
H = 2000; %Height Plot
Hb = 2;%Reference height
Tb = Temperatures + 273; %Temperatures in Kelvin
Pb = Pressures;

%Calculating pressures at 2000m
power = (g0*M)/(r*Lb);
diff = Lb*(H-Hb);
tempMod = Temperatures./(Temperatures+diff);
tempModPower = tempMod.^(power);
P = Pb.*((Tb./(Tb+diff)).^((g0*M)/(r*Lb)))

%Plotting Pressure at 2000m
f3=figure();
plot(hoursPerDay, P*10^(-2))
title('Pressures at 2000m')
xlabel('Hour of the day')
ylabel('Pressures (hPa)')
grid on