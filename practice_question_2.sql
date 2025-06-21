use it_4_all



CREATE TABLE Emp(
[Group]  varchar(20),
[Sequence]  int )

INSERT INTO Emp VALUES('A',1)
INSERT INTO Emp VALUES('A',2)
INSERT INTO Emp VALUES('A',3)
INSERT INTO Emp VALUES('A',5)
INSERT INTO Emp VALUES('A',6)
INSERT INTO Emp VALUES('A',8)
INSERT INTO Emp VALUES('A',9)
INSERT INTO Emp VALUES('B',11)
INSERT INTO Emp VALUES('C',1)
INSERT INTO Emp VALUES('C',2)
INSERT INTO Emp VALUES('C',3)


select * from emp



--Problem Statement : Write a SQL query to find the maximum and minimum values of continuous ‘Sequence’ in each ‘Group’

-- This query identifies continuous sequence ranges within each group
-- It uses ROW_NUMBER to detect breaks (gaps) in sequences

-- First: create a base query that assigns row numbers and calculates a difference (grp_split)
-- grp_split is constant for continuous sequences
select 
[group],
[sequence],

-- Assign row numbers ordered by Sequence within each Group

ROW_NUMBER() over(partition by [group] order by [sequence]) as rnk,
  -- Compute grp_split: Sequence - rnk will be same for continuous sequences
[sequence]-ROW_NUMBER() over(partition by [group] order by [sequence]) as grp_split
from emp



-- Final query: group by Group and grp_split to get min and max of each continuous sequence


select
[group],
min([sequence]) as  min_seq,
max([sequence]) as max_seq
from(
select
[group],
[sequence],
ROW_NUMBER() over(partition by [group] order by [sequence]) as rnk,
[sequence]-ROW_NUMBER() over(partition by [group] order by [sequence]) as grp_split
from emp) as a
group by [group],[grp_split]
order by [group]














