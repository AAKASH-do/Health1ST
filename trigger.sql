
CREATE OR REPLACE TRIGGER insert_user
AFTER INSERT ON Users
FOR EACH ROW
DECLARE
    v_username VARCHAR2(50);
BEGIN

    SELECT Username INTO v_username FROM Users WHERE UserID = :NEW.UserID;


    DBMS_OUTPUT.PUT_LINE('New user inserted. Username: ' || v_username);
END insert_user;
/


INSERT INTO Users VALUES (7, 'Aakash P', 'aakash@email.com', 1234567890, 'Male', 180, 75,'01-01-1990');

