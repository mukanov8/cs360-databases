SELECT studentId, name  
FROM STUDENT 
WHERE department = 'Computer Science' 
ORDER BY name ASC 
;

SELECT DISTINCT TAKES.studentId 
FROM TAKES
LEFT JOIN COURSE
ON TAKES.courseNo = COURSE.courseNo 
WHERE COURSE.classroom='E11, 402'
;

SELECT DISTINCT STUDENT.studentId FROM STUDENT
INNER JOIN TAKES
ON STUDENT.studentId = TAKES.studentId 
WHERE (STUDENT.semesters<4 AND TAKES.courseNo='CS360')
;

SELECT studentId, department FROM STUDENT 
WHERE studentId NOT IN (
  SELECT studentId
  FROM TAKES
)
;

SELECT studentId, courseNo 
FROM TAKES 
WHERE courseNo LIKE 'CS%'
;

SELECT name FROM STUDENT 
WHERE studentId = ANY(
  SELECT studentId FROM TAKES 
  WHERE courseNo='CS360' 
  AND applyDate = (
    SELECT MAX(applyDate) 
    FROM TAKES 
    WHERE courseNo='CS360'
  )
)
;

SELECT Instructor 
FROM Course 
GROUP BY Instructor 
HAVING COUNT(CourseID)>2
;

UPDATE ScoreRecord AS X
  INNER JOIN (
    SELECT MIN(Score) LowestScore 
    FROM ScoreRecord 
    WHERE CourseID='CS101'
  ) AS Y
  SET Score=Score+0.3
  WHERE Score=LowestScore
  AND CourseID='CS101'
;

SELECT Course.Instructor AS Instructor, 
Student.Name AS Student 
FROM Course 
LEFT OUTER JOIN Student 
ON Course.Instructor = Student.Advisor
UNION
SELECT Student.Advisor AS Instructor, 
Student.Name AS Student 
FROM Student WHERE Student.Advisor IS NOT NULL
;

SELECT Student.StudentID AS StudentId, 
Name AS StudentName, 
AVG(ScoreRecord.Score) AS GPA
FROM Student
LEFT OUTER JOIN ScoreRecord 
ON Student.StudentID = ScoreRecord.StudentID 
GROUP BY StudentID
