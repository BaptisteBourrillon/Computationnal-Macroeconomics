var
    y     ${Y}$        (long_name='output')
    c     ${C}$        (long_name='consumption')
    k     ${K}$        (long_name='capital')
    l     ${L}$        (long_name='labor')
    a     ${A}$        (long_name='productivity')
    r     ${R}$        (long_name='real return on capital')
    w     ${W}$        (long_name='real wage')
    iv    ${I}$        (long_name='investment')
;

varexo
    ea  ${\varepsilon}$   (long_name='Productivity Shock')
;

parameters
    ALPHA  ${\alpha}$     (long_name='Output Elasticity of Capital')
    BETA   ${\beta}$      (long_name='Discount Factor')
    DELTA  ${\delta}$     (long_name='Depreciation Rate')
    RHO    ${\rho}$       (long_name='Persistence technology')
    LSS    ${\bar{L}}$    (long_name='steady-state labor that calibrates $\psi$ endogenously')
    PSI    ${\psi}$       (long_name='labor disutility weight')
    ETAC   ${\eta^C}$     (long_name='CES utility elasticity with respect to consumption')
    ETAL   ${\eta^L}$     (long_name='CES utility elasticity with respect to labor')
;

ALPHA = 0.35;
BETA  = 0.990;
DELTA = 0.025;
RHO   = 0.9;
ETAC  = 2;
ETAL  = 1.5;
LSS   = 1/3;

model;
    [name='Euler equation']
    c^(-ETAC) = BETA*c(+1)^(-ETAC)*(1-DELTA+r(+1));
    [name='labor supply']
    w = - (-PSI*(1-l)^(-ETAL))/(c^(-ETAC));
    [name='labor demand']
    w = (1-ALPHA)*a*(k(-1)/l)^ALPHA;
    [name='capital demand']
    r = ALPHA*a*(k(-1)/l)^(ALPHA-1);
    [name='aggregate supply']
    y = a*k(-1)^ALPHA*l^(1-ALPHA);
    [name='aggregate demand']
    y = c + iv;
    [name='law of motion for capital']
    k = (1-DELTA)*k(-1) + iv;
    [name='law of motion for technology']
    log(a) = RHO*log(a(-1)) + ea;
end;

%% Steady State
steady_state_model;
    a = 1;
    l = LSS;
    r = 1/BETA+DELTA-1;
    K_L = ((ALPHA*a)/r)^(1/(1-ALPHA));    
    w = (1-ALPHA)*a*K_L^ALPHA;
    IV_L = DELTA*K_L;
    Y_L = a*K_L^ALPHA;
    C_L = Y_L - IV_L;
    c = C_L*l;
    iv = IV_L*l;
    k = K_L*l;
    y = Y_L*l;
    PSI = w*(1-l)^ETAL*c^(-ETAC); % endogenous parameter
end;
steady;

shocks;
var ea = 0.1^2;
end;

stoch_simul(order=2,irf=0);