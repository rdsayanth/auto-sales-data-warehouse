// Cypher queries run in Neo4j on the same sales data, to compare with the SQL versions

// Customers (and their cities) who bought product 1
MATCH (p:Product {product_id: 1})<-[:PRODUCT]-(s:Sale)-[:SOLD_TO]->(c:Customer)
RETURN DISTINCT c.customer_name, c.city;

// All sales of product 1
MATCH (p:Product {product_id: 1})-[:PRODUCT]-(s:Sale)
RETURN s;

// Sales linked to their dates (sample)
MATCH p=()-[r:SOLD_ON_DATE]->() RETURN p LIMIT 50;

// Sales linked to customers (sample)
MATCH p=()-[r:SALES_TO]->() RETURN p LIMIT 25;

// Top 5 customers by total quantity purchased
MATCH (s:Sale)-[:SOLD_TO]->(c:Customer)
RETURN c.customer_id, SUM(s.quantity) AS TotalQuantity
ORDER BY TotalQuantity DESC
LIMIT 5;

// Number of date records per year
MATCH (d:Date)
RETURN d.year, COUNT(*) AS YearCount
ORDER BY d.year;

// Customer count by city
MATCH (c:Customer)
RETURN c.city AS City, COUNT(*) AS CustomerCount
ORDER BY c.city;

// Customer–product purchase graph (sample)
MATCH (c:Customer)-[r:PURCHASED]->(p:Product)
RETURN c, r, p LIMIT 100;
