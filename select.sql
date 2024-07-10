--I have search how  many employees are work in each department

select initcap(dname) as department , count(*)  as amount  from emp, dept 
where  dept.deptno = emp.deptno  group by initcap(dname);

--show the table structure
desc emp
desc dept

--  show the existing row and column 
select * from emp;
select * from dept;