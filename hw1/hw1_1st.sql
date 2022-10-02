DROP TABLE IF EXISTS TAKES;
DROP TABLE IF EXISTS  COURSE;
DROP TABLE IF EXISTS  STUDENT;

--- TABLE CREATION
CREATE TABLE STUDENT (
	studentId INT PRIMARY KEY,
	name CHAR(10),
	department VARCHAR(25),
	semesters INT,
	doubleMajor VARCHAR(25));
	
CREATE TABLE COURSE (
	courseNo CHAR(7) PRIMARY KEY,
	title VARCHAR(40),
	couseType VARCHAR(20),
	classroom VARCHAR(15));
	
CREATE TABLE TAKES (
	studentId INT REFERENCES STUDENT(studentId) ON DELETE CASCADE,
	courseNo VARCHAR(7) REFERENCES COURSE(courseNo) ON DELETE CASCADE,
	semTaken VARCHAR(20),
	applyDate DATE );
	
--- STUDENT TUPLES (15)
INSERT INTO STUDENT (studentId, name, department, semesters, doubleMajor) VALUES (2014012, 'Noah', 'Computer Science',8 , 'Mathematical Science');
INSERT INTO STUDENT (studentId, name, department, semesters, doubleMajor) VALUES (2015057, 'Logan', 'Bio and Brain Engineering',8, NULL);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2016002, 'Emma', 'Chemistry',7);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2016105, 'Olivia', 'Computer Science',6);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2017016, 'Jackson', 'Mathematical Science',5);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2017102, 'Jacob', 'Industrial Design',7);
INSERT INTO STUDENT (studentId, name, department, semesters, doubleMajor) VALUES (2018035, 'Amelia', 'Electrical Engineering',6, 'Computer Science');
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2018089, 'Emily', 'Computer Science',3);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2018063, 'Benjamin', 'Electrical Engineering',2);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2019029, 'Oliver','Industrial Design',3);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2019045, 'Abigail', 'Electrical Engineering',4);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2019047, 'Lily', 'Computer Science',4);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2020014, 'Alexander', 'Electrical Engineering',4);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2020053, 'Hannah','Computer Science',4);
INSERT INTO STUDENT (studentId, name, department, semesters) VALUES (2021610, 'Sofia', 'Bio and Brain Engineering',2);

--- COURSE TUPLES (9)
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('BiS200', 'Bioengineering Fundamentals', 'Major Required', 'E11, 405');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CS360', 'Introduction to Database', 'Major Elective', 'E11, 402');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CS101', 'Introduction to Programming', 'Basic Required', 'E11, 103');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CH325', 'Bioorganic Chemistry', 'Major Elective', 'E6, 313');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('EE201', 'Circuit Theory', 'Major Required', 'E11, 201');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CC500', 'Scientific Writing', 'General Required', 'N4, 1117');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CC511', 'Probability and Stastics', 'General Required', 'E11, 402');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CS230', 'System Programming', 'Major Elective', 'N1, 101');
INSERT INTO COURSE (courseNo, title, couseType, classroom) VALUES ('CS206', 'Data Structure', 'Major Required', 'N1, 102');

--- TAKES TUPLES (30)
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2015057, 'CC500', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2015057, 'CS360', '2021, Fall', DATE'2021-09-03');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016002, 'CS360', '2021, Fall', DATE'2021-09-04');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016002, 'CC511', '2021, Fall', DATE'2021-09-13');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016002, 'CH325', '2021, Fall', DATE'2021-09-07');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016105, 'CS206', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016105, 'CC511', '2021, Fall', DATE'2021-08-27');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2016105, 'CC500', '2021, Fall', DATE'2021-08-21');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2017102, 'CS360', '2021, Fall', DATE'2021-08-21');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2017102, 'EE201', '2021, Fall', DATE'2021-08-23');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018035, 'EE201', '2021, Fall', DATE'2021-09-03');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018035, 'CC500', '2021, Fall', DATE'2021-09-07');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018035, 'CC511', '2021, Fall', DATE'2021-09-03');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018089, 'CS230', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018089, 'CS206', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018089, 'CS101', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2018063, 'EE201', '2021, Fall', DATE'2021-09-04');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2019029, 'CS101', '2021, Fall', DATE'2021-08-25');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2019029, 'CS230', '2021, Fall', DATE'2021-09-03');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2019045, 'CH325', '2021, Fall', DATE'2021-09-08');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2019045, 'CC500', '2021, Fall', DATE'2021-09-07');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2019045, 'CC511', '2021, Fall', DATE'2021-09-07');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020014, 'CS101', '2021, Fall', DATE'2021-09-03');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020014, 'EE201', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020014, 'CS360', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020014, 'CH325', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020014, 'CS206', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020053, 'BiS200', '2021, Fall', DATE'2021-09-01');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2020053, 'CS360', '2021, Fall', DATE'2021-08-23');
INSERT INTO TAKES (studentId, courseNo, semTaken, applyDate) VALUES (2021610, 'BiS200', '2021, Fall', DATE'2021-08-25');


--- COMMIT DML COMMANDS
COMMIT;