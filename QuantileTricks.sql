CREATE   TABLE quan_test (
	num INTEGER
) ;

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
