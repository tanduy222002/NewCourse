INSERT INTO newcourse.course 
VALUES (1, "Math modeling",
					"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220504172515/Discrete-Mathematics-Tutorial.jpg",
					"This is a course about Math_modeling",
					"Discrete mathematics is the study of mathematical structures that can be considered discrete (in a way analogous to discrete variables, ",
					'2018-10-04',
                    '2019-07-05', 
                    "English",
                    '27:03', 
                    250);
                    
INSERT INTO newcourse.course 
VALUES (2, "Linear algebra",
					"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Linear_subspaces_with_shading.svg/1920px-Linear_subspaces_with_shading.svg.png",
					"This is a course about Linear algebra",
					"DLinear algebra is central to almost all areas of mathematics. For instance, linear algebra is fundamental in modern presentations of geometry, including for defining basic objects such as lines, planes and rotations. Also, functional analysis, a branch of mathematical analysis, may be viewed as the application of linear algebra to spaces of functions.",
					'2018-10-04',
                    '2019-07-05', 
                    "English",
                    '27:03', 
                    250);
                    
INSERT INTO newcourse.course 
VALUES (3, "Math analysis",
					"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220504172515/Discrete-Mathematics-Tutorial.jpg",
					"This is a course about Discrete Mathematics",
					"Discrete mathematics is the study of mathematical structures that can be considered discrete (in a way analogous to discrete variables, ",
					'2018-10-04',
                    '2019-07-05', 
                    "English",
                    '27:03', 
                    250);
                                        
INSERT INTO newcourse.course 
VALUES (4, "General Physics",
					"https://www.science.edu/acellus/wp-content/uploads/2016/12/Acellus-General-Physics.jpg",
					"This is a course about Physics",
					"In the Acellus General Physics course, Dr. Russell Clothier explores the nature of our physical environment and explains how natural phenomena occur in terms of mathematics. He leads students through an investigation of matter and its motion through time and space, along with related concepts such as energy and force. Acellus General Physics is A-G Approved through the University of California.",
					'2018-10-04',
                    '2019-07-05', 
                    "English",
                    '27:03', 
                    250);
                    
INSERT INTO Learner 
VALUES ("1", "Willbur", "wilwil1153", "01923will", "willsooth@yahoo.com");

INSERT INTO Learner 
VALUES ("2", "Weyln", "weylnilla", "coffe1234", "weylnity@yahoo.com");

INSERT INTO Learner 
VALUES ("3", "John", "johnson1", "john1235", "johnblder@gmail.com");

INSERT INTO Learner 
VALUES ("4", "Mai", "thmai1973", "thanhmai123", "maimai@yahoo.com");

INSERT INTO Learner 
VALUES (5, "Olek", "oleky7676", "olesk4516", "ololek1899@gmail.com");

INSERT INTO Learner 
VALUES (6, "Arron", "8paulie8", "55ppauly", "paulie1977@yahoo.com");

INSERT INTO Learner 
VALUES (7, "Teddy", "teddyR45", "omason12", "tedmason@gmail.com");


-- Learner 3
INSERT INTO AddToCart
VALUES (3, 1, 3);

INSERT INTO AddToCart
VALUES (3, 2, 3);

INSERT INTO AddToCart
VALUES (3, 3, 3);

INSERT INTO Payment 
VALUES (1,"Credit Card","091024583327",750,3,3);

INSERT INTO Review 
VALUES (1,4,"This course is...",curdate(),1,3);

INSERT INTO Review 
VALUES (2,5,"This course is...",curdate(),2,3);

-- Learner 2
INSERT INTO AddToCart
VALUES (2, 1, 2);

INSERT INTO AddToCart
VALUES (2, 2, 2);

INSERT INTO Payment 
VALUES (2,"Credit Card","091024583327",500,2,2);

INSERT INTO Review 
VALUES (3,2,"This course is...",curdate(),1,2);

INSERT INTO Review 
VALUES (4,1,"This course is...",curdate(),2,2);

-- Learner 4
INSERT INTO AddToCart
VALUES (4, 1, 4);

INSERT INTO AddToCart
VALUES (4, 2, 4);

INSERT INTO Payment 
VALUES (3,"Credit Card","091024583327",500,4,4);

INSERT INTO Review 
VALUES (5,1,"This course is...",curdate(),1,4);

INSERT INTO Review 
VALUES (6,1,"This course is...",curdate(),2,4);

-- Learner 7
INSERT INTO AddToCart
VALUES (7, 4, 7);

INSERT INTO AddToCart
VALUES (7, 3, 7);

INSERT INTO Payment 
VALUES (4,"Credit Card","091024583327",500,7,7);

INSERT INTO Review 
VALUES (7,1,"This course is...",curdate(),4,7);

INSERT INTO Review 
VALUES (8,3,"This course is...",curdate(),3,7);

CALL getCourseInfo(1);

CALL getCourseInfo(2);

CALL getCourseInfo(3);

CALL getCourseInfo(4);