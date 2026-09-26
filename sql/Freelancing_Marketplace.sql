-- Creating database and using it
create database Freelancing_Marketplace;
use Freelancing_Marketplace;

-- Creating tables using DDl
-- Role table will divide users based on clients and freelancers
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(20) UNIQUE NOT NULL
);

-- User table will handle all the general information
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id)
        REFERENCES Role (role_id)
);

-- Freelancer table will handle all freelancer details
CREATE TABLE Freelancer (
    freelancer_id INT PRIMARY KEY,
    user_id INT,
    rating DECIMAL(3 , 2 ) DEFAULT 0,
    experience TEXT,
    FOREIGN KEY (user_id)
        REFERENCES User (user_id)
);


CREATE TABLE Client (
    client_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES User (user_id)
);

-- Skill table consists of all the skills
CREATE TABLE Skill (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL
);

-- this table will assign skills to freelancers
CREATE TABLE Freelancer_Skill (
    freelancer_id INT,
    skill_id INT,
    PRIMARY KEY (freelancer_id , skill_id),
    FOREIGN KEY (freelancer_id)
        REFERENCES Freelancer (freelancer_id),
    FOREIGN KEY (skill_id)
        REFERENCES Skill (skill_id)
);

-- Category table will consist of all services available
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Gig table will handle service provided by freelancer
CREATE TABLE Gig (
    gig_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL,
    freelancer_id INT,
    category_id INT,
    FOREIGN KEY (freelancer_id)
        REFERENCES Freelancer (freelancer_id),
    FOREIGN KEY (category_id)
        REFERENCES Category (category_id)
);


CREATE TABLE Order_Status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    client_id INT,
    gig_id INT,
    status_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id)
        REFERENCES Client (client_id),
    FOREIGN KEY (gig_id)
        REFERENCES Gig (gig_id),
    FOREIGN KEY (status_id)
        REFERENCES Order_Status (status_id)
);


CREATE TABLE Payment_Status (
    payment_status_id INT PRIMARY KEY,
    status_name VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10 , 2 ) NOT NULL,
    payment_status_id INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (payment_status_id)
        REFERENCES Payment_Status (payment_status_id)
);


CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    order_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
);
--------------------------------------------------------------------------------------------
-- Inserting data for functionality
INSERT INTO Role (role_id , role_name)VALUES
(1, 'Freelancer'),
(2, 'Client');

INSERT INTO User (user_id , name , email , role_id) VALUES
(1,'Ali','ali@gmail.com',1),
(2,'Usman','usman@gmail.com',1),
(3,'Hamza','hamza@gmail.com',1),
(4,'Zain','zain@gmail.com',1),
(5,'Ahmed','ahmed@gmail.com',2),
(6,'Bilal','bilal@gmail.com',2),
(7,'Saad','saad@gmail.com',2),
(8,'Hassan','hassan@gmail.com',2),
(9,'Riyan','riyan@gmail.com',1),
(10,'Ayesha','ayesha@gmail.com',1),
(11,'Kashif','kashif@gmail.com',2),
(12,'Muneeb','muneeb@gmail.com',2);

INSERT INTO Freelancer (freelancer_id , user_id , rating , experience)VALUES
(1,1,0,'2 years'),
(2,2,0,'3 years'),
(3,3,0,'1 year'),
(4,4,0,'4 years'),
(5,9,0,'2 years'),
(6,10,0,'5 years');

INSERT INTO Client (client_id , user_id) VALUES
(1,5),
(2,6),
(3,7),
(4,8),
(5,11),
(6,12);

INSERT INTO Skill (skill_id , skill_name) VALUES
(1,'Python'),
(2,'SQL'),
(3,'Web Development'),
(4,'Graphic Design'),
(5,'Data Analysis'),
(6,'Machine Learning');

INSERT INTO Freelancer_Skill (freelancer_id , skill_id) VALUES
(1,1),(1,2),
(2,3),(2,2),
(3,4),
(4,1),(4,5),
(5,3),(5,4),
(6,1),(6,6);

INSERT INTO Category (category_id , name)VALUES
(1,'Programming'),
(2,'Design'),
(3,'Data Science');

INSERT INTO Gig (gig_id , title , price , freelancer_id , category_id)VALUES
(1,'Python Script',2000,1,1),
(2,'Website Development',5000,2,1),
(3,'Logo Design',1500,3,2),
(4,'Data Analysis Report',3000,4,3),
(5,'ML Model',7000,6,3),
(6,'Frontend Website',4000,5,1),
(7,'SQL Queries',2500,1,1),
(8,'Poster Design',1200,3,2),
(9,'Dashboard Creation',3500,4,3),
(10,'AI Model',8000,6,3),
(11,'Landing Page',3000,2,1),
(12,'UI Design',2000,5,2);

INSERT INTO Order_Status (status_id , status_name) VALUES
(1,'Pending'),
(2,'In Progress'),
(3,'Completed');

INSERT INTO Orders (order_id , client_id , gig_id , status_id , order_date)
VALUES
(1,1,1,3,NOW()),
(2,2,2,3,NOW()),
(3,3,3,2,NOW()),
(4,4,4,3,NOW()),
(5,5,5,1,NOW()),
(6,6,6,3,NOW()),
(7,1,7,3,NOW()),
(8,2,8,2,NOW()),
(9,3,9,3,NOW()),
(10,4,10,1,NOW()),
(11,5,11,3,NOW()),
(12,6,12,3,NOW()),
(13,1,2,3,NOW()),
(14,2,3,3,NOW()),
(15,3,1,3,NOW());

INSERT INTO Payment_Status (payment_status_id , status_name) VALUES
(1,'Pending'),
(2,'Completed');

INSERT INTO Payment (payment_id , order_id , amount , payment_status_id) 
VALUES
(1,1,2000,2),
(2,2,5000,2),
(3,3,1500,1),
(4,4,3000,2),
(5,5,7000,1),
(6,6,4000,2),
(7,7,2500,2),
(8,8,1200,1),
(9,9,3500,2),
(10,10,8000,1),
(11,11,3000,2),
(12,12,2000,2),
(13,13,5000,2),
(14,14,1500,2),
(15,15,2000,2);

INSERT INTO Review (review_id , order_id , rating , comment) VALUES
(1,1,5,'Excellent'),
(2,2,4,'Good'),
(3,4,5,'Great work'),
(4,6,2,'Not satisfactory'),
(5,7,4,'Nice'),
(6,9,5,'Perfect'),
(7,11,4,'Well done'),
(8,12,5,'Outstanding'),
(9,13,4,'Good'),
(10,14,1,'Worst'),
(11,15,5,'Excellent');

-- 1st trigger for freelancer's rating updates
CREATE TRIGGER update_rating
AFTER INSERT ON Review
FOR EACH ROW
UPDATE Freelancer f
SET rating = (
  SELECT AVG(r.rating)
  FROM Review r
  JOIN Orders o ON r.order_id = o.order_id
  JOIN Gig g ON o.gig_id = g.gig_id
  WHERE g.freelancer_id = f.freelancer_id
);

-- 2nd trigger for checking wether an order is completed or not before user can enter review
DELIMITER $$

CREATE TRIGGER check_review_before_insert
BEFORE INSERT ON Review
FOR EACH ROW
BEGIN
    DECLARE s INT;

    SELECT status_id INTO s
    FROM Orders
    WHERE order_id = NEW.order_id;

    IF s <> 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order must be completed before adding review';
    END IF;
END$$

DELIMITER ;

-- 1st stored procedure for placing order
DELIMITER $$

CREATE PROCEDURE PlaceOrder (
    IN p_client_id INT,
    IN p_gig_id INT
)
BEGIN
    INSERT INTO Orders (client_id, gig_id, status_id, order_date)
    VALUES (p_client_id, p_gig_id, 1, NOW());
END$$

DELIMITER ;

-- 2nd stored procedure for completing order
DELIMITER $$

CREATE PROCEDURE CompleteOrder (
    IN p_order_id INT
)
BEGIN
    UPDATE Orders
    SET status_id = 3
    WHERE order_id = p_order_id;

    UPDATE Payment
    SET payment_status_id = 2
    WHERE order_id = p_order_id;
END$$

DELIMITER ;

-- INDEXES
-- index on user email
CREATE INDEX idx_user_email ON User(email);

-- index on freelancer skill to match required skills
CREATE INDEX idx_skill_match ON Freelancer_Skill(skill_id);

-- index on gig category to find the exact category
CREATE INDEX idx_gig_category ON Gig(category_id);

-- index on orders to find the orders of a client
CREATE INDEX idx_orders_client ON Orders(client_id);

-- index on payment status to check status of any payment
CREATE INDEX idx_payment_status ON Payment(payment_status_id);

-- index on review to check review of any order
CREATE INDEX idx_review_order ON Review(order_id);

-- QUERIES
-- Real world Scenarios
-- Query 1
-- How much each freelancer has earned from completed payments
SELECT 
    u.name AS freelancer_name, SUM(p.amount) AS total_revenue
FROM
    Payment p
        JOIN
    Orders o ON p.order_id = o.order_id
        JOIN
    Gig g ON o.gig_id = g.gig_id
        JOIN
    Freelancer f ON g.freelancer_id = f.freelancer_id
        JOIN
    User u ON f.user_id = u.user_id
WHERE
    p.payment_status_id = 2
GROUP BY u.name
ORDER BY total_revenue DESC;

-- Query 2
-- A report showing how many orders are completed, in progress, or pending
SELECT 
    os.status_name, COUNT(o.order_id) AS total_orders
FROM
    Orders o
        JOIN
    Order_Status os ON o.status_id = os.status_id
GROUP BY os.status_name;

-- Queries using views
-- Query 3
-- A complete order report including client, freelancer, gig, and status
CREATE VIEW Order_Report AS
    SELECT 
        o.order_id,
        cu.name AS client_name,
        fu.name AS freelancer_name,
        g.title AS gig_title,
        os.status_name,
        o.order_date
    FROM
        Orders o
            JOIN
        Client c ON o.client_id = c.client_id
            JOIN
        User cu ON c.user_id = cu.user_id
            JOIN
        Gig g ON o.gig_id = g.gig_id
            JOIN
        Freelancer f ON g.freelancer_id = f.freelancer_id
            JOIN
        User fu ON f.user_id = fu.user_id
            JOIN
        Order_Status os ON o.status_id = os.status_id;
        SELECT * FROM Order_Report;

-- other complex Queries
-- Query 4
-- find the name and skills of freelancers who have multiple skills
SELECT 
    u.name,
    GROUP_CONCAT(s.skill_name
        SEPARATOR ', ') AS skills,
    COUNT(fs.skill_id) AS skill_count
FROM
    Freelancer f
        JOIN
    User u USING (user_id)
        JOIN
    Freelancer_Skill fs USING (freelancer_id)
        JOIN
    Skill s USING (skill_id)
GROUP BY u.name , f.freelancer_id
HAVING COUNT(fs.skill_id) > 1;

-- Query 5
-- find the details of orders whose payments are pending
SELECT 
    o.order_id, c.client_id, u.name
FROM
    user u
        JOIN
    client c USING (user_id)
        JOIN
    orders o USING (client_id)
        JOIN
    payment p USING (order_id)
        JOIN
    payment_status ps USING (payment_status_id)
WHERE
    ps.status_name LIKE 'Pending';
    
-- Query 6
-- find the number of clients with most number of orders and also show their total amount
SELECT 
    COUNT(*) AS number_of_clients_with_most_orders,
    SUM(total_amount) AS grand_total
FROM
    (SELECT 
        c.client_id, SUM(p.amount) AS total_amount
    FROM
        client c
    JOIN orders o ON c.client_id = o.client_id
    JOIN payment p ON p.order_id = o.order_id
    GROUP BY c.client_id
    HAVING COUNT(o.order_id) = (SELECT 
            MAX(order_count)
        FROM
            (SELECT 
            COUNT(order_id) AS order_count
        FROM
            orders
        GROUP BY client_id) AS counts)) AS top_clients;
    
-- Query 7
-- find the title and price of gigs whose price is greater than the average price of all gigs
SELECT 
    title, price
FROM
    gig
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            gig);
            
-- Query 8
-- find the rating and name of freelancers and order them by highest rating first
SELECT 
    name, freelancer_id, rating
FROM
    freelancer
        JOIN
    user
WHERE
    user.user_id = freelancer.user_id
ORDER BY rating DESC;

-- Query 9
-- Find the name and total income of all freelancers
SELECT 
    name, freelancer.freelancer_id, SUM(amount) AS 'Income'
FROM
    freelancer
        LEFT JOIN
    gig ON gig.freelancer_id = freelancer.freelancer_id
        LEFT JOIN
    orders ON orders.gig_id = gig.gig_id
        LEFT JOIN
    payment ON payment.order_id = orders.order_id
        JOIN
    user ON user.user_id = freelancer.user_id
GROUP BY name , freelancer_id
ORDER BY SUM(amount) DESC;

-- Query 10
-- find the name and id of freelancers who have skill in python
SELECT 
    f.freelancer_id, u.name
FROM
    Freelancer f
        JOIN
    User u ON f.user_id = u.user_id
        JOIN
    Freelancer_Skill fs ON f.freelancer_id = fs.freelancer_id
        JOIN
    Skill s ON fs.skill_id = s.skill_id
WHERE
    s.skill_name = 'Python';

-- Query 11
-- Find the most experienced freelancer
  SELECT 
    f.freelancer_id, u.name, f.experience
FROM
    freelancer f
        JOIN
    user u USING (user_id)
WHERE
    f.experience IN (SELECT 
            MAX(experience)
        FROM
            freelancer); 
            
            