CREATE TABLE Job (
    job_id varchar2(15) NOT NULL UNIQUE,
    job_title varchar2(30) NOT NULL,
    min_sal number(7,2) NOT NULL,
    max_sal number(7,2) NOT NULL
);

CREATE TABLE Employee (
    emp_no number(10) CONSTRAINT emp_no_pk PRIMARY KEY,
    emp_name varchar2(30) CONSTRAINT emp_name_nn NOT NULL,
    emp_sal number(8,2) CONSTRAINT emp_sal_chk CHECK (emp_sal > 0),
    emp_comm number(6,1) CONSTRAINT emp_comm_chk CHECK (emp_comm >= 0),
    dept_no number(3) CONSTRAINT dept_no_nn NOT NULL
);

CREATE TABLE Deposit (
    a_no varchar2(5) NOT NULL UNIQUE,
    cname varchar2(15) NOT NULL,
    bname varchar2(10) NOT NULL,
    amount number(7,2) NOT NULL,
    a_date date NOT NULL
);

CREATE TABLE Borrow (
    loanno varchar2(5) NOT NULL UNIQUE,
    cname varchar2(15) NOT NULL,
    bname varchar2(15) NOT NULL,
    amount number(7,2) NOT NULL
);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(101,'Smith',800,455,20);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(102,'Snehal',1600,0,25);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(103,'Adama',1100,425,20);
INSERT INTO Employee(emp_no,emp_name,emp_sal,dept_no)VALUES(104,'Aman',3000,15);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no)VALUES(105,'Anita',5000,50000,10);
INSERT INTO Employee(emp_no,emp_name,emp_sal,dept_no)VALUES(106,'Anamika',2975,30);

SELECT * FROM Employee;

INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('IT PROG','Programmer',4000,10000);
INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('MK MGR','Marketing Manager',9000,15000);
INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('FI MGR','Finance Manager',8200,12000);
INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('FI ACC','Account',4200,9000);
INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('LEC','Lecturer',6000,17000);
INSERT INTO Job(Job_id,Job_title,min_sal,max_sal)VALUES('COMP OP','Computer Operator',1500,13000);

SELECT * FROM Job;

INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('101','Anil','andheri',7000,TO_DATE('01-01-2006','DD-MM-YYYY'));
INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('102','sunil','virar',5000,TO_DATE('15-07-2006','DD-MM-YYYY'));
INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('103','jay','villeparle',6500,TO_DATE('12-03-2006','DD-MM-YYYY'));
INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('104','vijay','andheri',8000,TO_DATE('17-09-2006','DD-MM-YYYY'));
INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('105','keyur','dadar',7500,TO_DATE('19-11-2006','DD-MM-YYYY'));
INSERT INTO Deposit(a_no,cname,bname,amount,a_date)VALUES('106','mayur','borivali',5500,TO_DATE('21-12-2006','DD-MM-YYYY'));

SELECT * FROM Deposit;

INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('201','ANIL','VRCE',1000);
INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('206','MEHUL','AJNI',5000);
INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('311','SUNIL','DHARAMPETH',3000);
INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('321','MADHURI','ANDHERI',2000);
INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('375','PRMOD','VIRAR',8000);
INSERT INTO Borrow(loanno,cname,bname,amount)VALUES('481','KRANTI','NEHRU PLACE',3000);

SELECT * FROM Borrow;

--Q_1
DROP TABLE Employee
CREATE TABLE SUPPLIER AS SELECT * FROM EMPLOYEE;
DESCRIBE SUPPLIER;
SELECT * FROM SUPPLIER

CREATE TABLE SUP1 AS SELECT EMP_NO,EMP_NAME FROM EMPLOYEE;
DESCRIBE SUP1;
SELECT * FROM SUP1

CREATE TABLE SUP2 AS SELECT * FROM EMPLOYEE WHERE 1=0;
DESCRIBE SUP2
SELECT * FROM SUP2

INSERT INTO SUP2  select * FROM EMPLOYEE WHERE EMP_NAME='Anita';

ALTER TABLE SUP2 RENAME TO SUP_2;
SELECT * FROM SUP_2

DROP TABLE SUP1
DESCRIBE SUP1

ALTER TABLE EMPLOYEE ADD PHONE VARCHAR2(10);
SELECT * FROM EMPLOYEE
DESCRIBE EMPLOYEE

ALTER TABLE EMPLOYEE MODIFY PHONE CHAR(10)
DESCRIBE EMPLOYEE


ALTER TABLE SUP_2 DROP COLUMN EMP_NAME;
DESCRIBE SUP_2;

ALTER TABLE SUP_2 RENAME COLUMN EMP_SAL TO NEW_SAL;
DESCRIBE SUP_2;



--PRACRICAL 3
--1
SELECT *FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM DEPOSIT
--  2 
SELECT JOB_TITLE,MAX_SAL
FROM JOB

-- 3
SELECT  BNAME FROM DEPOSIT;
SELECT BNAME  FROM BORROW;

--4
SELECT A_NO,AMOUNT FROM DEPOSIT WHERE A_DATE BETWEEN TO_DATE('01-01-2006', 'DD-MM-YYYY') 
                  AND TO_DATE('25-07-2006', 'DD-MM-YYYY');
--5
SELECT CNAME FROM DEPOSIT WHERE A_DATE > TO_DATE('09-OCT-2006','DD-MM-YYYY');

--6
 SELECT EMP_NAME AS EMPLOYEE_NAME,EMP_SAL
 FROM EMPLOYEE WHERE DEPT_NO=20;

--7
SELECT EMP_NO,EMP_NAME,DEPT_NO
FROM EMPLOYEE WHERE DEPT_NO IN(10,20);
 
 --8
SELECT EMP_NO,EMP_NAME,DEPT_NO
FROM EMPLOYEE WHERE DEPT_NO NOT IN(15,30)
    AND DEPT_NO!=25;

--9
SELECT EMP_NO,EMP_NAME,DEPT_NO
FROM EMPLOYEE WHERE DEPT_NO BETWEEN 15 AND 25;

--10
SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_COMM IS NOT NULL;

--11
SELECT TO_CHAR(min_sal) || ' - ' || TO_CHAR(max_sal) AS COMBIN_SAL
FROM JOB;

--12
INSERT INTO SUP_2(emp_no,NEW_SAL,emp_comm,dept_no) 
SELECT EMP_NO,EMP_SAL,EMP_COMM,DEPT_NO  FROM Employee;
SELECT * FROM SUP_2;

--13
DELETE FROM SUP1;
ALTER  TABLE SUP1 RENAME  TO NEW_SUP;
SELECT * FROM NEW_SUP;

--14
DELETE FROM SUP_2 WHERE EMP_NO=103;
SELECT * FROM SUP_2;

--15
UPDATE EMPLOYEE SET EMP_NAME='Aman' WHERE EMP_NAME='Anita';
SELECT * FROM EMPLOYEE;

--16
UPDATE EMPLOYEE SET EMP_NAME='DHAVAL_23CS060' WHERE EMP_NO=103;
SELECT * FROM EMPLOYEE;

--17
SELECT MIN(MIN_SAL) AS MINIMUN_SAL,MAX(MAX_SAL) AS MAXIMUM_SAL FROM JOB;

--18
SELECT AVG(EMP_SAL) AS AVERAGE_SAL FROM EMPLOYEE;

--19
SELECT COUNT(*) AS TOTAL_ROWS,
        COUNT(DISTINCT DEPT_NO) AS DISTINCT_DEPT_NO
        FROM EMPLOYEE WHERE EMP_SAL>1000;
        
--20
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME ASC,EMP_NO ASC;

--21
SELECT * FROM EMPLOYEE ORDER BY DEPT_NO ASC,EMP_COMM DESC;

--22
UPDATE EMPLOYEE SET EMP_COMM=500 WHERE DEPT_NO=20;
SELECT * FROM EMPLOYEE;

--23
SELECT EMP_COMM,EMP_SAL FROM EMPLOYEE
ORDER BY EMP_COMM ASC NULLS FIRST ,EMP_SAL DESC;

--24
SELECT EMP_COMM,EMP_NO FROM EMPLOYEE
ORDER BY EMP_COMM ASC NULLS LAST ,EMP_NO DESC;

 --PRACTICAL 4
--1
-- Step 1: Creating Employee and Customer schemas with constraints

DROP TABLE Employee;
CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    Emp_Name VARCHAR2(50) NOT NULL,
    Emp_Sal NUMBER CHECK (Emp_Sal > 0) NOT NULL,
    Job_ID VARCHAR2(30) UNIQUE,
    Dept_No NUMBER,
    Phone CHAR(10)
);

DROP TABLE Customer;
CREATE TABLE Customer (
    Cust_ID NUMBER PRIMARY KEY,
    Cust_Name VARCHAR2(50) NOT NULL,
    Branch VARCHAR2(50) NOT NULL
);

-- Inserting sample data into Employee table
INSERT INTO Employee (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (101, 'Aman', 3000, 'FI_ACC', 20, '1234567890');
INSERT INTO Employee (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (102, 'Adama', 2500, 'MK_MGR', 10, '2345678901');
INSERT INTO Employee (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (103, 'Anita', 5000, 'IT_PROG', 30, '3456789012');
INSERT INTO Employee (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (104, 'Anamika', 2975, 'LEC', 15, '4567890123');
INSERT INTO Employee (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (105, 'Snehal', 1600, 'COMP_OP', 25, NULL);

-- Inserting sample data into Customer table
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (201, 'Anil', 'Andheri');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (202, 'Sunil', 'Virar');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (203, 'Keyur', 'Dadar');
INSERT INTO Customer (Cust_ID, Cust_Name, Branch)
VALUES (204, 'Vijay', 'Borivali');

-- Task Queries

-- 1. Retrieve employees whose names start with 'A' or have 'a' as the third character
SELECT * FROM Employee
WHERE Emp_Name LIKE 'A%' OR SUBSTR(Emp_Name, 3, 1) = 'a';

-- 2. Retrieve employees whose names are exactly 5 characters long and start with 'Ani'
SELECT Emp_Name, emp_id, Emp_Sal FROM Employee
WHERE LENGTH(Emp_Name) = 5 AND Emp_Name LIKE 'Ani%';

-- 1. Retrieve employees whose second character is 'M' or 'N'
SELECT * FROM Employee
WHERE SUBSTR(Emp_Name, 2, 1) IN ('m', 'n');

-- 2. Retrieve employees whose second character is 'n' and names are exactly 5 characters long
SELECT * FROM Employee
WHERE LENGTH(Emp_Name) = 5 AND SUBSTR(Emp_Name, 2, 1) = 'n';

-- 3. Identify employees with incomplete details and third character as 'a'
SELECT * FROM Employee
WHERE (Emp_Sal IS NULL OR Phone IS NULL) AND SUBSTR(Emp_Name, 3, 1) = 'a';


-- 1. Retrieve names of customers in 'Andheri', 'Dadar', or 'Virar'
SELECT CUST_NAME FROM CUSTOMER
WHERE BRANCH IN('Andheri','Virar','Dadar');

-- 1. Retrieve job titles with Job_IDs starting with 'FI_'
SELECT Job_ID FROM Job
WHERE Job_ID LIKE 'FI_%';

-- 2. Retrieve job titles ending with '_MGR' and max salary > 12000
SELECT job_title FROM Job
WHERE job_title LIKE '%_MGR' AND max_sal > 12000;

-- Final Verification Queries
SELECT * FROM Employee;
SELECT * FROM Customer;


-- practical 5

CREATE TABLE JOB_PROFILE(
    emp_id NUMBER PRIMARY KEY,
    Emp_Name VARCHAR2(50) NOT NULL,
    Emp_Sal NUMBER CHECK (Emp_Sal > 0) NOT NULL,
    Job_ID VARCHAR2(30) UNIQUE,
    Dept_No NUMBER
    );
    
 CREATE TABLE CUSTOMER (
    Cust_ID NUMBER PRIMARY KEY,
    Cust_Name VARCHAR2(50) NOT NULL,
    Branch VARCHAR2(50) NOT NULL);
 
 
INSERT INTO JOB_PROFILE (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (101, 'Aman', 3000, 'FI_ACC', 20 );
INSERT INTO JOB_PROFILE (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (102, 'Adama', 2500, 'MK_MGR', 10 );
INSERT INTO JOB_PROFILE (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (103, 'Anita', 5000, 'IT_PROG', 30);
INSERT INTO JOB_PROFILE (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (104, 'Anamika', 2975, 'LEC', 15 );
INSERT INTO JOB_PROFILE (emp_id, Emp_Name, Emp_Sal, Job_ID, Dept_No)
VALUES (105, 'Snehal', 1600, 'COMP_OP', 25);

ALTER TABLE CUSTOMER DROP COLUMN BRANCH;

INSERT INTO Customer (Cust_ID, Cust_Name )
VALUES (201, 'Anil', 'Andheri');
INSERT INTO Customer (Cust_ID, Cust_Name )
VALUES (202, 'Sunil', 'Virar');
INSERT INTO Customer (Cust_ID, Cust_Name )
VALUES (203, 'Keyur', 'Dadar');
INSERT INTO Customer (Cust_ID, Cust_Name )
VALUES (204, 'Vijay', 'Borivali');

SELECT * FROM JOB_PROFILE;
SELECT * FROM CUSTOMER;

--1
SELECT AVG(Emp_Sal) AS Average_Salary
FROM JOB_PROFILE;

--1.1
SELECT AVG(DISTINCT Emp_Sal) AS Distinct_Average_Salary
FROM JOB_PROFILE;

--2
SELECT MIN(Emp_Sal) AS Min_Salary
FROM JOB_PROFILE;


--3
SELECT COUNT(*) AS Total_Employees
FROM JOB_PROFILE;
 
 --3.1
SELECT COUNT(DISTINCT Dept_No) AS Distinct_Departments
FROM JOB_PROFILE;

--4
SELECT MAX(Emp_Sal) AS Max_Salary
FROM JOB_PROFILE;

--5
SELECT SUM(Emp_Sal) AS Total_Salary
FROM JOB_PROFILE;

--5.1
SELECT SUM(DISTINCT Emp_Sal) AS Distinct_Salary
FROM JOB_PROFILE;


--6
SELECT emp_id, Emp_Name, Emp_Sal, ABS(Emp_Sal - 1000) AS Abs_Diff_From_1000
FROM JOB_PROFILE;

--7
SELECT emp_id, Emp_Name, Emp_Sal, POWER(Emp_Sal, 2) AS Salary_Squared
FROM JOB_PROFILE;

--8
SELECT emp_id, Emp_Name, Emp_Sal, ROUND(Emp_Sal, 2) AS Rounded_Salary
FROM JOB_PROFILE;

--9
    SELECT emp_id, Emp_Name, Emp_Sal, SQRT(Emp_Sal) AS Salary_Square_Root
    FROM JOB_PROFILE;

--
--10.1
SELECT emp_id, Emp_Name, LOWER(Emp_Name) AS Lowercase_Name
FROM JOB_PROFILE;

--10.2
SELECT emp_id, Emp_Name, UPPER(Emp_Name) AS Uppercase_Name
FROM JOB_PROFILE;

--10.3
SELECT emp_id, Emp_Name, INITCAP(Emp_Name) AS InitialCaps_Name
FROM JOB_PROFILE;

--11
SELECT emp_id, Emp_Name, SUBSTR(Emp_Name, 1, 3) AS First_Three_Chars
FROM JOB_PROFILE;

--12
SELECT emp_id, Emp_Name, LENGTH(Emp_Name) AS Name_Length
FROM JOB_PROFILE;

--13
SELECT emp_id, Emp_Name, 
       REPLACE(REPLACE(Emp_Name, 'A', ''), 'a', '') AS Modified_Name
FROM JOB_PROFILE;

--14
SELECT emp_id, Emp_Name, 
       LPAD(RPAD(Emp_Name, 10, '*'), 10, '*') AS Padded_Name
FROM JOB_PROFILE;
 
 
 --
 --15
SELECT emp_id, Emp_Name, Emp_Sal, TO_NUMBER(Emp_Sal) AS Numeric_Salary
FROM JOB_PROFILE;


--16
SELECT emp_id, Emp_Name, Emp_Sal, TO_CHAR(Emp_Sal, '999,999,999.00') AS Formatted_Salary
FROM JOB_PROFILE;

--
--17
SELECT CURRENT_DATE AS Current_Date, ADD_MONTHS(CURRENT_DATE, 6) AS Date_After_6_Months
FROM dual;

--18
SELECT CURRENT_DATE AS Current_Date, LAST_DAY(CURRENT_DATE) AS Last_Day_Of_Month
FROM dual;

--19
SELECT MONTHS_BETWEEN(DATE '2025-07-01', DATE '2025-01-01') AS Months_Between
FROM dual;

 --20
SELECT CURRENT_DATE AS Current_Date, NEXT_DAY(CURRENT_DATE, 'MONDAY') AS Next_Monday
FROM dual;

--
--21
SELECT Emp_Name AS First_Name
FROM JOB_PROFILE
UNION
SELECT Cust_Name AS First_Name
FROM CUSTOMER;

--22
SELECT Emp_Name AS First_Name
FROM JOB_PROFILE
UNION ALL
SELECT Cust_Name AS First_Name
FROM CUSTOMER;

--23
SELECT Emp_Name AS First_Name
FROM JOB_PROFILE
INTERSECT
SELECT Cust_Name AS First_Name
FROM CUSTOMER;


--24
SELECT Emp_Name AS First_Name
FROM JOB_PROFILE
MINUS
SELECT Cust_Name AS First_Name
FROM CUSTOMER;


----PRACTICAL 6

CREATE TABLE Product (
    Detorder_no VARCHAR(50),
    Product_no VARCHAR(50),
    Qty_order INT NOT NULL
);

CREATE TABLE emp_company (
    ENAME VARCHAR(255) NOT NULL ,
    CNAME VARCHAR(255) NOT NULL,
    SALARY DECIMAL(10,2) NOT NULL 
);


--1
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19001', 'P00001', 10);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19001', 'P00002', 3);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19002', 'P00001', 4);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19003', 'P00004', 2);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19004', 'P00003', 6);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19005', 'P00005', 2);
INSERT INTO Product (Detorder_no, Product_no, Qty_order) VALUES ('O19006', 'P00004', 7);

SELECT * FROM PRODUCT

--2
SELECT Product_no, SUM(Qty_order) AS Total_Quantity
FROM Product
GROUP BY Product_no;

--3
SELECT Product_no, SUM(Qty_order) AS Total_Quantity
FROM Product
WHERE Product_no IN ('P00001', 'P00004')
GROUP BY Product_no;

--T2_1

--1
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Anil', 'ACC', 1500);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Shankar', 'TATA', 2000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Sunil', 'WIPRO', 1800);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Jay', 'WIPRO', 1700);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Vijay', 'TATA', 5000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Prakash', 'TATA', 3000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Ajay', 'ACC', 8000);
INSERT INTO emp_company (ENAME, CNAME, SALARY) VALUES ('Abhay', 'ACC', 1800);

SELECT * FROM EMP_COMPANY

--2
SELECT CNAME, MAX(SALARY) AS Max_Salary
FROM emp_company
GROUP BY CNAME;


--3
SELECT CNAME, AVG(SALARY) AS Avg_Salary
FROM emp_company
GROUP BY CNAME;

--4
SELECT CNAME, AVG(SALARY) AS Avg_Salary
FROM emp_company
GROUP BY CNAME
HAVING AVG(SALARY) > 1500;

--5
SELECT CNAME, AVG(SALARY) AS Avg_Salary
FROM emp_company
WHERE CNAME != 'ACC'
GROUP BY CNAME;


--PRACTICAL-8

CREATE TABLE Salespeople (
    Snum NUMBER PRIMARY KEY,  -- Salesperson ID, primary key
    Sname VARCHAR2(100) NOT NULL,  -- Salesperson Name, not null constraint
    City VARCHAR2(100),  -- City, nullable field
    Comm NUMBER(5,2)  -- Commission rate, nullable field
);

CREATE TABLE Customers (
    Cnum NUMBER PRIMARY KEY,  -- Customer ID, Primary Key
    Cname VARCHAR2(100) NOT NULL,  -- Customer Name, Not Null
    City VARCHAR2(100),  -- City, Nullable
    Rating NUMBER DEFAULT 10,  -- Customer Rating, default value 10
    Snum NUMBER,  -- Salesperson ID, Foreign Key
    FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)  -- Foreign Key constraint
);

CREATE TABLE OrderTable (
    Order_no NUMBER PRIMARY KEY,  -- Order Number, Primary Key
    Amount NUMBER,  -- Order Amount, Nullable
    Odate DATE,  -- Order Date, Nullable
    Cnum NUMBER,  -- Customer ID, Foreign Key
    Snum NUMBER,  -- Salesperson ID, Foreign Key
    FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),  -- Foreign Key to Customers table
    FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)  -- Foreign Key to Salespeople table
);


CREATE TABLE Sales_order (
    Order_no VARCHAR2(10) PRIMARY KEY,  -- Order Number (Primary Key, must start with 'O')
    Order_date DATE,  -- Order Date (nullable)
    Client_no VARCHAR2(10),  -- Client Number (Foreign Key)
    Dely_addr VARCHAR2(200),  -- Delivery Address (nullable)
    Salesman_no VARCHAR2(10),  -- Salesman Number (Foreign Key)
    Dely_type CHAR(1) DEFAULT 'F',  -- Delivery Type (Default: 'F')
    Order_status VARCHAR2(20),  -- Order Status (nullable)
    
    -- Constraints
    CONSTRAINT chk_order_status CHECK (Order_status IN ('In Process', 'Fulfilled', 'Backorder', 'Cancelled')),  -- Valid Order Status values
    CONSTRAINT fk_client FOREIGN KEY (Client_no) REFERENCES Client_master(Client_no),  -- Foreign Key to Client_master
    CONSTRAINT fk_salesman FOREIGN KEY (Salesman_no) REFERENCES Salesman_master(Salesman_no)  -- Foreign Key to Salesman_master
);


CREATE TABLE Salesman_master (
    Salesman_no VARCHAR2(10) PRIMARY KEY,  -- Salesman Number, Primary Key, must start with 'S'
    Salesman_name VARCHAR2(100) NOT NULL,  -- Salesman Name, Not Null
    Address VARCHAR2(200),  -- Address (Nullable)
    City VARCHAR2(50),  -- City (Nullable)
    Pincode VARCHAR2(10),  -- Pincode (Nullable)
    State VARCHAR2(50),  -- State (Nullable)
    Sal_amt NUMBER NOT NULL CHECK (Sal_amt > 0),  -- Salary (Not Null, cannot be 0)
    Ytd_sales NUMBER NOT NULL CHECK (Ytd_sales > 0),  -- Year-to-date Sales (Not Null, cannot be 0)
    Tgt_sales NUMBER NOT NULL,  -- Target Sales (Not Null)
    CONSTRAINT chk_salesman_no CHECK (Salesman_no LIKE 'S%')  -- Salesman_no must start with 'S'
);

CREATE TABLE Client_master (
    Client_no VARCHAR2(10) PRIMARY KEY,  -- Client Number, Primary Key, must start with 'C'
    Name VARCHAR2(100) NOT NULL,  -- Client Name, Not Null
    Address VARCHAR2(200),  -- Address (Nullable)
    City VARCHAR2(50),  -- City (Nullable)
    State VARCHAR2(50),  -- State (Nullable)
    Pincode VARCHAR2(10),  -- Pincode (Nullable)
    Bal_due NUMBER CHECK (Bal_due >= 0)  -- Balance Due (Check constraint for non-negative value)
);

--Q-1
-- Insert data into Salespeople table
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (1, 'Name1', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (2, 'Name2', NULL, 10);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (3, 'Name3', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (4, 'Name4', NULL, 20);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (5, 'Name5', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (6, 'Name6', NULL, 30);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (7, 'Name7', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (8, 'Name8', NULL, 40);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (9, 'Name9', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (10, 'Name10', NULL, 50);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (11, 'Name11', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (12, 'Name12', NULL, 60);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (13, 'Name13', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (14, 'Name14', NULL, 70);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (15, 'Name15', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (16, 'Name16', NULL, 80);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (17, 'Name17', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (18, 'Name18', NULL, 90);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (19, 'Name19', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (20, 'Name20', NULL, 100);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (21, 'Name21', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (22, 'Name22', NULL, 110);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (23, 'Name23', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (24, 'Name24', NULL, 120);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (25, 'Name25', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (26, 'Name26', NULL, 130);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (27, 'Name27', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (28, 'Name28', NULL, 140);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (29, 'Name29', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (30, 'Name30', NULL, 150);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (31, 'Name31', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (32, 'Name32', NULL, 160);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (33, 'Name33', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (34, 'Name34', NULL, 170);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (35, 'Name35', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (36, 'Name36', NULL, 180);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (37, 'Name37', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (38, 'Name38', NULL, 190);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (39, 'Name39', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (40, 'Name40', NULL, 200);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (41, 'Name41', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (42, 'Name42', NULL, 210);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (43, 'Name43', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (44, 'Name44', NULL, 220);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (45, 'Name45', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (46, 'Name46', NULL, 230);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (47, 'Name47', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (48, 'Name48', NULL, 240);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (49, 'Name49', NULL, NULL);
INSERT INTO Salespeople (Snum, Sname, City, Comm) VALUES (50, 'Name50', NULL, 250);

SELECT * FROM SALESPEOPLE

-- Inserting data into Customers table
--2
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (1, 'Customer1', 'City1', 10, 1);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (2, 'Customer2', 'City2', 10, 2);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (3, 'Customer3', 'City3', 10, 3);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (4, 'Customer4', 'City4', 10, 4);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (5, 'Customer5', 'City5', 10, 5);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (6, 'Customer6', 'City6', 10, 6);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (7, 'Customer7', 'City7', 10, 7);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (8, 'Customer8', 'City8', 10, 8);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (9, 'Customer9', 'City9', 10, 9);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (10, 'Customer10', 'City10', 10, 10);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (11, 'Customer11', 'City11', 10, 11);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (12, 'Customer12', 'City12', 10, 12);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (13, 'Customer13', 'City13', 10, 13);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (14, 'Customer14', 'City14', 10, 14);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (15, 'Customer15', 'City15', 10, 15);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (16, 'Customer16', 'City16', 10, 16);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (17, 'Customer17', 'City17', 10, 17);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (18, 'Customer18', 'City18', 10, 18);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (19, 'Customer19', 'City19', 10, 19);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (20, 'Customer20', 'City20', 10, 20);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (21, 'Customer21', 'City21', 10, 21);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (22, 'Customer22', 'City22', 10, 22);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (23, 'Customer23', 'City23', 10, 23);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (24, 'Customer24', 'City24', 10, 24);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (25, 'Customer25', 'City25', 10, 25);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (26, 'Customer26', 'City26', 10, 26);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (27, 'Customer27', 'City27', 10, 27);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (28, 'Customer28', 'City28', 10, 28);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (29, 'Customer29', 'City29', 10, 29);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (30, 'Customer30', 'City30', 10, 30);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (31, 'Customer31', 'City31', 10, 31);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (32, 'Customer32', 'City32', 10, 32);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (33, 'Customer33', 'City33', 10, 33);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (34, 'Customer34', 'City34', 10, 34);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (35, 'Customer35', 'City35', 10, 35);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (36, 'Customer36', 'City36', 10, 36);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (37, 'Customer37', 'City37', 10, 37);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (38, 'Customer38', 'City38', 10, 38);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (39, 'Customer39', 'City39', 10, 39);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (40, 'Customer40', 'City40', 10, 40);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (41, 'Customer41', 'City41', 10, 41);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (42, 'Customer42', 'City42', 10, 42);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (43, 'Customer43', 'City43', 10, 43);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (44, 'Customer44', 'City44', 10, 44);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (45, 'Customer45', 'City45', 10, 45);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (46, 'Customer46', 'City46', 10, 46);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (47, 'Customer47', 'City47', 10, 47);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (48, 'Customer48', 'City48', 10, 48);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (49, 'Customer49', 'City49', 10, 49);
INSERT INTO Customers (Cnum, Cname, City, Rating, Snum) VALUES (50, 'Customer50', 'City50', 10, 50);

SELECT * FROM CUSTOMERS

---3
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (1, 500, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (2, 1500, TO_DATE('2025-02-02', 'YYYY-MM-DD'), 2, 2);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (3, 800, TO_DATE('2025-02-03', 'YYYY-MM-DD'), 3, 3);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (4, 1200, TO_DATE('2025-02-04', 'YYYY-MM-DD'), 4, 4);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (5, 600, TO_DATE('2025-02-05', 'YYYY-MM-DD'), 5, 5);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (6, 2500, TO_DATE('2025-02-06', 'YYYY-MM-DD'), 6, 6);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (7, 1000, TO_DATE('2025-02-07', 'YYYY-MM-DD'), 7, 7);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (8, 3000, TO_DATE('2025-02-08', 'YYYY-MM-DD'), 8, 8);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (9, 4000, TO_DATE('2025-02-09', 'YYYY-MM-DD'), 9, 9);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (10, 2000, TO_DATE('2025-02-10', 'YYYY-MM-DD'), 10, 10);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (11, 1100, TO_DATE('2025-02-11', 'YYYY-MM-DD'), 11, 11);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (12, 1300, TO_DATE('2025-02-12', 'YYYY-MM-DD'), 12, 12);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (13, 700, TO_DATE('2025-02-13', 'YYYY-MM-DD'), 13, 13);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (14, 1800, TO_DATE('2025-02-14', 'YYYY-MM-DD'), 14, 14);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (15, 2200, TO_DATE('2025-02-15', 'YYYY-MM-DD'), 15, 15);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (16, 2500, TO_DATE('2025-02-16', 'YYYY-MM-DD'), 16, 16);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (17, 950, TO_DATE('2025-02-17', 'YYYY-MM-DD'), 17, 17);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (18, 3000, TO_DATE('2025-02-18', 'YYYY-MM-DD'), 18, 18);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (19, 1500, TO_DATE('2025-02-19', 'YYYY-MM-DD'), 19, 19);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (20, 2000, TO_DATE('2025-02-20', 'YYYY-MM-DD'), 20, 20);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (21, 500, TO_DATE('2025-02-21', 'YYYY-MM-DD'), 21, 21);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (22, 1700, TO_DATE('2025-02-22', 'YYYY-MM-DD'), 22, 22);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (23, 900, TO_DATE('2025-02-23', 'YYYY-MM-DD'), 23, 23);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (24, 2800, TO_DATE('2025-02-24', 'YYYY-MM-DD'), 24, 24);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (25, 1200, TO_DATE('2025-02-25', 'YYYY-MM-DD'), 25, 25);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (26, 1600, TO_DATE('2025-02-26', 'YYYY-MM-DD'), 26, 26);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (27, 700, TO_DATE('2025-02-27', 'YYYY-MM-DD'), 27, 27);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (28, 2100, TO_DATE('2025-02-28', 'YYYY-MM-DD'), 28, 28);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (29, 1000, TO_DATE('2025-02-29', 'YYYY-MM-DD'), 29, 29);
INSERT INTO OrderTable (Order_no, Amount, Odate, Cnum, Snum) VALUES (30, 2500, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 30, 30);


SELECT * FROM ORDERTABLE

---
INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S001', 'John Doe', '123 Main St, New York', 'New York', '10001', 'NY', 50000, 250000, 300000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S002', 'Jane Smith', '456 Oak St, Los Angeles', 'Los Angeles', '90001', 'CA', 55000, 200000, 280000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S003', 'Alice Brown', '789 Pine St, Chicago', 'Chicago', '60001', 'IL', 60000, 220000, 270000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S004', 'Bob Green', '101 Maple Ave, Dallas', 'Dallas', '75201', 'TX', 52000, 210000, 290000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S005', 'Charlie White', '202 Birch Rd, Houston', 'Houston', '77001', 'TX', 53000, 230000, 310000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S006', 'David Blue', '303 Cedar St, Austin', 'Austin', '73301', 'TX', 54000, 240000, 320000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S007', 'Eva Black', '404 Pine Ave, Seattle', 'Seattle', '98101', 'WA', 55000, 250000, 330000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S008', 'Frank Yellow', '505 Oak St, Miami', 'Miami', '33101', 'FL', 56000, 260000, 340000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S009', 'Grace Red', '606 Maple Rd, Boston', 'Boston', '02101', 'MA', 57000, 270000, 350000);

INSERT INTO Salesman_master (Salesman_no, Salesman_name, Address, City, Pincode, State, Sal_amt, Ytd_sales, Tgt_sales) 
VALUES ('S010', 'Hank Silver', '707 Elm St, San Francisco', 'San Francisco', '94105', 'CA', 58000, 280000, 360000);

SELECT * FROM Salesman_master

---
-- Insert 10 records into the Client_master table with all required fields
INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C001', 'Tech Innovations Inc.', '101 Tech Ave, San Francisco', 'California', '94105', '94105', 15000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C002', 'Green Valley Ltd.', '202 Green Rd, Portland', 'Oregon', '97201', '97201', 5000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C003', 'Solar Solutions', '303 Sun St, Miami', 'Florida', '33101', '33101', 2000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C004', 'Bright Future Co.', '404 Shine St, Chicago', 'Illinois', '60601', '60601', 30000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C005', 'Global Ventures', '505 Horizon Blvd, Dallas', 'Texas', '75201', '75201', 40000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C006', 'Elite Enterprises', '606 Sky Rd, New York', 'New York', '10001', '10001', 25000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C007', 'Future Technologies', '707 Galaxy St, Seattle', 'Washington', '98101', '98101', 35000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C008', 'Advanced Systems', '808 Tech Park, Houston', 'Texas', '77001', '77001', 45000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C009', 'Visionary Solutions', '909 Innovation Rd, Boston', 'Massachusetts', '02101', '02101', 5000);

INSERT INTO Client_master (Client_no, Name, Address, City, State, Pincode, Bal_due) 
VALUES ('C010', 'NextGen Enterprises', '1010 Green Way, Miami', 'Florida', '33101', '33101', 60000);


SELECT * FROM CLIENT_MASTER


-- Inserting data into the Sales_order table
INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O001', TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'C001', '101 Tech Ave, San Francisco, CA 94105', 'S001', 'F', 'In Process');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O002', TO_DATE('2025-02-02', 'YYYY-MM-DD'), 'C002', '202 Green Rd, Portland, OR 97201', 'S002', 'F', 'Fulfilled');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O003', TO_DATE('2025-02-03', 'YYYY-MM-DD'), 'C003', '303 Sun St, Miami, FL 33101', 'S003', 'F', 'Backorder');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O004', TO_DATE('2025-02-04', 'YYYY-MM-DD'), 'C004', '404 Shine St, Chicago, IL 60601', 'S004', 'F', 'Cancelled');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O005', TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'C005', '505 Horizon Blvd, Dallas, TX 75201', 'S005', 'F', 'In Process');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O006', TO_DATE('2025-02-06', 'YYYY-MM-DD'), 'C006', '606 Sky Rd, New York, NY 10001', 'S006', 'F', 'Fulfilled');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O007', TO_DATE('2025-02-07', 'YYYY-MM-DD'), 'C007', '707 Galaxy St, Seattle, WA 98101', 'S007', 'F', 'Backorder');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O008', TO_DATE('2025-02-08', 'YYYY-MM-DD'), 'C008', '808 Tech Park, Houston, TX 77001', 'S008', 'F', 'In Process');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O009', TO_DATE('2025-02-09', 'YYYY-MM-DD'), 'C009', '909 Innovation Rd, Boston, MA 02101', 'S009', 'F', 'Cancelled');

INSERT INTO Sales_order (Order_no, Order_date, Client_no, Dely_addr, Salesman_no, Dely_type, Order_status)
VALUES ('O010', TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'C010', '1010 Green Way, Miami, FL 33101', 'S010', 'F', 'Fulfilled');


SELECT * FROM SALES_ORDER




--PRACTICAL 9


-- Create Sales People Table with unique name
-- Create Salesperson Table
CREATE TABLE SALES_PEOPLE2 (
    SALESPERSON_ID INT PRIMARY KEY,         -- Unique salesperson ID
    SNAME VARCHAR(100),                     -- Salesperson name
    CITY VARCHAR(100),                      -- City
    COMMISION_RATE DECIMAL(5, 2)            -- Commission rate
);

-- Create Customer Table
CREATE TABLE CUSTOMER2 (
    CUSTOMER2_ID INT PRIMARY KEY,           -- Unique identifier for the customer
    CUSTOMER2_NAME VARCHAR(100) NOT NULL,   -- Customer name, can't be null
    CITY VARCHAR(100),                      -- City (Nullable)
    RATING DECIMAL(3, 2) DEFAULT 5.00,      -- Customer rating (Default: 5.00)
    SALESPERSON2_ID INT,                    -- Foreign key for Salesperson managing the customer
    FOREIGN KEY (SALESPERSON2_ID) REFERENCES SALES_PEOPLE2(SALESPERSON_ID)  -- Link to Salesperson table
);

-- Create Order Table
CREATE TABLE ORDER2 (
    ORDER2_ID INT PRIMARY KEY,              -- Unique order ID
    ORDER2_AMOUNT DECIMAL(10, 2),           -- Order amount (can be a decimal)
    ORDER2_DATE DATE,                       -- Date of the order
    CUSTOMER2_ID INT,                       -- Foreign key linking to Customer table
    SALESPERSON2_ID INT,                    -- Foreign key linking to Salesperson table
    FOREIGN KEY (CUSTOMER2_ID) REFERENCES CUSTOMER2(CUSTOMER2_ID),  -- Link to Customer2 table
    FOREIGN KEY (SALESPERSON2_ID) REFERENCES SALES_PEOPLE2(SALESPERSON_ID)  -- Link to Salesperson table
);

-- Insert records into SALES_PEOPLE2 table
INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1001, 'Peel', 'London', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1002, 'Serrs', 'San Jose', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1003, 'Motika', 'London', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1004, 'Rifkin', 'Barcelona', 0.12);

INSERT INTO SALES_PEOPLE2 (SALESPERSON_ID, SNAME, CITY, COMMISION_RATE) 
VALUES (1005, 'Axeload', 'New York', 0.12);

SELECT * FROM SALES_PEOPLE2

-- Insert records into CUSTOMER2 table
INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2001, 'Hoffman', 'London', 100.00, 1001);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2002, 'Giovanne', 'Rome', 200.00, 1003);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2003, 'Liu', 'San Jose', 300.00, 1002);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2004, 'Grass', 'Berlin', 100.00, 1002);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2006, 'Clemes', 'London', 300.00, 1007);

INSERT INTO CUSTOMER2 (CUSTOMER2_ID, CUSTOMER2_NAME, CITY, RATING, SALESPERSON2_ID) 
VALUES (2007, 'Pereira', 'Rome', 100.00, 1004);

SELECT * FROM CUSTOMER2

-- Insert records into ORDER2 table
INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3001, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 18.96, 2002, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3003, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 767.19, 2001, 1001);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3002, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 1900.10, 2007, 1003);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3005, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 5160.45, 2003, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3006, TO_DATE('1994-03-10', 'YYYY-MM-DD'), 1098.16, 2008, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3009, TO_DATE('1994-04-10', 'YYYY-MM-DD'), 1713.23, 2002, 1003);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3007, TO_DATE('1994-04-10', 'YYYY-MM-DD'), 75.75, 2004, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3008, TO_DATE('1994-05-10', 'YYYY-MM-DD'), 4723.95, 2006, 1001);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3010, TO_DATE('1994-06-10', 'YYYY-MM-DD'), 1309.95, 2004, 1002);

INSERT INTO ORDER2 (ORDER2_ID, ORDER2_DATE, ORDER2_AMOUNT, CUSTOMER2_ID, SALESPERSON2_ID) 
VALUES (3011, TO_DATE('1994-06-10', 'YYYY-MM-DD'), 9891.00, 2006, 1001);

SELECT* FROM ORDER2
-- Queries
-- 1. List customers handled by 'Peel' and 'Motika'
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME
FROM CUSTOMER2 c
JOIN SALES_PEOPLE2 s ON c.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE s.SNAME IN ('Peel', 'Motika');

-- 2. List orders with amounts greater than 0
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, c.CUSTOMER2_NAME, s.SNAME
FROM ORDER2 o
JOIN CUSTOMER2 c ON o.CUSTOMER2_ID = c.CUSTOMER2_ID
JOIN SALES_PEOPLE2 s ON o.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE o.ORDER2_AMOUNT > 0;

-- 3. Orders with amount > 3000, sorted in descending order
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, s.SNAME
FROM ORDER2 o
JOIN SALES_PEOPLE2 s ON o.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE o.ORDER2_AMOUNT > 3000
ORDER BY o.ORDER2_AMOUNT DESC;

-- 4. List salesperson names with customer names and cities
SELECT s.SNAME AS SALESPERSON_NAME, c.CUSTOMER2_NAME, c.CITY
FROM SALES_PEOPLE2 s
JOIN CUSTOMER2 c ON s.CITY = c.CITY
WHERE s.CITY IS NOT NULL AND c.CITY IS NOT NULL;

-- 5. List all orders with customer names
SELECT o.ORDER2_ID, o.ORDER2_AMOUNT, o.ORDER2_DATE, c.CUSTOMER2_NAME
FROM ORDER2 o
JOIN CUSTOMER2 c ON o.CUSTOMER2_ID = c.CUSTOMER2_ID;

-- 6. Customers managed by salespeople with commission rate > 0.12
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME, c.CITY, s.SNAME
FROM CUSTOMER2 c
JOIN SALES_PEOPLE2 s ON c.SALESPERSON2_ID = s.SALESPERSON_ID
WHERE s.COMMISION_RATE > 0.12;

-- 7. Customers with same rating as 'Hoffman'
SELECT c.CUSTOMER2_ID, c.CUSTOMER2_NAME, c.RATING
FROM CUSTOMER2 c
JOIN CUSTOMER2 h ON h.CUSTOMER2_NAME = 'Hoffman'
WHERE c.RATING = h.RATING;

-- 8. Count customers with rating higher than average in 'San Jose'
SELECT COUNT(*) AS NUM_CUSTOMERS
FROM CUSTOMER2 c
WHERE c.RATING > (
    SELECT AVG(RATING)
    FROM CUSTOMER2
    WHERE CITY = 'San Jose'
);

-- 9. Salesperson names with total order amount greater than max order amount
SELECT s.SNAME
FROM SALES_PEOPLE2 s
JOIN ORDER2 o ON s.SALESPERSON_ID = o.SALESPERSON2_ID
GROUP BY s.SNAME
HAVING SUM(o.ORDER2_AMOUNT) > (SELECT MAX(ORDER2_AMOUNT) FROM ORDER2);

-- 10. Classify customer ratings as High or Low
SELECT c.CUSTOMER2_NAME, c.RATING,
       CASE
           WHEN c.RATING >= 400 THEN 'High Rating'
           ELSE 'Low Rating'
       END AS RATING_CATEGORY
FROM CUSTOMER2 c;



--practical 10

--1_1
DECLARE 

NUM1  NUMBER;
NUM2 NUMBER;
TOTAL NUMBER;

BEGIN

NUM1:= &NUM1;
NUM2:= &NUM2;
TOTAL:= NUM1 * NUM2;

DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF THE NUM1 AND NUM2 IS :' ||TOTAL);
END;

--1_2
CREATE OR REPLACE PROCEDURE mupltipiction(num1 IN NUMBER , num2 IN NUMBER)
AS 
BEGIN
dbms_output.put_line('THE PRODUCT OF THE NUM1 AND NUM2 IS :' || NUM1 * NUM2);

END;

DECLARE 
INP_1 NUMBER := &INP_1;
INP_2 NUMBER := &INP_2;
BEGIN
mupltipiction(INP_1,INP_2);
END;


--
--T_2
DECLARE 

NUM1  NUMBER;
NUM2 NUMBER;
TOTAL NUMBER;

BEGIN

NUM1:= 15;
NUM2:= 0;
TOTAL:= NUM1 * NUM2;

DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF THE NUM1 AND NUM2 IS :' ||TOTAL);
END;


--
--T_2_1
DECLARE 

NUM1  NUMBER;
NUM2 NUMBER;
TOTAL NUMBER;

BEGIN

NUM1:= &NUM1;
NUM2:= &NUM2;
TOTAL:= NUM1 * NUM2;

DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF THE NUM1 AND NUM2 IS :' ||TOTAL);
END;

--
--T_3_1
DECLARE 

NUM1  NUMBER;
NUM2 NUMBER;
TOTAL NUMBER;

BEGIN

NUM1:= -4.2;
NUM2:= -6.3;
TOTAL:= NUM1 * NUM2;

DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF THE NUM1 AND NUM2 IS :' ||TOTAL);
END;

--
--T_3_2
CREATE OR REPLACE PROCEDURE mupltipiction(num1 IN NUMBER , num2 IN NUMBER)
AS 
BEGIN
dbms_output.put_line('THE PRODUCT OF THE NUM1 AND NUM2 IS :' || NUM1 * NUM2);

END;

DECLARE 
INP_1 NUMBER := &INP_1;
INP_2 NUMBER := &INP_2;
BEGIN
mupltipiction(INP_1,INP_2);
END;

--T_4

DECLARE 
  NUM1  NUMBER;
  NUM2 NUMBER;
  TOTAL NUMBER;
BEGIN
  -- Example: Multiplying a positive and negative number
  NUM1 := 7;
  NUM2 := -3;
  TOTAL := NUM1 * NUM2;

  -- Output the product
  DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF NUM1 AND NUM2 IS: ' || TOTAL);

  -- Additional output for validation
  IF TOTAL < 0 THEN
    DBMS_OUTPUT.PUT_LINE('STAT: The result is negative, as expected.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('STAT: The result is not negative, which is unexpected.');
  END IF;
END;


--
CREATE OR REPLACE PROCEDURE mupltipiction(num1 IN NUMBER, num2 IN NUMBER)
AS 
BEGIN
  -- Output the product
  DBMS_OUTPUT.PUT_LINE('THE PRODUCT OF NUM1 AND NUM2 IS: ' || num1 * num2);
  
  -- Additional output for validation (checking if the result is negative)
  IF (num1 * num2) < 0 THEN
    DBMS_OUTPUT.PUT_LINE('STAT: The result is negative, as expected.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('STAT: The result is not negative, which is unexpected.');
  END IF;
END;


DECLARE 
  INP_1 NUMBER := &INP_1;  -- Input for the first number
  INP_2 NUMBER := &INP_2;  -- Input for the second number
BEGIN
  -- Call the procedure to calculate the product
  mupltipiction(INP_1, INP_2);
END;


--EXTRA



SELECT * FROM EMPLOYEE

DECLARE 
    EMP_ID NUMBER;             -- Declare variable for Employee ID
    EMP_NAME VARCHAR(50);       -- Declare variable for Employee Name
    EMP_SAL NUMBER;            -- Declare variable for Employee Salary
    JOB_ID VARCHAR(30);        -- Declare variable for Job ID
    PHONE VARCHAR(30);  
 BEGIN
    EMP_ID := 12;             -- Assign value to EMP_ID
    EMP_NAME := 'BANTI';      -- Correctly assign value to EMP_NAME (with quotes)
    EMP_SAL := 43222;         -- Assign value to EMP_SAL
    JOB_ID := '58';           -- Assign value to JOB_ID
    PHONE := '1234567890';   -- Assign value to PHONE

    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME :' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY: ' || EMP_SAL);

    -- Insert into EMPLOYEE table
    INSERT INTO EMPLOYEE (
        DEPT_NO, 
        EMP_ID, 
        EMP_NAME, 
        EMP_SAL, 
        JOB_ID, 
        PHONE
    ) VALUES (
        10,              -- Static department number (replace with actual value)
        EMP_ID,          -- EMP_ID (user input)
        EMP_NAME,        -- EMP_NAME (user input)
        EMP_SAL,         -- EMP_SAL (user input)
        JOB_ID,          -- JOB_ID (user input)
        PHONE            -- PHONE (user input)
    );

    -- Query the EMPLOYEE table using correct condition
    SELECT EMP_NAME, EMP_SAL INTO EMP_NAME, EMP_SAL
    FROM EMPLOYEE 
    WHERE EMP_ID = EMP_ID;  -- Use the correct identifier here

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END;


