close all;
g = 32.2; % ft/s^2

%% AIRCRAFT PARAMETERS
W = 2650; % lb
m = W / g;
rho = 2.377e-3; % slug/ft^3
S = 174; % ft^2
J_2 = 1346; % slug/ft^2
c_bar = 4.9; % ft

CL_0 = 0.307;
CL_a = 4.41; % 1/rad
CL_el = 0.43; % 1/rad
CL_ad = 1.7; % 1/rad
CL_q = 3.9; % 1/rad
CL_DM = 0;

CM_0 = 0.04;
CM_a = -0.613; % 1/rad
CM_el = -1.122; % 1/rad
CM_ad = -7.27; % 1/rad
CM_q = -12.4; % 1/rad

C_DM = 0.0223;
CL_DM = 0;
k = 0.0554;

epsilon = 0;
x=0;
e_T = 0;
eta = .7;

%% CASE 1
el = 0;
T=0;
th = 0;
out = sim("newFinalSim.slx", 600);

figure(1)
nexttile;
plot(out.V);
grid on;
ylabel("(ft/s)");
title("Velocity")
set(gca,'FontSize',15)

nexttile
plot(out.alpha);
grid on;
title("Angle of Attack")
set(gca,'FontSize',15)

nexttile
plot(out.gamma);
grid on;
title("Flight Path Angle")
set(gca,'FontSize',15)

nexttile
plot(out.h);
grid on;
ylabel("(ft)");
title("Altitude")
set(gca,'FontSize',15)

figure(2)
plot(out.p.Data, out.h.Data)
ylabel("Altitude Displacement (ft)"); xlabel("Horizontal Displacement (ft)");
title("Trajectory");
grid on;
set(gca,'FontSize',15)

%% CHECKS
ck_alpha_e = (-CM_0 - (CM_el * el)) / CM_a; % C_M(a_e, el) = 0
ck_CL = CL_0 + CL_a * ck_alpha_e + CL_el * el; % eqn. (39)
ck_CD = C_DM + k*(ck_CL - CL_DM)^2; % eqn. (35)
ck_gamma_e = atan(- ck_CD / ck_CL); % eqn. (46)
ck_theta_e = ck_gamma_e + ck_alpha_e; % eqn. (6)
ck_V_e = sqrt(-(2*W*sin(ck_gamma_e)) / (rho*S*ck_CD));
ck_gamma_e = rad2deg(ck_gamma_e);
ck_alpha_e = rad2deg(ck_alpha_e);


%% CASE 2
el = 0.0278;
th = 100;
out = sim("newFinalSim.slx", 600);

figure(7)
plot(out.gamma)
title("el = 0.0278");
set(gca,'FontSize',15)
xlim([450 500]); ylim([-.3 .3]);

figure(3)
nexttile;
plot(out.V);
grid on;
ylabel("(ft/s)");
title("Velocity")
set(gca,'FontSize',15)

nexttile
plot(out.alpha);
grid on;
title("Angle of Attack")
set(gca,'FontSize',15)

nexttile
plot(out.gamma);
grid on;
title("Flight Path Angle")
set(gca,'FontSize',15)

nexttile
plot(out.h);
grid on;
ylabel("(ft)");
title("Altitude")
set(gca,'FontSize',15)

figure(4)
plot(out.p.Data, out.h.Data)
ylabel("Altitude Displacement (ft)"); xlabel("Horizontal Displacement (ft)");
title("Trajectory");
grid on;
set(gca,'FontSize',15)




