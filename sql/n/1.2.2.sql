-- 1.2.2.1

DROP PROCEDURE IF EXISTS showTotalPriceRemain;
DELIMITER $$
CREATE PROCEDURE showTotalPriceRemain(
    IN cartIDres int
)
BEGIN
	DECLARE totalnum int default 0;
	DECLARE totalprice int default 0;
	SET totalnum = (SELECT count(cartID)  FROM addtocart WHERE cartID=cartIDres);
    IF totalnum > 0 THEN 
		SET totalprice = (SELECT SUM(price)
							FROM courseincart as a,course as b 
                            WHERE a.courseID = b.courseID AND a.cartID = cartIDres);
	ELSE 
		SET totalprice = 0;
	END IF;
    UPDATE cart SET totalCost = totalprice WHERE cartID = cartIDres;
    SELECT * FROM cart WHERE cartID = cartIDres;
END $$
DELIMITER ;


CALL showTotalPriceRemain(6);

-- 1.2.2.2

DROP PROCEDURE IF EXISTS showSyllabusLesson;
DELIMITER $$
CREATE PROCEDURE showSyllabusLesson(
    IN courseIDres int
)
BEGIN
	SELECT l.lessonID,l.lessonName,s.content as sectionName 
    FROM course as c,section as s,lesson as l 
	WHERE c.courseID = s.inCourseID AND s.sectionID = l.inSectionID AND c.courseID = courseIDres;
END $$
DELIMITER ;


CALL showSyllabusLesson(2);



