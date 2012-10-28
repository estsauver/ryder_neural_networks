clc;
clear;
close all;
global K_m K_i v F F_0 X_actual S_actual

%Parameters
K_m = 0.25;  %dim/less
K_i = 1.0;   %dim/less
v   = 1;     %dim/less

%Feed
F   = 0.6*v; %L/h
F_0 = F;


%Initial Conditions
S_0 = 0.5; %dim/less
X_0 = 0.5; %dim/less

Y0(1) = X_0;
Y0(2) = S_0;

options = odeset('NonNegative',[1 2]);
[T, Y] = ode45('diffFerm', [0 10], Y0, options);

X_actual = Y(:,1);
S_actual = Y(:,2);

dXdT = diff(X_actual)./diff(T);
dSdT = diff(S_actual)./diff(T);



