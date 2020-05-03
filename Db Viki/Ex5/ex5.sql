	
REM 1. Check whether the given pizza type is available. If not display appropriate message.

SET SERVEROUTPUT ON;
REM pan

DECLARE
	pizzatype Pizza.pizza_type%TYPE;
	
BEGIN
	pizzatype:='&pizzatype';
	UPDATE Pizza 
	SET pizza_type=pizza_type
	WHERE pizza_type=pizzatype;
	
	IF SQL%FOUND THEN
		dbms_output.put_line('Pizza Available');
	ELSE	
		dbms_output.put_line('Pizza Not Available');
	END IF;
END;
/



REM 2. For the given customer name and a range of order date, find whether a customer had
REM placed any order, if so display the number of orders placed by the customer along
REM with the order number(s).

SET SERVEROUTPUT ON;

REM Hari
REM 25-JUN-2015
REM 30-JUN-2015	

DECLARE
	name Customer.cust_name%TYPE;
	start_date DATE;	
	end_date DATE;
	orderno Orders.order_no%TYPE;
	
	CURSOR c1 IS 
	SELECT o.order_no
	FROM Customer c,Orders o
	WHERE c.cust_name=name AND
		c.cust_id=o.cust_id AND	
		o.order_date BETWEEN start_date AND end_date;
		
BEGIN
	name:='&name';
	start_date:='&start_date';
	end_date:='&end_date';
	
	dbms_output.put_line('Customer name :'||name);
	
	OPEN c1;
	
	FETCH c1 INTO orderno;
	
	IF c1%NOTFOUND THEN
		dbms_output.put_line('Not placed any orders in the given period');
	ELSE
		dbms_output.put_line('Orders : ');
		WHILE  c1%FOUND LOOP
			dbms_output.put_line(orderno);
			FETCH c1 INTO orderno;
		END LOOP;
		dbms_output.put_line('Number of Orders : '||c1%ROWCOUNT);
	END IF;
	CLOSE c1;
END;
/




REM 3. Display the customer name along with the details of pizza type and its quantity
REM ordered for the given order number. Also find the total quantity ordered for the given
REM order number as shown below:


SET SERVEROUTPUT ON;

REM OP100

DECLARE
	name Customer.cust_name%TYPE;
	pizzatype Pizza.pizza_type%TYPE;
	quantity Order_List.qty%TYPE;
	numbers number(10);
	orderno orders.order_no%TYPE;
	
	CURSOR c1 IS
	SELECT c.cust_name
	FROM Customer c,Orders o
	WHERE o.order_no=orderno AND
		o.cust_id=c.cust_id;
		
	CURSOR c2 IS
	SELECT p.pizza_type,o.qty
	FROM Pizza p, Order_List o
	WHERE o.order_no=orderno AND
		p.pizza_id=o.pizza_id;
		
BEGIN
	orderno:='&orderno';
	numbers:=0;
	
	OPEN c1;
	OPEN c2;
	
	FETCH c1 INTO name;
	FETCH c2 INTO pizzatype,quantity;
	
	IF c1%NOTFOUND THEN	
		dbms_output.put_line('Wrong order number');
	ELSE
		dbms_output.put_line('Customer Name : '||name);
		dbms_output.put_line(RPAD('Pizza Type', 15)||RPAD('Qty.', 5));
		WHILE c2%FOUND LOOP
			dbms_output.put_line(RPAD(pizzatype,15)||RPAD(quantity,5));
			numbers:=numbers+quantity;
			FETCH c1 INTO name;
			FETCH c2 INTO pizzatype,quantity;
		END LOOP;
		dbms_output.put_line('---------------------------');
		dbms_output.put_line('Total Qty : '||numbers);
	END IF;
	CLOSE c1;
	CLOSE c2;
END;
/

	
	

REM 4. Display the total number of orders that contains one pizza type, two pizza type and so on.

SET SERVEROUTPUT ON;

DECLARE
	ptype_count number(10);
	max_types number(10);
	counter number(10);
	orderno Orders.order_no%TYPE;
	
	CURSOR c1 IS
	SELECT COUNT(DISTINCT pizza_type)
	FROM Pizza;
	
	CURSOR c2 IS
	SELECT order_no
	FROM Order_List
	GROUP BY order_no
	HAVING COUNT(order_no)=counter;
	
BEGIN	
	counter:=0;
	
	OPEN c1;
	
	FETCH c1 INTO max_types;
	
	IF max_types=0 THEN 
		dbms_output.put_line('pizza table empty');
	ELSE	
		DBMS_OUTPUT.PUT_LINE('Number of Orders that contain: ');
        FOR COUNT IN 1 .. max_types LOOP
			ptype_count:=0;
			counter:=counter+1;
			OPEN c2;
			FETCH c2 INTO orderno;
			WHILE c2%FOUND LOOP	
				ptype_count:=ptype_count+1;
				FETCH c2 INTO orderno;
			END LOOP;
			CLOSE c2;
			dbms_output.put_line(counter||' Pizza Type    '||ptype_count);
		END LOOP;
	END IF;
	CLOSE c1;
END;
/
	