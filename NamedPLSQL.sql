delimiter //
CREATE OR REPLACE PROCEDURE proc_Grade (p_name IN VARCHAR2,p_total_marks IN NUMBER) 
IS
    v_class VARCHAR2(20);
BEGIN
    IF p_total_marks BETWEEN 990 AND 1500 THEN
        v_class := 'Distinction';
    ELSIF p_total_marks BETWEEN 900 AND 989 THEN
        v_class := 'First Class';
    ELSIF p_total_marks BETWEEN 825 AND 899 THEN
        v_class := 'Higher Second Class';
    ELSE
        v_class := 'No Category';
    END IF;

    INSERT INTO Result (Roll, Name, Class)
    VALUES ((SELECT NVL(MAX(Roll), 0) + 1 FROM Result), p_name, v_class);
END;
//

-- PL/SQL block to use the procedure
DECLARE
    v_name VARCHAR2(50);
    v_total_marks NUMBER;
BEGIN
    
    --sample values
    v_name := 'John Doe';
    v_total_marks := 950;

    proc_Grade(v_name, v_total_marks); --function call

END;
//
delimiter ;