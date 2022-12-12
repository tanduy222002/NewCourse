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



-- test NEW CATEGORIES
CALL addCourse("Organic Chemistry",
				"Chemistry", 
                "https://theimportantsite.com/wp-content/uploads/2022/05/organic-chemistry.jpeg",
                "Organic chemistry is a highly creative science that allows chemists to create and explore molecules and compounds.",
                "Organic chemistry is the study of the structure, properties, composition, reactions, and preparation of carbon-containing compounds. Most organic compounds contain carbon and hydrogen, but they may also include any number of other elements (e.g., nitrogen, oxygen, halogens, phosphorus, silicon, sulfur).",
                "English",
                '27:03',
                3,
                200,
                @state);
select @state;
SELECT * FROM COURSE;
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
    
	IF courseName_IN = "" THEN
		SET stateOUT = 'Course name cannot be null';
	ELSEIF category_IN = "" THEN
		SET stateOUT = 'Category cannot be null';
	ELSEIF script_IN = "" THEN
		SET stateOUT = 'Script cannot be null';
	ELSEIF detail_IN = "" THEN
		SET stateOUT = 'Detail cannot be null';
	ELSEIF language_IN = "" THEN
		SET stateOUT = 'Language cannot be null';
	ELSEIF instructorID_IN = "" THEN
		SET stateOUT = 'Price cannot be null';
        
	ELSEIF instructorNumber = -1 THEN
		SET stateOUT = 'Instructor does not exists';
	ELSEIF categoryNumber = -1 THEN
		SET stateOUT = 'Category does not exists';
	ELSEIF price_in < 0 THEN
		SET stateOUT = 'Price cannot be negative';
	ELSEIF averageStudyTime_IN < 0 THEN
		SET stateOUT = 'StudyTime cannot be negative';
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
explain course;
-- Change price of Course
DROP PROCEDURE IF EXISTS CHANGE_PRICE_COURSE;
DELIMITER $$
CREATE PROCEDURE CHANGE_PRICE_COURSE(
	IN courseIDIN INT,
    IN priceIN int,
    OUT stateOUT VARCHAR(255)
)
BEGIN
	DECLARE numid INT;
    set numid = -1;
    SELECT courseID INTO numid FROM course WHERE course.courseID=courseIDIN;
    IF numid = -1 THEN
        SET stateOUT = 'Course has not been exists';
	ELSEIF PRICEIN < 0 THEN
		SET stateOUT = 'Price cannot be negative';
	ELSE
		update course 
        set course.price = priceIN
        where course.courseID = numID;
		SET stateOUT = 'Change price of the course complete';
    END IF;
END $$
DELIMITER ;





