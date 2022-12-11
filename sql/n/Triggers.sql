/*Inserting SEQ*/
DELIMITER $$
CREATE TRIGGER createLearner 
AFTER INSERT 
ON Learner
FOR EACH ROW
BEGIN
   INSERT INTO Cart (cartID, totalCost)
   VALUES (new.userID, 0);
END $$
DELIMETER ;

/*
SET @disableTrigger = 0;	
DELIMITER $$
CREATE TRIGGER addFriend
AFTER INSERT 
ON Friend
FOR EACH ROW
BEGIN
	IF (@disableTrigger=0) 
    THEN
		SET @disableTrigger = 1;
		INSERT INTO Friend (userID1,userID2)
		VALUES (new.userID2,new.userID1);
		SET @disableTrigger = 0;
	END IF;
END $$
DELIMETER ;



DELIMITER $$
CREATE TRIGGER relatedCourseCheck
AFTER INSERT 
ON RelatedCourse
FOR EACH ROW
BEGIN
	INSERT INTO RelatedCourse (courseID1,courseID2)
	VALUES (new.courseID2,new.courseID1);
END $$
DELIMETER ;
*/

/*Purchase SEQ*/
DELIMITER $$
CREATE TRIGGER addToCartCheck 
AFTER INSERT 
ON AddToCart
FOR EACH ROW
BEGIN
	INSERT INTO CourseInCart (cartID,courseID)
	VALUES (new.cartID,new.courseID);
	
	UPDATE Cart
	SET	totalCost = totalCost + (SELECT price FROM Course WHERE courseID = new.CourseID)
	WHERE cartID = new.cartID;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER paymentProcedures 
AFTER INSERT 
ON Payment
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT totalCost FROM Cart WHERE cartID = new.cartID and totalCost = new.cost)
    THEN
		UPDATE Cart
		SET totalCost = 0
		WHERE cartID = new.cartID;
        
        INSERT INTO PaymentTime
        VALUES (new.paymentID,curdate(),curtime());
        
        INSERT INTO Learn (courseID,userIDLearner)
        SELECT CourseInCart.courseID, new.userIDlearner
        FROM CourseInCart
        INNER JOIN Cart ON CourseInCart.cartID = Cart.cartID;	
        
        DELETE FROM CourseinCart
        WHERE cartID = new.cartID;
	END IF;
END $$
DELIMITER ;

/*Take test SEQ*/
DELIMITER $$
CREATE TRIGGER insertChoices 
AFTER INSERT 
ON ExamQuestion
FOR EACH ROW
BEGIN
	INSERT INTO ChoicesExamQuestion 
    VALUES (new.questionID,'A');
    INSERT INTO ChoicesExamQuestion 
    VALUES (new.questionID,'B');
    INSERT INTO ChoicesExamQuestion 
    VALUES (new.questionID,'C');
    INSERT INTO ChoicesExamQuestion 
    VALUES (new.questionID,'D');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER createExam 
AFTER INSERT 
ON LearnerExam
FOR EACH ROW
BEGIN
	DECLARE numQues INT DEFAULT new.numberOfQuestions;
    INSERT INTO LearnerAnswerExam (examID,questionID)
    SELECT new.examID, questionID
		FROM ExamQuestion
		ORDER BY RAND()
		LIMIT numQues;
END $$
DELIMITER ;

set @certCount = 1;
DELIMITER $$
CREATE TRIGGER calScore 
AFTER UPDATE 
ON LearnerAnswerExam
FOR EACH ROW
BEGIN
	IF (old.answer IS NULL)
	THEN
		IF (new.answer = (SELECT correctAnswer FROM ExamQuestion WHERE (ExamQuestion.questionID = new.questionID)))
		THEN
			UPDATE LearnerExam
			SET score = score + 1
			WHERE examID = new.examID;
		END IF;
	END IF;
    
    IF (NOT EXISTS (SELECT* FROM LearnerAnswerExam WHERE LearnerAnswerExam.examID = new.examID AND answer IS NULL))
    THEN
		INSERT INTO Certificate
		VALUES (@certCount,curdate(),(SELECT courseID FROM TakeTest WHERE new.examID = TakeTest.examID),(SELECT userIDLearner FROM TakeTest WHERE new.examID = TakeTest.examID),new.examID);
		SET @certCount = @certCount + 1;
    END IF;
END $$
DELIMITER ;
