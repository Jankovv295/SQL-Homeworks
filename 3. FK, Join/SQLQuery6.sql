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
where LastName like 'J%' and EnrolledDate like '1998.01'

--○ List all Students ordered by FirstName
select * 
from Student
order by FirstName

--○ List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates
select *
from Teacher



--○ Create Foreign key constraints from diagram or with script
--○ List all possible combinations of Courses names and AchievementType
--names that can be passed by student
--○ List all Teachers without exam Grade
