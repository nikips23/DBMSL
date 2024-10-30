-- Create the Library_Audit table to store the old values
CREATE TABLE Library_Audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    library_id INT,
    old_value VARCHAR(255),
    operation_type VARCHAR(10),
    operation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a trigger for AFTER UPDATE on the Library table
CREATE TRIGGER before_library_update
AFTER UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (library_id, old_value, operation_type)
    VALUES (OLD.id, OLD.value, 'UPDATE');
END;

-- Create a trigger for AFTER DELETE on the Library table
CREATE TRIGGER before_library_delete
AFTER DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (library_id, old_value, operation_type)
    VALUES (OLD.id, OLD.value, 'DELETE');
END;