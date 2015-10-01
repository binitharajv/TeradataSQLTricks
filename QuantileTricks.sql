/*
	QUANTILE is a useful function in Teradata, it divids a range into
	several pieces, and return the value at that point.
	
	Sometimes, we only want to apply it in a part of one column. For this 
	example, we put -1 for any value less or equal 5, and only apply quantile 
	to values above 5. But the result is not expected.
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
