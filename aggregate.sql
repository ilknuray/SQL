--aggregate method kullanimi
/*
sum,count,min,max,avg
subquery icinde de kullanilir 
ancak sorgu tekbir deger donduruyor olmalidir
sum() seklinde yazilir arasinda bosluk olmamali
*/
select * from calisanlar2
--calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz
select max(maas) from calisanlar2
--calisanlar tablosundaki maaslarin toplamini listeleyin
select sum(maas) from calisanlar2
--tablodaki maas ortalamalarini listeleyiniz
select avg (maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2
select min(maas) from calisanlar2

--tablodan kac kisini maas aldigini listeleyiniz
select count(maas) from calisanlar2

--her markanin ismini calisan sayiini ve o markaya ait calisanlarin toplam maasini listeleyiniz
select * from markalar
select marka_isim,calisan_sayisi,(select sum(maas)) from calisanlar2 where marka_isim=isyeri)
as toplam_maas from markalar
