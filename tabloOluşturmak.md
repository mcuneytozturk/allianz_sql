# TABLO OLUŞTURMA

## CREATE TABLE 

komutu ile tablo oluşturulabilir; 

 ` CREATE TABLE customer (id SERİAL PRİMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age INTEGER, city VARCHAR(50))`

* CREATE TABLE komutu ardından tablo adı verilir,
* ilk sütun adı yazılır, sütuna girilcek parametre cinsi yazılır (bu durumda satır numarası demek istediğimizden SERİAL PRİMARY KEY)
* ikinci sütun adı "first_name" ve parametere cinsi "VARCHAR(50)
* üçüncü sütun adı "last_name" ve parametre cinsi "VARCHAR(50)"(VARCHAR(50) burda 50 karaktere kadar yazı yazılabilecek parametre atanacağı belirtilir)
* dördüncü sütun ve parametre cinsi (INTEGER girilecek parametrenin tam sayı olacağı belirtilir)

CREATE TABLE IF NOT EXISTS komutu eğer tablo adı başka bir tablo adı ile çakışıyorsa hata almadan tablo oluşturmaya yarıyor

## DROP TABLE

DROP TABLE komutu bir tabloyu sql'den tamamen kaldırıyor

Burada IF EXISTS yapısını kullanarak yanlış tablo ismi yazımı durumunda hata mesajı almayı önleriz.

` DROP TABLE IF EXISTS <tablo adı>`

# Tabloda veri düzenlemesi

## Tabloya veri ekleme - INSERT INTO

INSERT INTO komutu tabloya veri eklemede kullanılır

" ` INSERT INTO <tablo adı>(<birinci sütun adı>, <ikinci sütun adı> ... <n'nci sütun>) VALUES (<birinci değer>, <ikinci değer>... <n'ninci değer>) ` "

* INSERT INTO denilir ve tablo seçilir
* Parantez içerisine tabloda girmemiz gereken sütun isimleri sırasıyla girilir
* VALUES komutundan sonra parantez içerisine sırasıyla sütuna atanacak değerler girilir


## Tabloda veri güncelleme - UPDATE

UPDATE anahtar kelimesi sayesinde tablomuzda bulunan verileri güncelleyebiliriz.

" `UPDATE <tablo_adı> SET <sütun_adı> = değer, <sütun_adı> = değer,... WHERE <koşul adı>` "


* UPDATE denilir ve tablo seçilir
* SET dendikten sonra sütun isimleri ve değiştirilecek değer sırasıyla girilir, her bir sütun ve değer arasına virgül konulur
* WHERE komutu ile spesifik sütunda spesifik satır seçilir


## Tablodan veri silme - DELETE

DELETE anahtar kelimesi sayesinde tablomuzda bulunan verileri silebiliriz.

" `DELETE FROM <tablo_adı> WHERE <koşul_adı>` "

* DELETE FROM komutu ile tablo seçilir
* WHERE ile silinmek istenen satır seçilir