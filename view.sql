CREATE VIEW UserSummary AS
SELECT u.UserID, u.Username, u.EmailID, COUNT(DISTINCT a.AppointmentID) AS NumAppointments, COUNT(DISTINCT m.RecordID) AS NumMedicalRecords
FROM Users u
LEFT JOIN Appointments a ON u.UserID = a.UserID
LEFT JOIN Medical_Record m ON u.UserID = m.UserID
GROUP BY u.UserID, u.Username, u.EmailID;

SELECT * FROM USERSUMMARY;