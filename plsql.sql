
CREATE OR REPLACE FUNCTION calculate_bmi(
    p_weight IN NUMBER,
    p_height IN NUMBER
) RETURN NUMBER
IS
    v_bmi NUMBER;
BEGIN

    v_bmi := p_weight / POWER(p_height / 100, 2);
    RETURN v_bmi;
END calculate_bmi;
/


CREATE OR REPLACE PROCEDURE display_user_bmi(
    p_user_id IN NUMBER
)
IS
    v_username VARCHAR2(50);
    v_weight NUMBER;
    v_height NUMBER;
    v_bmi NUMBER;
BEGIN

    SELECT Username, Weight, Height
    INTO v_username, v_weight, v_height
    FROM Users
    WHERE UserID = p_user_id;


    v_bmi := calculate_bmi(v_weight, v_height);


    DBMS_OUTPUT.PUT_LINE('BMI for user ' || v_username || ': ' || v_bmi);
END display_user_bmi;
/

BEGIN
    display_user_bmi(3); -- Provide the desired User
END;
/
