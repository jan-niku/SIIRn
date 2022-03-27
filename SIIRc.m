% This is the odefn for compartmental SIIR
% This file is used in SIIRc_main.m

function dUdt = SIIRc(t,U,r1,r2,a1,a2)
    dUdt = zeros(4,1);
    dUdt(1) = -r1*U(1)*U(2) - r2*U(1)*U(3); % S
    dUdt(2) = r1*U(1)*U(2) - a1*U(2); % I1
    dUdt(3) = r2*U(1)*U(3) - a2*U(3); % I2
    dUdt(4) = a1*U(2) + a2*U(3);
end