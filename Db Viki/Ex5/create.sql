REM PL/SQL – Control Structures

REM Drop Table

DROP TABLE Order_List;
DROP TABLE Orders;
DROP TABLE Pizza;
DROP TABLE Customer;

REM Create Table

CREATE TABLE Customer(
	cust_id varchar2(10) CONSTRAINT cust_pk PRIMARY KEY,
	cust_name varchar2(10),
	address varchar2(40),
	phone number(10));
	
	
CREATE TABLE Pizza(
	pizza_id varchar2(10) CONSTRAINT pizza_pk PRIMARY KEY,
	pizza_type varchar2(15),
	unit_price number(10));


CREATE TABLE Orders(
	order_no varchar2(10) CONSTRAINT order_pk PRIMARY KEY,
	cust_id varchar2(10),
	order_date date,
	delv_date date,
	CONSTRAINT cust_fk FOREIGN KEY(cust_id) REFERENCES Customer(cust_id));
	

CREATE TABLE Order_List(
	order_no varchar2(10) CONSTRAINT order_fk REFERENCES Orders(order_no),
	pizza_id varchar2(10) CONSTRAINT pizza_fk REFERENCES Pizza(pizza_id),
	qty number(10),
	CONSTRAINT order_list_pk PRIMARY KEY(order_no,pizza_id));
	