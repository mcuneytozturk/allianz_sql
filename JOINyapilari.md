# JOIN yapıları

tablolar arasında birleşme yapmamızı sağlayan yapılardır

## INNER JOIN

eğer INNER kodu yazılmaz sadece JOIN kodu yazılırsa sql bunu INNER JOIN olarak kabul edecektir

```
SELECT * FROM customer
JOIN payment ON customer.customer_id = payment.customer_id;

```

## LEFT JOIN

bu kod kullanıldığında veri çektiğimiz tablo sol taraftaki tablo birleştirilen tablo sağ taraftaki tablo olarak veri birleştirmesi yapılır

* eğer soldaki veride 'null' değeri olursa sağdaki değerler de null olarak dönecektir. sol taraf büyüklük gösterir. sağ taraf derki;
  * ## "aman tadımız kaçmasın büyüklük sende kalsın"

## RIGHT JOIN

left join ile right join arasındaki tek fark veri çekmede önceliği sol yada sağ tarafa vermesi. birleştirilen kısım yada birleşen kısım ile veri önceliği tanıması ile ilgil ibir ayrım var

* eğer sağdaki veride 'null' değeri olursa soldaki değerler de null olarak dönecektir. sağ taraf büyüklük gösterir. sol taraf derki;
  * ## "aman tadımız kaçmasın büyüklük sende kalsın"

## FULL JOIN

iki taraftaki veriyide tam anlamıyla gösteriyor, sağ yada sol önceliği belirtmeden istenen sütunlardaki tüm verileri gösterir

## UNION operatörü

UNION operatörü sayesinde farklı SELECT sorgularıyla oluşan sonuçları tek bir sonuç kümesi haline getiririz.

## INTERSECT

ıntersect komutu sql'de union gibi bir operatör ancak burda birleştirme yerine iki sorgunun kesişimini bize getirir

## EXCEPT

ilk sorguda olan ancak ikinci sorguda olmayan değerleri verir