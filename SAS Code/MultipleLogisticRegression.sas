LIBNAME project "/home/My folders/SAS Project 2023";
/* Multiple Logistic Regression - Full Model */
ods HTML;
PROC LOGISTIC DATA=PROJECT.GROUP_7_TRAIN;
	class Seasons Holiday functioning_day; 
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature 
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day;
run;
ODS HTML CLOSE;

Proc Print data=LogRegStatistics;
run;

/*Using selection techniques*/
/* Multiple Logistic Regression - forward selection model */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN; 
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature 
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day /Selection=forward Slentry=0.05;
run;	

/* Multiple Logistic Regression - backwards selection model */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN;
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature
		  Solar_Radiation Rainfall Snowfall Seasons Holiday functioning_day /Selection=Backward SLE=0.05;
run;	


/* Multiple Logistic Regression - stepwise selection model */
Proc Logistic Data=PROJECT.GROUP_7_TRAIN;
	Class Seasons Holiday Functioning_Day;
	model Rented_Bike_Count(event="1") = Hour Rainfall Snowfall Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature 
		  Solar_Radiation Seasons Holiday functioning_day /Selection=Stepwise SLE=0.05;
run;

