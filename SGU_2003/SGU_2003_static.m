function [residual, g1, g2, g3] = SGU_2003_static(y, x, params)
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

residual = zeros( 13, 1);

%
% Model equations
%

T31 = exp(y(6))*exp(y(5))^params(8);
T35 = exp(y(2))^(1-params(8));
T50 = exp(y(2))^params(2);
T55 = (exp(y(1))-T50/params(2))^(-params(1));
T58 = exp(y(2))^(params(2)-1);
T69 = exp(y(7))*params(14)*(1+exp(y(3))*params(8)/exp(y(5))-params(5));
T98 = params(2)^(-1);
T100 = exp(y(1))-T50*T98;
lhs =y(9);
rhs =y(9)*(1+exp(y(12)))-exp(y(3))+exp(y(1))+exp(y(4));
residual(1)= lhs-rhs;
lhs =exp(y(3));
rhs =T31*T35;
residual(2)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(4))+exp(y(5))*(1-params(5));
residual(3)= lhs-rhs;
lhs =exp(y(7));
rhs =exp(y(7))*(1+exp(y(12)))*params(14);
residual(4)= lhs-rhs;
lhs =T55;
rhs =exp(y(7));
residual(5)= lhs-rhs;
lhs =T55*T58;
rhs =exp(y(3))*(1-params(8))*exp(y(7))/exp(y(2));
residual(6)= lhs-rhs;
lhs =exp(y(7));
rhs =T69;
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(3)+params(4)*x(1);
residual(8)= lhs-rhs;
lhs =exp(y(12));
rhs =params(12)+y(13);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =params(7)*(exp(y(9)-params(13))-1);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =1-(exp(y(1))+exp(y(4)))/exp(y(3));
residual(11)= lhs-rhs;
residual(12) = y(11);
lhs =y(8);
rhs =(T100^(1-params(1))-1)/(1-params(1));
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

T107 = getPowerDeriv(exp(y(1))-T50/params(2),(-params(1)),1);
T112 = getPowerDeriv(T100,1-params(1),1);
T121 = exp(y(2))*getPowerDeriv(exp(y(2)),params(2),1);
T124 = T107*(-(T121/params(2)));
T141 = (-(exp(y(3))*(1-params(8))*exp(y(7))/exp(y(2))));
  g1(1,1)=(-exp(y(1)));
  g1(1,3)=exp(y(3));
  g1(1,4)=(-exp(y(4)));
  g1(1,9)=1-(1+exp(y(12)));
  g1(1,12)=(-(y(9)*exp(y(12))));
  g1(2,2)=(-(T31*exp(y(2))*getPowerDeriv(exp(y(2)),1-params(8),1)));
  g1(2,3)=exp(y(3));
  g1(2,5)=(-(T35*exp(y(6))*exp(y(5))*getPowerDeriv(exp(y(5)),params(8),1)));
  g1(2,6)=(-(T31*T35));
  g1(3,4)=(-exp(y(4)));
  g1(3,5)=exp(y(5))-exp(y(5))*(1-params(5));
  g1(4,7)=exp(y(7))-exp(y(7))*(1+exp(y(12)))*params(14);
  g1(4,12)=(-(exp(y(7))*exp(y(12))*params(14)));
  g1(5,1)=exp(y(1))*T107;
  g1(5,2)=T124;
  g1(5,7)=(-exp(y(7)));
  g1(6,1)=T58*exp(y(1))*T107;
  g1(6,2)=T58*T124+T55*exp(y(2))*getPowerDeriv(exp(y(2)),params(2)-1,1)-(-(exp(y(2))*exp(y(3))*(1-params(8))*exp(y(7))))/(exp(y(2))*exp(y(2)));
  g1(6,3)=T141;
  g1(6,7)=T141;
  g1(7,3)=(-(exp(y(7))*params(14)*exp(y(3))*params(8)/exp(y(5))));
  g1(7,5)=(-(exp(y(7))*params(14)*(-(exp(y(5))*exp(y(3))*params(8)))/(exp(y(5))*exp(y(5)))));
  g1(7,7)=exp(y(7))-T69;
  g1(8,6)=1-params(3);
  g1(9,12)=exp(y(12));
  g1(9,13)=(-1);
  g1(10,9)=(-(params(7)*exp(y(9)-params(13))));
  g1(10,13)=1;
  g1(11,1)=exp(y(1))/exp(y(3));
  g1(11,3)=(-(exp(y(3))*(exp(y(1))+exp(y(4)))))/(exp(y(3))*exp(y(3)));
  g1(11,4)=exp(y(4))/exp(y(3));
  g1(11,10)=1;
  g1(12,11)=1;
  g1(13,1)=(-(exp(y(1))*T112/(1-params(1))));
  g1(13,2)=(-(T112*(-(T98*T121))/(1-params(1))));
  g1(13,8)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,2197);
end
end
end
end
