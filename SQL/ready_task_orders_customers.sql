

1.	Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
2.	Вывести названия компаний поставщиков, которые находятся в México D.F.;
3.	Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
4.	Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
5.	Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
6.	Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
7.	Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.

drop TABLE customers
CREATE TABLE customers
(
  customersId VARCHAR (30) Not null,
  company_name VARCHAR (255) NOT null,
  address VARCHAR (255) NOT null,
  city VARCHAR (255) NOT null,
  country VARCHAR (255) not null,
  PRIMARY KEY (customersId)
 );
 
 INSERT INTO customers (customersId, company_name, address, city, country)
 VALUES 
 ('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
 ('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
 ('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico'),
 ('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
 ('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', 'Sweden'),
 ('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
 ('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France'),
 ('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain')

SELECT * from customers

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomersID VARCHAR(255),
    OrderDate VARCHAR(255) NOT NULL,
    OrderSum INT NOT NULL
);
INSERT INTO orders (OrderID, CustomersID, OrderDate, OrderSum)
 VALUES 
 (10355, 'AROUT', '15.11.1996', 1000),
 (10365, 'ANTON', '27.11.1996', 15000),
 (10381, 'LILAS', '12.12.1996', 20000),
 (10436, 'BLONP', '05.02.1997', 17500),
 (10442, 'BERNSH', '11.02.1997', 20000),
 (10449, 'BLONP', '18.02.1997', 10000),
 (10453, 'AROUT', '21.02.1997', 15000)
SELECT * from orders

 
1.select c.company_name,o.OrderID from customers c
JOIN orders o ON c.customersID = o.customersID
where o.orderdate NOT BETWEEN '5.11.1996' AND '18.02.1997'

2.
SELECT company_name FROM customers
WHERE city like 'México D.F.%';
 
3.SELECT orderid from orders
WHERE orderdate BETWEEN '12.12.1996' and '18.02.1997';

4. SELECT company_name FROM customers
WHERE company_name like 'An%';

5. SELECT customers.company_name, orders.orderid FROM orders
JOIN customers ON customers.customersid = orders.customersid
WHERE ordersum > 17000;
 6.
SELECT customers.company_name,orders.ordersum FROM orders
JOIN customers ON customers.customersid = orders.customersid
ORDER BY ordersum DESC


