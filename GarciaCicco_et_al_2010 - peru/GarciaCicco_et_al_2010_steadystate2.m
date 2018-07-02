function [ys_, params, info] = GarciaCicco_et_al_2010_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(15)=1/params(1)*params(10)^params(2);
    ys_(5)=params(9);
    k_over_gh=((params(10)^params(2)/params(1)-1+params(3))/params(4))^(1/(params(4)-1));
    ys_(4)=(params(10)*(1-params(4))*k_over_gh^params(4)/params(7))^(1/(params(6)-1));
    ys_(2)=ys_(4)*params(10)*k_over_gh;
    ys_(7)=ys_(2)*(params(3)+params(10)-1);
    ys_(6)=ys_(2)^params(4)*(params(10)*ys_(4))^(1-params(4));
    ys_(18)=ys_(6)*params(16);
    params(17)=ys_(18);
    ys_(1)=ys_(6)+ys_(5)*(params(10)/ys_(15)-1)-ys_(18)-ys_(7);
    ys_(8)=ys_(6)-ys_(1)-ys_(18)-ys_(7);
    ys_(10)=ys_(8)/ys_(6);
    ys_(9)=(ys_(1)-params(7)/params(6)*ys_(4)^params(6))^(-params(2));
    ys_(3)=1;
    ys_(14)=params(10);
    ys_(12)=ys_(14);
    ys_(13)=ys_(14);
    ys_(11)=ys_(14);
    ys_(17)=1;
    ys_(16)=1;
    ys_(8)=exp(ys_(8));
    ys_(10)=exp(ys_(10));
    % Auxiliary equations
    check_=0;
end
