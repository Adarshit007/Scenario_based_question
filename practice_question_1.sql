create database it_4_all

use it_4_all

CREATE TABLE [dbo].[Transaction_Tbl](
 [CustID] [int] ,
 [TranID] [int] ,
 [TranAmt] [float] ,
 [TranDate] [date] 
) 

INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date))
INSERT [dbo].[Transaction_Tbl] ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date))


select * from Transaction_Tbl

--Problem Statement:-
--Transatcion_tbl Table has four columns CustID, TranID, TranAmt, and  TranDate.
--User has to display all these fields along with maximum TranAmt for each CustID and ratio of TranAmt and maximum TranAmt for each transaction.

--using sub squery


select 
a.custid,
a.tranid,
a.tranamt,
a.trandate,
maxtran_amt,
(TranAmt/maxtran_amt) as ratio
from Transaction_Tbl as a
inner join
(select custid, 
MAX(tranamt) as maxtran_amt
from Transaction_Tbl
group by CustID) as b
on a.CustID=b.CustID



--using CTE

with max_tran as(
select custid,
MAX(tranamt) as maxtran_amt
from Transaction_Tbl
group by CustID) 

select 
a.custid,
a.tranid,
a.tranamt,
a.trandate,
b.maxtran_amt,
(tranamt/maxtran_amt) as ratio
from Transaction_Tbl as a
inner join 
max_tran as b
on a.custid=b.CustID

