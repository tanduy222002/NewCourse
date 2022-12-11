INSERT INTO Learner 
VALUES (1, "Weyln", "weylnilla", "coffe1234", "weylnity@yahoo.com");

INSERT INTO newcourse.course 
VALUES (1, "Math analysis",
					"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220504172515/Discrete-Mathematics-Tutorial.jpg",
					"This is a course about Discrete Mathematics",
					"Discrete mathematics is the study of mathematical structures that can be considered discrete (in a way analogous to discrete variables, ",
					'2018-10-04',
                    '2019-07-05', 
                    "English",
                    '27:03', 
                    250);

INSERT INTO ExamQuestion 
VALUES (1,1,"If a + b = 3 and...","A");

INSERT INTO ExamQuestion 
VALUES (2,1,"If ABC is a triagnle...","C");

INSERT INTO ExamQuestion 
VALUES (3,1,"Given vector A(1,2,-5), find...","D");

INSERT INTO ExamQuestion 
VALUES (4,1,"Property of a Isosceles triangle is...","B");

INSERT INTO ExamQuestion 
VALUES (5,1,"If a + b = 3 and...","A");

INSERT INTO LearnerExam
VALUES (1,'2023-01-01','0:45',5,0);

INSERT INTO TakeTest
VALUES (1,1,1);

UPDATE LearnerAnswerExam
SET answer = 'C'
WHERE examID = 1 AND questionID = 1;

UPDATE LearnerAnswerExam
SET answer = 'C'
WHERE examID = 1 AND questionID = 2;

UPDATE LearnerAnswerExam
SET answer = 'C'
WHERE examID = 1 AND questionID = 3;

UPDATE LearnerAnswerExam
SET answer = 'C'
WHERE examID = 1 AND questionID = 4;

UPDATE LearnerAnswerExam
SET answer = 'C'
WHERE examID = 1 AND questionID = 5;
