/*
	Use Where or And when multiple conditions in JOIN
	When use inner join, there is no different to put the condition 
	after Where or And. But if it is a left join, need to think about
	the logic carefully.
	
	Query 1 missed Eric in the result
	Query 2 is correct
*/


/* Create Dummpy tables */

CREATE TABLE tab1  
(
		cust_id 	INTEGER
	,	cust_name 	VARCHAR(30)
) PRIMARY INDEX (cust_id);

CREATE TABLE tab2  
(
		tran_id 	INTEGER
	,	cust_id 	INTEGER
	,	tran_code 	INTEGER
	,	tran_date	DATE
	,	tran_value	DEC(11,2)
) PRIMARY INDEX (tran_id);

INSERT INTO tab1 (cust_id, cust_name) VALUES (1,'James');
INSERT INTO tab1 (cust_id, cust_name) VALUES (2,'Tom');
INSERT INTO tab1 (cust_id, cust_name) VALUES (3,'Eric');


INSERT INTO tab2 VALUES (1, 1, 123, CURRENT_DATE, 12.4);
INSERT INTO tab2 VALUES (2, 2, 123, CURRENT_DATE, 15.7);
INSERT INTO tab2 VALUES (3, 3, 678, CURRENT_DATE, 19.4);


/*
	To extract all 123 transactions, for every customer
*/


/* 	Query 1
*/
SELECT
		t1.cust_name
	,	t2.tran_date
	,	t2.tran_code
	,	t2.tran_value
	FROM
		tab1 t1
	LEFT JOIN
		tab2 t2
	ON
		t1.cust_id = t2.cust_id
	WHERE
		t2.tran_code = 123;

/*
	James	2/10/2015	123	12.40
	Tom	2/10/2015	123	15.70
*/


/* 	Query 2
*/
SELECT
		t1.cust_name
	,	t2.tran_date
	,	t2.tran_code
	,	t2.tran_value
	FROM
		tab1 t1
	LEFT JOIN
		tab2 t2
	ON
		t1.cust_id = t2.cust_id
	AND
		t2.tran_code = 123;
		
/*
	Eric			
	James	2/10/2015	123	12.40
	Tom	2/10/2015	123	15.70
*/
