INSERT INTO Administrator
VALUES (1, "Harry", "harry2202", "9harrison");

INSERT INTO Administrator
VALUES (2, "Carlson", "Narl7878", "Carles1121");

INSERT INTO Instructor 
VALUES (1, "Porter", "Robinson1", "012654porte","teacher at 123 unni...","...");

INSERT INTO Instructor 
VALUES ("2", "May", "mayes4554", "earl9783","teacher at abc unni...","...");

INSERT INTO Instructor 
VALUES ("3", "Sam", "Robinson1", "012654merry","teacher at 123 unni...","...");

INSERT INTO Instructor 
VALUES ("4", "Weyln", "weylnilla", "coffe1234","teacher at wsl unni...","...");

INSERT INTO Learner 
VALUES ("1", "Willbur", "wilwil1153", "01923will", "willsooth@yahoo.com");

INSERT INTO Learner 
VALUES ("2", "Weyln", "weylnilla", "coffe1234", "weylnity@yahoo.com");

INSERT INTO Learner 
VALUES ("3", "John", "johnson1", "john1235", "johnblder@gmail.com");
INSERT INTO Cart
VALUES (3, 0);

INSERT INTO Learner 
VALUES ("4", "Mai", "thmai1973", "thanhmai123", "maimai@yahoo.com");
INSERT INTO Cart
VALUES (4, 0);

INSERT INTO Learner 
VALUES (5, "Olek", "oleky7676", "olesk4516", "ololek1899@gmail.com");
INSERT INTO Cart
VALUES (5, 0);

INSERT INTO Learner 
VALUES (6, "Arron", "8paulie8", "55ppauly", "paulie1977@yahoo.com");
INSERT INTO Cart
VALUES (6, 0);

INSERT INTO Learner 
VALUES (7, "Teddy", "teddyR45", "omason12", "tedmason@gmail.com");
INSERT INTO Cart
VALUES (7, 0);

select * from course;

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
                    
                    
INSERT INTO Book
VALUES ("Basics of regular expression","John.JH",'2013-12-01',1);



INSERT INTO RelatedCourse
VALUES (1,2);

INSERT INTO TeachBy
VALUES (1,2);

INSERT INTO TeachBy
VALUES (1,4);



INSERT INTO Blacklist
VALUES (7,1);

INSERT INTO Friend 
VALUES (1,2);

INSERT INTO Friend 
VALUES (1,3);

INSERT INTO Friend 
VALUES (4,5);

INSERT INTO AddToCart
VALUES (3, 1, 3);

INSERT INTO AddToCart
VALUES (5, 2, 5);


INSERT INTO Payment 
VALUES (1,"Credit Card","091024583327",500,3,3);

INSERT INTO Review 
VALUES (1,4,"This course is...",curdate(),1,3);

INSERT INTO Review 
VALUES (2,5,"This course is...",curdate(),2,4);