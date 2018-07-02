function [residual, g1, g2, g3] = GarciaCicco_et_al_2010_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 18, 1);

%
% Model equations
%

RSTAR__ = 1/params(1)*params(10)^params(2);
T39 = y(1)-params(7)/params(6)*y(4)^params(6);
T41 = T39^(-params(2));
T58 = params(8)/2*(y(14)-params(10))^2;
T69 = (y(4)*y(14))^(1-params(4));
T71 = y(2)^params(4);
T81 = y(14)^params(2);
T82 = params(1)/T81;
T90 = y(14)^(1-params(4));
T91 = (1-params(4))*y(3)*T90;
T93 = (y(2)/y(4))^params(4);
T102 = (y(4)*y(14)/y(2))^(1-params(4));
T110 = 1-params(3)+params(4)*y(3)*T102+(y(14)-params(10))*y(14)*y(2)*params(8)/y(2)-T58;
lhs =y(15);
rhs =exp(y(16)-1)+RSTAR__+params(5)*(exp(y(5)-params(9))-1)-1;
residual(1)= lhs-rhs;
lhs =y(9);
rhs =y(17)*T41;
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(1)+log(y(8))+y(18)+y(7)+y(2)*T58;
residual(3)= lhs-rhs;
lhs =log(y(8));
rhs =y(5)-y(5)*y(14)/y(15);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T69*y(3)*T71;
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(2)*y(14)-y(2)*(1-params(3));
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(9)*y(15)*T82;
residual(7)= lhs-rhs;
lhs =params(7)*y(4)^(params(6)-1);
rhs =T91*T93;
residual(8)= lhs-rhs;
lhs =y(9)*(1+params(8)*(y(14)-params(10)));
rhs =y(9)*T82*T110;
residual(9)= lhs-rhs;
lhs =log(y(10));
rhs =log(y(8))/y(6);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(14);
residual(11)= lhs-rhs;
lhs =y(12);
rhs =y(14);
residual(12)= lhs-rhs;
lhs =y(13);
rhs =y(14);
residual(13)= lhs-rhs;
lhs =log(y(3));
rhs =log(y(3))*params(11)+x(1);
residual(14)= lhs-rhs;
lhs =log(y(14)/params(10));
rhs =log(y(14)/params(10))*params(12)+x(2);
residual(15)= lhs-rhs;
lhs =log(y(17));
rhs =log(y(17))*params(13)+x(3);
residual(16)= lhs-rhs;
lhs =log(y(16));
rhs =log(y(16))*params(14)+x(4);
residual(17)= lhs-rhs;
lhs =log(y(18)/params(17));
rhs =log(y(18)/params(17))*params(15)+x(5);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

T156 = getPowerDeriv(T39,(-params(2)),1);
T167 = getPowerDeriv(y(2)/y(4),params(4),1);
T174 = getPowerDeriv(y(4)*y(14)/y(2),1-params(4),1);
T196 = getPowerDeriv(y(4)*y(14),1-params(4),1);
T243 = (-(params(1)*getPowerDeriv(y(14),params(2),1)))/(T81*T81);
T265 = 1/params(10)/(y(14)/params(10));
T282 = 1/params(17)/(y(18)/params(17));
  g1(1,5)=(-(params(5)*exp(y(5)-params(9))));
  g1(1,15)=1;
  g1(1,16)=(-exp(y(16)-1));
  g1(2,1)=(-(y(17)*T156));
  g1(2,4)=(-(y(17)*T156*(-(params(7)/params(6)*getPowerDeriv(y(4),params(6),1)))));
  g1(2,9)=1;
  g1(2,17)=(-T41);
  g1(3,1)=(-1);
  g1(3,2)=(-T58);
  g1(3,6)=1;
  g1(3,7)=(-1);
  g1(3,8)=(-(1/y(8)));
  g1(3,14)=(-(y(2)*params(8)/2*2*(y(14)-params(10))));
  g1(3,18)=(-1);
  g1(4,5)=(-(1-y(14)/y(15)));
  g1(4,8)=1/y(8);
  g1(4,14)=y(5)/y(15);
  g1(4,15)=(-(y(5)*y(14)))/(y(15)*y(15));
  g1(5,2)=(-(T69*y(3)*getPowerDeriv(y(2),params(4),1)));
  g1(5,3)=(-(T69*T71));
  g1(5,4)=(-(y(3)*T71*y(14)*T196));
  g1(5,6)=1;
  g1(5,14)=(-(y(3)*T71*y(4)*T196));
  g1(6,2)=(-(y(14)-(1-params(3))));
  g1(6,7)=1;
  g1(6,14)=(-y(2));
  g1(7,9)=1-y(15)*T82;
  g1(7,14)=(-(y(9)*y(15)*T243));
  g1(7,15)=(-(y(9)*T82));
  g1(8,2)=(-(T91*1/y(4)*T167));
  g1(8,3)=(-(T93*(1-params(4))*T90));
  g1(8,4)=params(7)*getPowerDeriv(y(4),params(6)-1,1)-T91*T167*(-y(2))/(y(4)*y(4));
  g1(8,14)=(-(T93*(1-params(4))*y(3)*getPowerDeriv(y(14),1-params(4),1)));
  g1(9,2)=(-(y(9)*T82*params(4)*y(3)*(-(y(4)*y(14)))/(y(2)*y(2))*T174));
  g1(9,3)=(-(y(9)*T82*params(4)*T102));
  g1(9,4)=(-(y(9)*T82*params(4)*y(3)*T174*y(14)/y(2)));
  g1(9,9)=1+params(8)*(y(14)-params(10))-T82*T110;
  g1(9,14)=y(9)*params(8)-(T110*y(9)*T243+y(9)*T82*(params(4)*y(3)*T174*y(4)/y(2)+y(14)*y(2)*params(8)/y(2)+(y(14)-params(10))*y(2)*params(8)/y(2)-params(8)/2*2*(y(14)-params(10))));
  g1(10,6)=(-((-log(y(8)))/(y(6)*y(6))));
  g1(10,8)=(-(1/y(8)/y(6)));
  g1(10,10)=1/y(10);
  g1(11,11)=1;
  g1(11,14)=(-1);
  g1(12,12)=1;
  g1(12,14)=(-1);
  g1(13,13)=1;
  g1(13,14)=(-1);
  g1(14,3)=1/y(3)-params(11)*1/y(3);
  g1(15,14)=T265-params(12)*T265;
  g1(16,17)=1/y(17)-params(13)*1/y(17);
  g1(17,16)=1/y(16)-params(14)*1/y(16);
  g1(18,18)=T282-params(15)*T282;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,5832);
end
end
end
end
