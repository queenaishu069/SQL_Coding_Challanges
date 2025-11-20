-- To create OnlineBookstore database
CREATE DATABASE OnlineBookstore;
USE  OnlineBookstore;


-- To create a table Books
CREATE TABLE Books(
book_id INT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(50) NOT NULL,
ISBN VARCHAR (20) UNIQUE,
price DECIMAL(8,2) CHECK(price>0)
);


-- To create a table Orders
CREATE TABLE Orders(
order_id INT PRIMARY KEY,
book_id INT ,
order_date DATE NOT NULL,
quantity INT CHECK(quantity>0),
FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

 
-- To insert records
INSERT INTO Books (book_id, title, author, ISBN, price)
VALUES(1, 'to kill a monckingbird','harper lee',9780061120084,450),
	  (2,'the hobbit', 'emily',97814769335,530),
      (3,'echo','harper',9780307941238,810),
      (4,'dust','rowan',9780143178101,750),
      (5,'flame','kingsley',9780062303340,920),
      (6,'shore','whitman',9780525558763,690),
      (7,'rose','bennett',9781501122200,250),
      (8,'moon','callahan',9780316001025,330),
      (9,'ash','ellison',9780062658891,840),
      (10,'star','winslow',9781501154225,670);
      
      
      select * from Orders;
      -- To insert records in orders table
      INSERT INTO Orders(order_id, book_id, order_date, quantity)
      VALUES(1001,2,'2025-3-12',2),
            (1002,7,'2025-3-17',1),
            (1003,4,'2025-3-22',3),
            (1004,1,'2025-4-1',2),
            (1005,8,'2025-4-13',2),
            (1006,3,'2025-4-15',1),
            (1007,5,'2025-4-25',3),
            (1008,9,'2025-4-30',2),
            (1009,10,'2025-5-7',1),
            (1010,6,'2025-5-28',2);
            
            
SELECT * FROM Orders;
SELECT * FROM Books;
-- To update price
UPDATE Books
SET price=350
WHERE book_id=7 ;

SET SQL_SAFE_UPDATES=0;
-- To delete specific rows
DELETE FROM Orders
WHERE quantity<2;

SELECT * FROM Orders;

SET SQL_SAFE_UPDATES=1;   

-- To use truncate
TRUNCATE TABLE Orders;   
TRUNCATE TABLE Books;