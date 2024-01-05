LIBNAME project "/home/u60921783/My folders/SAS Project 2023";

/*Correlation Analysis between all continous variables*/
Proc Corr Data=Project.group_7_train;
	TITLE "Correlation analysis between continous variables";
	var Hour Temperature Humidity Wind_Speed Visibility 
		Dew_point_Temperature Solar_Radiation Rainfall Snowfall;
run;

/*Correlation Analysis between Seasons and Rented Bike Count*/
Proc Freq DATA=PROJECT.group_7_train;
	Tables Seasons * Rented_bike_count / CHISQ;

run;

/*Correlation Analysis between Holiday and Rented Bike Count*/
Proc Freq DATA=PROJECT.group_7_train;
	Tables Holiday* Rented_bike_count / CHISQ;

run;

/*Correlation Analysis between Functioning Day and Rented Bike Count*/
Proc Freq DATA=PROJECT.group_7_train;
	Tables Functioning_Day * Rented_bike_count / CHISQ;

run;

/*Point Biserial correlation analysis between a continous and categorical variable*/
/* Sample SAS code for point-biserial correlation analysis */
/* Perform simple logistic regression */
PROC LOGISTIC DATA=PROJECT.group_7_train;
   MODEL Rented_Bike_Count(Event='1') = Temperature / LINK=LOGIT;
RUN;


