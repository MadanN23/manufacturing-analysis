use project;
describe mfd;
UPDATE mfd 
SET Doc_Date = STR_TO_DATE(Doc_Date, '%d-%m-%Y %H:%i');
ALTER TABLE mfd
MODIFY COLUMN Doc_Date DATETIME;


select * from mfd;


#1 Total Manufactured Qty
select sum(today_Manufactured_qty) as Manufactured_QTY from mfd;

#2 Total Rejected Qty
select sum(Rejected_Qty) as Rejected_Qty from mfd;

#3 Total Processed Qty
select sum(Processed_Qty) as Processed_Qty from mfd;

#4 Wastage Qty
select sum(WO_Qty) as Wastage_Qty from mfd;

#5 Employee Wise Rejected Qty
select Emp_Name,sum(Rejected_Qty) as Rejected_Qty from mfd group by Emp_name order by Rejected_Qty;

#6 Machine Wise Rejected Qty
select Machine_Code,sum(Rejected_Qty) as Rejected_Qty from mfd group by Machine_Code order by Rejected_Qty desc;

#7 select month wise Rejected and Produced Qty
select monthname(Doc_Date) as Month_name,sum(Produced_Qty) as Produced_Qty,sum(Rejected_Qty) as Rejected_Qty  from mfd group by month(Doc_Date),Month_name order by month(Doc_Date);

#8 Department Wise Manufactured and Rejected Qty
select Department_Name,sum(Produced_Qty) as Produced_Qty,sum(Rejected_Qty) as Rejected_Qty  from mfd group by Department_Name;


#9 Buyer , Operation_Name wise Produced,Processed and Rejected Qty
Select Buyer,Operation_Name,sum(Produced_Qty) as Produced_Qty,sum(Processed_Qty) as Processed_Qty,sum(Rejected_Qty) as Rejected_Qty from mfd group by buyer,Operation_Name order by Buyer;

#10 Count of Delivery Period for Each Buyer
select Buyer,sum(case when Delivery_Period="Late" then 1 end) as "Late",
sum(case when Delivery_Period="On Time" then 1 end) as "ON_Time",
sum(case when Delivery_Period="Early" then 1 end) as "Early" from mfd group by Buyer;