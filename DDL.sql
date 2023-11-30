CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR (50) NOT NULL UNIQUE,
    EmailID VARCHAR (100) NOT NULL UNIQUE,
    Phone_number INT NOT NULL UNIQUE,
    Gender VARCHAR (10) CHECK (Gender IN ('Male', 'Female')),
    Height DECIMAL (5,2),
    Weight DECIMAL (5,2),
    BIRTHDATE DATE
);



    CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR (150),
    Gender VARCHAR (10) CHECK (Gender IN('MALE','FEMALE','NIL')),
    Date_of_Birth DATE,
    Contact_Number VARCHAR (15),
    Email VARCHAR (100),
    Specialization VARCHAR (50),
    Department VARCHAR (50),
    Medical_Degree VARCHAR (50),
    Years_of_Experience INT,
    License_Number VARCHAR (20)
);




    CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    Hospital_Name VARCHAR (100) NOT NULL,
    Location VARCHAR (100) NOT NULL,
    Contact_Number VARCHAR (15) UNIQUE,
    Email VARCHAR (100) UNIQUE,
    Num_Beds INT CHECK (Num_Beds >= 0),
    Num_Doctors INT CHECK (Num_Doctors >= 0),
    Num_Nurses INT CHECK (Num_Nurses >= 0),
    Num_ICU INT CHECK (NUM_ICU >= 0),
    Website VARCHAR (200) DEFAULT 'N/A'
);

    
    create table Insurance (
    ProviderID number not null constraint insurance_pk primary key,
    Provider_Name varchar2(100) not null,
    Contact_Number varchar2(15),
    Contact_Email varchar2(100),
    Website varchar2(200),
    Coverage_Type varchar2(50),
    Coverage_Description varchar2(4000)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    Medication_Name VARCHAR (100),
    Description VARCHAR (50),
    Dosage_Form VARCHAR (50),
    Manufacturer VARCHAR (100),
    Usage_Instructions VARCHAR (100)
);




CREATE TABLE Medical_Specializations (
    SpecializationID INT PRIMARY KEY,
    Specialization_Name VARCHAR (100) NOT NULL UNIQUE,
    Description VARCHAR (255),
    Parent_SpecializationID INT,
    FOREIGN KEY (Parent_SpecializationID) REFERENCES Medical_Specializations(SpecializationID)
);

CREATE TABLE Vital_Signs( VitalID INT PRIMARY KEY,  
    UserID INT,  
    Date_ DATE NOT NULL,  
    Time_ TIMESTAMP NOT NULL, 
    Heart_Rate INT,  
    Blood_Pressure VARCHAR (20),  
    Temperature DECIMAL (5,2),  
    FOREIGN KEY (UserID) REFERENCES Users (UserID)  
);  


CREATE TABLE Appointments (  
    AppointmentID INT PRIMARY KEY,  
    UserID INT,  
    Date_ DATE NOT NULL,  
    Time_ TIMESTAMP NOT NULL,
    DoctorID INT NOT NULL,
    Doctor VARCHAR (100) NOT NULL,  
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors (DoctorID)
);  



CREATE TABLE Medical_Record (
    RecordID INT PRIMARY KEY,
    UserID INT,
    DateStamp DATE NOT NULL,
    Condition VARCHAR (100) NOT NULL,
    Diagnosis VARCHAR (255),
    Medications VARCHAR (255),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);




CREATE TABLE Lab_Test(
    ResultID INT PRIMARY KEY,
    PatientID INT,
    Test_Date DATE,
    Test_Type VARCHAR (100),
    Result_Details VARCHAR (100),
    FOREIGN KEY (PatientID) REFERENCES Users (UserID)
);


CREATE TABLE Insurance_Claims (
    ClaimID INT PRIMARY KEY,
    UserID INT,
    InsuranceID INT,
    Claim_Date DATE,
    Claim_Amount DECIMAL (10, 2),
    Claim_Status VARCHAR (50),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurance (ProviderID)
);


CREATE TABLE Receipts (
    ReceiptID INT PRIMARY KEY,
    Payment_Date DATE NOT NULL,
    UserID NUMBER (38) NOT NULL,
    EmailID VARCHAR (100),
    PaymentMethod VARCHAR (50),
    Amount DECIMAL (10, 2) NOT NULL,
    FOREIGN KEY (EmailID) REFERENCES Users (EmailID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);


INSERT INTO Users VALUES(1, 'JohnDoe', 'john.doe@email.com', 1234567890, 'Male', 175.5, 70.2, '15-05-1990');
INSERT INTO Users VALUES(2, 'JaneSmith', 'jane.smith@email.com', 9876543210, 'Female', 160.0, 55.8, '22-08-1985');
INSERT INTO Users VALUES(3, 'BobJohnson', 'bob.johnson@email.com', 5556667777, 'Male', 182.3, 80.5, '10-11-1982');
INSERT INTO Users VALUES(4, 'AliceWhite', 'alice.white@email.com', 3334445555, 'Female', 168.7, 63.0, '03-03-1995');
INSERT INTO Users VALUES(5, 'ChrisBrown', 'chris.brown@email.com', 1112223333, 'Male', 178.9, 75.2, '18-07-1988');

INSERT INTO Doctors VALUES(1, 'Dr. Smith', 'MALE', '28-02-1975', '555-1234', 'dr.smith@email.com', 'Cardiology', 'Cardiology Department', 'MD, Cardiology', 15, 'MD12345');
INSERT INTO Doctors VALUES(2, 'Dr. Johnson', 'FEMALE', '15-07-1980', '555-5678', 'dr.johnson@email.com', 'Pediatrics', 'Pediatrics Department', 'MD, Pediatrics', 12, 'MD67890');
INSERT INTO Doctors VALUES(3, 'Dr. Davis', 'NIL', '03-11-1968', '555-9876', 'dr.davis@email.com', 'Orthopedics', 'Orthopedics Department', 'MD, Orthopedics', 20, 'MD54321');
INSERT INTO Doctors VALUES(4, 'Dr. White', 'MALE', '12-04-1972', '555-5432', 'dr.white@email.com', 'Dermatology', 'Dermatology Department', 'MD, Dermatology', 18, 'MD09876');
INSERT INTO Doctors VALUES(5, 'Dr. Brown', 'FEMALE', '20-08-1975', '555-8765', 'dr.brown@email.com', 'Ophthalmology', 'Ophthalmology Department', 'MD, Ophthalmology', 10, 'MD13579');


INSERT INTO Hospitals VALUES(1, 'City General Hospital', 'Cityville', '555-1111', 'info@cityhospital.com', 300, 50, 100, 20, 'www.cityhospital.com');
INSERT INTO Hospitals VALUES(2, 'Suburb Medical Center', 'Suburbia', '555-2222', 'info@suburbmedical.com', 200, 30, 70, 15, 'www.suburbmedical.com');
INSERT INTO Hospitals VALUES(3, 'Rural Health Clinic', 'Rural Town', '555-3333', 'info@ruralclinic.com', 100, 15, 40, 10, 'www.ruralclinic.com');
INSERT INTO Hospitals VALUES(4, 'Metro Health Institute', 'Metropolis', '555-4444', 'info@metrohealth.com', 500, 80, 150, 30, 'www.metrohealth.com');
INSERT INTO Hospitals VALUES(5, 'Coastal Wellness Center', 'Coastal City', '555-5555', 'info@coastalwellness.com', 400, 60, 120, 25, 'www.coastalwellness.com');


INSERT INTO Insurance VALUES(1, 'HealthGuard Insurance', '888-1111', 'info@healthguard.com', 'www.healthguard.com', 'Health', 'Comprehensive health coverage with various plans');
INSERT INTO Insurance VALUES(2, 'SafeCare Insurance', '888-2222', 'info@safecare.com', 'www.safecare.com', 'Health', 'Affordable health plans with focus on preventive care');
INSERT INTO Insurance VALUES(3, 'SureShield Insurance', '888-3333', 'info@sureshield.com', 'www.sureshield.com', 'Life', 'Life insurance policies with flexible terms');
INSERT INTO Insurance VALUES(4, 'SecurePlus Insurance', '888-4444', 'info@secureplus.com', 'www.secureplus.com', 'Auto', 'Auto insurance for all vehicle types');
INSERT INTO Insurance VALUES(5, 'HomeGuard Insurance', '888-5555', 'info@homeguard.com', 'www.homeguard.com', 'Home', 'Home insurance covering property and belongings');


INSERT INTO Medications VALUES(1, 'Aspirin', 'Pain reliever', 'Tablet', 'Bayer', 'Take with water after meals');
INSERT INTO Medications VALUES(2, 'Amoxicillin', 'Antibiotic', 'Capsule', 'Pfizer', 'Take as directed by the physician');
INSERT INTO Medications VALUES(3, 'Lisinopril', 'Blood pressure medication', 'Tablet', 'Novartis', 'Once daily with or without food');
INSERT INTO Medications VALUES(4, 'Simvastatin', 'Cholesterol-lowering drug', 'Tablet', 'Merck', 'Take in the evening with food');
INSERT INTO Medications VALUES(5, 'Levothyroxine', 'Thyroid hormone replacement', 'Tablet', 'AbbVie', 'Take on an empty stomach before breakfast');


INSERT INTO Medical_Specializations VALUES(1, 'Cardiology', 'Specializing in heart-related issues', NULL);
INSERT INTO Medical_Specializations VALUES(2, 'Pediatrics', 'Specializing in the health of children', NULL);
INSERT INTO Medical_Specializations VALUES(3, 'Orthopedics', 'Specializing in bone and joint health', NULL);
INSERT INTO Medical_Specializations VALUES(4, 'Dermatology', 'Specializing in skin conditions', NULL);
INSERT INTO Medical_Specializations VALUES(5, 'Ophthalmology', 'Specializing in eye care', NULL);


INSERT INTO Vital_Signs VALUES (1, 1, '15-01-2023', NULL, 75, '120/80', 98.6);
INSERT INTO Vital_Signs VALUES (2, 2, '20-02-2023', NULL, 82, '118/75', 98.2);
INSERT INTO Vital_Signs VALUES (3, 3, '10-03-2023', NULL, 68, '130/85', 97.9);
INSERT INTO Vital_Signs VALUES (4, 4, '05-04-2023', NULL, 90, '110/70', 99.0);
INSERT INTO Vital_Signs VALUES (5, 5, '12-05-2023', NULL, 78, '125/80', 98.8);


INSERT INTO Appointments VALUES (1, 1, '20-01-2023', NULL, 1, 'Dr. Smith');
INSERT INTO Appointments VALUES (2, 2,'25-02-2023', NULL, 2, 'Dr. Johnson');
INSERT INTO Appointments VALUES (3, 3, '15-03-2023', NULL, 3, 'Dr. Davis');
INSERT INTO Appointments VALUES (4, 4, '10-04-2023', NULL, 4, 'Dr. White');
INSERT INTO Appointments VALUES (5, 5, '18-05-2023', NULL, 5, 'Dr. Brown');


INSERT INTO Medical_Record VALUES (1, 1, '25-01-2023', 'Headache', 'Stress-related headache', 'Aspirin');
INSERT INTO Medical_Record VALUES (2, 2, '28-02-2023', 'Ear Infection', 'Bacterial ear infection', 'Amoxicillin');
INSERT INTO Medical_Record VALUES (3, 3, '20-03-2023', 'Back Pain', 'Muscle strain', 'Pain relievers, Physical therapy');
INSERT INTO Medical_Record VALUES (4, 4, '15-04-2023', 'Skin Rash', 'Allergic reaction', 'Antihistamines, Topical cream');
INSERT INTO Medical_Record VALUES (5, 5, '22-05-2023', 'Vision Checkup', 'Nearsightedness', 'Prescription eyeglasses');



INSERT INTO Lab_Test VALUES (1, 1, '30-01-2023', 'Blood Test', 'Normal blood parameters');
INSERT INTO Lab_Test VALUES (2, 2, '05-03-2023', 'Urine Test', 'No signs of infection');
INSERT INTO Lab_Test VALUES (3, 3, '25-04-2023', 'X-Ray', 'No fractures detected');
INSERT INTO Lab_Test VALUES (4, 4, '18-05-2023', 'Skin Allergy Test', 'Positive for pollen allergy');
INSERT INTO Lab_Test VALUES (5, 5, '10-06-2023', 'Eye Exam', 'Nearsightedness confirmed');


INSERT INTO Insurance_Claims VALUES (1, 1, 1, '05-02-2023', 500.00, 'Pending');
INSERT INTO Insurance_Claims VALUES (2, 2, 2, '12-03-2023', 750.00, 'Approved');
INSERT INTO Insurance_Claims VALUES (3, 3, 3, '30-04-2023', 1200.00, 'Denied');
INSERT INTO Insurance_Claims VALUES (4, 4, 4,'25-05-2023', 1000.00, 'Processing');
INSERT INTO Insurance_Claims VALUES (5, 5, 5,'15-06-2023', 800.00, 'Approved');

INSERT INTO Receipts VALUES (1, '10-02-2023', 1, 'john.doe@email.com', 'Credit Card', 150.00);
INSERT INTO Receipts VALUES (2, '18-03-2023', 2, 'jane.smith@email.com', 'Cash', 200.00);
INSERT INTO Receipts VALUES (3, '02-05-2023', 3, 'bob.johnson@email.com', 'Check', 300.00);
INSERT INTO Receipts VALUES (4, '20-06-2023', 4, 'alice.white@email.com', 'PayPal', 250.00);
INSERT INTO Receipts VALUES (5, '05-07-2023', 5, 'chris.brown@email.com', 'Credit Card', 180.00);


--DELETE STATEMENT IMPLEMENTATION--
-- Insert User into Users Table
INSERT INTO Users VALUES (6, 'dummy_user', 'dummy@email.com', 1234567890, 'Male', 175.0, 70.0,'01-01-1990');
INSERT INTO Vital_Signs VALUES (6, 6, '01-01-2023', NULL, 80, '130/85', 98.0);

SELECT * FROM Vital_Signs;

DELETE FROM Vital_Signs WHERE VitalID = 6;

SELECT * FROM Vital_Signs;

--DELETE STATEMENT IMPLEMENTATION--

INSERT INTO Appointments VALUES (6, 1, '22-01-2023', NULL, 1, 'Dr. Smith');
INSERT INTO Lab_Test VALUES (6, 3, '10-07-2023', 'Blood Test', 'Abnormal blood parameters');
INSERT INTO Medical_Record VALUES (6, 2, '30-06-2023', 'Fever', 'Viral infection', 'Antipyretics');
INSERT INTO Receipts VALUES (6, '15-07-2023', 4, 'john.white@email.com', 'Credit Card', 120.00);



SELECT * FROM Appointments;
SELECT * FROM Lab_Test;
SELECT * FROM Medical_Record;
SELECT * FROM Receipts;

--UPADATE STATEMENT IMPLEMENTATION--
UPDATE Appointments SET Doctor = 'Dr. Johnson' WHERE AppointmentID = 6;
UPDATE Lab_Test SET Result_Details = 'Normal blood parameters' WHERE ResultID = 6;
UPDATE Medical_Record SET Diagnosis = 'Allergic reaction' WHERE RecordID = 6;
UPDATE Receipts SET PaymentMethod = 'Debit Card' WHERE ReceiptID = 6;


-- Delete Operations--
DELETE FROM Appointments WHERE UserID = 1 AND Date_ = '22-01-2023';
DELETE FROM Lab_Test WHERE PatientID = 3;
DELETE FROM Medical_Record WHERE Condition = 'Fever';
DELETE FROM Receipts WHERE ReceiptID = 6;






