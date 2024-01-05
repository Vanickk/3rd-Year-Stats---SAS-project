LIBNAME project "/home/My folders/SAS Project 2023";

Proc Logistic data= Project.group_7_train plots=ROC;
	Title "Simple Logistic regression model for Temperature vs. Rented_Bike_Count";
	model Rented_Bike_Count(event="1") = Temperature;
run;
