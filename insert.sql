-- select * from bolum
-- create view View1
-- as
-- select bolumid,bolumad,ad from bolum innner join fakulte on bolum.bolumf=fakulte.id

-- create table dersler(
-- id int not null primary key,
-- dersad varchar(30),
-- kontenjan varchar(3));
-- insert into dersler (id,dersad,kontenjan,bolumid) values(1,'algoritma','20',1);
-- insert into dersler (id,dersad,kontenjan,bolumid) values(2,'yapayzeka','20',2);
-- insert into dersler (id,dersad,kontenjan,bolumid) values(3,'devreler','10',1);
-- insert into dersler (id,dersad,kontenjan,bolumid) values(4,'guvenlik','10',1);
-- insert into dersler (id,dersad,kontenjan,bolumid) values(5,'programlama','40',1);
-- insert into dersler (id,dersad,kontenjan,bolumid) values(6,'cebir','20',4);
-- select * from dersler order by id
-- update dersler set bolumid=1 where bolumid=null;
-- select * from view1

-- SELECT bolum.bolumid,
--     bolum.bolumad,
--     fakulte.ad,
-- 	dersler.dersad
-- 	dersler.kontenjan
--    FROM bolum
--      JOIN fakulte ON bolum.bolumf = fakulte.id
-- 	 join dersler on bolum.bolumid=dersler.bolumid
-- 	 ;
-- 	create view view2
-- 	as 
-- 	select *from dersler
-- 	select * from view2
--select dersad,length(dersad) from dersler where lenght(dersad)>12
--insert into view2(id,dersad) values(7,'ingilizce');



