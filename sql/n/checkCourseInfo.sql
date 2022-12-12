DROP PROCEDURE IF EXISTS getCourseInfo

DELIMITER //
CREATE PROCEDURE getCourseInfo ( courseID INT )
BEGIN
	DECLARE rating REAL DEFAULT 0;
    DECLARE enroll REAL default 0;
    
    IF (EXISTS (SELECT* FROM review as R WHERE R.courseID = courseID))
    THEN 
		SET rating = (SELECT AVG(rate) FROM Review AS r WHERE r.courseID = courseID);
    END IF;
    
    IF (EXISTS (SELECT* FROM Learn as L WHERE L.CourseID = courseID))
	THEN
		SET enroll = (SELECT COUNT(userIDLearner) FROM Learn as L WHERE L.courseID = courseID);
    END IF;
    
	SELECT *, rating, enroll FROM Course as C WHERE courseID = C.courseID;

END; //
DELIMITER ;

CALL getCourseInfo(1);
CALL getCourseInfo(2);
CALL getCourseInfo(3);
