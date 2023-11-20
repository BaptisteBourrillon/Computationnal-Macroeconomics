%====================================================================
%  Computation Macro 2023; Midterm Exam 
% Task 1; Exercise 9; 
% Baptiste Bourrillon; 
%====================================================================
%====================================================================
%% This mod file does an TFP shock and plots it; note that the file"EX1_BOURRILLON_MODEL.mod" and the matlable function "do_plots"
%% are used it follows that those file must  DL by the user.

%% Copy and past to excecute the file : dynare EX1_BOURRILLON_TFP_SHOCK %%
%======================================================================
@#include "EX1_BOURRILLON_MODEL.mod" 
% "EX1_BOURRILLON_MODEL.mod"  include a steady command 
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% TFP Shock %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
shocks; 
var eps_a; 
periods 1;
values -0.04;
end;
% note that the shock is a surprise as it occurs on impact 
%%%%%%%%%%%%%% check everything is correctly set up%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% perfect_foresight_setup(periods=4); % check everything is correctly set up   
% oo_.exo_simul; 
% oo_.endo_simul;
%%%%%%%%%%%%%%%%%%%%%%%%%%% actual simulation %%%M%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
perfect_foresight_setup(periods=300);
perfect_foresight_solver;
%% ploting 
do_plots("One Period TFP shock on impact ",40,oo_,M_)
