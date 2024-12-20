CREATE TABLE Job(
        job_id VARCHAR2(15) NOT NULL UNIQUE,
        job_title VARCHAR2(30) NOT NULL,
        min_sal NUMBER(7,2) NOT NULL,
        max_sal NUMBER(7,2) NOT NULL
        );
CREATE TABLE Employee(
        emp_no NUMBER(3) NOT NULL UNIQUE,
        emp_name VARCHAR2(30) NOT NULL,
        emp_sal NUMBER(8,2) NOT NULL,
        emp_comm NUMBER(6,1),
        dept_no   NUMBER(3) NOT NULL
        );
create table Deposit(
    a_no VARCHAR2(5) NOT NULL UNIQUE,
    cname VARCHAR2(15)  NOT NULL UNIQUE,
    bname VARCHAR(10) NOT NULL UNIQUE,
    amount NUMBER(7,2) NOT NULL,
    a_date DATE NOT NULL
    );
CREATE TABLE Borrow(
    loanno  varchar2(5) NOT NULL UNIQUE,
    cname varchar(15) NOT NULL,
    bname VARCHAR(10) NOT NULL,
    amount NUMBER(7,2) NOT NULL
    );
    
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(101,'Smith',800,455,20);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(102,'Snehal',1600,0,25);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(103,'Adama',1100,425,20);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(104,'Aman',3000,null,15);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(105,'Anita',5000,50000,10);
INSERT INTO Employee(emp_no,emp_name,emp_sal,emp_comm,dept_no) VALUES(106,'Anamika',2975,null,30);
select * from Employee