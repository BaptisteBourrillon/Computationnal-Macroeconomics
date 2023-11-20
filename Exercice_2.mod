%====================================================================
%  Computation Macro 2023; Midterm Exam 
% Task 2; Exercize 3; 
% Baptiste Bourrillon; 
%====================================================================
%====================================================================
%% This mod file is an attempt to implement actual mit shock; 
%note that "Auray_Eyquem_2019_plots"  and "Auray_Eyquem_2019"  
%% are used it follows that those file must  DL by the user.

%% Copy and past to excecute the file : dynare Exercise_2%%
%======================================================================
@#include "Auray_Eyquem_2019.mod"

shocks; 
var eps_war; 
periods 1:5;
values 1;
end;

%%%%%%%%%%%%%% check everything is correctly set up%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% perfect_foresight_setup(periods=6); % check everything is correctly set up   
% oo_.exo_simul; 
% oo_.endo_simul;
%%%%%%%%%%%%%% Actual shock %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
perfect_foresight_setup(periods=500);
perfect_foresight_solver;
 Auray_Eyquem_2019_plots(oo_,M_)  %  ploting 