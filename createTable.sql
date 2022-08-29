--select * from boluM
--  create table bolum(
--   bolumid int primary key not null,
-- bolumad varchar(30) not null,
--  bolumf int not null,
-- constraint fk_bolumfakulte FOREIGN KEY (bolumf) references fakulte(id));
--select * from fakulte
-- insert into bolum (bolumid,bolumad,bolumf) values (1,'mekatronik',1);
-- insert into bolum (bolumid,bolumad,bolumf) values (2,'yazilim',1);
-- insert into bolum (bolumid,bolumad,bolumf) values (3,'Ybs',3);
-- insert into bolum (bolumid,bolumad,bolumf) values (4,'matematik',2);
-- insert into bolum (bolumid,bolumad,bolumf) values (5,'kimya',2);
-- insert into bolum (bolumid,bolumad,bolumf) values (6,'fizik',2);
-- insert into bolum (bolumid,bolumad,bolumf) values (7,'otomotiv',1);

select * from bolum where bolumf=(select id from fakulte where ad='muhendislik');

select bolumf,count(*) from bolum group by bolumf order by bolumf

--select ad,count(*) from bolum inner join fakulte on bolum.bolumf=fakulte.id group by ad order by ad

select * from fakulte
insert into fakulte (id,ad) values (4,'deneme');
insert into fakulte (id,ad) values (5,'Tip');

select bolumid,bolumad,bolumf,ad from fakulte left join bolum on bolum.bolumf=fakulte.id
select id,ad,bolumad from bolum right join fakulte on bolum.bolumf=fakulte.id

