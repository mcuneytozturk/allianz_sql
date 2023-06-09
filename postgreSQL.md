# Temel SQL sorgular

## SELECT - FROM

 Select komutu bir veritabanında seçim yapmada kullanılır.

Örnek;

* " * " tüm sütunları seçmek için kullanılır;

 `SELECT * FROM tabloAdi `

* Belirli Sütunları seçmek için;
    
 `SELECT sütun1,sütun2 FROM tabloAdi `

## WHERE

 Filtreleme ve karşılaştırma operatörüdür.

 SQL sorghularında belirl koşullara uyan verileri seçmede kullanılıyor

* " = " eşitlik karşılaştırma veya " != " eşit olmayan karşılaştırma ;

` SELECT * FROM tabloAdi WHERE sütun = 'aranan_Parametre' `

` SELECT * FROM tabloAdi WHERE sütun != 'istenmeyen_Parametre' `

* " >, <, <=, >= " boyut karşılaştırma;

` SELECT * FROM tabloAdi WHERE sütun > 'ilişkiselParametre' `

* "AND" iki veya daha fazla koşulu birleştirmek için kullanılır ve tüm koşulların doğru olması gerekir;

 ` SELECT * FROM tavloAdi WHERE sütun1 = "snack" AND sütun2 < 80 `

* "OR" iki veya daha fazla koşulu birleştiren ve koşullardan herhangi birinin doğru olması gereken operatör;

 `SELECT * FROM tabloAdi WHERE  sütun1 > 33 OR sütun2 < 80 `

* "NOT", iki koşulun tam tersine uyan verileri getiren operatör;

 `SELECT * FROM tabloAdi WHERE NOT(sütun1 = "snack" OR sütun2 < 80) `

*** parantez içerisindeki koşullar önceliklidir, önce parantez içindeki koşul karşılanır ardından dışarıdaki koşulla kıyaslanır ***

`SELECT  * FROM film WHERE NOT(length > 50) AND NOT (rental_rate = 2.99 OR rental_rate = 4.99) `

## BETWEEN

bir değerin belirli aralıkta yer alıp almadığını kontrol etmede kullanılan operatör;

`SELECT * FROM tabloAdi WHERE sütun1 BETWEEN 1.00 AND 2.00 `

`SELECT * FROM tabloAdi WHERE sütun1 BETWEEN 1.00 AND 2.00 AND NOT sütun2 = "bişeyler" `

`SELECT * FROM tabloAdi WHERE sütun1 NOT BETWEEN 1.00 AND 2.00 `

## IN 

Belirli bir liste içinde yer alan değerleri seçmede kullanılıyor

` SELECT * FROM tabloAdi WHERE sütun1 IN ('PARAMETRE1', 'PARAMETRE2') AND sütun2 IN(30, 44, 45) `

## LIKE ve ILIKE

Like operatörü SQLŞ sorgusunda metin veya karekter dizinlerini belirli bir desene göre aramak veya eşleştirmek için kullanılır

LIKE operatörü " % " ve " _ " ile kullanılır;

* " % " joker karekter, herhangi bir karakter veya karakter dizisi yerine kullanılabilir;

 ` SELECT * FROM tabloAdi WHERE sütun1 LIKE 'a%'  `

* " _ " Bu joker karakter, herhangi bir karakter yerine kullanılabilir. "a_bc" deseni a ile başlayan bc ile biten bu harfler arasında herhangi ""1"" adet karakter olan karakter dizinini verecektir.

` SELECT * FROM tabloAdi WHERE sütun1 LIKE 'a_tion'  `

* \ (ters slash = "altgr+?") "%" veya "_" işaretlerini aramada kullanmak için önüne ters slash koyabiliriz.

## DISTINCT

DISTINCT operatörü, SQL sorgularında verileri ortadan kaldırmak için kullanılan bir opetatördür. Bu operatör sadece benzersiz(tekrar etmeyen) değerleri döndürür.

` SELECT DISTINCT rental_rate FROM tabloAdi `

iki farklı değer aynı anda benzersiz ise(bu durumda iki değer kendi içinde tekrar edebilir ama bir arada benzersizdir)

` SELECT DISTINCT rental_rate, replacement_cost FROM tabloAdi `

## COUNT

COUNT operatörü bir tablodaki veya bir sütundaki sorgunun sonucundaki satır sayısını verir 

` SELECT COUNT(*) FROM tabloAdi WHERE sütun1 = parametre ` 