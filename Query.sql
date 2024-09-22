--HER BİR MÜŞTERİNİN HARCAMA TOPLAMI
SELECT customers.company_name, SUM(order_details.quantity * order_details.unit_price) AS TotalSpent
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY customers.company_name
ORDER BY TotalSpent DESC;

--HER BİR NAKLİYECİNİN TESLİM ETTİĞİ TOPLAM SİPARİŞ
SELECT shippers.company_name, SUM(order_details.quantity * order_details.unit_price) AS TotalSales
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN shippers ON orders.ship_via = shippers.shipper_id
GROUP BY shippers.company_name
ORDER BY TotalSales DESC;

--EN ÇOK SATILAN ÜRÜNLER
SELECT products.product_name, SUM(order_details.quantity) AS TotalQuantitySold
FROM order_details
JOIN products ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY TotalQuantitySold DESC;

--KATEGORİ BAZINDA SATIŞLAR
SELECT categories.category_name, SUM(order_details.quantity * order_details.unit_price) AS TotalSales
FROM order_details
JOIN products ON order_details.product_id = products.product_id
JOIN categories ON products.category_id = categories.category_id
GROUP BY categories.category_name
ORDER BY TotalSales DESC;

--MÜŞTERİ BAZINDA ORTALAMA SİPARİŞ
SELECT customers.company_name, AVG(order_details.quantity * order_details.unit_price) AS AverageOrderValue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY customers.company_name
ORDER BY AverageOrderValue DESC;

--AYLIK SATIŞ
SELECT DATE_TRUNC('month', orders.order_date) AS Month, SUM(order_details.quantity * order_details.unit_price) AS TotalSales
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY Month
ORDER BY Month;

--ÇALIŞAN BAŞINA SATIŞLAR
SELECT employees.first_name, employees.last_name, SUM(order_details.quantity * order_details.unit_price) AS TotalSales
FROM employees
JOIN orders ON employees.employee_id = orders.employee_id
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY employees.first_name, employees.last_name
ORDER BY TotalSales DESC;

--MÜŞTERİ BAŞINA TOPLAM SATIŞ
SELECT customers.company_name, COUNT(orders.order_id) AS TotalOrders
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.company_name
ORDER BY TotalOrders DESC;

--EN FAZLA SİPARİŞ VEREN MÜŞTERİLER
SELECT customers.company_name, COUNT(orders.order_id) AS OrderCount
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.company_name
ORDER BY OrderCount DESC
LIMIT 10;

--GECİKEN SİPARİŞLER
SELECT orders.order_id, orders.order_date, orders.required_date, orders.shipped_date,
(orders.shipped_date - orders.required_date) AS DelayDays
FROM orders
WHERE orders.shipped_date > orders.required_date;

--TEDARİKÇİ BAZINDA SİPARİŞLER
SELECT suppliers.company_name, SUM(products.unit_price * products.units_in_stock) AS TotalCost
FROM suppliers
JOIN products ON suppliers.supplier_id = products.supplier_id
GROUP BY suppliers.company_name
ORDER BY TotalCost DESC;

--NAKLİYECİ PERFORMANSI
SELECT shippers.company_name, SUM(order_details.quantity * order_details.unit_price) AS TotalSales
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN shippers ON orders.ship_via = shippers.shipper_id
GROUP BY shippers.company_name
ORDER BY TotalSales DESC;