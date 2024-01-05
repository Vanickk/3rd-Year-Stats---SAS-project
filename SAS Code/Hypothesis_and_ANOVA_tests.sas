LIBNAME project "/home/u60921783/My folders/SAS Project 2023";

/* ANOVA on Full Multiple Logistic Regression Model*/;
PROC Glm DATA=PROJECT.GROUP_7_TRAIN;
	class Seasons Holiday functioning_day; 
	model Rented_Bike_Count = Hour Temperature Humidity Wind_Speed Visibility Dew_Point_Temperature Solar_Radiation Rainfall 
		  Snowfall Seasons Holiday functioning_day;
RUN;
