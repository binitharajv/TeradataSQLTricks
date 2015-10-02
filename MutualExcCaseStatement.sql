/*
	The CASE END statement doesn't go through all When..Then.. pairs, 
	it matches the first one and then move to next record
	
	Here is an example to show this,
	- Make sure the When .. Then .. (s) are mutual exclusion
	- Beware of the order in Case .. End statement
*/

CREATE TABLE zd_test2 
(	s VARCHAR(100)
) PRIMARY INDEX (s);

INSERT INTO zd_test2 VALUES ('bigapple');
INSERT INTO zd_test2 VALUES ('bigapple1');
INSERT INTO zd_test2 VALUES ('bigapple3');

SELECT
		s
	,	CASE
			WHEN s LIKE 'big%' 	THEN 'Bigapple'
			WHEN s LIKE '%3'	THEN '3'
			ELSE
				'other'
		END AS _type
	FROM zd_test2;
/*
bigapple3	Bigapple
bigapple	Bigapple
bigapple1	Bigapple
*/


SELECT
		s
	,	CASE
			WHEN s LIKE '%3'	THEN '3'	
			WHEN s LIKE 'big%' 	THEN 'Bigapple'

			ELSE
				'other'
		END AS _type
	FROM zd_test2;	
/*	
bigapple3	3
bigapple	Bigapple
bigapple1	Bigapple
*/
