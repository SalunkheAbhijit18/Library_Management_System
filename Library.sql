-- Create a Database called 'Library' 
CREATE DATABASE library;
\c library;


-- Create Table "Branch"
CREATE TABLE Branch(
	Branch_no VARCHAR(20) PRIMARY KEY,
	Manager_id VARCHAR(20),
	Branch_address VARCHAR(30),
	Contact_no VARCHAR(15)
);


-- Create Table "Employee"
CREATE TABLE Employee(
	Emp_id VARCHAR(10) PRIMARY KEY,
	Emp_name VARCHAR(20),
	Position VARCHAR(20),
	Salary DECIMAL(10,2)
);


-- Create Table "Customer"
CREATE TABLE Customer(
	Customer_id VARCHAR(10) PRIMARY KEY,
	Customer_name VARCHAR(20),
	Customer_address VARCHAR(30),
	Reg_date DATE
);


-- Create Table "Books"
CREATE TABLE Books(
	ISBN VARCHAR(25) PRIMARY KEY,
	Books_title VARCHAR(50),
	Category VARCHAR(20),
	Rental_price DECIMAL(10,2),
	Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
	Author VARCHAR(30),
	Publisher VARCHAR(30)
);


-- Create Table "Issue_status"
CREATE TABLE Issue_status(
	Issue_id VARCHAR(10) PRIMARY KEY,
	Issued_cust VARCHAR(30) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
	Issued_book_name VARCHAR(80),
	Issue_date DATE,
	Isbn_book VARCHAR(25) REFERENCES Books(ISBN) ON DELETE CASCADE
);


-- Create Table "Return_status"
CREATE TABLE Return_status(
	Return_id VARCHAR(10) PRIMARY KEY,
	Return_cust VARCHAR(20) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
	Return_book_name VARCHAR(80),
	Return_date DATE,
	Isbn_book2 VARCHAR(25) REFERENCES Books(ISBN) ON DELETE CASCADE
);


-- Insert values into Branch Table
INSERT INTO Branch VALUES
('B001', 'M101', 'Thane', '+91 9320304089'),
('B002', 'M102', 'Kalwa', '+91 8818345983'),
('B003', 'M103', 'Borivali', '+91 8767978928'),
('B004', 'M104', 'Turbhe', '+91 9080706050'),
('B005', 'M105', 'Digha', '+91 8798675432');


-- Insert values into Customer Table
INSERT INTO Customer VALUES
('C101', 'Nilesh Unawane', 'Lokmanya Nagar', '2024-11-09'),
('C102', 'Shreyas Zagade', 'Rabodi', '2024-10-10'),
('C103', 'Sagar Kalmundkar', 'Kasarvadavali', '2024-09-09'),
('C104', 'Tejas Sardar', 'Mogarpada', '2024-01-01'),
('C105', 'Prasad Lokhande', 'Gaimukh', '2024-12-02'),
('C106', 'Krushna Pujari', 'Sai Nagar', '2024-02-12'),
('C107'	, 'Girikrishnan KS', 'Mira Road', '2024-11-09'),
('C108', 'Abhijit Salunkhe', 'Owala', '2023-11-09'),
('C109', 'Shubham Pattade', 'dombivali', '2023-10-09'),
('C110', 'Ganesh Varande', 'Girgaon', '2025-01-15');


-- Insert values into Employee Table
INSERT INTO Employee VALUES
('E101', 'Mukesh', 'Manager', 60000.00),
('E102', 'Naresh', 'Clerk', 45000.00),
('E103', 'Mangesh', 'Librarian', 55000.00),
('E104', 'Kalpesh', 'Assistant', 40000.00),
('E105', 'Arun', 'Assistant',42000.00),
('E106', 'Santosh', 'Assistant', 43000.00),
('E107', 'Samir', 'Manager', 62000.00),
('E108', 'Iqbal', 'Clerk', 46000.00),
('E109', 'Salman', 'Librarian', 57000.00),
('E110', 'Shahrukh', 'Assistant', 41000.00),
('E111', 'Amir', 'Manager', 65000.00);


-- Insert values into Books Table
INSERT INTO Books VALUES
('978-9-357-20047-9', 'Chavaa', 'History', 200.00, 'Yes', 'Shivaji Sawant', 'Mehta Publishing House'),
('978-0-735-21129-2', 'Atomic Habits', 'Self-help', 150.00, 'Yes', 'James Clear', 'Penguin Random House'),
('978-9-391-16548-2', 'Do Epic Shit', 'Self-help', 130.00, 'Yes', 'Ankur Warikoo', 'Juggernaut Books'),
('978-0-241-95822-3', 'Start With WHY', 'Business', 234.00, 'Yes', 'Simon Sinek', 'Penguin Random House'),
('978-1-713-52646-9', 'The Wellness Sense', 'Health', 456.00, 'Yes', 'Om Swami', 'HarperCollins India'),
('978-9-356-29079-2', 'RAM Amish', 'Mythology', 340.00, 'Yes', 'Amish Tripathi', 'Westland'),
('978-1-780-33200-0', 'Mindset', 'Psychology', 200.00, 'Yes', 'Carol Dweck', 'Ballantine Books'),
('978-1-786-33089-5', 'Ikigai', 'Philosophy', 400.00, 'Yes', 'Hector Garcia', 'Penguin Random House'),
('978-8-126-01221-3', 'Yayati', 'Mythology', 500.00, 'Yes', 'V S Khandekar', 'Mehta Publishing House'),
('978-0-143-46377-1', 'Mrutunjay', 'History', 200.00, 'Yes', 'Shivaji Sawant', 'Mehta Publishing House'),
('978-9-385-50954-4', 'Panipat', 'History', 120.00, 'Yes', 'Vishwas Patil', 'Rajhans Prakashan'),
('978-9-355-18938-7', 'Sambhaji', 'History', 130.00, 'Yes', 'Vishwas Patil', 'Rajhans Prakashan'),
('978-9-389-08244-9', 'Duniyadaari', 'Fiction', 170.00, 'Yes', 'Suhas Shirvalkar', 'Mehta Publishing House'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind',	'History', 190.00, 'Yes', 'Yuval Noah Harari',	'HarperCollins India'),
('978-0-09-957807-9', 'A Game of Thrones',	'Fantasy', 210.00,	'Yes', 'George Martin',	'Bantam Books'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 250.00, 'Yes', 'Paulo Coelho', 'HarperCollins India'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction',	300.00,	'Yes', 'Gabriel Marquez', 'HarperCollins India');


-- Update Books status
UPDATE Books SET status = 'No' WHERE isbn IN ('978-0-241-95822-3','978-1-780-332000-0','978-9-389-08244-9', '978-0-307-58837-1');


-- Insert values into Issue_Status Table
INSERT INTO Issue_status VALUES
('IS101', 'C101', 'Chavaa',	'01-05-2024', '978-9-357-20047-9'),
('IS102', 'C102', 'Mindset', '02-05-2024', '978-1-780-33200-0'),
('IS103', 'C103', 'Duniyadaari', '03-05-2024', '978-9-389-08244-9'),
('IS104', 'C104', 'Atomic Habits', '04-05-2024', '978-0-735-21129-2'),
('IS105', 'C105', 'Do Epic Shit', '05-05-2024', '978-9-391-16548-2');


-- Insert values into Return_Status table
INSERT  INTO Return_status VALUES
('RS101', 'C101', 'Chavaa',	'06-06-2024', '978-9-357-20047-9'),
('RS102', 'C102', 'Atomic Habits',	'07-06-2024', '978-0-735-21129-2'),
('RS103', 'C103', 'Do Epic Shit', '08-06-2024', '978-9-391-16548-2'),
('RS104', 'C104', 'Yayati',	'09-06-2024', '978-8-126-01221-3'),
('RS105', 'C105', 'Ikigai',	'10-06-2024', '978-1-786-33089-5');


-- Alter employee table to add branch_no column with foreign key
ALTER TABLE employee ADD COLUMN branch_no VARCHAR(10);
ALTER TABLE employee ADD CONSTRAINT fk_branch_no FOREIGN KEY (branch_no) REFERENCES branch(branch_no);


-- Update employee branch_no values
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E101';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E102';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E103';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E104';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E105';
UPDATE employee SET branch_no = 'B003' WHERE emp_id ='E106';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E107';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E108';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E109';
UPDATE employee SET branch_no = 'B004' WHERE emp_id ='E110';
UPDATE employee SET branch_no = 'B003' WHERE emp_id ='E111';



----- Queries------


-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Books_title, category, rental_price FROM books WHERE Status = 'Yes';


-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM employee ORDER BY Salary DESC;


-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issue_status.Issued_book_name, customer.Customer_name FROM issue_status INNER JOIN
customer on issue_status.Issued_cust = customer.Customer_Id;


-- 4. Display the total count of books in each category.
SELECT Category, COUNT(Books_title) FROM books GROUP BY Category;


-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, position FROM employee WHERE Salary > 50000;


-- 6. List the customer names who registered before 2025-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE Reg_date < '2025-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issue_status);


-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no;


-- 8. Display the names of customers who have issued books in the month of May 2024.
SELECT customer.Customer_name FROM customer INNER JOIN issue_status ON 
customer.Customer_Id = issue_status.Issued_cust 
WHERE issue_status.Issue_date >= '2024-05-01' AND issue_status.Issue_date <= '2024-05-30';


-- 9. Retrieve book_title from book table containing 'history'.
SELECT books_title FROM books WHERE Category = 'History';


-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 2 employees.
SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no HAVING COUNT(Emp_id) > 2;
