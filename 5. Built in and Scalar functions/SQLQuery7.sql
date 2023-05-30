--● Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable
DECLARE @FirstName nvarchar(50)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

--● Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students
DECLARE @VarTableFemaleStudents TABLE (
StudentId int,
StudentName nvarchar(50),
DateOfBirth datetime
)

INSERT INTO @VarTableFemaleStudents(StudentId, StudentName, DateOfBirth)
SELECT S.ID, S.FirstName, DateOfBirth
FROM Student S
WHERE Gender = 'F'
GROUP BY S.ID, S.FirstName, DateOfBirth

SELECT * FROM @VarTableFemaleStudents

--● Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #TempTable(LastName nvarchar(50), EnrolledDate datetime)

INSERT INTO #TempTable(LastName, EnrolledDate)
SELECT S.LastName, S.EnrolledDate
FROM Student S
WHERE Gender = 'M' AND FirstName like 'A%'
GROUP BY S.LastName, S.EnrolledDate

SELECT * FROM #TempTable

SELECT *
FROM #TempTable t
WHERE LEN(t.LastName) = 7;

--● Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher T
WHERE LEN(T.FirstName) < 5 AND LEFT(T.FirstName, 3) = LEFT(T.LastName, 3)


