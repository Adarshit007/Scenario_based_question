use it_4_all






CREATE TABLE Student(
[Student_Name]  varchar(30),
[Total_Marks]  int ,
[Year]  int)

INSERT INTO Student VALUES('Rahul',90,2010)
INSERT INTO Student VALUES('Sanjay',80,2010)
INSERT INTO Student VALUES('Mohan',70,2010)
INSERT INTO Student VALUES('Rahul',90,2011)
INSERT INTO Student VALUES('Sanjay',85,2011)
INSERT INTO Student VALUES('Mohan',65,2011)
INSERT INTO Student VALUES('Rahul',80,2012)
INSERT INTO Student VALUES('Sanjay',80,2012)
INSERT INTO Student VALUES('Mohan',90,2012)

select * from Student




--Problem Statement:-
--Student Table has three columns Student_Name, Total_Marks and Year.
--User has to write a SQL query to display Student_Name, Total_Marks, Year,
--Prev_Yr_Marks for those whose Total_Marks are greater than or equal to the previous year.


select 
student_name,
Total_Marks,
[YEAR],
prev_yr
from(
select
student_name,
Total_Marks,
[year],
prev_yr,
case 
    when total_marks >= prev_yr then 1 
	else 0 
end as flag
from(
select
Student_name,
YEAR,
total_marks,
LAG(total_marks) over(partition by student_name order by year) as prev_yr
from Student) as a
) as b
where flag=1



















