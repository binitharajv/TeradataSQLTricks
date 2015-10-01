/*
	QUANTILE - Computes the quantile scores for the values in a group.

	In some cases, we only want to calcualte the quantile for certain values, not for
	all values. We may use CASE END to split all values. 
	
	For this example, we only want to calcuate quantile for value above 5, and if LE. 4, we
	assign a -1. Check the query 1, it looks correct, but returned a wrong result. 
	
*/

CREATE   TABLE quan_test (
	num INTEGER
) PRIMARY INDEX (num);

INSERT INTO c4ustcrm.quan_test (num) VALUES (0);
INSERT INTO c4ustcrm.quan_test (num) VALUES (1);
INSERT INTO c4ustcrm.quan_test (num) VALUES (2);
INSERT INTO c4ustcrm.quan_test (num) VALUES (3);
INSERT INTO c4ustcrm.quan_test (num) VALUES (4);
INSERT INTO c4ustcrm.quan_test (num) VALUES (5);
INSERT INTO c4ustcrm.quan_test (num) VALUES (6);
INSERT INTO c4ustcrm.quan_test (num) VALUES (7);
INSERT INTO c4ustcrm.quan_test (num) VALUES (8);
INSERT INTO c4ustcrm.quan_test (num) VALUES (9);
INSERT INTO c4ustcrm.quan_test (num) VALUES (10);

/* Query 1
*/
SELECT 
num, 
CASE	
	WHEN num <=5 THEN -1
	ELSE QUANTILE(5, num) + 1
END AS p
FROM quan_test;

/*
0	-1
1	-1
2	-1
3	-1
4	-1
5	-1
6	3
7	4
8	4
9	5
10	5
*/

/* Query 2 - The correct one
*/
SELECT
	num,
	-1 AS p
	FROM 
		quan_test
	WHERE 
		num <= 5
UNION ALL
SELECT
	num,
	QUANTILE(5, num) + 1 AS p
	FROM
		quan_test
	WHERE
		num > 5;
		
/*
0	-1
1	-1
2	-1
3	-1
4	-1
5	-1
6	1
7	2
8	3
9	4
10	5
*/
