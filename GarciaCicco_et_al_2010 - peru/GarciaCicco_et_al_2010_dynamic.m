function [residual, g1, g2, g3] = GarciaCicco_et_al_2010_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(18, 1);
RSTAR__ = 1/params(1)*params(10)^params(2);
T39 = y(11)-params(7)/params(6)*y(14)^params(6);
T41 = T39^(-params(2));
T53 = params(8)/2;
T76 = (y(14)*y(24))^(1-params(4));
T85 = y(24)^params(2);
T86 = params(1)/T85;
T95 = y(24)^(1-params(4));
T96 = y(13)*(1-params(4))*T95;
T206 = T53*(y(24)*y(12)/y(2)-params(10))^2;
T214 = y(2)^params(4);
T223 = (y(2)/y(14))^params(4);
T230 = (y(33)*y(31)/y(12))^(1-params(4));
T235 = y(33)*params(8)*y(29)/y(12);
T237 = y(29)/y(12)*y(33)-params(10);
T242 = 1-params(3)+params(4)*y(30)*T230+T235*T237-T53*T237^2;
lhs =y(25);
rhs =exp(y(26)-1)+RSTAR__+params(5)*(exp(y(4)-params(9))-1)-1;
residual(1)= lhs-rhs;
lhs =y(19);
rhs =y(27)*T41;
residual(2)= lhs-rhs;
lhs =y(16);
rhs =y(11)+log(y(18))+y(28)+y(17)+y(2)*T206;
residual(3)= lhs-rhs;
lhs =log(y(18));
rhs =y(4)-y(15)*y(24)/y(25);
residual(4)= lhs-rhs;
lhs =y(16);
rhs =T76*y(13)*T214;
residual(5)= lhs-rhs;
lhs =y(17);
rhs =y(12)*y(24)-(1-params(3))*y(2);
residual(6)= lhs-rhs;
lhs =y(19);
rhs =y(25)*T86*y(32);
residual(7)= lhs-rhs;
lhs =params(7)*y(14)^(params(6)-1);
rhs =T96*T223;
residual(8)= lhs-rhs;
lhs =y(19)*(1+params(8)*(y(24)*y(12)/y(2)-params(10)));
rhs =T86*y(32)*T242;
residual(9)= lhs-rhs;
lhs =log(y(20));
rhs =log(y(18))/y(16);
residual(10)= lhs-rhs;
lhs =y(21);
rhs =y(16)/y(5)*y(7);
residual(11)= lhs-rhs;
lhs =y(22);
rhs =y(7)*y(11)/y(1);
residual(12)= lhs-rhs;
lhs =y(23);
rhs =y(7)*y(17)/y(6);
residual(13)= lhs-rhs;
lhs =log(y(13));
rhs =params(11)*log(y(3))+x(it_, 1);
residual(14)= lhs-rhs;
lhs =log(y(24)/params(10));
rhs =params(12)*log(y(7)/params(10))+x(it_, 2);
residual(15)= lhs-rhs;
lhs =log(y(27));
rhs =params(13)*log(y(9))+x(it_, 3);
residual(16)= lhs-rhs;
lhs =log(y(26));
rhs =params(14)*log(y(8))+x(it_, 4);
residual(17)= lhs-rhs;
lhs =log(y(28)/params(17));
rhs =params(15)*log(y(10)/params(17))+x(it_, 5);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 38);

  %
  % Jacobian matrix
  %

T250 = getPowerDeriv(T39,(-params(2)),1);
T260 = 2*(y(24)*y(12)/y(2)-params(10));
T272 = getPowerDeriv(y(2)/y(14),params(4),1);
T290 = getPowerDeriv(y(33)*y(31)/y(12),1-params(4),1);
T339 = getPowerDeriv(y(14)*y(24),1-params(4),1);
T408 = (-(params(1)*getPowerDeriv(y(24),params(2),1)))/(T85*T85);
  g1(1,4)=(-(params(5)*exp(y(4)-params(9))));
  g1(1,25)=1;
  g1(1,26)=(-exp(y(26)-1));
  g1(2,11)=(-(y(27)*T250));
  g1(2,14)=(-(y(27)*T250*(-(params(7)/params(6)*getPowerDeriv(y(14),params(6),1)))));
  g1(2,19)=1;
  g1(2,27)=(-T41);
  g1(3,11)=(-1);
  g1(3,2)=(-(T206+y(2)*T53*y(24)*(-y(12))/(y(2)*y(2))*T260));
  g1(3,12)=(-(y(2)*T53*T260*y(24)*1/y(2)));
  g1(3,16)=1;
  g1(3,17)=(-1);
  g1(3,18)=(-(1/y(18)));
  g1(3,24)=(-(y(2)*T53*y(12)/y(2)*T260));
  g1(3,28)=(-1);
  g1(4,4)=(-1);
  g1(4,15)=y(24)/y(25);
  g1(4,18)=1/y(18);
  g1(4,24)=y(15)/y(25);
  g1(4,25)=(-(y(15)*y(24)))/(y(25)*y(25));
  g1(5,2)=(-(T76*y(13)*getPowerDeriv(y(2),params(4),1)));
  g1(5,13)=(-(T76*T214));
  g1(5,14)=(-(y(13)*T214*y(24)*T339));
  g1(5,16)=1;
  g1(5,24)=(-(y(13)*T214*y(14)*T339));
  g1(6,2)=1-params(3);
  g1(6,12)=(-y(24));
  g1(6,17)=1;
  g1(6,24)=(-y(12));
  g1(7,19)=1;
  g1(7,32)=(-(y(25)*T86));
  g1(7,24)=(-(y(32)*y(25)*T408));
  g1(7,25)=(-(T86*y(32)));
  g1(8,2)=(-(T96*1/y(14)*T272));
  g1(8,13)=(-(T223*(1-params(4))*T95));
  g1(8,14)=params(7)*getPowerDeriv(y(14),params(6)-1,1)-T96*T272*(-y(2))/(y(14)*y(14));
  g1(8,24)=(-(T223*y(13)*(1-params(4))*getPowerDeriv(y(24),1-params(4),1)));
  g1(9,2)=y(19)*params(8)*y(24)*(-y(12))/(y(2)*y(2));
  g1(9,12)=y(19)*params(8)*y(24)*1/y(2)-T86*y(32)*(params(4)*y(30)*(-(y(33)*y(31)))/(y(12)*y(12))*T290+T237*y(33)*(-(params(8)*y(29)))/(y(12)*y(12))+T235*y(33)*(-y(29))/(y(12)*y(12))-T53*y(33)*(-y(29))/(y(12)*y(12))*2*T237);
  g1(9,29)=(-(T86*y(32)*(T237*y(33)*params(8)/y(12)+T235*y(33)*1/y(12)-T53*2*T237*y(33)*1/y(12))));
  g1(9,30)=(-(T86*y(32)*params(4)*T230));
  g1(9,31)=(-(T86*y(32)*params(4)*y(30)*T290*y(33)/y(12)));
  g1(9,19)=1+params(8)*(y(24)*y(12)/y(2)-params(10));
  g1(9,32)=(-(T86*T242));
  g1(9,24)=y(19)*params(8)*y(12)/y(2)-T242*y(32)*T408;
  g1(9,33)=(-(T86*y(32)*(params(4)*y(30)*T290*y(31)/y(12)+params(8)*y(29)/y(12)*T237+y(29)/y(12)*T235-T53*y(29)/y(12)*2*T237)));
  g1(10,16)=(-((-log(y(18)))/(y(16)*y(16))));
  g1(10,18)=(-(1/y(18)/y(16)));
  g1(10,20)=1/y(20);
  g1(11,5)=(-(y(7)*(-y(16))/(y(5)*y(5))));
  g1(11,16)=(-(y(7)*1/y(5)));
  g1(11,21)=1;
  g1(11,7)=(-(y(16)/y(5)));
  g1(12,1)=(-(y(7)*(-y(11))/(y(1)*y(1))));
  g1(12,11)=(-(y(7)*1/y(1)));
  g1(12,22)=1;
  g1(12,7)=(-(y(11)/y(1)));
  g1(13,6)=(-(y(7)*(-y(17))/(y(6)*y(6))));
  g1(13,17)=(-(y(7)*1/y(6)));
  g1(13,23)=1;
  g1(13,7)=(-(y(17)/y(6)));
  g1(14,3)=(-(params(11)*1/y(3)));
  g1(14,13)=1/y(13);
  g1(14,34)=(-1);
  g1(15,7)=(-(params(12)*1/params(10)/(y(7)/params(10))));
  g1(15,24)=1/params(10)/(y(24)/params(10));
  g1(15,35)=(-1);
  g1(16,9)=(-(params(13)*1/y(9)));
  g1(16,27)=1/y(27);
  g1(16,36)=(-1);
  g1(17,8)=(-(params(14)*1/y(8)));
  g1(17,26)=1/y(26);
  g1(17,37)=(-1);
  g1(18,10)=(-(params(15)*1/params(17)/(y(10)/params(17))));
  g1(18,28)=1/params(17)/(y(28)/params(17));
  g1(18,38)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,54872);
end
end
end
end
