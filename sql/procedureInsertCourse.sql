-- ADD NEW CATEGORIES
DROP PROCEDURE IF EXISTS ADD_CATEGORY;
DELIMITER $$
CREATE PROCEDURE ADD_CATEGORY(
    IN CategoryName VARCHAR(30),
    OUT stateOUT VARCHAR(255)
)
BEGIN
	DECLARE Cid INT;
    set cid = -1;
    SELECT categoryID INTO Cid FROM Categories WHERE Categories.categoryName=CategoryName;
    IF Cid = -1 THEN
		INSERT INTO Categories (categoryName) VALUES(CategoryName);
        SET stateOUT = 'Category has been added';
	ELSE
		SET stateOUT = 'Category has been exists';
    END IF;
END $$
DELIMITER ;

CALL ADD_CATEGORY("Mathematic", @state);

CALL ADD_CATEGORY(`CategoryName` = 'Physics', @state);

CALL addCourse('a','a','https://www.youtube.com/results?search_query=get+respond+and+send+to+view','a','a','English','37:00','3','200', @stateOfQuery); 
CALL addCourse('fuzzy logic','Mathematic','https://www.tutorialspoint.com/artificial_intelligence/images/fuzzylogic_system.jpg','Logic mờ (tiếng Anh: Fuzzy logic) được phát triển từ lý thuyết tập mờ.','Mặc dù được chấp nhận rộng rãi và có nhiều ứng dụng thành công, lôgic mờ vẫn bị phê phán tại một số cộng đồng nghiên cứu. ','English','37:00','2','200', @stateOfQuery);
select @stateOfQuery;

select @stateOfQuery;
select @state;
SHOW PROCEDURE STATUS WHERE db = newcourse;
delete from Categories where categoryID = 3;
select * from Categories;
select * from course;
select * from instructor;
select * from BELONGTO;
select * from instructor;
delete from Categories where categoryID = 8
-- test NEW CATEGORIES
CALL addCourse("General Chemistry",
				"Chemistry", 
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-course-photos.s3.amazonaws.com/fa/6926005ea411e490ff8d4c5d4ff426/chemistry_logo.png?auto=format%2Ccompress&dpr=1",
                "General Chemistry is awesome!",
                "This is so awesome",
                "English",
                '27:03',
                3,
                100,
                @state);
select @state;

-- ADD NEW COURSE
DROP PROCEDURE IF EXISTS addCourse;
DELIMITER $$
CREATE PROCEDURE addCourse(
						IN courseName_IN   varchar(50),
						IN category_IN 		CHAR(20),
						IN imgUrl_IN 		CHAR(255),
                        IN script_IN 		CHAR(255),
                        IN detail_IN 		CHAR(255),
						IN language_IN	VARCHAR(30),
                        IN averageStudyTime_IN TIME,
                        IN instructorID_IN	int,
                        IN PRICE_IN INT,
                        OUT stateOUT 	VARCHAR(255)
                        )
BEGIN
	declare instructorNumber INT;
    DECLARE categoryNumber INT;
	DECLARE currentDate DATE;
    DECLARE Cid INT;
    
    set currentDate = curdate();
	SET instructorNumber = -1;
    SELECT userID INTO instructorNumber FROM instructor WHERE instructor.userID=instructorID_IN;
    SET categoryNumber = -1;
    SELECT categoryID INTO categoryNumber FROM Categories WHERE Categories.categoryName=category_IN;
    
	
   
	IF instructorNumber = -1 THEN
		SET stateOUT = 'Instructor does not exists';
	ELSEIF categoryNumber = -1 THEN
		SET stateOUT = 'Category does not exists';
	else -- success
		INSERT INTO course (courseName, imgurl,script,detail, firstPostDate,lastUpdate,language, averageStudyTime, price) 
		VALUES 				(courseName_IN,
							imgUrl_IN, 
							script_IN,
							detail_IN, 
                            currentDate,
                            currentDate,
                            language_IN,
                            averageStudyTime_IN,
                            price_IN
							);
		SELECT max(courseid) into Cid FROM course;
		INSERT INTO BELONGTO values (categoryNumber, cid);
		SET stateOUT = 'Successful creation of the course';
	
	end if;
END $$
DELIMITER ;


