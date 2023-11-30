--inner join--
SELECT Appointments.AppointmentID, Users.Username AS Patient, Doctors.Name AS Doctor, Appointments.Date_, Appointments.Time_
FROM Appointments
INNER JOIN Users ON Appointments.UserID = Users.UserID
INNER JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID;

-- Left Join--
SELECT Users.UserID, Users.Username, Medical_Record.DateStamp, Medical_Record.Condition, Medical_Record.Diagnosis, Medical_Record.Medications
FROM Users
LEFT JOIN Medical_Record ON Users.UserID = Medical_Record.UserID;

-- Full Outer Join --
SELECT Users.UserID, Users.Username, Appointments.Date_, Appointments.Time_
FROM Users
FULL OUTER JOIN Appointments ON Users.UserID = Appointments.UserID;

-- Cross Join -- 
SELECT Users.Username, Medical_Specializations.Specialization_Name
FROM Users
CROSS JOIN Medical_Specializations;

