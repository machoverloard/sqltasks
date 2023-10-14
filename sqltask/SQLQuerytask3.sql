/*CREATE DATABASE Stud
GO
    
USE Stud
GO

 
create table student
(
stdid int,
stdname varchar(15),
stdage int
)
insert into student(stdid,stdname,stdage)
values(1,'Amal',22)
insert into student(stdid,stdname,stdage)
values(2,'Babu',22)
insert into student(stdid,stdname,stdage)
values(3,'Dona',22)
insert into student(stdid,stdname,stdage)
values(4,'Elsa',22)
insert into student(stdid,stdname,stdage)
values(5,'Freddy',23)

create table departments
(
dptid int,
stdname varchar(15),
dptname varchar(20),
)
insert into departments(dptid,stdname,dptname)
values(100,'Amal','chemistry')
insert into departments(dptid,stdname,dptname)
values(101,'Babu','physics')
insert into departments(dptid,stdname,dptname)
values(102,'Dona','zoology')
insert into departments(dptid,stdname,dptname)
values(103,'Elsa','botany')
insert into departments(dptid,stdname,dptname)
values(104,'Freddy','physics')
select * from departments


--select student.stdid,departments.dptname from student  INNER JOIN departments on student.stdname=departments.stdname;

--select student.stdname,departments.dptname from student  left join departments on student.stdname=departments.stdname order by student.stdname;
--select student.stdid,departments.dptname from student  right join  departments on student.stdname=departments.stdname order by student.stdname;



CREATE PROCEDURE createusers
as
begin
select student.stdid,departments.dptname from student  INNER JOIN departments on student.stdname=departments.stdname;

end
exec createusers

alter procedure createusers
@dept varchar(20)
as 
begin
select student.stdid,departments.dptname from student  INNER JOIN departments on student.stdname=departments.stdname where dptname=@dept
end
exec createusers 'b.com'

drop procedure createusers


create procedure createstd
@stdid int,
@stdname varchar(15),
@stdage int,
@choice varchar(20)
as
begin
set nocount on;
if @choice='insert'
begin
insert into student values(@stdid,@stdname,@stdage)
end
if @choice ='update'
begin
update student set
stdid=@stdid,
stdname=@stdname,
stdage=@stdage
where stdid=@stdid
end
if @choice='delete'
begin
delete from student where stdid=@stdid
end
end
go 


 exec createstd @stdid=6,@stdname='anakha',@stdage=23,@choice='insert'
 exec createstd @stdid=3,@stdname='aromal',@stdage=26,@choice='update'
 exec createstd @stdid=7,@stdname='archana',@stdage=25,@choice='insert'
 
  
 

 exec createstd @stdid=1,@choice='delete'

 select * from student;

 

CREATE TABLE studentpivot(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL
);

INSERT INTO studentpivot (id, name, gender) VALUES (1, 'Maria', 'Female');
INSERT INTO studentpivot (id, name, gender) VALUES (2, 'Vishnu', 'male');
INSERT INTO studentpivot(id, name, gender) VALUES (3, 'Alex', 'Other');
INSERT INTO studentpivot (id, name, gender) VALUES (4, 'Sagar', 'Male');
INSERT INTO studentpivot (id, name, gender) VALUES (5, 'Athira', 'Female');
INSERT INTO studentpivot(id, name, gender) VALUES (6, 'rahul', 'Male');
INSERT INTO studentpivot (id, name, gender) VALUES (7, 'elizabeth', 'Female');
INSERT INTO studentpivot (id, name, gender) VALUES (8, 'parvathy', 'female');
INSERT INTO studentpivot (id, name, gender) VALUES (9, 'Anila', 'Female');
INSERT INTO studentpivot (id, name, gender) VALUES (10, 'Fready', 'Male');

SELECT * from studentpivot;

SELECT 
    'Total Students' as total_students_by_gender,
    [Male] as male,
    [Female] as female,
    [Other] as other
FROM (
    SELECT id, gender FROM studentpivot
) as students
PIVOT (
    COUNT(id) FOR gender in ([Male], [Female], [Other])
) pivot_table;


SELECT
    id,
    name,
    gender
FROM (
    SELECT
        total_students_by_gender,
        male,
        female,
        other
    FROM pivot_table
) AS unpivoted
UNPIVOT (
    gender FOR gender_type IN (male, female, other)
) AS result;



create table sourceemployee
(
id int,
empname varchar(20),
empsalary float,
empage int,
empgender varchar(10),
empdept varchar(10)
)

insert into sourceemployee values(1,'amal',10000,22,'male','operator')
insert into sourceemployee values(2,'anoop',20000,25,'male','manager')
insert into sourceemployee values(4,'anakha',15000,22,'female','accountant')
insert into sourceemployee values(6,'avani',10000,23,'female','manager')
insert into sourceemployee values(7,'amala',10000,22,'female','clerk')


create table targetemployee
(
id int,
empname varchar(20),
empsalary float,
empage int,
empgender varchar(10),
empdept varchar(10)
)

insert into targetemployee values(1,'athul',12500,23,'male','operator')
insert into targetemployee values(2,'anandu',40000,27,'male','manager')
insert into targetemployee values(4,'anakha',15000,22,'female','accountant')
insert into targetemployee values(6,'reji',30000,23,'female','manager')
insert into targetemployee values(3,'raju',10000,22,'male','cleaner')
insert into targetemployee values(5,'malu',50000,22,'male','Assi.manager')

merge targetemployee as t
using sourceemployee as s
on t.id=s.id
when matched
then update set t.empsalary=s.empsalary,t.empage=s.empage
when not matched by target
then insert(id,empname,empsalary,empage,empgender,empdept)values(s.id,s.empname,s.empsalary,s.empage,s.empgender,s.empdept)
when not matched by source
then delete;

select * from targetemployee*/