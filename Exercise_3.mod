%====================================================================
%  Computation Macro 2023; Midterm Exam 
% Task 2; Exercise 3; 
% Baptiste Bourrillon; 
%====================================================================
%====================================================================
%% This mod file is an attempt to implement actual mit shock; 
%note that "Auray_Eyquem_2019_plots"  and "Auray_Eyquem_2019"  
%% are used it follows that those file must be  DL by the user.

%% Copy and past to excecute the file : dynare Exercise_3 %%
%======================================================================
@#include "Auray_Eyquem_2019.mod"

% %%generating storage matrix 
% saved_endo=nan(51,6); 
% saved_exo=nan(6,9); 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Initializaton
perfect_foresight_setup(periods=500);
saved_endo(:,1)= oo_.endo_simul(:,1);
saved_exo(1,:)=oo_.exo_simul(1,:); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shock occurring in t = 1%
oo_.exo_simul(2,9)=1;
perfect_foresight_solver;
saved_endo(:,2)= oo_.endo_simul(:,2);
 saved_exo(2,:)=oo_.exo_simul(2,:); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shock occurring in t = 2%
options_.periods=options_.periods-1;
oo_.endo_simul=oo_.endo_simul(:,2:502);
oo_.exo_simul=oo_.exo_simul(2:502,:);
oo_.exo_simul(2,9)=1;
perfect_foresight_solver;
saved_endo(:,3)= oo_.endo_simul(:,2);
  saved_exo(3,:)=oo_.exo_simul(2,:); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shock occurring in t = 3%
 options_.periods=options_.periods-1; 
oo_.endo_simul=oo_.endo_simul(:,2:501);
oo_.exo_simul=oo_.exo_simul(2:501,:);
oo_.exo_simul(2,9)=1;
perfect_foresight_solver;
saved_endo(:,4)= oo_.endo_simul(:,2);
saved_exo(4,:)=oo_.exo_simul(2,:);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shock occurring in t = 4,%
options_.periods=options_.periods-1;
oo_.endo_simul=oo_.endo_simul(:,2:500);
 oo_.exo_simul=oo_.exo_simul(2:500,:);
oo_.exo_simul(2,9)=1;
 perfect_foresight_solver;
saved_endo(:,5)= oo_.endo_simul(:,2);
  saved_exo(5,:)=oo_.exo_simul(2,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shock occurring in t = 5,%
options_.periods=options_.periods-1;
oo_.endo_simul=oo_.endo_simul(:,2:499);
 oo_.exo_simul=oo_.exo_simul(2:499,:);
oo_.exo_simul(2,9)=1;
 perfect_foresight_solver;
saved_endo(:,6)= oo_.endo_simul(:,2);
 saved_exo(6,:)=oo_.exo_simul(2,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %Combine simulations% 
  options_.periods=502;
  oo_.endo_simul=oo_.endo_simul(:,3:498);
  oo_.exo_simul=oo_.exo_simul(3:498,:);
% 
 oo_.endo_simul=[saved_endo, oo_.endo_simul];
oo_.exo_simul=[saved_exo,
               oo_.exo_simul]; 
%% check if we have implemented the shock we want  
% oo_.exo_simul;

%% ploting
 Auray_Eyquem_2019_plots(oo_,M_) 

