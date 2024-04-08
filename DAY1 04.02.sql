SELECT * FROM dual;

SELECT LENGTH('ab') FROM dual;

CREATE TABLE ex2_2(
	COLUMN1	VARCHAR2(3),
	COLUMN2	VARCHAR2(3 byte),
	COLUMN3	VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

SELECT * FROM ex2_2;

SELECT COLUMN1, LENGTH(COLUMN1) AS len1,
		COLUMN2, LENGTH(COLUMN2) AS len2,
		COLUMN3, LENGTH(COLUMN3) AS len3 
	FROM EX2_2;

--INSERT INTO ex2_2 VALUES ('홍길동', '홍길동', '홍길동');

INSERT INTO ex2_2 (COLUMN3) VALUES ('홍길동');

SELECT column3, LENGTH (column3) AS len3, LENGTHB(column3) AS bytelen
FROM ex2_2;

CREATE TABLE ex2_3(
	col_int integer,
	col_dec decimal,
	col_num NUMBER
	);
	
SELECT column_id, column_name, data_type, data_length
	FROM USER_TAB_COLS 
	WHERE table_name = 'EX2_3'		-- '' 안에 있는 글은 대문자 구분
	ORDER BY column_id;
	

CREATE TABLE ex2_5 (
	col_date DATE,
	col_timestamp timestamp
	);

INSERT INTO ex2_5 VALUES (sysdate, systimestamp);
SELECT *
FROM ex2_5;


CREATE TABLE ex2_6 (
	col_null	varchar2(10),
	col_not_null	varchar2(10) NOT NULL
	);

--INSERT INTO ex2_6 VALUES ('AA', '');
INSERT INTO ex2_6 VALUES ('AA', 'BB');

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6';


CREATE TABLE ex2_7 (
	col_unique_null	varchar2(10) UNIQUE,
	col_unique_nnull	varchar2(10) UNIQUE NOT NULL,
	col_unique	varchar2(10),
	CONSTRAINTS unique_nm1 UNIQUE (col_unique)
);
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_7';

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');
INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');
INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');



