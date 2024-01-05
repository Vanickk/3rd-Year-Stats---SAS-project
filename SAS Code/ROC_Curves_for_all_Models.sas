LIBNAME project "/home/My folders/SAS Project 2023";

/* ROC curve for Simple Logistic regression - Full Model */
Proc Logistic data= Project.group_7_train plots=ROC;
	Title "Simple Logistic regression model for Temperature vs. Rented_Bike_Count";
	model Rented_Bike_Count(event="1") = Temperature;
run;

/* ROC curve for Multiple Logistic regression - Full Model */
ods HTML;
PROC LOGISTIC DATA=PROJECT.GROUP_7_TRAIN plots(only) =roc;
	class Seasons Holiday functioning_day; 
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature 
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day;
run;
ODS HTML CLOSE;

/*Using selection techniques*/
/* ROC curve for Multiple Logistic regression - forward selection */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN plots(only) =roc; 
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature 
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day /Selection=forward Slentry=0.05;	
run;	

/* ROC curve for Multiple Logistic regression - backwards selection  */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN plots(only)=roc;
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day /Selection=Backward SLE=0.05;
run;	

/* ROC curve for Multiple Logistic regression - stepwise selection */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN plot(only)=roc;
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Rainfall Snowfall Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature
		  Solar_Radiation Seasons Holiday functioning_day /Selection=Stepwise SLE=0.05;
run;


