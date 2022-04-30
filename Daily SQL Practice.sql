
---DDL---14/03/2022 
----CREATE TABLE,ALTER,DROP----
--create table--
create table big_bazar10(id number(2),name varchar(20),location varchar(20));

create table man(id number(2),name varchar(20),location varchar(20));

select * from big_bazar10;

desc big_bazar10

--alter table---
 alter table big_bazar10 add email_id varchar(20);

select * from big_bazar10

alter table big_bazar10 drop column email_id;

select * from big_bazar10

alter table big_bazar10 modify name char(15);

select * from big_bazar10

--RENAME--(By using rename command we can rename column and table name)

rename man to women;

desc women;

alter table women rename column name to name_1;

desc women;

--DML--(Data manipulation language)
--1.INSERT-Creates a record

insert into women values(1,'baalu','mysore');

insert into women values(2,'baghya','gadag');

insert into women values(3,'bramha','bellary');

select * from women;

create table chennai(id number(2),name_2 varchar(20),location varchar(20));

insert into chennai value (select * from women);

select * from chennai;

value--insert bulk rows from another table
values--insert one rows

create table hassan(id number(2),name_1 varchar(20),location varchar(20));

insert into hassan value(select * from women);

select * from hassan;

--difference between balnk and null?
--blank-space has been defined
--null--no value,no space

--2.UPDATE-modifies a record

create table hp(id number(2),name varchar(20),location varchar(20));

insert into hp values(1,'akash','ckm');

insert into hp values(2,'anil','mys');

insert into hp values(3,'ashwath','dvg');

select * from hp;

update hp
set location='pune';

update hp
set location='bangalore'
where id=1;

update hp
set id=4
where name='ashwath';

select * from hp;

--3.DELETE-Deletes a record

create table jamoon(id number(2),name varchar(10),location varchar(10));

insert into jamoon values(1,'ashok','mys');

insert into jamoon values(2,'anamika','bng');

select * from jamoon;

delete jamoon 
where id=2;

delete jamoon;

select * from jamoon;

--4SELECT--Display purpose

select * from employees;

select employee_id,first_name from employees;

select * from employees where salary=24000;

select * from employees where commission_pct is not null;

select * from employees where employee_id=155;

select * from employees where employee_id in (156,157);

select * from employees where first_name in ('Steven','Jenette');
 
--TCL--Transaction control language
--tcl commands are
COMMIT--Save the data fro redologfile
ROLLBACK--It will undo your last work

--DCL-Data control language

--GRANT-we can grant the permission to HR

GRANT connect,resource,DBA to HR

--REVOKE-we can take back all the given permission

revoke,connect,resource DBA from HR;

--AGGREGATE FUNCTION--

--SUM:gives sum

select sum(salary)from employees;

select sum(salary) from employees where department_id=60;

--MAX-returns the maximum values of specific column

select max(salary) from employees;

select max(salary) from employees where department_id=90;

--MIN--Gives minimum value

select min(salary) from employees;

select min(salary) from employees where department_id=100;

--AVG--Gives average value,it may give output in decimal value

select avg(salary) from employees;

--COUNT--Calulate total rows from selected column

select count(first_name) from employees;

select count(salary) from employees;

select count(commssion_pct) from employees; --(is there any null in the column it shoudn't dispaly)

select count(*) from employees;

--ROUND--round function rounds the decimal value 

select round(salary) from employees;


CHARACTER FUNCTION----By using character function we can convert the data from one format to another format


--ltrim,rtirm,trim,upper,lower,initcap,decode,nvl

create table pant(id number,name varchar(20),location varchar(20));

insert into pant values(1,'  chandhu','bng   ');

insert into pant values(2,'chandru  ','  mng');

insert into pant values(3,'CHAITRA','MYSOre');

insert into pant values(4,'chaKORI','bangalORE');

select * from pant;

--LTRIM--removes the space from left side of the string
select id,ltrim(name),location from pant;

select ltrim(name),ltrim(location) from pant;

--RTRIM--removes the space from right side of the string

select id,rtrim(name),location from pant;

select id,rtrim(name),rtrim(location)from pant;

--TRIM--removes the space from both side of the string

select id,trim(name),location from pant;

select id,trim(name),trim(location) from pant;

update pant
set name=trim(name);

select* from pant;

--UPPER--It converts all lower cases into upper cases and if it is in already upper case,it will display as it is.

select id,upper(name),location from pant;

select id,upper(name),upper(location) from pant;

--LOWER--It converts all upper cases into lower cases and if it is in already lower case,it will display as it is.

select id,lower(name),location from pant;

select lower(name) from pant;

select id,lower(name),lower(location) from pant;

--INITCAP--By using initcap it will change initial letter to capital and remaining as small letter.

select id,initcap(name),location from pant;

select id,initcap(name),initcap(location) from pant;

--DECODE FUNCTION---

create table plants(id number(2),name varchar(20),location varchar(20));

insert into plants values(1,'ram','ckm');

insert into plants values(2,'raj','hsn');

insert into plants values(3,'raaghu','mys');

insert into plants values(4,'ravi','mng');

select * from plants

select id,name,decode(location,'ckm','chikmagaluru','hsn','hassan','mys','mysore','mng','mangalore') from plants;

select id,name,decode(location,'ckm','chikmagaluru','hsn','hassan','mys','mysore','mng','mangalore') updated_location from plants;

--NVL--null value logic

select * from employees;

select employee_id,first_name,email,commission_pct, nvl(commission_pct,10) from employees;

select employee_id,commission_pct,nvl(commission_pct,25) from employees;

select nvl(commission_pct,13) from employees where employee_id=2;

---DATE FUNCTION---

--system date(today date)
select sysdate from dual;

--to get yesterdays date--
select sysdate-1 from dual;

--to get tommorows date--
select sysdate+1 from dual;

--TO_CHAR--Convert month from number format to character format

select to_char(sysdate,'dd-mm-yy') from dual;

select to_char(sysdate,'dd-mm-yyyy') from dual;

select to_char(sysdate,'dd-mon-yyyy') from dual;

select to_char(sysdate,'dd-month-yyyy') from dual;

select to_char(sysdate,'dd/month/yyyy') from dual;

select to_char(sysdate,'dd month yyyy') from dual;

select to_char(sysdate,'day dd month yyyy') from dual;

select to_char(sysdate,'day dd month yyyy hh:mi:ss') from dual;

--ADD MONTHS--

select add_months(sysdate,1) from dual;

select add_months(sysdate,-1) from dual;


--MONTHS_BETWEEN--

select months_between('01-04-2022','01-04-2021') from dual;

select months_between('01-april-2021','01-april-2019') from dual;

--LAST DAY--

select last_day('01-feb-2022') from dual;

select last_day('01-april-2022') from dual;

select last_day('01-02-2022') from dual;

--NEXT DAY--

select next_day(sysdate,'sunday') from dual;

select next_day(sysdate,'friday') from dual;

--APPLY ON TABLE--
  --just query--
select empno,empname,to_char(hire_date,'yyyy') as doj from emp;

-----where clause----

select * from employees;

select *from employees where employee_id=100;

select * from employees where employee_id=100 or employee_id=105 or employee_id=106;

select * from employees where first_name='Steven';

----order by---

select distinct department_id from employees order by department_id asc;

------group by clause-------

select job_id,sum(salary) from employees group by job_id;

select department_id, sum(salary) from employees group by department_id;

select manager_id,sum(salary) from employees group by manager_id;

------having clause------

select job_id, sum(salary) from employees group by job_id having sum(salary)>10000;

select department_id, sum(salary) from employees group by department_id having sum(salary)<20000;

select job_id, sum(salary) from employees group by job_id having sum(salary)>50000;


---LOGICAL OPERATORS---
--1.AND-To get specific data.It is mandatory and it should satisfy allcondition

select * from employees;

select * from employees where first_name='Steven' and department_id=90;

select * from employees where last_name='Pataballa' and department_id=60;

--2.OR--It is not mandatory and it shouldn't satisfy allcondition

select * from employees where first_name='Steven' or department_id=90;

select * from employees where last_name='Pataballa' or manager_id=103;

--3.BETWEEN--can be used only on numerical value and date

select * from employees where salary between 5000 and 7000;

select * from employees where employee_id between 103 and 109;

select * from employees where hire_date between 07-02-07 and 03-01-06;

--COMPARISION OPERATOR--
> Greater than
>=greater than equal
<less than
<=-less than equal
=equal
!= not equal <>

select * from employees where salary >=17000;

select * from employees where salary <=17000;

--CONSTRAINTS--

--1.NOT NULL--It will allow to insert any null value in any particular column while creating table.

create table flipkart_1(id number(2),name varchar(25)not null,location varchar(20));

select * from flipkart_1;

desc flipkart_1;


--2.UNIQUE CONSTRAINTS--Null is allowed and duplicate is not allowed.

create table snapdeal_1(id number(2),name varchar(20)unique,location varchar(20));

select * from snapdeal_1;

desc snapdeal_1;

--3.PRIMARY KEY CONSTRAINTS--It will not alow to insert any null values and duplicate value.

create table photo_1(id number(2)primary key,name varchar (20),location varchar(20));

select * from photo_1;

desc photo_1;

create table hospital_1(id number(10) primary key,name varchar(25)not null,location varchar(25)unique);

select * from hospital_1;

desc hospital_1;

--4.COMPOSITE PRIMARY KEY--More than one column

create table ravi_mama
(id number(2),name varchar(20),location varchar(20),primary key(id,name,location));

alter table ravi_mama add phone_number number(10);

desc ravi_mama;

insert into ravi_mama values(1,'shanthu','shivamogga',89566);

insert into ravi_mama values(2,'shanthi','mysore',86955);

insert into ravi_mama values(3,'sharadha','coorg',78999);

select * from ravi_mama;

--5.FOREIGN KEY CONSTRAINTS--It is always found in child table and also called as child table.

create table milind_1(id number(2)primary key,name varchar(20),location varchar(20));

create table lakshmi(id number(2),name varchar(20),location varchar(20),foreign key(id),reference milind_1(id));

--5.CHECK CONSTRAINTS---Biund to insert the value from the given range(date&salary)

create table ravi_mama1
(id number(3),name varchar(20),salary number(10),check(salary between 10000 and 5000));

insert into ravi_mama1 values(1,'kavya',10000 and 5000);

create table raaamu
(id number(2),name varchar(20),salary number(10),check(salary between 10000 and 5000));

insert into raamu values(1,'raaju',10000);

--CASE STATEMENT---

select * from employees;

select employee_id,first_name,salary,
(case
when salary>20000 then 'grade A'
when salary>15000 and salary<20000 then 'grade B'
when salary>10000 and salary<15000 then 'grade C'
else 'grade D'
end) as grade_sal
from employees;

create table homes(id number(2),name varchar(20),gender varchar(20));

insert into homes values(1,'girish','female');

insert into homes values(2,'geetha','male');

insert into homes values(3,'govind','female');

insert into homes values(2,'girija','female');

insert into homes values(2,'nikitha','male');

insert into homes values(2,'giri','female');

select * from homes;

select id,name,gender,
(case
when gender='female' then 'male'
when gender='male' then 'female'
end)as c_gender
from homes;

--ANALYTICAL FUNCTION--
--(RANK AND DENSE RANK)--

---RANK--(It will escape serial number)

select * from employees;

select employee_id,first_name,last_name,salary, rank() over(order by salary desc) from employees;

select employee_id,first_name,email,phone_number,job_id,salary,rank () over (order by salary desc) from employees;

select employee_id,salary, rank () over(order by salary desc) from employees;

--DENSE RANK--Doesn't escape from serial number.

select * from employees;

select employee_id,first_name,last_name,salary, dense_rank () over(order by salary desc) from employees;

select employee_id,first_name,job_id,hire_date,salary, dense_rank () over(order by salary desc) from employees;

--rank & denserank

select employee_id,first_name,last_name,job_id,hire_date,salary, rank () over(order by salary desc),
dense_rank () over(order by salary desc) from employees;

--how to get 9th highest saalary from the table?

select * from employees;

select * from
(select employees.*,
rank () over(order by salary desc)
as sal_rank from employees)
where sal_rank=& sal_rank;

select * from
(select employees.*,
dense_rank () over (order by salary desc)
as sal_rank from employees)
where sal_rank=& sal_rank;


select * from
(select employees.*,
rank () over (order by salary desc)
as sal_rank from employees)
where sal_rank=7;

select * from
(select employees.*,
dense_rank () over (order by salary desc)
as sal_rank from employees)
where sal_rank=5;

--PSUEDO COLUMNS--

select* from employees;

select first_name,email,salary,rownum,rowid from employees;

select first_name,email,salary,rownum from employees;

select first_name,email,salary,rowid from employees;

--SET OPEARTORS--

create table bangalore(id number(2));

insert into bangalore values(1);

insert into bangalore values(2);

insert into bangalore values(3);

insert into bangalore values(4);

insert into bangalore values(5);

truncate table pune;

create table goa(id number(2));

insert into goa values(5);

insert into goa values(6);

insert into goa values(7);

insert into goa values(8);

insert into goa values(9);

--1.UNION--(join two tables)

select id from bangalore
union
select id from goa;

select id from goa
union
select id from bangalore;

--2.UNION ALL--(It will display all the data)

select id from bangalore
union all
select id from goa;

select id from goa 
union all
select id from bangalore;

--3.INTERSECT--(It will give a very common data/same data)

select id from bangalore
intersect
select id from goa;

select id from goa
intersect
select id from bangalore;

--4.MINUS--(Data validation on any type if data)

select id from bangalore
minus
select id from goa;

select id from goa
minus
select id from bangalore;


create table preetha(id number(2),name varchar(20),location varchar(20),contact number(10));

insert into preetha values(1,'akash','mudigere',86955);

insert into preetha values(2,'amar','chikmagalur',89665);

 insert into preetha values(3,'anil','davanagere',94810);

insert into preetha values(4,'ashwath','managalore',89550);

select * from preetha;

delete preetha
where id=4;


create table chethan(emp_id number(2),name varchar(20),email_id varchar(20));

insert into chethan values(1,'gagan','gagan@gmail.com');

insert into chethan values(2,'gowtham','gowtham@gmail.com');

insert into chethan values(3,'gowri','gowri@gmail.com');

insert into chethan values(4,'giri','giri@gmail.com');

select * from chethan;

select id,name from preetha
union
select emp_id,name from chethan;

select id,name from preetha
union all
select emp_id,name from chethan;

select id,name from preetha
intersect
select emp_id,name from chethan;

select id,name from preetha
minus
select emp_id,name from chethan;

select emp_id,name from chethan
minus
select id,name from preetha;
 
--JOINS--(Joins two or more table)

select * from employees;

select * from departments;

select employees.employee_id,employees.first_name,employees.salary,employees.department_id,
departments.department_id,departments.location_id
from employees,departments
where employees.department_id=departments.department_id;

select e.employee_id,e.first_name,e.salary,e.department_id,
d.department_id,d.location_id
from employees e,departments d
where e.department_id=d.department_id;

select emp.employee_id,emp.first_name,emp.salary,emp.department_id,
dept.department_id,dept.location_id
from employees emp,departments dept
where emp.employee_id=dept.department_id;

--EQUI JOIN--

select * from employees;

select employee_id,first_name,job_id,department_id from employees
union all
select employee_id,first_name,job_id,department_id from employees;

select * from departments;

select department_id,manager_id,location_id from departments
union all
select department_id,manager_id,location_id from departments;


---CROSS JOIN--

Select emp.employee_id,emp.first_name,emp.salary,emp.department_id,
dept.department_id,dept.location_id
from employees emp,departments dept;

--LEFT OUTER JOIN--All the data from the left of the table and matching data from the right of the table.

select employees.employee_id,employees.department_id,
departments.department_name,departments.location_id
from employees left outer join departments
on employees.department_id=departments.department_id;

--RIGHT OUTER JOIN--All the data from the right of the table and matching data from the left of the table.
select * from employees;

select * from departments;

select employees.employee_id,employees.first_name,employees.department_id,
departments.department_id,departments.department_name,departments.location_id
from employees right outer join departments
on employees.department_id=departments.department_id;

--INNER OUTER JOIN--give you very common data

select employees.employee_id,employees.first_name,employees.department_id,
departments.department_id,departments.department_name,departments.location_id
from employees inner join departments
on employees.department_id=departments.department_id;

--FULL OUTER JOIN--will give all the data from both table without any delete

select employees.employee_id,employees.first_name,employees.department_id,
departments.department_id,departments.department_name,departments.location_id
from employees full outer join departments
on employees.department_id=departments.department_id;

--SELF JOIN--joins on the single or same table

select * from employees;

select e.employee_id,e.first_name,m.first_name as manager
from employees e,employees m
where e.department_id=m.department_id;


--SUB QUARIES-- inner query or nested query

select * from employees;

select * from departments;

select employee_id,first_name,last_name,salary,department_id from employees
where department_id=(select department_id from departments where department_name='Marketing');

select employee_id,first_name,salary,department_id from employees
where department_id=(select department_id from departments where department_name='Purchasing');

select employee_id,department_id from employees 
where department_id=(select department_id from departments where department_name='Shipping');

select * from employees 
where department_id=(select department_id from departments where department_name='IT');


select * from employees where department_id=(select department_id from departments where department_name='Human Resources');

--VIEW--(It can be created by single table or multiple table)virtual relection of the table,which doesn't occupy any space.

create view bangalore_hyd as select * from employees;

select * from bangalore_hyd;

create view bellary_bng as select * from departments;

select * from bellary_bng;

--LIKE OPERATOR---we can apply only on characters and date  

select * from employees where first_name like 'S%';

select * from employees where first_name like '%s';

select * from employees where first_name like 'A%';

select * from employees where first_name like '%a%';

select * from employees where first_name like 'A%' or first_name like '%a';

select * from employees where first_name like 'L%' and last_name like '%t';



173 queries

1) display details of all the employees & department

select * from employees;

select * from departments;

2) Display the name and job for all the employees

select first_name,job_id from employees;

3)Display the name and salary  for all the employees

select first_name,salary from employees;

5)Display the employee no and total salary  for all the employees
 
select employee_id,first_name,salary,commission_pct,nvl(commission_pct,0) from employees;

select employee_id,first_name,salary,commission_pct, salary+nvl(commission_pct,100) as "toatal salary" from employees;

6)) Display the employee name and annual salary for all employees.

select 12*(salary+nvl(commission_pct,0)) as "annual salary" from employees;

select 6*(salary+nvl(commission_pct,10)) as " mid term salary" from employees;

7) Display the names of all the employees who are working in depart number 10.

select * from employees where department_id=10;

8) Display the names of all the employees who are working as clerks and 
   drawing a salary more than 3000.

9)Display the employee number and name  who are earning comm.

select employee_id,first_name from employees where commission_pct is not null;

10)Display the employee number and name  who are earning not comm.

select employee_id,first_name from employees where commission_pct is null;

11) Display the names of employees who are working as clerks, salesman or 
analyst and drawing a salary more than 3000.

select first_name from employees where job_id='SH_CLEARK' or job_id='HR_REP' or job_id='PR_REP' and salary >3000;

12) Display the names of the employees who are working in the company for 
the past 5 years;

select first_name from employees where to_char(sysdate,'yyyy')-to_char(hire_date,'yyyy') >=5;

13) Display the list of employees who have joined the company before 
30-JUN-90 or after 31-DEC-90.

select first_name from employees where hire_date<'30-jun-90' or hire_date>'31-dec-90';

14) Display current Date.
select sysdate from dual;

15) Display the list of all users in your database (use catalog table).
select * from all_users;

16) Display the names of all tables from current user;
select * from all_tables;

17) Display the name of the current user.
show user;


18) Display the names of employees working in depart number 10 or 20 or 40 
or employees working as
CLERKS,SALESMAN or ANALYST.

select first_name from employees where department_id in(10,20,30) or job_id in('AD_VP','AD_PRES','FI_MGR');

19) Display the names of employees whose name starts with alaphabet S.

select * from employees where first_name like 'S%';

select first_name from employees where first_name like'S%';

20) Display the Employee names for employees whose name ends with alaphabet S.
 
select * from employees where first_name like '%S';

select first_name from employees where first_name like '%S';

21) Display the names of employees whose names have second alphabet A in  
their names.

select * from employees where first_name like '_a%';

22) select the names of the employee whose names is exactly five characters 
in length.

select first_name from employees where length(first_name)=5;

23) Display the names of the employee who are not working as MANAGERS.

select first_name from employees where job_id not in('AD_VP');

24) Display the names of the employee who are not working as SALESMAN OR 
CLERK OR ANALYST.
select * from employees;

select first_name from employees where job_id not in('AD_VP','AD_PRES','FI_MGR');

25) Display all rows from emp table.The system should wait after every 
screen full of informaction.

set pause on;

26) Display the total number of employee working in the company.
select count(*) from employees;

27) Display the total salary beiging paid to all employees.
select sum(salary) from employees;

28) Display the maximum salary from emp table.
select max(salary) from employees;

29) Display the minimum salary from emp table.
select min(salary) from employees;

30) Display the average salary from emp table.
select avg(salary) from employees;

31) Display the maximum salary being paid to CLERK.
select max(salary) from employees where job_id='AD_VP';

32) Display the maximum salary being paid to depart number 20.
select max(salary) from employees where department_id=20;

33) Display the minimum salary being paid to any SALESMAN.
select min(salary) from employees where job_id='IT_PROG';

34) Display the average salary drawn by MANAGERS.
select avg(salary) from employees where job_id='AD_PRES';

35) Display the total salary drawn by ANALYST working in depart number 40.
select sum(salary) from employees where department_id=90 and job_id='AD_VP';

36) Display the names of the employee in order of salary i.e the name of 
the employee earning lowest salary should appear first.

37) Display the names of the employee in descending order of salary.

select first_name,salary from employees order by salary desc;

38) Display the names of the employee in order of employee name.

select first_name from employees order by first_name;

39) Display empno,ename,deptno,sal sort the output first base on name and 
within name by deptno and with in deptno by sal.

select employee_id,first_name,department_id,salary from employees order by first_name,department_id,salary;

40) Display the name of the employee along with their annual salary(sal*12).The name of the employee earning highest annual salary should apper first.

select first_name,salary*12 from employees order by salary desc;

select first_name,salary*6 from employees order by salary desc;


41) Display name,salary,hra,pf,da,total salary for each employee. The 
output should be in the order of total salary,hra 15% of salary,da 10% of salary,pf 5% 
salary,total salary will be(salary+hra+da)-pf.

select first_name,salary,salary/100*15 as hra,salary/100*10 as da,salary/100*5 as pf,
salary+salary/100*15+salary/100*10-salary/100*5 as total from employees;

42) Display depart numbers and total number of employees working in each 
department.

select department_id,count(department_id) from employees group by department_id;

43) Display the various jobs and total number of employees within each job 
group.

select job_id, count(job_id)from employees group by job_id;

44) Display the depart numbers and total salary for each department.

select department_id,sum(salary) from employees group by department_id;

45) Display the depart numbers and max salary for each department.

select department_id,sum(salary) from employees group by department_id;

46) Display the various jobs and total salary for each job

select job_id,sum(salary) from employees group by job_id;

47) Display the various jobs and total salary for each job

select job_id,min(salary) from employees group by job_id;

48) Display the depart numbers with more than three employees in each dept.

select department_id,count(department_id) from employees group by department_id having count(*)>3;

49) Display the various jobs along with total salary for each of the jobs 
Where total salary is greater than 40000.

select job_id,sum(salary) from employees group by job_id having sum(salary)>40000;

51) Display the name of the employee who earns highest salary.

select first_name,max(salary) from employees group by first_name;

select first_name from employees where salary= (select max(salary) from employees);
 
52) Display the employee number and name for employee working as clerk and 
earning highest salary among clerk

select employee_id,first_name from employees where salary=( select max (salary) from employees where job_id='AD_VP');


53) Display the names of salesman who earns a salary more than the highest 
salary of any clerk.

select first_name,salary from employees where job_id='AD_PRES' and salary>(select max(salary) from employees where job_id='AD_VP');

54) Display the names of clerks who earn a salary more than the lowest 
Salary

select first_name from employees where job_id='AD_VP' and salary=(select min(salary) from employees where job_id='AD_VP');

select first_name from employees where job_id='AD_VP' and salary>(select min(salary) 
from employees
             where job_id='AS_PRES');
             
 55) Display the names of the employees who earn highest salary in their 
respective departments.

select first_name,salary,department_id from employees where salary in(select max(salary) from employees group by department_id);

56) Display the names of the employees who earn highest salaries in their 
respective job groups.

select first_name,salary,job_id from employees where salary in(select max(salary) from employees group by job_id);

57) Display the employee names who are working in accounting department.

select first_name from employees where department_id=(select department_id from departments where department_name='Marketing');

58) Display the employee names who are working in Chicago.

select first_name from employees  where department_id=(select department_id from departments where department_name='Construction');

select ename from emp where deptno=(select deptno from dept where 
LOC='CHICAGO')

59) Display the Job groups having total salary greater than the maximum 
salary for managers.

60) Display the names of employees from department number 10 with salary 
grether than that of any employee working in other department.

select first_name from employees where department_id=90 and salary>any(select salary from employees where department_id not in 90);


61) Display the names of the employees from department number 10 with 
salary greater than that of all employee working in other departments.

select first_name from employees where department_id=90 and salary>all(select salary from employees where deapartment_id not in 90);

62) Display the names of the employees in Uppercase.

select upper(first_name) from employees;

63) Display the names of the employees in Lowecase.
select lower(first_name) from employees;

64) Display the names of the employees in Propercase.
select initcap(first_name) from employees;

65) Display the length of Your name using appropriate function
select length('first_name') from employees;

select length('name') from dual;

66) Display the length of all the employee names.

select length('first_name') from employees;

67) select name of the employee concatenate with employee number. 

select first_name || employee_id from employees;


68) User appropriate function and extract 3 characters starting from 2 
characters from the following  string 'Oracle'. i.e the out put should be 'ac'.

select substr('oracle',3,2) from dual;

select substr('oracle',1,2) from dual;


69) Find the First occurance of character 'a' from the following string i.e 
'Computer Maintenance Corporation'.

select instr('Computer Maintenance Corporation','a')from dual;

70) Replace every occurance of alphabhet A with B in the string Allens(use 
translate function)

select translate('Allens','A','B') from dual;

71) Display the informaction from emp table.Where job manager is found it 
should be displayed as boos(Use replace function).

select replace(job_id,'manager','boss') from employees;


72) Display empno,ename,deptno from emp table.Instead of display department 
numbers display the related department name(Use decode function).

select employee_id,first_name,decode(department_id,60,'SALES',90,'MARKETING') from employees;


73) Display your age in days.
select to_date(sysdate)-to_date('01 april 1998')from dual;

74) Display your age in months.
select months_between(sysdate,'01-04-1998') from dual;

75) Display the current date as 15th Augest Friday Nineteen Ninety Saven.

select to_char(sysdate,'ddth month day year') from dual;

76) Display the following output for each row from emp table.
scott has joined the company on wednesday 13th August ninten nintey.

select first_name ||'HAS JOINED THE COMPANY ON'|| to_char(hire_date,'ddth month year') from employees;

77) Find the date for nearest saturday after current date.

select next_day(sysdate,'saturday') from dual;

78) Display current time.

select to_char (sysdate,'hh:mm:ss') from dual;

79) Display the date three months Before the current date.

select add_months(sysdate,3) from dual;

80) Display the common jobs from department number 10 and 20.

select department_name from departments where department_id=10 and department_name in(select department_name from departments where department_id=20);

81) Display the jobs found in department 10 and 20 Eliminate duplicate jobs.

select distinct(job_id) from employees where department_id=60 or department_id=90;

select distinct(job_id) from employees where department_id in(60,90);

82) Display the jobs which are unique to department 10.

select distinct(job_id) from employees where department_id=90;

84) Display the details of those employees who are in sales department and 
grade is 3.

select * from employees where department_number=(select department_number from departments where department_name='Sales')
and salary between(select losalary from salary_grade where grade=3) and (select hisalary from salary_grade where grade=3);


85) Display those who are not managers and who are managers any one.
i)display the managers names

select first_name from employees where employee_id in(select manager_id from employees);

ii)display the who are not managers 

select first_name from employees where employee_id not in(select manager_id from employees where manager_id is not null);

86) Display those employee whose name contains not less than 4 characters.

select first_name from employees where length(first_name)>4;


87) Display those department whose name start with "S" while the location 
name ends with "K".

select first_name from employees where first_name like'S%' or job_id like'%T';

88) Display those employees whose manager name is JONES.

select p.first_name from employees e,employees p where e.employee_id=p.manager_id and e.first_name='Neena';

select p.ename from emp e,emp p where e.empno=p.mgr and 
e.ename='JONES';


89) Display those employees whose salary is more than 3000 after giving 20% 
increment.CC

select first_name,salary from employees where(salary+salary*.2)>3000;

90) Display all employees while their dept names;

select first_name,department_name from employees,departments where employees.department_id=departments.department_id;

91) Display ename who are working in sales dept.
 
select first_name from employees where department_id=(select department_id from departments where department_name='Sales');


92) Display employee name,deptname,salary and comm for those sal in between 
2000 to 5000 while location is chicago.

select first_name,department_name,salary from employees,departments where (salary between 2000,5000) and
employee.department_id=departments.department_id;

93)Display those employees whose salary greter than his manager salary.

select p.first_name from employees e,employees p where e.employee_id=p.manager_id and p.salary>e.salary;


94) Display those employees who are working in the same dept where his 
manager is work

select p.first_name from employees e,employees p where e.employee_id=p.manager_id and e.department_id=p.department_id;

95) Display those employees who are not working under any manager.
 
 select first_name from employees where manager_id is null;
 
 select first_name from employees where manager_id is not null;
 
 
96) Display grade and employees name for the dept no 10 or 30 but grade is 
not 4 while joined the company before 31-dec-82.

select first_name,grade from employees,salarygrade where salary between losalary and hisalary and department_id in(60,90) and grade<>4 and hiredate<'31-dec-82';

select ename,grade from emp,salgrade where sal between losal and 
hisal and deptno     in(10,30) and grade<>4 and hiredate<'31-DEC-82';


97) Update the salary of each employee by 10% increment who are not 
eligiblw for commission.

update employees set salary=salary+salary*10/100 where commission_pct is null;

98) SELECT those employee who joined the company before 31-dec-82 while 
their dept location is newyork or  Chicago.

select employee_id,first_name,hire_date,department_id,location_id from employees,departments
where(employees.department_id=departments.department_id) and hire_date<'31-dec-82' and location_id in(1700,1800);

SELECT EMPNO,ENAME,HIREDATE,DNAME,LOC FROM EMP,DEPT
 WHERE (EMP.DEPTNO=DEPT.DEPTNO)AND 
HIREDATE <'31-DEC-82' AND DEPT.LOC IN('CHICAGO','NEW YORK');


99) DISPLAY EMPLOYEE NAME,JOB,DEPARTMENT,LOCATION FOR ALL WHO ARE WORKING 
AS  MANAGER?

select e.*,d.* from employees e,deparrment d where employee_id in(select manager_id from employees where manager_id is not null) and d.department_id=e.department_id;

SQL> 1)    select e.*,d.* from emp e,dept d where empno in(select mgr from emp where mgr is         not null) and d.deptno=e.deptno;

100) DISPLAY THOSE EMPLOYEES WHOSE MANAGER NAME IS JONES? --
          [AND ALSO DISPLAY THEIR MANAGER NAME]?
  
  select p.first_name from employees e,employees p where e.employee_id=p.manager_id and e.first_name='Austin'; 
          
          SELECT P.ENAME FROM EMP E, EMP P WHERE E.EMPNO=P.MGR AND 
E.ENAME='JONES';


101) Display name and salary of ford if his salary is equal to hisal of his 
grade

select first_name,salary from employees,salgrade where salary between lowsalary and hisalary
and first_name='Steven' and hisalary=salary;

select ename,sal,grade from emp,salgrade where sal between losal and 
hisal
 and ename ='FORD' AND HISAL=SAL;
 
102) Display employee name,job,depart name ,manager name,his grade and make 
out an under department wise?
 
 select e.first_name,e.job_id,department_name,employees.first_name,grade from employees,employees e,
 salarygrade,departments where employee.salary between losalary and hisalary and employees.employee_id=e.manager_id and employees.department_id=departments.department_id order by department_name;
 
SQL>SELECT E.ENAME,E.JOB,DNAME,EMP.ENAME,GRADE FROM EMP,EMP 
E,SALGRADE,DEPT WHERE EMP.SAL BETWEEN LOSAL AND HISAL AND EMP.EMPNO=E.Mgr AND EMP.DEPTNO=DEPT.DEPTNO ORDER BY DNAME;
 
103) List out all employees name,job,salary,grade and depart name for every 
one in the company  except 'CLERK'.Sort on salary display the highest salary?

select first_name,job_id,department_name,salary,grade,(select max(salary) from employees) from employees,salarygrade,departments where salary between losalary and hisalary and
employees.department_id=departments.department_id and job_id not in('Cleark') order by salary asc;

   SELECT ENAME,JOB,DNAME,SAL,GRADE,(select max(sal) from emp) FROM EMP,SALGRADE,DEPT WHERE 
SAL BETWEEN LOSAL AND HISAL AND EMP.DEPTNO=DEPT.DEPTNO AND JOB
 NOT IN('CLERK')ORDER BY SAL ASC;
 
104) Display the employee name,job and his manager.Display also employee who 
are without manager? 

select employees.first_name,e.job_id,employees.first_name as manager_id from employees, employees e where employees.employee_id(+)=e.manager_id;

105) Find out the top 5 earners of company?

select distinct salary from employees e where 5>=(select count(distinct salary) from employees a where a.salary>=e.salary)order by salary desc;

select * from(select * from employees order by salary desc)where rownum<5;

106) Display name of those employee who are getting the highest salary?

select first_name from(select first_name from employees order by salary desc)where rownum<5;

select first_name from employees where salary=(select max(salary) from employees);


107) Display those employee whose salary is equal to average of maximum and 
minimum?

select first_name from employees where salary=(select max(salary)+min(salary)/2 from employees); 

select ename from emp where sal=(select max(sal)+min(sal)/2 from 
emp);

108) Select count of employee in each department  where count greater than 3?

select count(*) from employees group by department_id having count(department_id)>3;

109) Display dname where at least 3 are working and display only department 
name?
select distinct d.department_name from departments d,employees e where d.department_id=e.department_id and 3>
any(select count(department_id) from employees group by department_id);

110) Display name of those managers name whose salary is more than average 
salary of his company?

select e.first_name,employees.first_name from employees,employees e
where employees.employee_id=e.manager_id and e.salary>(select avg(salary) from employees);

111)Display those managers name whose salary is more than average salary of 
his employee?
select distinct e.first_name from employees e,employees m where m.salary <(select avg(e.salary) from employees where e.employee_id=m.manager_id group by e.first_name)
and e.employee_id=m.manager_id;

112) Display employee name,sal,comm and net pay for those employee 
whose net pay is greter than or equal to any other employee salary of 
the company?

select first_name,salary,commission_pct,salary+nvl(commission_pct,0) as NetPay from employees
where salary+nvl(commission_pct,0) >any(select salary from employees);

113) Display all employees names with total sal of company with each 
employee name?

select first_name,(select sum(salary) from employees) from employees;

114) Find out last 5(least)earners of the company.?
select distinct salary from employees e where 5>=(select count(distinct salary) from employees a where a.salary<=e.salary) order by salary desc;

select first_name from(select first_name,salary from employees order by salary asc) where rownum<=5;

115) Find out the number of employees whose salary is greater than their 
manager salary?

select e.first_name from employees,employees e where employees.employee_id=e.manager_id
and employees.salary<e.salary;

116) Display those department where no employee working?

select department_name from departments where department_id not in(select distinct department_id from employees);

117) Display those employee whose salary is ODD value?

select * from employees where mod(salary,2)=1;

118) Display those employee whose salary contains alleast 3 digits?

select * from employees where length(salary)>=3;

119) Display those employee who joined in the company in the month of Dec?

select first_name from employees where to_char(hire_date,'mon')='dec';

120) Display those employees whose name contains "A"?

select first_name from employees where first_name like'A%';

select first_name from employees where instr(first_name,'A')>0;

121) Display those employee whose deptno is available in salary?

select first_name from employees where substr(salary,1,2)= any(select department_id from employees);

select first_name from employees where salary like'%10%' or salary like '%20%' or salary like '%30%';

select first_name from employees where substr(salary,2,2)= any(select department_id from employees);

122) Display those employee CONCATINATE WITH first 2 characters from hiredate -last 2 
characters of salary?

select first_name, substr(hire_date,1,2)||first_name||substr(hire_date,-2,2) from employees;

123) Display those employee whose 10% of salary is equal to the year of 
joining?

select first_name from employees where to_char(hire_date,'YY')=salary*0.1;

124) Display those employee who are working in sales or research?

select first_name from employees where department_id in(select department_id from departments where department_name in('Sales','IT'));

125) Display the grade of jones?

select first_name,grade from employees, salarygrade where salary between losalary and hisalary and first_name='Steven';

SELECT ENAME,GRADE FROM EMP,SALGRADE
            WHERE SAL BETWEEN LOSAL AND HISAL AND Ename='JONES';

126) Display those employees who joined the company before 15 of the month?

select first_name from employees where to_char(hire_date,'dd')<15;

127) Display those employee who has joined AFTER 15th of the month.

select first_name from employees where to_char(hire_date,'dd')>15;


128) Delete those records where no of employees in a particular department 
is less than 3.

delete from employees where department_id=(select department_id from employees group by department_id having count(department_id)<3);

SQL>delete from emp where deptno=(select deptno from emP group by deptno having count(deptno)<3);

129) Display the name of the department where no employee working.

select department_name from departments where department_id not in(select department_id from employees);

SQL> select dname from dept where deptno not in( select deptno from emp);

130) Display those employees who are working as manager.
select m.first_name manager_id from employees m,employees e where e.manager_id=m.employee_id group by m.first_name;

131) Display those employees whose grade is equal to any number of sal but 
not equal to first number of sal?

select first_name,grade from employees,salarygrade where grade not in(substr(salary(0,1) from employees);

SELECT ENAME,GRADE FROM EMP,SALGRADE
            WHERE GRADE NOT IN(SELECT SUBSTR(SAL,0,1)FROM EMP)

132) Print the details of all the employees who are Sub-ordinate to BLAKE?

select employees.first_name from employees, employees e where employees.manager_id=e.employee_id and e.first_name='Lex';

133) Display employee name and his salary whose salary is greater than highest average of department number?

select first_name from employees where salary>(select max(avg(salary)) from employees group by department_id);

134) Display the 10th record of emp table(without using rowid)

select * from employees where rownum<11
minus
select *from employees where rownum<10;

135) Display the half of the ename's in upper case and remaining lowercase?

select substr(upper(first_name),1,3)||substr(lower(first_name),3,length(first_name)) from employees;

136) Display the 10th record of emp table without using group by and rowid?
select * from employees where rownum<11
minus
select * from employees where rownum<10;

1)Delete the 10th record of emp table.

delete from employees where employee_id=(select employee_id from employees where rownum<11
minus
select employee_id from employees where rownum<10);

137) Create a copy of emp table;

create table new_table as select * from employees where 1=2;

138) Select ename if ename exists more than once.

select first_name from employees e group by first_name having count(*)>1;

139) Display all enames in reverse order?(SMITH:HTIMS).

select reverse(first_name) from employees;

140) Display those employee whose joining of month and grade is equal.

select first_name from employees where salary between
(select losalary from salary_grade where grade=to_char(hire_date,'MM')) and
(select hisalary from salary_grade where grade=to_char(hire_date,'MM'));

SELECT ENAME FROM EMP WHERE SAL BETWEEN
           (SELECT LOSAL FROM SALGRADE WHERE 
             GRADE=TO_CHAR(HIREDATE,'MM')) AND
        (SELECT HISAL FROM SALGRADE WHERE 
GRADE=TO_CHAR(HIREDATE,'MM'));

141) Display those employee whose joining DATE is available in deptno.

select first_name from employees where to_char(hire_date,'DD')=department_id;

SQL>SELECT ENAME FROM EMP WHERE TO_CHAR(HIREDATE,'DD')=DEPTNO

142) Display those employees name as follows
               A ALLEN
               B BLAKE
 
select substr(first_name,1,7)from employees;  

143) List out the employees ename,sal,PF(20% OF SAL) from emp;

select first_name,salary,salary*.2 as pf from employees;

144) Create table emp with only one column empno;

create table employees_1 as select employee_id from employees where 1=2;

select * from employees_1;

145) Add this column to emp table ename vrachar2(20).

alter table employees_1 add (employee_name varchar(20));

146) Oops I forgot give the primary key constraint.  Add in now.

alter table employees_1 add primary key(employee_id);

desc employees_1;

147) Now increase the length of ename column to 30 characters.

 alter table employees_1 modify(employee_name varchar(30));
 
148) Add salary column to emp table.

alter table employees_1 add(salary number(10));
 
149) I want to give a validation saying that salary cannot be greater 10,000
(note give a name to this constraint)

alter table employees_1 add contraints chk_001 check(salary<=10000);

SQL>alter table emp add constraint chk_001 check(sal<=10000)

150) For the time being I have decided that I will not impose this validation.My boss has agreed to pay more than 10,000.

again alter the table or drop constraint with  alter table emp drop constraint chk_001 (or)
Disable the constraint by using  alter table emp modify constraint chk_001 disable;

151) My boss has changed his mind.  Now he doesn't want to pay more than 
10,000.so revoke that salary constraint.

alter table employees_1 modify constraints chk_001 enable;

152) Add column called as mgr to your emp table;

alter table employees_1 add(mg number(10));

153) Oh! This column should be related to empno.  Give a command to add this 
constraint.

alter table employees_1 add constraints mgr_dept foregn key(mg) references employees_1(employee_id);

154) Add deptno column to your emp table;

alter table employees_1 add(dept_no varchar(20));

155) This deptno column should be related to deptno column of dept table;

alter table employees_1 add constraints dept_001 foreign key(dept_no) reference departments(dept_no);

156) Give the command to add the constraint.

alter table employees_1 add constraints dept_0001 varchar(20);

157) Create table called as newemp.  Using single command create this table 
as well as get data into this table(use create table as);

create table newempl as select * from employees;

Create table called as newemp.  This table should contain only 
empno,ename,dname.

create table newemp as select employee_id,first_name,department_name from employees,departments where 1=2;

158) Delete the rows of employees who are working in the company for more 
than 2 years.

delete from employees where (sysdate-hire_date)/365>2;

159) Provide a commission(10% Comm Of Sal) to employees who are not earning 
any commission.

select salary*.1 from employees where commission_pct is null;

select first_name,salary*.1 from employees where commission_pct is null;

160) If any employee has commission his commission should be incremented by 
10% of his salary.

update employees_1
set commission=salary*.1
where commission is not null;

161) Display employee name and department name for each employee.

select employee_id,department_name from employees,departments where employees.department_id=departments.department_id;

162)Display employee number,name and location of the department in which he 
is working.

select  employee_id,first_name,location_id,department_name from employees,departments where employees.department_id=departments.department_id;

163) Display ename,dname even if there are no employees working in a 
particular department(use outer join).

select first_name,department_name from employees,departments where employees.department_id=departments.department_id;

164) Display employee name and his manager name.

select first_name,department_name from employees,departments where employees.employee_id=departments.manager_id;

select p.first_name,e.first_name from employees e,employees p where e.employee_id=p.manager_id;

165) Display the department name and total number of employees in each 
department.

select department_name,count(first_name) from employees,departments where
employees.department_id=departments.department_id group by department_name;

166)Display the department name along with total salary in each department.

select department_name,sum(salary) from employees,departments where employees.department_id=departments.department_id group by department_name;

167) Display itemname and total sales amount for each item.
select itemname,sum(amount) from item group by itemname;

168) Write a Query To Delete The Repeted Rows from emp table;

delete from employees where rowid not in(select min(rowid) from employees group by first_name);

169) TO DISPLAY 5 TO 7 ROWS FROM A TABLE

select first_name from employees
where rowid in (select rowid from employees where rownum<=7
minus
select rowid from employees where rownum<5);

170)  DISPLAY  TOP N ROWS FROM TABLE?

select * from
(select * from employees order by first_name desc)
where rownum<10;

171) DISPLAY   TOP 3 SALARIES FROM EMP;
select salary from (select * from employees order by salary desc)
where rownum<4;

172) DISPLAY  9th FROM THE EMP TABLE?

select first_name from employees
where rowid=(select rowid from employees where rownum<=10
minus
select rowid from employees where rownum<=10);

173)select second max salary from emp;

select max(salary) from employees where salary<(select max(salary) from employees);



select department_id,count(department_id) 
from employees
group by department_id
having count(department_id) >1; 


select department_id,sum(salary) from employees group by department_id having sum(salary)>30000;

select * from 
(select employees.*,
dense_rank () over(order by salary desc)
as sal_rank from employees)
where sal_rank=2;


select * from employees;