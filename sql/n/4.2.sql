



DROP FUNCTION IF EXISTS evaluateResult


DELIMITER //
CREATE FUNCTION evaluateResult ( learnerId INT, courseId INT )
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN
	DECLARE result VARCHAR(30) DEFAULT "";
	DECLARE countExam INT DEFAULT 0;
    DECLARE testScore DOUBLE DEFAULT 0;
    
	SELECT COUNT(examID) FROM taketest AS tt 
    WHERE ( tt.userIDLearner=learnerId AND tt.courseID=courseId)
	GROUP BY examID INTO countExam;
    
    --  Throw Error if user does not participate in this exam
   
    IF (countExam=0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User did not participate in this course Exam' ;
    END IF;
    
	SELECT score from taketest as tt,learnerexam as lx 
	WHERE (tt.examID=lx.examID AND tt.userIDLearner= learnerId AND tt.courseID= courseId)
	INTO testScore;
    
    IF  (testScore>= 9.0) THEN
		SET result  = 'Outstanding';
        
	ELSEIF (testScore>= 8.0 AND 
			testScore < 9) THEN
        SET Result = 'Execellent';
	ELSEIF (testScore>= 6.5 AND 
			testScore < 8) THEN
	SET Result = 'Good';
    ELSEIF (testScore>=5 AND 
			testScore < 6.5) THEN
	SET Result = 'Pass';
    ELSEIF testScore < 5 THEN
        SET Result = 'bad';
    END IF;
	RETURN (result);


END; //
DELIMITER ;
select evaluateResult(1,1);
select evaluateResult(1,2);
select evaluateResult(2,1);
