-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    location VARCHAR(255),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO Customers (customer_id, name, email, location)
VALUES
    (1, 'John Smith', 'john.smith@email.com', 'New York'),
    (2, 'Alice Johnson', 'alice.johnson@email.com', 'Los Angeles'),
    (3, 'Michael Brown', 'michael.brown@email.com', 'Chicago'),
    (4, 'Emily Davis', 'emily.davis@email.com', 'San Francisco'),
    (5, 'William Wilson', 'william.wilson@email.com', 'Houston');

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 1, '2023-01-15', 100.00),
    (2, 2, '2023-01-16', 150.00),
    (3, 1, '2023-01-17', 75.00),
    (4, 3, '2023-01-18', 200.00),
    (5, 4, '2023-01-19', 80.00);

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO Categories (category_id, name)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3');

-- Products Table with Category Relationship
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products (product_id, name, description, price, category_id)
VALUES
    (1, 'Tea', 'Milk Tea', 10.00, 1),
    (2, 'Bread', 'Milk Bread', 15.00, 1),
    (3, 'Cheese', 'Salty Cheese', 20.00, 2),
    (4, 'Butter Bun', 'Bun with Butter', 25.00, 2),
    (5, 'Butter Roll', 'Butter in Roll', 30.00, 3);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 5, 10.00),
    (2, 1, 2, 3, 15.00),
    (3, 2, 3, 2, 20.00),
    (4, 3, 4, 4, 25.00),
    (5, 4, 5, 1, 30.00);
