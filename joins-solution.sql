# prime-group-joins

SELECT * FROM "customers";
SELECT * FROM "addresses";

--1. Get all custs and addresses
SELECT * FROM "customers" 
JOIN "addresses" ON "customers"."id" =  "addresses"."customer_id";

--2. All orders and their line items
SELECT * FROM "orders";
SELECT * FROM "line_items";

SELECT * FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id";

--3. Which warehouses have cheetos?
SELECT * FROM "warehouse_product";
SELECT * FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id" WHERE"products"."id" = 5;

--4. Which warehouses have diet pepsi?
SELECT * FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id" JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id" WHERE"products"."id" = 6;

--count("customer_id"."orders")
--5. Get the number of orders for each customer.
SELECT "customers"."first_name", count("orders"."id") FROM "customers" 
JOIN "addresses" ON "customers"."id" =  "addresses"."customer_id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."first_name";

--6. How many customers?
SELECT count("customers") FROM "customers";


--7. How many products?
SELECT count("products") FROM "products";

--8. Total available quantity of diet pepsi?
SELECT SUM("on_hand") FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."id" = 6;
SELECT SUM("on_hand") FROM "warehouse_product" WHERE "product_id" = 6;
