-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xwo0CW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Vehicles" (
    "Accident_Index" varchar   NOT NULL,
    "Age_Band_of_Driver" VARCHAR   NOT NULL,
    "Age_of_Vehicle" VARCHAR   NOT NULL,
    "Hit_Object_in_Carriageway" VARCHAR   NOT NULL,
    "Hit_Object_off_Carriageway" VARCHAR   NOT NULL,
    "make" VARCHAR   NOT NULL,
    "model" VARCHAR   NOT NULL,
    "Sex_of_Driver" VARCHAR   NOT NULL,
    "Skidding_and_Overturning" VARCHAR   NOT NULL,
    "Towing_and_Articulation" VARCHAR   NOT NULL,
    "Vehicle_Manoeuvre" VARCHAR   NOT NULL,
    "Vehicle_Type" VARCHAR   NOT NULL,
    "Was_Vehicle_Left_Hand_Drive" VARCHAR   NOT NULL,
    "Year" INT   NOT NULL,
    CONSTRAINT "pk_Vehicles" PRIMARY KEY (
        "Accident_Index"
     )
);

CREATE TABLE "Accident" (
    "Accident_Index" Int   NOT NULL,
    "Date" VARCHAR   NOT NULL,
    "Day_of_Week" VARCHAR   NOT NULL,
    "Light_Conditions" VARCHAR   NOT NULL,
    "Local_Authority_(District)" VARCHAR   NOT NULL,
    "Number_of_Casualties" VARCHAR   NOT NULL,
    "Number_of_Vehicles" varchar   NOT NULL,
    "Pedestrian_Crossing-Human_Control" VARCHAR   NOT NULL,
    "Pedestrian_Crossing-Physical_Facilities" VARCHAR   NOT NULL,
    "Road_Surface_Conditions" VARCHAR   NOT NULL,
    "Road_Type" VARCHAR   NOT NULL,
    "Special_Conditions_at_Site" VARCHAR   NOT NULL,
    "Time" VARCHAR   NOT NULL,
    "Year" VARCHAR   NOT NULL,
    "Month" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Accident" PRIMARY KEY (
        "Accident_Index"
     )
);

CREATE TABLE "Weather" (
    "year" VARCHAR   NOT NULL,
    "month" VARCHAR   NOT NULL,
    "tmax" INT   NOT NULL,
    "tmin" INT   NOT NULL,
    "af" INT   NOT NULL,
    "rain" INT   NOT NULL,
    "sun" INT   NOT NULL,
    "station" INT   NOT NULL
);

ALTER TABLE "Accident" ADD CONSTRAINT "fk_Accident_Accident_Index" FOREIGN KEY("Accident_Index")
REFERENCES "Vehicles" ("Accident_Index");

ALTER TABLE "Accident" ADD CONSTRAINT "fk_Accident_Year_Month" FOREIGN KEY("Year", "Month")
REFERENCES "Weather" ("year", "month");

