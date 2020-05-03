REM Ex6
REM PL/SQL – Stored Procedures & Stored Functions

REM 1. Write a stored function to display the total number of pizza ordered by the given
REM order number

SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION Total_Pizza
(orderno IN Order_List.order_no%TYPE) RETURN int IS
n int;
BEGIN	
	SELECT SUM(qty) INTO n 
	FROM Order_List 
	Where order_no=orderno;
	RETURN n;
END;
/

SELECT DISTINCT order_no,Total_Pizza(order_no) AS "Total pizza" 
FROM Order_List
ORDER BY order_no;




REM 2. Write a PL/SQL block to calculate the total amount, discount and billable amount
REM (Amount to be paid) as given below:
REM For total amount > 2000 and total amount < 5000: Discount=5%
REM For total amount > 5000 and total amount < 10000: Discount=10%
REM For total amount > 10000: Discount=20%
REM Calculate the billable amount (after the discount) and update the same in orders
REM table.
REM Bill Amount = Total – Discount.

ALTER TABLE Orders
ADD total_amt number(10);

ALTER TABLE Orders
ADD discount number(10,2);

ALTER TABLE Orders
ADD bill_amt number(10,2);

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE billing
(orderno IN Orders.order_no%TYPE) IS
	tot int;
	dis real;
	bill real;
	CURSOR total IS
	SELECT SUM(qty*unit_price)
	FROM Order_List NATURAL JOIN Pizza
	WHERE Order_no=orderno;
BEGIN 
	tot:=0;

	OPEN total;
	FETCH total INTO tot;	

	WHILE total%FOUND LOOP
		IF tot > 10000 THEN 
			dis:=0.2;
		ELSIF tot > 5000 THEN
			dis:=0.1;
		ELSIF tot > 2000 THEN 
			dis:=0.05;
		ELSE 
			dis:=0;
		End IF;
		
		bill:=tot-(tot*dis);
		UPDATE Orders
		SET total_amt=tot,discount=dis,bill_amt=bill
		WHERE Order_no=orderno;
		FETCH total INTO tot;
		
	END LOOP;
	CLOSE total;
END;
/
	
	
DECLARE
	orderno Orders.order_no%TYPE;
	
	CURSOR pickorder IS
	SELECT order_no
	FROM Orders;
	
BEGIN
	OPEN pickorder;
	
	FETCH pickorder INTO orderno;
	
	WHILE pickorder%FOUND LOOP	
		billing(orderno);
		FETCH pickorder INTO orderno;
	END LOOP;
	CLOSE pickorder;
END;
/

SELECT * FROM Orders;
	

REM 3. For the given order number, write a PL/SQL block to print the order as shown below:
REM Hint: Use the PL/SQL blocks created in 1 and 2.

SET SERVEROUTPUT ON;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE bill
(orderno IN Orders.order_no%TYPE) IS 

	cust_rec customer%rowtype;
	CURSOR detail IS
	SELECT pizza_type,qty,unit_price,qty*unit_price
	FROM pizza NATURAL JOIN order_list 
	WHERE order_no=orderno;
		
	str varchar2(20);
	a int;
	b int;
	c real;
	i int;
	d real;
	x date;
BEGIN
	SELECT cust_id,cust_name,address,phone INTO cust_rec FROM customer natural join orders WHERE order_no=orderno;
	SELECT order_date INTO x FROM orders WHERE order_no=orderno;
	dbms_output.put_line('**************************************************************');
	dbms_output.put_line('Order Number: '||orderno||chr(9)||chr(9)||'Customer Name:'||cust_rec.cust_name);
	dbms_output.put_line('Order Date:'||x||chr(9)||chr(9)||'Phone: '||cust_rec.phone);
	dbms_output.put_line('**************************************************************');
	OPEN detail;
	FETCH detail INTO str,a,b,c;
	i:=1;
	dbms_output.put_line('SNo'||chr(9)||'Pizza Type'||chr(9)||'Qty'||chr(9)||'Price'||chr(9)||'Amount');
	WHILE detail%FOUND LOOP
		dbms_output.put_line(i||'.'||chr(9)||str||chr(9)||chr(9)||a||chr(9)||b||chr(9)||c);   
		i:=i+1;
		FETCH detail INTO str,a,b,c;
	END LOOP;   
	CLOSE detail;
	dbms_output.put_line('----------------------------------------------------------');
	SELECT Total_Pizza(order_no) INTO a FROM orders WHERE order_no = orderno;
	billing(orderno);
	SELECT total_amt,discount,bill_amt INTO b,c,d FROM orders WHERE order_no=orderno;
	dbms_output.put_line(chr(9)||'Total = '||chr(9)||a||chr(9)||chr(9)||b);
	dbms_output.put_line('----------------------------------------------------------');
	dbms_output.put_line('Total Amount '||chr(9)||chr(9)||':Rs.'||b);
	dbms_output.put_line('Discount ('||c||'%)'||chr(9)||chr(9)||':Rs.'||b*c);
	dbms_output.put_line('------------------------------------');
	dbms_output.put_line('Amount to be paid'||chr(9)||':Rs.'||d);
	dbms_output.put_line('------------------------------------');
	dbms_output.put_line('Great Offers! Discount up to 25% on DIWALI Festival Day...');
	dbms_output.put_line('**************************************************************');
END;
/

DECLARE
	orderno VARCHAR2(10);
BEGIN
	orderno:='&order_number';
	SELECT order_no INTO orderno FROM ORDERS WHERE order_no=orderno;
	IF sql%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Order Number');
	ELSE
		bill(orderno);
	END IF;
END;
/



