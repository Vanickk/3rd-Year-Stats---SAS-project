LIBNAME project "/home/My folders/SAS Project 2023";

ODS Html;
Proc Print data=project.group_7_train;
run;
ODS HTML close;

Proc MEANS Data= Project.GROUP_7_TRAIN;
	Title "Descriptive Statistics for numeric variables";
	var Temperature Humidity Wind_speed Visibility Dew_point_temperature Solar_radiation Rainfall Snowfall;
RUN;

/*Descriptive Statistics*/
Proc Univariate Data=Project.Group_7_train;
	Title "Descriptive Statistics for numeric variables";
	var Temperature Humidity Wind_speed Visibility Dew_point_temperature Solar_radiation Rainfall Snowfall;
	Histogram;	
RUN;

Proc Freq DATA= Project.GROUP_7_TRAIN;
	title "Descriptive stastistics for categorical variables";
	Tables Rented_bike_count Seasons Holiday functioning_day;
run;

Proc Freq Data=Project.Group_7_train;
	Title "Descriptive Statistics for the rented bikes count variables";
	Tables Rented_bike_count;	
RUN;

proc print data=PROJECT.GROUP_7_TRAIN;
run;
