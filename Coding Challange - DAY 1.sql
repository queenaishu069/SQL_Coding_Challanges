-- To create database hospital
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE patients(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(50),
age TINYINT,
gender ENUM("M","F"),
admission_date DATE
);

-- ALTER TABLE - ADD COLUMN
ALTER TABLE patients
ADD COLUMN doctor_assigned VARCHAR(50);

-- ALTER TABLE - MODIFY COLUMN
ALTER TABLE patients
MODIFY COLUMN patient_name VARCHAR(50);
 
TRUNCATE TABLE patients;

DROP TABLE patients;
