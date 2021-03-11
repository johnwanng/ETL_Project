-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/xwo0CW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Vehicles" (
    "Accident_Index" varchar25   NOT NULL,
    "Age_Band_of_Driver" VARCHAR30   NOT NULL,
    "Age_of_Vehicle" VARCHAR2   NOT NULL,
    "Hit_Object_in_Carriageway" VARCHAR50   NOT NULL,
    "Hit_Object_off_Carriageway" VARCHAR50   NOT NULL,
    "make" VARCHAR30   NOT NULL,
    "model" VARCHAR50   NOT NULL,
    "Sex_of_Driver" VARCHAR10   NOT NULL,
    "Skidding_and_Overturning" VARCHAR30   NOT NULL,
    "Towing_and_Articulation" VARCHAR40   NOT NULL,
    "Vehicle_Manoeuvre" VARCHAR50   NOT NULL,
    "Vehicle_Type" VARCHAR50   NOT NULL,
    "Was_Vehicle_Left_Hand_Drive" VARCHAR5   NOT NULL,
    "Year" INT4   NOT NULL,
    CONSTRAINT "pk_Vehicles" PRIMARY KEY (
        "Accident_Index"
     )
);

CREATE TABLE "Accident" (
    "Accident_Index" VARCHAR25   NOT NULL,
    "Date" VARCHAR20   NOT NULL,
    "Day_of_Week" VARCHAR10   NOT NULL,
    "Light_Conditions" VARCHAR40   NOT NULL,
    "Local_Authority_(District)" VARCHAR40   NOT NULL,
    "Number_of_Casualties" INT3   NOT NULL,
    "Number_of_Vehicles" INT3   NOT NULL,
    "Pedestrian_Crossing-Human_Control" INT3   NOT NULL,
    "Pedestrian_Crossing-Physical_Facilities" INT3   NOT NULL,
    "Road_Surface_Conditions" VARCHAR30   NOT NULL,
    "Road_Type" VARCHAR30   NOT NULL,
    "Special_Conditions_at_Site" VARCHAR70   NOT NULL,
    "Time" VARCHAR5   NOT NULL,
    "Year" VARCHAR4   NOT NULL,
    "Month" VARCHAR10   NOT NULL,
    CONSTRAINT "pk_Accident" PRIMARY KEY (
        "Accident_Index"
     )
);

CREATE TABLE "Weather" (
    "year" INT4   NOT NULL,
    "month" INT2   NOT NULL,
    "tmax" FLOAT   NOT NULL,
    "tmin" FLOAT   NOT NULL,
    "af" INT2   NOT NULL,
    "rain" FLOAT   NOT NULL,
    "sun" FLOAT   NOT NULL,
    "station" VARCHAR20   NOT NULL
);

ALTER TABLE "Accident" ADD CONSTRAINT "fk_Accident_Accident_Index" FOREIGN KEY("Accident_Index")
REFERENCES "Vehicles" ("Accident_Index");

ALTER TABLE "Accident" ADD CONSTRAINT "fk_Accident_Year_Month" FOREIGN KEY("Year", "Month")
REFERENCES "Weather" ("year", "month");

