%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'GarciaCicco_et_al_2010';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('GarciaCicco_et_al_2010.log');
M_.exo_names = 'eps_a';
M_.exo_names_tex = '{\varepsilon_a}';
M_.exo_names_long = 'eps_a';
M_.exo_names = char(M_.exo_names, 'eps_g');
M_.exo_names_tex = char(M_.exo_names_tex, '{\varepsilon_g}');
M_.exo_names_long = char(M_.exo_names_long, 'eps_g');
M_.exo_names = char(M_.exo_names, 'eps_nu');
M_.exo_names_tex = char(M_.exo_names_tex, '{\varepsilon_\nu}');
M_.exo_names_long = char(M_.exo_names_long, 'eps_nu');
M_.exo_names = char(M_.exo_names, 'eps_mu');
M_.exo_names_tex = char(M_.exo_names_tex, '{\varepsilon_\mu}');
M_.exo_names_long = char(M_.exo_names_long, 'eps_mu');
M_.exo_names = char(M_.exo_names, 'eps_s');
M_.exo_names_tex = char(M_.exo_names_tex, '{\varepsilon_s}');
M_.exo_names_long = char(M_.exo_names_long, 'eps_s');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'invest');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'invest');
M_.endo_names = char(M_.endo_names, 'tb');
M_.endo_names_tex = char(M_.endo_names_tex, 'tb');
M_.endo_names_long = char(M_.endo_names_long, 'tb');
M_.endo_names = char(M_.endo_names, 'mu_c');
M_.endo_names_tex = char(M_.endo_names_tex, '{MU_C}');
M_.endo_names_long = char(M_.endo_names_long, 'mu_c');
M_.endo_names = char(M_.endo_names, 'tb_y');
M_.endo_names_tex = char(M_.endo_names_tex, '{\frac{TB}{Y}}');
M_.endo_names_long = char(M_.endo_names_long, 'tb_y');
M_.endo_names = char(M_.endo_names, 'g_y');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta Y}');
M_.endo_names_long = char(M_.endo_names_long, 'g_y');
M_.endo_names = char(M_.endo_names, 'g_c');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta C}');
M_.endo_names_long = char(M_.endo_names_long, 'g_c');
M_.endo_names = char(M_.endo_names, 'g_invest');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta I}');
M_.endo_names_long = char(M_.endo_names_long, 'g_invest');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, '{g}');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, '{r}');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'mu');
M_.endo_names_tex = char(M_.endo_names_tex, '{\mu}');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, '{\nu}');
M_.endo_names_long = char(M_.endo_names_long, 'nu');
M_.endo_names = char(M_.endo_names, 's');
M_.endo_names_tex = char(M_.endo_names_tex, '{s}');
M_.endo_names_long = char(M_.endo_names_long, 's');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = '{\beta}';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, '{\gamma}');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, '{\psi}');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, '{\omega}');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, '{\theta}');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, '{\phi}');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'dbar');
M_.param_names_tex = char(M_.param_names_tex, '{\bar d}');
M_.param_names_long = char(M_.param_names_long, 'dbar');
M_.param_names = char(M_.param_names, 'gbar');
M_.param_names_tex = char(M_.param_names_tex, '{\bar g}');
M_.param_names_long = char(M_.param_names_long, 'gbar');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_a}');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_g}');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_\nu}');
M_.param_names_long = char(M_.param_names_long, 'rho_nu');
M_.param_names = char(M_.param_names, 'rho_mu');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_\mu}');
M_.param_names_long = char(M_.param_names_long, 'rho_mu');
M_.param_names = char(M_.param_names, 'rho_s');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_s}');
M_.param_names_long = char(M_.param_names_long, 'rho_s');
M_.param_names = char(M_.param_names, 's_share');
M_.param_names_tex = char(M_.param_names_tex, '{sshare}');
M_.param_names_long = char(M_.param_names_long, 's_share');
M_.param_names = char(M_.param_names, 'S');
M_.param_names_tex = char(M_.param_names_tex, '{S}');
M_.param_names_long = char(M_.param_names_long, 'S');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 18;
M_.param_nbr = 17;
M_.orig_endo_nbr = 18;
M_.aux_vars = [];
M_.predetermined_variables = [ 2 5 ];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('GarciaCicco_et_al_2010_static');
erase_compiled_function('GarciaCicco_et_al_2010_dynamic');
M_.orig_eq_nbr = 18;
M_.eq_nbr = 18;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 11 0;
 2 12 29;
 3 13 30;
 0 14 31;
 4 15 0;
 5 16 0;
 6 17 0;
 0 18 0;
 0 19 32;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 7 24 33;
 0 25 0;
 8 26 0;
 9 27 0;
 10 28 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 7;
M_.nboth   = 3;
M_.nsfwrd   = 5;
M_.nspred   = 10;
M_.ndynamic   = 12;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(18, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(17, 1);
M_.NNZDerivatives = [76; -1; -1];
M_.params( 10 ) = 1.001;
gbar = M_.params( 10 );
M_.params( 12 ) = 0.323027844166870;
rho_g = M_.params( 12 );
M_.params( 11 ) = 0.864571930755821;
rho_a = M_.params( 11 );
M_.params( 8 ) = 4.810804146604144;
phi = M_.params( 8 );
M_.params( 13 ) = 0.850328786147732;
rho_nu = M_.params( 13 );
M_.params( 15 ) = 0.205034667802314;
rho_s = M_.params( 15 );
M_.params( 14 ) = 0.906802888826967;
rho_mu = M_.params( 14 );
M_.params( 2 ) = 2;
gamma = M_.params( 2 );
M_.params( 3 ) = 1.03;
delta = M_.params( 3 );
M_.params( 4 ) = 0.32;
alpha = M_.params( 4 );
M_.params( 6 ) = 1.6;
omega = M_.params( 6 );
M_.params( 7 ) = 1.4*M_.params(6);
theta = M_.params( 7 );
M_.params( 1 ) = 0.98;
beta = M_.params( 1 );
M_.params( 9 ) = 0.007;
dbar = M_.params( 9 );
M_.params( 5 ) = 2.867166241970346;
psi = M_.params( 5 );
M_.params( 16 ) = 0.10;
s_share = M_.params( 16 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.033055089525252)^2;
M_.Sigma_e(2, 2) = (0.010561526060797)^2;
M_.Sigma_e(3, 3) = (0.539099453618175)^2;
M_.Sigma_e(4, 4) = (0.057195449717680)^2;
M_.Sigma_e(5, 5) = (0.018834174505537)^2;
options_.irf = 40;
options_.loglinear = 1;
options_.order = 1;
var_list_ = char('g_y','g_c','g_invest','tb_y','y','c','r');
info = stoch_simul(var_list_);
fprintf('%30s \t %5s   \t %5s   \t %5s   \t %5s   \n',' ','g_y','g_c','g_inv','TB/Y')
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Standard Deviations:',sqrt(diag(oo_.var))*100)
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Correlation with g_y:',oo_.gamma_y{1,1}(strmatch('g_y',var_list_,'exact'),:)./sqrt(oo_.gamma_y{1,1}(strmatch('g_y',var_list_,'exact'),strmatch('g_y',var_list_,'exact')))./sqrt(diag(oo_.gamma_y{1,1}))')
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','First Order Autocorr.:',diag(oo_.autocorr{1,1}))
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Second Order Autocorr.:',diag(oo_.autocorr{1,2}))
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Third Order Autocorr.:',diag(oo_.autocorr{1,3}))
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Fourth Order Autocorr.:',diag(oo_.autocorr{1,4}))
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Correlation with TB/Y:',oo_.gamma_y{1,1}(strmatch('tb_y',var_list_,'exact'),:)./sqrt(oo_.gamma_y{1,1}(strmatch('tb_y',var_list_,'exact'),strmatch('tb_y',var_list_,'exact')))./sqrt(diag(oo_.gamma_y{1,1}))')
    [data_mat,data_header]=xlsread('data_peru_trimestral.xls',1,'G2:J154');
    %sqrt(0.06*var(data_mat)); prior bounds
    figure('Name','Figure 5: Autocorrelation Function - Peru')
    tby_data=data_mat(:,strcmp('tb_y',data_header));
    plot((1:4),[corr(tby_data(2:end-3),tby_data(1:end-4)),corr(tby_data(3:end-2),tby_data(1:end-4)),corr(tby_data(4:end-1),tby_data(1:end-4)),corr(tby_data(5:end),tby_data(1:end-4))],'b-')
    hold on
    tb_pos=strmatch('tb_y',var_list_,'exact');
    plot((1:4),[oo_.autocorr{1,1}(tb_pos,tb_pos) oo_.autocorr{1,2}(tb_pos,tb_pos) oo_.autocorr{1,3}(tb_pos,tb_pos) oo_.autocorr{1,4}(tb_pos,tb_pos)],'r-.')
    xlabel('Lags')
    legend('Data','Model')
fprintf('%30s \t %5s   \t %5s   \t %5s   \t %5s   \n',' ','g_y','g_c','g_inv','TB/Y')
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Non-stationary TFP:',[oo_.variance_decomposition(strmatch('g_y',var_list_,'exact'),strmatch('eps_g',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_c',var_list_,'exact'),strmatch('eps_g',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_invest',var_list_,'exact'),strmatch('eps_g',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('tb_y',var_list_,'exact'),strmatch('eps_g',M_.exo_names,'exact'))])
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Stationary TFP:',[oo_.variance_decomposition(strmatch('g_y',var_list_,'exact'),strmatch('eps_a',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_c',var_list_,'exact'),strmatch('eps_a',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_invest',var_list_,'exact'),strmatch('eps_a',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('tb_y',var_list_,'exact'),strmatch('eps_a',M_.exo_names,'exact'))])
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Preference:',[oo_.variance_decomposition(strmatch('g_y',var_list_,'exact'),strmatch('eps_nu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_c',var_list_,'exact'),strmatch('eps_nu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_invest',var_list_,'exact'),strmatch('eps_nu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('tb_y',var_list_,'exact'),strmatch('eps_nu',M_.exo_names,'exact'))])
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Country Premium:',[oo_.variance_decomposition(strmatch('g_y',var_list_,'exact'),strmatch('eps_mu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_c',var_list_,'exact'),strmatch('eps_mu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_invest',var_list_,'exact'),strmatch('eps_mu',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('tb_y',var_list_,'exact'),strmatch('eps_mu',M_.exo_names,'exact'))])
fprintf('%30s \t %5.4f \t %5.4f \t %5.4f \t %5.4f \n','Ex. Spending:',[oo_.variance_decomposition(strmatch('g_y',var_list_,'exact'),strmatch('eps_s',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_c',var_list_,'exact'),strmatch('eps_s',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('g_invest',var_list_,'exact'),strmatch('eps_s',M_.exo_names,'exact')),oo_.variance_decomposition(strmatch('tb_y',var_list_,'exact'),strmatch('eps_s',M_.exo_names,'exact'))])    
save('GarciaCicco_et_al_2010_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('GarciaCicco_et_al_2010_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 2 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
