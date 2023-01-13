--2.
--Klientų sukūrimas

--INSERT INTO "customer" ("f_name", "l_name", "email")
--VALUES ("Ona", "Onaitė", "one@gmail.com")

--INSERT INTO "customer" ("f_name", "l_name", "email")
--VALUES ("Jonas", "Jonaitis", "jonis@gmail.com")

--INSERT INTO "customer" ("f_name", "l_name", "email")
--VALUES ("Jurga", "Jurgytė", "jurge@gmail.com")

--INSERT INTO "customer" ("f_name", "l_name", "email")
--VALUES ("Ilona", "Varnauskė", "iva@gmail.com")

--INSERT INTO "customer" ("f_name", "l_name", "email")
--VALUES ("Jokūbas", "Bernauskas", "jober@gmail.com")

--statuso lentelės papildymas

--INSERT INTO "status" ("name")
--VALUES ("patvirtintas")

--INSERT INTO "status" ("name")
--VALUES ("vykdomas")

--INSERT INTO "status" ("name")
--VALUES ("įvykdytas")

--INSERT INTO "status" ("name")
--VALUES ("atmestas")

--produktų įrašymas
--INSERT INTO "product" ("name", "price")
--VALUES ("Stalas", "180")

--INSERT INTO "product" ("name", "price")
--VALUES ("Kėdė", "50")

--INSERT INTO "product" ("name", "price")
--VALUES ("Lempa", "120")

--INSERT INTO "product" ("name", "price")
--VALUES ("Kompiuteris", "820")

--INSERT INTO "product" ("name", "price")
--VALUES ("Ausinės", "220")

--INSERT INTO "product" ("name", "price")
--VALUES ("Tušinukas", "2")

--INSERT INTO "product" ("name", "price")
--VALUES ("Kalendorius", "12")

--uzsakymai:
--INSERT INTO "order_" ("customer_id", "date_", status_id)
--VALUES ("2", "2020-02-20", "2")

--INSERT INTO "order_" ("customer_id", "date_", status_id)
--VALUES ("3", "2010-02-20", "1")

--INSERT INTO "order_" ("customer_id", "date_", status_id)
--VALUES ("4", "2019-02-20", "4")

--INSERT INTO "order_" ("customer_id", "date_", status_id)
--VALUES ("5", "2019-02-20", "3")

--INSERT INTO "order_" ("customer_id", "date_", status_id)
--VALUES ("1", "2019-02-20", "3")

--product_order lentelės pildymas
--INSERT INTO "product_order" ("order_id", "product_id", "quantity")
--VALUES ("1", "1", "2")

--INSERT INTO "product_order" ("order_id", "product_id", "quantity")
--VALUES ("2", "2", "3")

--INSERT INTO "product_order" ("order_id", "product_id", "quantity")
--VALUES ("3", "3", "1")

--INSERT INTO "product_order" ("order_id", "product_id", "quantity")
--VALUES ("4", "4", "4")

--INSERT INTO "product_order" ("order_id", "product_id", "quantity")
--VALUES ("5", "5", "5")

--3.1.suformuoti užklausą,kad rezultate matytųsi .
--užsakymo id, užsakovo pavardė, data, bendra užsakymo suma.

--SELECT order_.id, order_.date_, customer.f_name,
--price * quantity  AS "viso:"
--FROM product_order
--JOIN order_ ON product_order.order_id = order_.id
--JOIN product ON product_order.product_id = product.id
--JOIN customer ON order_.customer_id = customer.id
--JOIN status ON order_.status_id = status.id

--3.2.rezultate matytųsi užsakymo id,
--pozicijos su kiekiais, kainomis,
--bendra pozicijos suma.
--SELECT order_.id, product.name, product_order.quantity, product.price,
--price * quantity  AS "total"
--FROM product_order
--JOIN order_ ON product_order.order_id = order_.id
--JOIN product ON product_order.product_id = product.id
--JOIN customer ON order_.customer_id = customer.id
--JOIN status ON order_.status_id = status.id

--3.3.prieš tai buvusios užklausos pagrindu sukurti užklausą,
--kurioje matytųsi, kiek ir kokio produkto buvo užsakyta.
SELECT product.name, product_order.quantity, product.price,
price * quantity  AS "total"
FROM product_order
JOIN order_ ON product_order.order_id = order_.id
JOIN product ON product_order.product_id = product.id
JOIN customer ON order_.customer_id = customer.id
JOIN status ON order_.status_id = status.id
GROUP BY product_order.product_id


