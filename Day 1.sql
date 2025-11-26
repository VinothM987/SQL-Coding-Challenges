-- Day-1 Coding Challenge
-- Database Create

create database Hospital;
use Hospital;

-- Question 1: CREATE Table

create table Patients(
PatientID int,
PatientName varchar(50),
Age int,
Gender varchar(10),
AdmissionDate date
);

-- Question 2: ALTER – Add Column

alter table Patients
add column DoctorAssigned varchar(50);

-- Question 3: ALTER – Modify Column

alter table Patients
modify column PatientName varchar(100);

-- Question 4: RENAME Table

rename table Patients to Patient_Info;

-- Question 5: TRUNCATE vs DROP

-- TRUNCATE
truncate table Patient_Info;

-- DROP
drop table Patient_Info;