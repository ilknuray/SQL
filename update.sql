CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler order by vergi_no
select * from urunler

update tedarikciler set firma_ismi='vestel' where vergi_no=102
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler set firma_ismi='casper',irtibat_ismi='Ali Veli' where vergi_no=101
--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyin
update urunler set urun_isim='telefon' where urun_isim='Phone'
--  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler set urun_id=urun_id+1 where urun_id > 1004
--tum urunlerin urun_id degerini ted_vergino sutun degerleri ile topla
update urunler set urun_id=urun_id+ted_vergino
---urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
--bu soruda tedarikciler ve urunler tablosunu yeniden olusturduk

update urunler
set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adama Eve')
where musteri_isim='Ali Bak'
--urunler tablosunda laptop alan musterilerin ismini firma_ismi apple in irtibat_isim ile degistirn
update urunler
set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') where urun_isim='Laptop'