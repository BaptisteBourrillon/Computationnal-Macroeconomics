function do_plots(fig_title,irfhorizon,oo_,M_)
% function do_plots(fig_title,irfhorizon,oo_,M_)
% =========================================================================
% creates plots for deterministic simulations 
% -------------------------------------------------------------------------
% INPUTS
% - fig_title    [string]      title of figure
% - irfhorizon   [integer]     number of periods to plot
% - oo_          [structure]   Dynare's output structure containing the results of the simulation
% - M_           [structure]   Dynare's model structure containing information on the model
% -------------------------------------------------------------------------
%%  adapted from  Willi Mutschler's  original "Do_plots" %% 
% this function is used to  plot irf from EX1_BOURRILLON_MODEL  
% Version:  june 1 , 2023
% =========================================================================

%% common settings for plots
col_H = "#7E2F8E";
col_F = "#0072BD";
width_lines = 2;
size_fonts = 16;

%% variable transformation in percentage deviation from steady-state
hat_yHH = 100*(oo_.endo_simul(M_.endo_names=="y",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="y",1) - 1);
hat_cH = 100*(oo_.endo_simul(M_.endo_names=="c",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="c",1) - 1);
hat_pi_annH = 100*(oo_.endo_simul(M_.endo_names=="iv",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="iv",1) - 1);
hat_rnom_annH = 100*(oo_.endo_simul(M_.endo_names=="r",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="r",1) - 1);
hat_tauH = 100*(oo_.endo_simul(M_.endo_names=="k",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="k",1) - 1);
plot_a =  100*(oo_.endo_simul(M_.endo_names=="a",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="a",1) - 1);
hat_w=100*(oo_.endo_simul(M_.endo_names=="w",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="w",1) - 1);
hat_h=100*(oo_.endo_simul(M_.endo_names=="h",2:(irfhorizon+1))./oo_.endo_simul(M_.endo_names=="h",1) - 1);
%% Elasticty is has its actual value and not its deviation 
hat_v=oo_.endo_simul(M_.endo_names=="v",2:(irfhorizon+1))%./oo_.endo_simul(M_.endo_names=="v",1) - 1); 
%% create figure
figure(name=fig_title);
sgtitle(fig_title,'FontSize',size_fonts+2);
%% ploting the different variable 
subplot(3,3,1)
    title('Output')
    hold on;
    plot_hat_yHH = plot(0:(irfhorizon-1), hat_yHH, '-', 'LineWidth',width_lines,'Color',col_H);
     ylabel(sprintf('%% dev. from initial SS\n(in Percentage)'));
    grid on;
    hold off;

subplot(3,3,2)
    title('Consumption')
    hold on;
    plot_hat_cH = plot(0:(irfhorizon-1), hat_cH, '-', 'LineWidth',width_lines,'Color',col_H);
    grid on;
    hold off;

subplot(3,3,3)
    title('Capital');
    hold on;
    plot_hat_tauH = plot(0:(irfhorizon-1), hat_tauH, '-', 'LineWidth',width_lines,'Color',col_H);
    grid on;
    hold off;

subplot(3,3,4)
    title('Investement');
    hold on;
    plot_hat_piH = plot(0:(irfhorizon-1), hat_pi_annH, '-', 'LineWidth',width_lines,'Color',col_H);
     ylabel(sprintf('Dev. from initial SS\n(in percentage)'));
    grid on;
    hold off;

subplot(3,3,5)
    title(' Rental rate');
    hold on;
    plot_hat_rnomH = plot(0:(irfhorizon-1), hat_rnom_annH, '-', 'LineWidth',width_lines,'Color',col_H);
    grid on;
    hold off;

subplot(3,3,6)
    title('Productivity');
    hold on;
    plot_aa = plot(0:(irfhorizon-1), plot_a, '-', 'LineWidth',width_lines,'Color',col_H);
    ylim([-1,1]);
    grid on;
    hold off;

 subplot(3,3,7)
    title('Real wage')
    hold on;
    plot_hat_w = plot(0:(irfhorizon-1), hat_w, '-', 'LineWidth',width_lines,'Color',col_H);
    ylabel(sprintf('%% dev. from initial SS\n(in Percentage)'));
    grid on;
    hold off;
 subplot(3,3,8)
    title('Labor')
    hold on;
    plot_hat_h = plot(0:(irfhorizon-1), hat_h, '-', 'LineWidth',width_lines,'Color',col_H);
    grid on;
    hold off;

 subplot(3,3,9)
    title('Elasticty of substitution')
    hold on;
    plot_hat_v = plot(0:(irfhorizon-1), hat_v, '-', 'LineWidth',width_lines,'Color',col_H);
    ylabel(sprintf("actual elasticity value"));
    grid on;
    hold off;
