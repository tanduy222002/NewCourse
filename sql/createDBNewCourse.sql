-- drop database NewCourse;
CREATE DATABASE NewCourse;

USE NewCourse;

SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE Administrator
(
  userID int NOT NULL AUTO_INCREMENT,
  adminName 	   	    VARCHAR(20)		NOT NULL	DEFAULT "Admin",
  userName	        	VARCHAR(20) 	NOT NULL,
  adminPassword	    	VARCHAR(20) 	NOT NULL,
  CONSTRAINT passCheckAdmin CHECK ((adminPassword like '%0%'or adminPassword like '%1%'or adminPassword like '%2%'or adminPassword like '%3%'or adminPassword like '%4%'or adminPassword like '%5%'or adminPassword like '%6%'or adminPassword like '%7%'or adminPassword like '%8%'or adminPassword like '%9%') and  length(adminPassword)>=8),
  PRIMARY KEY (userID)
);

CREATE TABLE Blacklist
(
  userIDLearner		int NOT NULL ,
  userIDAdmin		int NOT NULL ,
  PRIMARY KEY (userIDLearner,userIDAdmin),
  FOREIGN KEY (userIDLearner)	REFERENCES	Learner(userID),
  FOREIGN KEY (userIDAdmin)		REFERENCES	Administrator(userID)
);

CREATE TABLE Learner
(	
  userID	       	    int NOT NULL AUTO_INCREMENT,
  learnerName			VARCHAR(20)		NOT NULL	DEFAULT "RandomUser",
  userName	       		VARCHAR(20) 	NOT NULL,
  learnerPassword     	VARCHAR(20) 	NOT NULL,
  learnerEmail	    	VARCHAR(50)		NOT NULL,
  CONSTRAINT passCheckLearner CHECK ((learnerPassword like '%0%'or learnerPassword like '%1%'or learnerPassword like '%2%'or learnerPassword like '%3%'or learnerPassword like '%4%'or learnerPassword like '%5%'or learnerPassword like '%6%'or learnerPassword like '%7%'or learnerPassword like '%8%'or learnerPassword like '%9%') and  length(learnerPassword)>=8),
  PRIMARY KEY (userID)
);

CREATE TABLE Friend
(
  userID1			int NOT NULL,
  userID2			int	NOT NULL,
  CONSTRAINT friendCheck CHECK (userID1!=userID2),
  PRIMARY KEY (userID1,userID2),
  FOREIGN KEY (userID1) REFERENCES Learner(userID),
  FOREIGN KEY (userID2) REFERENCES Learner(userID)
);

CREATE TABLE Learn
(
  userIDLearner	int			NOT NULL,
  courseID		int			NOT NULL,
  PRIMARY KEY (userIDLearner,courseID),
  FOREIGN KEY (courseID) REFERENCES Course(courseID),
  FOREIGN KEY (userIDLearner) REFERENCES Learner(userID)
);

CREATE TABLE Certificate
(
  certificateNumber		int NOT NULL AUTO_INCREMENT,
  dateComplete			DATE		NOT NULL,
  courseID				int 	NOT NULL,
  useridlearner			int 	NOT NULL,
  examID 				int		NOT NULL,
  PRIMARY KEY (certificateNumber),
  FOREIGN KEY (courseID) 		 REFERENCES Course(CourseID),
  FOREIGN KEY (useridlearner)	 REFERENCES Learner(userID),
  FOREIGN KEY (examID)			 REFERENCES Exam(examID)
);

CREATE TABLE Review
(
  reviewID		int NOT NULL AUTO_INCREMENT,
  rate			INT				NOT NULL    DEFAULT 0,
  script		VARCHAR(300) 	NOT NULL,
  reviewDate	DATE 			NOT NULL,
  courseID		int 		NOT NULL,
  useridlearner	int 		NOT NULL,
  CONSTRAINT rating CHECK (rate>=0 and rate<=5),
  PRIMARY KEY (reviewID),
  FOREIGN KEY (courseID) 		 REFERENCES Course(CourseID),
  FOREIGN KEY (useridlearner)	 REFERENCES Learner(userID)
);

CREATE TABLE Cart
(
	cartID			int,
  	totalCost		INT			NOT NULL	DEFAULT 0,
    CONSTRAINT costCheck CHECK (totalCost >= 0),
    PRIMARY KEY (cartID) 
);

CREATE TABLE CourseInCart
(
	cartID				int		NOT NULL,
  	courseID			int		NOT NULL,
    PRIMARY KEY (courseID,cartID),
  	FOREIGN KEY (courseID) 		 REFERENCES Course(CourseID),
  	FOREIGN KEY (cartID)	 	 REFERENCES Cart(cartID)
);
DROP TABLE IF EXISTS AddToCart;
select * from cart;
select * from AddToCart;
CREATE TABLE AddToCart
(
  cartID			int			NOT NULL,
  courseID			int			NOT NULL,
  userIDlearner		int			NOT NULL,
  PRIMARY KEY (cartID, courseID, userIDlearner),
  FOREIGN KEY (cartID)	 		 REFERENCES Cart(cartID),
  FOREIGN KEY (courseID) 		 REFERENCES Course(CourseID),
  FOREIGN KEY (userIDlearner)	 REFERENCES Learner(userID)
);

CREATE TABLE Payment
(
	paymentID			 int NOT NULL AUTO_INCREMENT,
  	paymentType		 	 VARCHAR(150)		NOT NULL,
    time				datetime,
  	creditCardNo		 CHAR(12)			NOT NULL,
  	cost				 INT				NOT NULL,
  	cartID				 int			NOT NULL,
    userIDlearner		 int 			NOT NULL,
	CONSTRAINT costCheckPayment CHECK (cost > 0),
    PRIMARY KEY (paymentID),
    FOREIGN KEY (userIDlearner)	 REFERENCES Learner(userID),
 	FOREIGN KEY (cartID)	 	 REFERENCES Cart(cartID)
);

CREATE TABLE PaymentTime
(
	paymentID			int NOT NULL AUTO_INCREMENT,
  	paymentDate			DATE 			NOT NULL,
  	currentHour			TIME 			NOT NULL,
  	PRIMARY KEY (paymentID,paymentDate,currentHour),
  	FOREIGN KEY	(paymentID)	REFERENCES	Payment(PaymentID)
);

CREATE TABLE Instructor
(
  userID					int NOT NULL AUTO_INCREMENT,
  insName					VARCHAR(20)		NOT NULL	DEFAULT "RandomInstructor",
  userName					VARCHAR(20) 	NOT NULL,
  insPassword				VARCHAR(20) 	NOT NULL,
  shortDescription 			VARCHAR(150)	NOT NULL,
  detailedDescription		VARCHAR(500),
  CONSTRAINT passCheckIns CHECK ((insPassword like '%0%'or insPassword like '%1%'or insPassword like '%2%'or insPassword like '%3%'or insPassword like '%4%'or insPassword like '%5%'or insPassword like '%6%'or insPassword like '%7%'or insPassword like '%8%'or insPassword like '%9%') and  length(insPassword)>=8),
  PRIMARY KEY (userID)
);
CREATE TABLE Categories 
(
	categoryID				int NOT NULL AUTO_INCREMENT,
  	categoryName	VARCHAR(20)	NOT NULL,
  	PRIMARY KEY (categoryID)
);

CREATE TABLE Course
(
    courseID				int NOT NULL AUTO_INCREMENT,
    courseName 			VARCHAR(50)		NOT NULL,
  imgUrl 				varchar(255),
  script 				VARCHAR(500)	NOT NULL,
  detail 				VARCHAR(500)	NOT NULL,
  firstPostDate	DATE			NOT NULL,
  lastUpdate		DATE 			NOT NULL,
  Language				VARCHAR(20)		NOT NULL,	
  averageStudyTime		TIME			DEFAULT 0,
  price					INT				NOT NULL,
  CONSTRAINT studyTimeCheckCourse CHECK (averageStudyTime >= 0),
  CONSTRAINT lastUpdateCheckCourse CHECK (lastUpdate>=firstPostDate),
  CONSTRAINT priceCheckCourse CHECK (price>0),
  PRIMARY KEY (courseID)
);
CREATE TABLE SubtitlesCourse
(
    courseID				int			NOT NULL,
    Subtitleslanguage varchar(20) NOT NULL,
    PRIMARY KEY (courseID, Subtitleslanguage),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE TeachBy
(
  courseID				int			NOT NULL,
  userID				int			NOT NULL,
  PRIMARY KEY (courseID,userID),
  FOREIGN KEY (courseID) REFERENCES Course(courseID),
  FOREIGN KEY (userID) 	 REFERENCES Instructor(userID)
);

CREATE TABLE Book
(
  nameOfBook			VARCHAR(50)		NOT NULL,
  authors				VARCHAR(50)		NOT NULL,
  publishingDate		DATE,
  courseID				int			NOT NULL,
  PRIMARY KEY (nameOfBook),
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE RelatedCourse
(
  courseID1			int			NOT NULL,
  courseID2			int			NOT NULL,
  PRIMARY KEY (courseID1,courseID2),
  FOREIGN KEY (courseID1) REFERENCES Course(courseID),
  FOREIGN KEY (courseID2) REFERENCES Course(courseID)
);


CREATE TABLE Section
(
  sectionID	  	    int NOT NULL AUTO_INCREMENT,
  content	    	VARCHAR(300)	NOT NULL,
  inCourseID		int			NOT NULL,
  PRIMARY KEY (sectionID),
  FOREIGN KEY (inCourseID) REFERENCES Course(courseID) 
);

CREATE TABLE Lesson
(
  lessonID				int			NOT NULL,
  lessonName			VARCHAR(50)		NOT NULL,
  lessonDescription		VARCHAR(1000)	NOT NULL,
  inSectionID			int			NOT NULL,
  PRIMARY KEY (lessonID),
  FOREIGN KEY (inSectionID) REFERENCES Section(sectionID) 
);

CREATE TABLE DocumentLesson
(
  documentID			int NOT NULL AUTO_INCREMENT,
  documentName 			VARCHAR(50)		NOT NULL,
  documentLink			VARCHAR(300)	NOT NULL,
  inLessonID			int		NOT NULL,
  PRIMARY KEY (documentID),
  FOREIGN KEY (inLessonID) REFERENCES Lesson(lessonID) 
);

CREATE TABLE CommentCourse
(
  messageID			int NOT NULL AUTO_INCREMENT,
  script			TEXT(300)	NOT NULL,
  commentTime 		DATE		NOT NULL,
  inLessonID		int		NOT NULL,
  userIDcreate		int		NOT NULL,
  PRIMARY KEY (messageID),
  FOREIGN KEY (inLessonID) 		REFERENCES Lesson(lessonID),
  FOREIGN KEY (userIDcreate) 	REFERENCES Learner(userID) 
);


CREATE TABLE Quiz
(
  quizID			int NOT NULL AUTO_INCREMENT,
  inLessonID		int			NOT NULL,
  PRIMARY KEY (quizID),
  FOREIGN KEY (inLessonID) REFERENCES Lesson(lessonID) 
);

CREATE TABLE TakeBy
(
  quizID				int			NOT NULL,
  questionID			int			NOT NULL,
  userIDlearner			int			NOT NULL,
  haveDone				BIT				NOT NULL	DEFAULT 0, 
  PRIMARY KEY (questionID),
  FOREIGN KEY (questionID)		 REFERENCES quizQuestion(questionID),
  FOREIGN KEY (userIDlearner) 	 REFERENCES Learner(userID),
  FOREIGN KEY (quizID) 			 REFERENCES Quiz(quizID)
);

CREATE TABLE LeanerAnswer
(
	questionID		int					NOT NULL, 
  	answer			CHAR(1)					NOT NULL,
    CONSTRAINT viableAnswer CHECK (answer = 'A' OR answer = 'B' OR answer = 'C' OR answer = 'D'),
  	PRIMARY KEY (questionID,answer),
  	FOREIGN KEY (questionID) REFERENCES quizQuestion(questionID)
);

CREATE TABLE quizQuestion
(
	questionID				int NOT NULL AUTO_INCREMENT, 
  	correctAnswer			CHAR(1)					NOT NULL,
  	questionDescription		VARCHAR(150)			NOT NULL,
  	explanation				VARCHAR(500),
	CONSTRAINT viableAnswerQuiz CHECK (correctAnswer = 'A' OR correctAnswer = 'B' OR correctAnswer = 'C' OR correctAnswer = 'D'),
  	PRIMARY KEY (questionID)
);

CREATE TABLE Choices
(
	questionID		int					NOT NULL, 
  	choices			CHAR(1)					NOT NULL,
    CONSTRAINT viableChoice CHECK (choices = 'A' OR choices = 'B' OR choices = 'C' OR choices = 'D'),
  	PRIMARY KEY (questionID,choices),
  	FOREIGN KEY (questionID) REFERENCES quizQuestion(questionID)
);

/*Video part*/
CREATE TABLE Video
(
	videoID			int NOT NULL AUTO_INCREMENT, 
  	lessonID		int					NOT NULL,
  	PRIMARY KEY (videoID),
  	FOREIGN KEY (lessonID) REFERENCES Lesson(lessonID)
);
CREATE TABLE VideoSubstitles
(
    substitlesID    int NOT NULL AUTO_INCREMENT,
    videoID         int					NOT NULL,
    substitlesLink  VARCHAR(300)			NOT NULL,
    PRIMARY KEY (substitlesID),
    FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

CREATE TABLE WatchBy
(
	videoID		       		 int      NOT NULL, 
  	userIDlearner			 int			NOT NULL,
  	PRIMARY KEY (videoID,userIDlearner),
  	FOREIGN KEY (videoID) 		REFERENCES Video(videoID),
  	FOREIGN KEY (userIDlearner) REFERENCES Learner(userID)
);

/*Reading part*/
CREATE TABLE Reading
(
	readingID		int NOT NULL AUTO_INCREMENT, 
  	lessonID		int				NOT NULL,
  	readingLink	VARCHAR(300)			NOT NULL,
  	PRIMARY KEY (readingID),
  	FOREIGN KEY (lessonID) REFERENCES Lesson(lessonID)
);

CREATE TABLE ReadBy
(
	readingID			int			NOT NULL, 
  	userIDlearner		int			    NOT NULL,
  	PRIMARY KEY (readingID,userIDlearner),
  	FOREIGN KEY (readingID) 	REFERENCES Reading(readingID),
  	FOREIGN KEY (userIDlearner) REFERENCES Learner(userID)
);

CREATE TABLE LearnerExam
(
  examID				int NOT NULL AUTO_INCREMENT,
  expirationDate		DATE        NOT NULL,
  timeLimit				TIME		NOT NULL,
  numberOfQuestions		INT			NOT NULL,
  score					INT 		NOT NULL,
  CONSTRAINT questionCheck CHECK (numberOfQuestions > 0),
  CONSTRAINT scoreCheck CHECK (score > 0),
  PRIMARY KEY (examID)
);

CREATE TABLE TakeTest
(
  examID				int NOT NULL AUTO_INCREMENT,
  userIDLearner			int		NOT NULL,
  courseID				int		NOT NULL,
  PRIMARY KEY (examID),
  FOREIGN KEY (examID) 			REFERENCES LearnerExam(examID),
  FOREIGN KEY (userIDlearner)   REFERENCES Learner(userID),
  FOREIGN KEY (courseID) 		REFERENCES Course(courseID)
);

CREATE TABLE ExamQuestion
(
  questionID				int NOT NULL AUTO_INCREMENT,
  examID					int			NOT NULL,
  courseID					int			NOT NULL,
  questionDescription		VARCHAR(300)	NOT NULL,
  correctanswer				CHAR(1)			NOT NULL,
  PRIMARY KEY (questionID),
  FOREIGN KEY (examID) 			REFERENCES LearnerExam(examID),
  FOREIGN KEY (courseID) 		REFERENCES Course(courseID)
);

CREATE TABLE ChoicesExamQuestion
(
	questionID		int					NOT NULL, 
  	choices			CHAR(1)					NOT NULL,
    CONSTRAINT viableChoiceExam CHECK (choices = 'A' OR choices = 'B' OR choices = 'C' OR choices = 'D'),
  	PRIMARY KEY (questionID,choices),
  	FOREIGN KEY (questionID) REFERENCES ExamQuestion(questionID)
);

CREATE TABLE LearnerAnswerExam
(
  examID				int		NOT NULL,
  userIDLearner			int		NOT NULL,
  questionID			int		NOT NULL,
  PRIMARY KEY (questionID),
  FOREIGN KEY (questionID) 		REFERENCES ExamQuestion(questionID),
  FOREIGN KEY (userIDlearner)   REFERENCES Learner(userID),
  FOREIGN KEY (examID) 			REFERENCES LearnerExam(examID)
);

-- RELATION
CREATE TABLE BelongTo -- course belong to category
(
    categoryID				int		NOT NULL,
    CourseID int,
    PRIMARY KEY (categoryID, CourseID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID) ON UPDATE CASCADE ON DELETE CASCADE ,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS = 1;

