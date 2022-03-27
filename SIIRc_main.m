% This is the code for the SIIRc model
% This is a straightforward extension of compartmental SIR
% relies on SIIRc.m

%% Params
t0 = 0;
tf = 25;
tspan = [t0 tf];
S0 = 100;
I10 = 1;
I20 = 5;
R0 = 0;
U0 = [S0,I10,I20,R0];

r1 = 0.010;
r2 = 0.005;
a1 = 0.2;
a2 = 0.2;

PLOTBOOL = 1; % plot at all?
LEG_PLOT = 1; % legend
LEGNAMES = ["S","I_1","I_2","R"];
POP_BOOL = [1,1,1,1]; % which populations
% which parameters do you want to include?
PARAMPLOT = [0, ... % S0
             1, ... % I10
             1, ... % I20
             0, ... % R0
             0, ... % r1
             0, ... % r2
             0, ... % a1
             0];    % a2
PARAM = [U0(1),U0(2),U0(3),U0(4), ...
          r1, r2, a1, a2];
PARAMstr = ["S(0)", "I_1(0)", "I_2(0)", "R(0)", ...
            "r_1", "r_2", "a_1", "a_2"];
TITSTRING = "Compartmentalized SIIR (SIIRc) Model";


%% Solve
[t,U] = ode45(@(t,U) SIIRc(t,U,r1,r2,a1,a2), tspan, U0);

%% Plot
if PLOTBOOL
    hold on
    
    for i = 1:4
        if POP_BOOL(i)
            plot(t,U(:,i))
        end
    end
    
    if LEG_PLOT; legend(LEGNAMES); end
    title(TITSTRING)

    % TODO subtitstring for params

    hold off

end