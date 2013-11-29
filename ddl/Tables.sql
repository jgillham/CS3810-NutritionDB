-- Generated by Oracle SQL Developer Data Modeler 3.1.0.691
--   at:        2013-11-19 21:54:25 MST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

ALTER TABLE MealsCourses
    DROP CONSTRAINT MealsCourses_Course_FK;

ALTER TABLE MealsCourses
    DROP CONSTRAINT MealsCourses_Meal_FK;
ALTER TABLE DayPlans
    DROP CONSTRAINT DayPlans_Users_FK;

ALTER TABLE Users
    DROP CONSTRAINT User_PK;
ALTER TABLE Courses
    DROP CONSTRAINT Course_PK;
ALTER TABLE Meals
    DROP CONSTRAINT Meal_PK;


DROP TABLE Attributes;
CREATE TABLE Attributes
    (
     ATTRIBUTE_ID NUMERIC  NOT NULL ,
     NAME VARCHAR (50)
    )
;



DROP TABLE Courses;
CREATE TABLE Courses
    (
     COURSE_ID NUMERIC  NOT NULL ,
     NAME VARCHAR (50) ,
     SERVINGS INTEGER
    )
;



DROP TABLE DayPlans;
CREATE TABLE DayPlans
    (
     "DATE" DATE ,
     USER_ID NUMERIC  NOT NULL
    )
;



DROP TABLE Dietition;
CREATE TABLE Dietition
    (
     USER_ID NUMERIC  NOT NULL , 
     PRESCRIPTION_ID NUMERIC  NOT NULL
    )
;


DROP TABLE Emails;
CREATE TABLE Emails
    (
     ADDRESS VARCHAR (1000) ,
     USER_ID NUMERIC  NOT NULL
    )
;




DROP TABLE Ingredients;
CREATE TABLE Ingredients
    (
     INGREDIENT_ID NUMERIC  NOT NULL ,
     "NAME" VARCHAR (50) ,
     FAT INTEGER ,
     CALORIES INTEGER
    )
;

DROP TABLE IngredientsCourses;
CREATE TABLE IngredientsCourses
    (
     INGREDIENT_ID NUMERIC  NOT NULL ,
     COURSE_ID NUMERIC
    )
;



DROP TABLE Meals;
CREATE TABLE Meals
    (
     MEAL_ID NUMERIC  NOT NULL ,
     NAME VARCHAR (50)
    )
;

DROP TABLE UserSelectedMeals;
CREATE TABLE UserSelectedMeals (
    USER_ID NUMERIC NOT NULL
    ,
    MEAL_ID NUMERIC NOT NULL
    ,
    "DATE" DATE
);




DROP TABLE MealsCourses;
CREATE TABLE MealsCourses
    (
     MEAL_ID NUMERIC  NOT NULL ,
     COURSE_ID NUMERIC  NOT NULL
    )
;




DROP TABLE MealsFoodAttributes;
CREATE TABLE MealsFoodAttributes
    (
     MEAL_ID NUMERIC  NOT NULL ,
     ATTRIBUTE_ID NUMERIC  NOT NULL
    )
;




DROP TABLE Prescription;
CREATE TABLE Prescription
    (
     PRESCIPTION_ID NUMERIC  NOT NULL ,
     "DATE" DATE ,
     USER_ID NUMERIC  NOT NULL
    )
;




DROP TABLE PrescriptionAttributes;
CREATE TABLE PrescriptionAttributes
    (
     PRESCRIPTION_ID NUMERIC  NOT NULL ,
     ATTRIBUTE_ID NUMERIC  NOT NULL
    )
;




DROP TABLE Ratings;
CREATE TABLE Ratings
    (
     MEAL_ID NUMERIC  NOT NULL ,
     USER_ID NUMERIC  NOT NULL ,
     STARS INTEGER
    )
;



DROP TABLE UserType;
CREATE TABLE UserType
    (
     USER_TYPE_ID NUMERIC  NOT NULL
     ,
     NAME VARCHAR (50)  NOT NULL
    )
;


DROP TABLE Users;
CREATE TABLE Users
    (
     USER_ID NUMERIC  NOT NULL ,
     FNAME VARCHAR (50) ,
     LNAME VARCHAR (50) ,
     UNAME VARCHAR (50) ,
     GENDER CHAR (1) ,
     PASSWORD VARCHAR (200),
     USER_TYPE_ID NUMERIC  NOT NULL
    )
;

ALTER TABLE Users
    ADD CONSTRAINT User_PK PRIMARY KEY ( USER_ID );
ALTER TABLE Courses
    ADD CONSTRAINT Course_PK PRIMARY KEY ( COURSE_ID );
ALTER TABLE Meals
    ADD CONSTRAINT Meal_PK PRIMARY KEY ( MEAL_ID );

ALTER TABLE DayPlans
    ADD CONSTRAINT DayPlans_Users_FK FOREIGN KEY ( USER_ID )
     REFERENCES Users( USER_ID );
ALTER TABLE MealsCourses
    ADD CONSTRAINT MealsCourses_Course_FK FOREIGN KEY ( COURSE_ID )
    REFERENCES Courses( COURSE_ID );
ALTER TABLE MealsCourses
    ADD CONSTRAINT MealsCourses_Meal_FK FOREIGN KEY ( MEAL_ID )
    REFERENCES Meals( MEAL_ID );