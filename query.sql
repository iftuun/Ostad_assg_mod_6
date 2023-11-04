-- Task 1

SELECT
    C.customer_id,
    C.name AS customer_name,
    C.email AS customer_email,
    C.location AS customer_location,
    COUNT(O.order_id) AS total_orders
FROM
    Customers AS C
LEFT JOIN
    Orders AS O
ON
    C.customer_id = O.customer_id
GROUP BY
    C.customer_id, C.name, C.email, C.location
ORDER BY
    total_orders DESC;

-- Task 2

SELECT
    OI.order_id,
    P.name AS product_name,
    OI.quantity,
    (OI.quantity * P.price) AS total_amount
FROM
    Order_Items AS OI
JOIN
    Products AS P
ON
    OI.product_id = P.product_id
ORDER BY
    OI.order_id ASC;


-- Task 3

SELECT
    C.name AS category_name,
    SUM(P.price * OI.quantity) AS total_revenue
FROM
    Categories AS C
JOIN
    Products AS P
ON
    C.category_id = P.category_id
JOIN
    Order_Items AS OI
ON
    P.product_id = OI.product_id
GROUP BY
    C.name
ORDER BY
    total_revenue DESC;


--Task 4

SELECT
    C.name AS customer_name,
    SUM(O.total_amount) AS total_purchase_amount
FROM
    Customers AS C
JOIN
    Orders AS O
ON
    C.customer_id = O.customer_id
GROUP BY
    C.name
ORDER BY
    total_purchase_amount DESC
LIMIT 5;
