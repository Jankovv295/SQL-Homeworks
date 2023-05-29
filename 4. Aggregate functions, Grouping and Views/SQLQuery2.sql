USE HomeWork3

--● Calculate the count of all grades per Teacher in the system
SELECT T.[FirstName], T.[LastName], COUNT(Grade) AS GradesPerTeacher
FROM Teacher T
JOIN Grade G ON T.ID = G.TeacherID
GROUP BY T.[FirstName], T.[LastName]

--● Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT T.[FirstName], T.[LastName], COUNT(Grade) AS GradesPerTeacher
FROM Teacher T
JOIN Grade G ON T.ID = G.TeacherID
WHERE StudentID < 100
GROUP BY T.[FirstName], T.[LastName]

--● Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, s.LastName, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade
FROM Grade g
JOIN Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName

--● Calculate the count of all grades per Teacher in the system and filter only grade count greater then
--200
SELECT t.FirstName, t.LastName, COUNT(g.Grade) as CountOfAllGrades
FROM Grade g
JOIN Teacher t on g.TeacherID = t.ID
GROUP BY t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200

--● Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade
--● List Student First Name and Last Name next to the other details 
SELECT s.FirstName, s.LastName, COUNT(g.Grade) as CountOfAllGrades, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade
FROM Grade g
JOIN Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)

--● Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
as
SELECT s.ID, COUNT(g.Grade) as GradesPerStudent
FROM Grade g
JOIN Student s on g.StudentID = s.ID
GROUP BY s.ID

SELECT *
FROM vv_StudentGrades

--● Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
as
SELECT s.FirstName, s.LastName, COUNT(g.Grade) as GradesPerStudent
FROM Grade g
JOIN Student s on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName

--● List all rows from view ordered by biggest Grade Count
SELECT *
FROM vv_StudentGrades
ORDER BY GradesPerStudent desc
