CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;
--JOINS
/*
1)inner join:kesisim
2)left joinsol :kumenin tamami
3)right joinsag: kumenin tamami
4)cross join
5)full join:birlesim
6)self join:iki table dan kopya ile yeni bir table olusturur
*/

--Ortak companyler için company_name,
--order_id ve order_date değerlerini çağırın.
select company_name,order_id,order_date from my_companies mc
inner join orders o
on my_companies.company_id=orders.company_id;

-- 2) LEFT JOIN
--my_companies table'ındaki companyler
--için order_id ve order_date değerlerini çağırın.
select mc.company_name ,o.order_id,o.order_date from
my_companies mc left join orders o
on mc.company_id=o.company_id;

--3) RIGHT JOIN
--Orders table'ındaki company'ler için 
--company_name, company_id ve order_date değerlerini çağırın.
select mc.company_name ,o.company_id,o.order_date
from my_companies
mc right join orders o
on mc.company_id=o.company_id;

--FULL JOIN
--İki table'dan da
--company_name, order_id ve order_date değerlerini çağırın.
select company_name,order_id,order_date from
orders o full join my_companies mc
on mc.company_id=o.company_id;

--SELF JOIN
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;
--workers tablosunu kullanarak 
--çalışanların yöneticilerini gösteren bir tablo hazırlayın.
select employee.name as Employee, manager.name
as Manager
from workers employee full join workers manager
on employee.manager_id = manager.id