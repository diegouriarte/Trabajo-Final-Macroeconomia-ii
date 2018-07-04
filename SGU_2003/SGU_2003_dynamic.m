function [residual, g1, g2, g3] = SGU_2003_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(13, 1);
T31 = params(9)/2*(exp(y(9))-exp(y(1)))^2;
T38 = exp(y(10))*exp(y(1))^params(8);
T42 = exp(y(6))^(1-params(8));
T62 = exp(y(6))^params(2);
T67 = (exp(y(5))-T62/params(2))^(-params(1));
T70 = exp(y(6))^(params(2)-1);
T91 = params(14)*exp(y(20))*(1+params(8)*exp(y(18))/exp(y(9))-params(5)+params(9)*(exp(y(19))-exp(y(9))));
T124 = params(2)^(-1);
T126 = exp(y(5))-T62*T124;
lhs =y(13);
rhs =(1+exp(y(4)))*y(3)-exp(y(7))+exp(y(5))+exp(y(8))+T31;
residual(1)= lhs-rhs;
lhs =exp(y(7));
rhs =T38*T42;
residual(2)= lhs-rhs;
lhs =exp(y(9));
rhs =exp(y(8))+exp(y(1))*(1-params(5));
residual(3)= lhs-rhs;
lhs =exp(y(11));
rhs =params(14)*(1+exp(y(16)))*exp(y(20));
residual(4)= lhs-rhs;
lhs =T67;
rhs =exp(y(11));
residual(5)= lhs-rhs;
lhs =T67*T70;
rhs =exp(y(7))*(1-params(8))*exp(y(11))/exp(y(6));
residual(6)= lhs-rhs;
lhs =exp(y(11))*(1+params(9)*(exp(y(9))-exp(y(1))));
rhs =T91;
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(3)*y(2)+params(4)*x(it_, 1);
residual(8)= lhs-rhs;
lhs =exp(y(16));
rhs =params(12)+y(17);
residual(9)= lhs-rhs;
lhs =y(17);
rhs =params(7)*(exp(y(13)-params(13))-1);
residual(10)= lhs-rhs;
lhs =y(14);
rhs =1-(T31+exp(y(5))+exp(y(8)))/exp(y(7));
residual(11)= lhs-rhs;
lhs =y(15);
rhs =1/exp(y(7))*(y(3)-y(13));
residual(12)= lhs-rhs;
lhs =y(12);
rhs =(T126^(1-params(1))-1)/(1-params(1));
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 21);

  %
  % Jacobian matrix
  %

T133 = getPowerDeriv(exp(y(5))-T62/params(2),(-params(1)),1);
T138 = getPowerDeriv(T126,1-params(1),1);
T147 = exp(y(6))*getPowerDeriv(exp(y(6)),params(2),1);
T150 = T133*(-(T147/params(2)));
T167 = (-(exp(y(7))*(1-params(8))*exp(y(11))/exp(y(6))));
T184 = params(9)/2*(-exp(y(1)))*2*(exp(y(9))-exp(y(1)));
T197 = params(9)/2*exp(y(9))*2*(exp(y(9))-exp(y(1)));
  g1(1,5)=(-exp(y(5)));
  g1(1,7)=exp(y(7));
  g1(1,8)=(-exp(y(8)));
  g1(1,1)=(-T184);
  g1(1,9)=(-T197);
  g1(1,3)=(-(1+exp(y(4))));
  g1(1,13)=1;
  g1(1,4)=(-(exp(y(4))*y(3)));
  g1(2,6)=(-(T38*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(8),1)));
  g1(2,7)=exp(y(7));
  g1(2,1)=(-(T42*exp(y(10))*exp(y(1))*getPowerDeriv(exp(y(1)),params(8),1)));
  g1(2,10)=(-(T38*T42));
  g1(3,8)=(-exp(y(8)));
  g1(3,1)=(-(exp(y(1))*(1-params(5))));
  g1(3,9)=exp(y(9));
  g1(4,11)=exp(y(11));
  g1(4,20)=(-(params(14)*(1+exp(y(16)))*exp(y(20))));
  g1(4,16)=(-(exp(y(20))*params(14)*exp(y(16))));
  g1(5,5)=exp(y(5))*T133;
  g1(5,6)=T150;
  g1(5,11)=(-exp(y(11)));
  g1(6,5)=T70*exp(y(5))*T133;
  g1(6,6)=T70*T150+T67*exp(y(6))*getPowerDeriv(exp(y(6)),params(2)-1,1)-(-(exp(y(6))*exp(y(7))*(1-params(8))*exp(y(11))))/(exp(y(6))*exp(y(6)));
  g1(6,7)=T167;
  g1(6,11)=T167;
  g1(7,18)=(-(params(14)*exp(y(20))*params(8)*exp(y(18))/exp(y(9))));
  g1(7,1)=exp(y(11))*params(9)*(-exp(y(1)));
  g1(7,9)=exp(y(11))*params(9)*exp(y(9))-params(14)*exp(y(20))*((-(exp(y(9))*params(8)*exp(y(18))))/(exp(y(9))*exp(y(9)))+params(9)*(-exp(y(9))));
  g1(7,19)=(-(params(14)*exp(y(20))*params(9)*exp(y(19))));
  g1(7,11)=exp(y(11))*(1+params(9)*(exp(y(9))-exp(y(1))));
  g1(7,20)=(-T91);
  g1(8,2)=(-params(3));
  g1(8,10)=1;
  g1(8,21)=(-params(4));
  g1(9,16)=exp(y(16));
  g1(9,17)=(-1);
  g1(10,13)=(-(params(7)*exp(y(13)-params(13))));
  g1(10,17)=1;
  g1(11,5)=exp(y(5))/exp(y(7));
  g1(11,7)=(-(exp(y(7))*(T31+exp(y(5))+exp(y(8)))))/(exp(y(7))*exp(y(7)));
  g1(11,8)=exp(y(8))/exp(y(7));
  g1(11,1)=T184/exp(y(7));
  g1(11,9)=T197/exp(y(7));
  g1(11,14)=1;
  g1(12,7)=(-((y(3)-y(13))*(-exp(y(7)))/(exp(y(7))*exp(y(7)))));
  g1(12,3)=(-(1/exp(y(7))));
  g1(12,13)=1/exp(y(7));
  g1(12,15)=1;
  g1(13,5)=(-(exp(y(5))*T138/(1-params(1))));
  g1(13,6)=(-(T138*(-(T124*T147))/(1-params(1))));
  g1(13,12)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,441);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,9261);
end
end
end
end
