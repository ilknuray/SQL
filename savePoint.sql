create table ogrenciler2
(
id serial,
isim varchar(50),
veli_isim VARCHAR(50),
yazili_notu real);
BEGIN;
insert into ogrenciler2 VALUES (DEFAULT,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (DEFAULT,'Canan Gul','Ayse sen',90.5);
SAVEPOINT x;
insert into ogrenciler2 VALUES (DEFAULT,'Kemal Can','ahmet Can',75.5);
insert into ogrenciler2 VALUES (DEFAULT,'Ahmet Sen','Ayse Can',65.5);

ROLLBACK to x;

select * from ogrenciler2;

commit;