LIBNAME project "/home/My folders/SAS Project 2023";

ODS Html;
Proc Print data=project.group_7_train;
run;
ODS HTML close;
