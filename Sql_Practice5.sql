SELECT * from students
-- 101 id öğrencinin ismini 'ALI CAN' olarak güncelleyinin
update students set student_name='ALI CAN'where student_id='101';
-- 109 idli öğrencinin doğumtarihini 2010-12-11 olarak update yapın.
update students set student_dob='2010.12.11' where student_id='109';
--ilk iki veriden sonra 5 veriyi listeleyiniz
select * from students limit 5 offset 2;
-- yasi en buyyuk 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from students order by student_age desc limit 3 offset 3;

select * from calisanlar
select * from markalar

 --SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve 
-- şehirlerini listeleyiniz. 
select isim,maas,sehir from calisanlar where isyeri in (select marka_isim from markalar where marka_id>101);
-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar where sehir='Ankara' );
     
-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select sum(maas) as toplam_maas from calisanlar where marka_isim=isyeri)from markalar;
 
-- SORU5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select round(avg(maas)) as ortalama_maas from calisanlar where marka_isim=isyeri)from markalar
-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select min(maas) as min_maas from calisanlar where marka_isim=isyeri),(select max(maas) as max_maas from calisanlar where marka_isim=isyeri)from markalar
-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir) as toplam_sehir from calisanlar where marka_isim=isyeri)from markalar
