Delimiter //
CREATE PROCEDURE merge_data ( IN Roll INT)
BEGIN
	Declare S_Roll INT;
	Declare rcount INT DEFAULT 0;
	Declare t BOOLEAN DEFAULT False;
	
	Declare c1 CURSOR FOR
		SELECT RollNo FROM Students WHERE RollNo = Roll;
	
	Declare CONTINUE HANDLER FOR NOT FOUND 
		SET t = True;
	OPEN c1;
	
	L1 : LOOP	
		FETCH c1 INTO S_Roll;
	
		IF NOT EXISTS (SELECT * FROM N_Students WHERE RollNo = S_Roll) THEN
			INSERT INTO N_Students SELECT * FROM Students WHERE RollNo = S_Roll;
			SET rcount = rcount + 1;
		END IF;
	
		IF (t) THEN
			LEAVE L1;
		END IF;
	END LOOP L1 ;
	
	SELECT CONCAT(rcount, ' Rows Affected.') AS Message ;

END;
//
Delimiter ;