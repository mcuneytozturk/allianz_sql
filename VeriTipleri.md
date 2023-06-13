# SQL veri tipleri

# Key Tipleri

## Primary Key

Bir tabloda bulunan veri sıralarını birbirinden ayırmamızı sağlayan bir kısıtlama (constraint) yapısıdır. O tabloda bulunan veri sıralarına ait bir "benzersiz tanımlayıcıdır".

* Benzersiz olmalıdır
* NULL olamaz
* Bir tablo içerisinde bir kere kullanılabilir.

## Foreign Key

Bir tabloda bulunan herhangi bir sütundaki verilerin genelde başka bir tablo sütununa referans vermesi durumudur, tablolar arası ilişki kurulmasını sağlar.

* Bir tabloda birden fazla sütun FK olarak tanımlanabilir
* Aynı sütunun içerisinde aynı değerler bulunabilir.

---

# Veri Tipleri

Veri tipleri, saklamak istediğimiz verinin tipini belirttiğimiz tiplere denir.
  

---

## Sayısal Veri Tipleri

* INTEGER = Tam sayıları temsil eder 
* SMALLINT = Daha küçük tam sayıları ifade eder, integer'den daha az yer kapladığı için küçük değer alması beklenen durumlarda kullanılabilir
* BIGINT = Daha büyük bir tam sayı veri tipidir.
* DECIMAL = ondalık sayıları saklamak istediğimiz veri tipidir
* SERIAL = "1 - 2147483647" değerleri arasında değer alabilen veri tipidir.

## Karakter Veri Tipleri

* CHAR(n) = Sabit bir karakter dizinini temsil etmede kullanılıyor
* VARCHAR(n) = Değişken bir karakter dizinini temsil etmede kullanılır, n değişkeni karakter sayısını temsil ediyor, eğer bu sayı aşılırsa hata verir.
* TEXT = Karakter sayısı belli olmayan dizin için kullanılır. Sonsuz uzunluğa sahip olabilir

## Boolean Veri Tipi
* BOOLEAN = true false yada null olabilen veri tipidir;
  * TRUE = true, yes, on, 1 değerleri döndüren veri tipi
  * FALSE = false, no, off, 0 değerleri döndüren veri tipi
  * NULL = bilinmeyen, tanımsız değerleri döndüren veri tipi

## Zaman / Tarih Veri Tipleri

* DATE = tarih temsil eden veri tipi
* TIME = saat temsil eden veri tipi
* DATETIME veya TIMESTAMP = hem tarihi hem saati kaydeden veri tipi
  * ör. 2023-06-12 10:30:00
* TIME WİTH TIMEZONE = saati temsil ederken sunucunun saat diliminide ekler
* TIMESTAMP WITH TIMEZONE = tarih ve saati temsil ederken sunucunun saat dilimini de ekler

## NOT NULL 

NOT NULL kodu veri tipini belirledikten sonra kullanılarak o verinin hiç bir zaman NULL olmaması gerektiğini verinin girilmesi gerektiğini belirtir


## ALTER

ALTER, SQL de mevcut bir tablo veya sütunu değiştirmek için kullanılır.

"` ALTER TABLE <tablo adi> ALTER COLUMN <sütun adı> SET <özellik> `"

### ALTER KOMUTLARI
 
* SET
* DROP COLUMN
* RENAME COLUMN
* ALTER TABLE <tablo adı> ADD COLUMm
* ...

## UNIQUE

bir sütunda benzersiz değerlerin kabul edilmesi gerektiği belirtme kodudur.


``` 
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE
)
```

ALTER komutu ile ADD UNIQUE kullanılabilir

` ALTER TABLE <tablo adı> ADD UNIQUE (<sütun adı>)`


## CHECK

SQL'de bir tablo sütununa uygulanan kısıtlamadır.

```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) UNİQUE NOT NULL,
    age INTEGER CHECK(age >= 18)
)
```

