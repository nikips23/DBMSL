delimiter //
CREATE PROCEDURE BookFine(roll_new integer, book_new VARCHAR(30))
BEGIN
DECLARE x integer;

DECLARE CONTINUE HANDLER FOR NOT FOUND
BEGIN
    SELECT concat('Roll No: ', roll_new, 'was Not Found') AS NoRecord;
END;

SELECT datediff(curdate(), DateOfIssue) INTO x FROM Borrower WHERE Roll = roll_new;

if(x > 15 && x < 30) then
    INSERT INTO Fine VALUES (roll_new, curdate(), (x*5));
end if;

if(x > 30) then
    INSERT INTO Fine VALUES (roll_new, curdate(), (x*50));
end if;

UPDATE Borrower SET Status = "R" WHERE Roll = roll_new;
END;
//
delimiter ;

