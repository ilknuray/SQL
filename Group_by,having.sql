CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamıni bulunuz
select name,SUM(salary) AS "total salary" 
from workers GROUP BY name
having sum(salary)>2500;

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
select state,count (state) AS number_of_employees 
from workers
group by state
having count (state) >1;

--Her bir state için değeri 3000'den az olan
--maximum salary değerlerini bulun.
select state,
max(salary) 
from workers group by state
having max(salary)<3000;

--Her bir company için değeri 2000'den fazla olan minimum
--salary değerlerini bulun.
select company,min(salary) from workers AS min_salary
group by company having min(salary)>2000;

--tekrarsiz isimleri cagirin
select distinct name from workers;--distinct clause cagirilan terimlerden tekrarli olanlarin sadece 1.sini alir

--Name değerlerini company kelime 
--uzunluklarına göre sıralayın.

select name,company from workers
order by length(company);

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun
--değerinin uzunluğuna göre sıralayın.
--1.YOL
select concat(name,' ',state) as name_and_state 
from workers order by length(name) + length(state);

2.YOL
select name||' '||state||' ' || length(name)+length(state) 
as "name_and_state" 
from workers order by length(name)+length(state);

--union operator:
--1)iki sorgu(query) sonucunu birlestirmek icin kullanilir
--2)tekrarsiz(unique) recordlari(satir) alir
--3)tek bir sutuna cok sutun koyabiliriz
--4)data tipi ve data limitleri mevcut duruma uygun olmali

--salary değeri 3000'den yüksek olan state
--değerlerini ve 2000'den küçük olanname değerlerini 
--tekrarsız olarak bulun.
 select state as "name and state",salary
from workers
where salary>3000
union
select name,salary
from workers
where salary<2000

--salary değeri 3000'den yüksek 
--olan state değerlerini ve salary değeri
--2000'den küçükolan name değerlerini tekrarsız olarak bulun.

select state as "name and state",salary
from workers
where salary>3000
union all--distinct(uygulamaz tekrarli verir)
select name,salary
from workers
where salary<2000

--salary değeri 1000'den yüksek,
--2000'den az olan "ortak" name değerlerini bulun.
select name from workers where salary>1000
intersect
select name from workers where salary<2000;

--salary değeri 2000'den az olan ve company değeri  IBM,
--APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name from workers where salary<2000
INTERSECT
select name from workers 
where company in('IBM','APPLE','MICROSOFT');


--salary değeri 1000'den yüksek,
--2000'den az olan "farkli" name değerlerini bulun.


select name from workers where salary>1000
except
select name from workers where salary<2000;

--salary değeri 3000'den az ve GOOGLE'da
--çalışmayan  name değerlerini bulun.
select name from workers where salary<3000
except
select name from workers where company='GOOGLE';

