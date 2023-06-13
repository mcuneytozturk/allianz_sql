# ALT sorgular

alt sorgu, sorgunun içerisinde sorgu yapmaya yararlar

SELECT sorgusu içerisine başka bir SELECT sorgusundan dönen sonuç kullanılabilir

```
SELECT DISTINCT Country (
    SELECT COUNT(*) FROM customers WHERE customers.Country = Main.Country
)

```

## ANY operatörü

## ALL operatörü 