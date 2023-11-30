SELECT UserID, Username
FROM Users u
WHERE EXISTS (SELECT 1 FROM Appointments a WHERE a.UserID = u.UserID)AND EXISTS (
        SELECT 1 FROM Medical_Record m WHERE m.UserID = u.UserID);

SELECT UserID, Username FROM Users u
WHERE EXISTS (
        SELECT 1 FROM Insurance_Claims ic WHERE ic.UserID = u.UserID);

SELECT UserID, Username FROM Users u WHERE 
    EXISTS (SELECT 1 FROM Lab_Test lt WHERE lt.PatientID = u.UserID);


SELECT UserID, Username FROM Users u WHERE 
    EXISTS (SELECT 1 FROM Receipts r WHERE r.UserID = u.User);


