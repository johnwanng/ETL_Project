CREATE TABLE Vehicles (
    Accident_Index varchar(25)   NOT NULL,
    Age_Band_of_Driver VARCHAR(50)   ,
    Age_of_Vehicle VARCHAR(10)   ,
    Hit_Object_in_Carriageway VARCHAR(50)   ,
    Hit_Object_off_Carriageway VARCHAR(50)   ,
    make VARCHAR(30)   ,
    model VARCHAR(50)   ,
    Sex_of_Driver VARCHAR(20)   ,
    Skidding_and_Overturning VARCHAR(30)   ,
    Towing_and_Articulation VARCHAR(40)   ,
    Vehicle_Manoeuvre VARCHAR(50)   ,
    Vehicle_Type VARCHAR(50)   ,
    Was_Vehicle_Left_Hand_Drive VARCHAR(10)   ,
    Year INT,
    CONSTRAINT pk_Vehicles PRIMARY KEY (
        Accident_Index
     )
);
​
CREATE TABLE Accident (
    Accident_Index VARCHAR(25) NOT NULL,
    Date DATE,
    Day_of_Week VARCHAR(20)   ,
    Light_Conditions VARCHAR(50)   ,
    Local_Authority_District VARCHAR(40)   ,
    Number_of_Casualties INT   ,
    Number_of_Vehicles INT   ,
    Pedestrian_Crossing_Human_Control INT,
    Pedestrian_Crossing_Physical_Facilities INT,
    Road_Surface_Conditions VARCHAR(40),
    Road_Type VARCHAR(30)   ,
    Special_Conditions_at_Site VARCHAR(100)   ,
    Time VARCHAR(10),
    Year INT,
    Month INT,
    CONSTRAINT pk_Accident PRIMARY KEY (
        Accident_Index
     )
);

CREATE TABLE Weather (
    year INT NOT NULL,
    month INT NOT NULL,
    tmax FLOAT,
    tmin FLOAT,
    af INT,
    rain FLOAT,
    sun FLOAT,
    station VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Weather PRIMARY KEY (
        year,month
     )    
);
​
ALTER TABLE Accident ADD CONSTRAINT fk_Accident_Accident_Index FOREIGN KEY(Accident_Index)
REFERENCES Vehicles (Accident_Index);
​
ALTER TABLE Accident ADD CONSTRAINT fk_Accident_Year_Month FOREIGN KEY(Year, Month)
REFERENCES Weather (year, month);
​


