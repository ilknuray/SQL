--select - similar to regex(regular expressions) --
/*
similar to : daha karmasik pattern (kalip) ile sorgulama islemi icin
similar to kullanilabilir.sadece postgre sql de kullanilir.buyuk kucuk harf onmlidir

REGEX: herhangi bir kod metin icerisinde
istenen yazi veya kod parcasinin aranip bulunmasini
saglayan kendisine ait bir soz dizimi olan bir yapidir
mysql de(REGEXP_LIKE)olarak kullanilir
postgre de "~" karakteri ile kullanilir

*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   select * from kelimeler
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   --veya islemi icin | kullanilir
   select * from kelimeler where kelime similar to '%(at|ot)%'
   --like ile
   select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%'
   --regex ile
   select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at'
   -- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
   select * from kelimeler where kelime similar to 'ho%|hi%'
   --LIKE ILE 
   select *from kelimeler where kelime ~~*'ho%'or kelime ~~*'hi%'
   
   --regex ile
   select * from kelimeler where kelime ~* 'h[oi](.*)' 
--   Sonu 't' veya 'm' ile bitenleri listeleyeniz
select * from kelimeler where kelime similar to '%t|%m'
--regex ile
select * from kelimeler where kelime ~* '(.*)[tm]$'
--like ile
select * from kelimeler where kelime like '%m' or kelime like '%t'
--h ile baslayip t ile biten 3 harfli kelimeleri listeleyiniz
--similar to
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0,9]t'
--like ile 
select * from kelimeler where kelime ~~*'h_t';
--regex ile
select * from kelimeler where kelime ~*'h[a-z,A-Z,0-9]t'
--ilk karakterleri 'h' son karakteri 't' ve ikinci karakteri 'a'dan 'e' ye herhangi bir karakter olan 
--kelime degerlerini cagirin
select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t'
--regex ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'
--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[say](.*)'
--^ isreti baslangici ifade eder
--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$'

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayal
select * from kelimeler where kelime similar to 'h[a|i]t'
select * from kelimeler where kelime ~* 'h[a|i]t'

--İlk harfi 'A' dan ‘M' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'[b-s].l(.*)'

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
--icerisinde en az 4 adet oooo barindiran kelimelerin tum bilgilerini listeleyiniz
select * from kelimeler where kelime similar to '%[o][o][o][o]%'
select * from kelimeler where kelime similar to '%[o]{4}%'
--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime similar to '%[a|s|y]%[m]'
