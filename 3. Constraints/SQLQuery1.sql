use HomeWork3

--○ Find all Students with FirstName = Antonio
select *
from Student
where FirstName = 'Antonio'

--○ Find all Students with DateOfBirth greater than ‘01.01.1999’
select *
from Student
where DateOfBirth > '1999.01.01'

--○ Find all Students with LastName starting With ‘J’ enrolled in January/1998
select *
from Student
where LastName like 'J%' 
and MONTH(EnrolledDate) = 1 
and YEAR (EnrolledDate) = 1998;

--○ List all Students ordered by FirstName
select *
from Student
order by FirstName

--○ List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates
select LastName
from Teacher
Union
select LastName
from Student

--○ Create Foreign key constraints from diagram or with script
-- so diagram e napraveno

--○ List all possible combinations of Courses names and AchievementType
--names that can be passed by student

SELECT Course.Name, AchievementType.Name
FROM Course
CROSS JOIN AchievementType;

--○ List all Teachers without exam Grades
select *
from Teacher
left join Grade on Teacher.ID = Grade.TeacherID
where Grade.ID is null;
