DROP FUNCTION IF EXISTS classify

DELIMITER //
CREATE FUNCTION classify ( cId INT )
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN
	
    
	DECLARE averageRate REAL;
    DECLARE evaluation VARCHAR(30) DEFAULT "";
	
	SELECT AVG(rate) FROM (
		SELECT rate
		FROM review AS r
		WHERE (rate IS NOT NULL AND r.courseId=cId)
		) AS temp_table
	INTO averageRate;
	
	IF  (averageRate> 4.0) THEN
		SET evaluation  = 'Positive rating course';
        
	ELSEIF (averageRate >= 3.0 AND 
			averageRate < 4.0) THEN
        SET evaluation = 'Acceptable rating course';
        
    ELSEIF averageRate < 3.0 THEN
        SET evaluation = 'bad rating course';
        
    END IF;
    
	RETURN (evaluation);


END; //
DELIMITER ;

select classify("2")