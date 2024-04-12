
------------------ 테이블 생성

CREATE TABLE cart
(
  cart_no   VARCHAR2(20) NOT NULL,
  cart_qty  NUMBER       NOT NULL,
  cart_date DATE         NOT NULL,
  prod_code VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_cart PRIMARY KEY (cart_no)
);

COMMENT ON TABLE cart IS '주문내역';
COMMENT ON COLUMN cart.cart_no IS '주문번호';
COMMENT ON COLUMN cart.cart_qty IS '수량';
COMMENT ON COLUMN cart.cart_date IS '주문일자';
COMMENT ON COLUMN cart.prod_code IS '상품코드';


CREATE TABLE lprod
(
  lprod_code VARCHAR2(20) NOT NULL,
  lprod_name VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_lprod PRIMARY KEY (lprod_code)
);

COMMENT ON TABLE lprod IS '상품분류';
COMMENT ON COLUMN lprod.lprod_code IS '상품분류코드';
COMMENT ON COLUMN lprod.lprod_name IS '분류명';


CREATE TABLE member_job
(
  mem_name     VARCHAR2(20) NOT NULL,
  mem_add      VARCHAR2(20) NOT NULL,
  mem_hiredate DATE         NOT NULL,
  mem_position VARCHAR2(20) NOT NULL,
  mem_code     VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_member_job PRIMARY KEY (mem_code)
);

COMMENT ON TABLE member_job IS '직원관리';
COMMENT ON COLUMN member_job.mem_name IS '이름';
COMMENT ON COLUMN member_job.mem_add IS '주소';
COMMENT ON COLUMN member_job.mem_hiredate IS '입사일';
COMMENT ON COLUMN member_job.mem_position IS '직급';
COMMENT ON COLUMN member_job.mem_code IS '직원코드';


CREATE TABLE prod
(
  prod_code  VARCHAR2(20) NOT NULL,
  prod_name  VARCHAR2(20) NOT NULL,
  prod_price NUMBER       NOT NULL,
  prod_qty   NUMBER       NOT NULL,
  lprod_code VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_prod PRIMARY KEY (prod_code)
);

COMMENT ON TABLE prod IS '상품정보';
COMMENT ON COLUMN prod.prod_code IS '상품코드';
COMMENT ON COLUMN prod.prod_name IS '상품명';
COMMENT ON COLUMN prod.prod_price IS '가격';
COMMENT ON COLUMN prod.prod_qty IS '재고수량';
COMMENT ON COLUMN prod.lprod_code IS '상품분류코드';


ALTER TABLE cart
  ADD CONSTRAINT FK_prod_TO_cart
    FOREIGN KEY (prod_code)
    REFERENCES prod (prod_code);

ALTER TABLE prod
  ADD CONSTRAINT FK_lprod_TO_prod
    FOREIGN KEY (lprod_code)
    REFERENCES lprod (lprod_code);

        

----------------- 상품 데이터 입력
SELECT * FROM lprod;

INSERT INTO lprod VALUES ('b01', '빵류');
INSERT INTO lprod VALUES ('c01', '케이크류');
INSERT INTO lprod VALUES ('c02', '쿠키류');

INSERT INTO prod VALUES ('a001', '소세지빵', 2000, 300, 'b01');
INSERT INTO prod VALUES ('a002', '단팥빵', 1000, 300, 'b01');
INSERT INTO prod VALUES ('a003', '크림빵', 1500, 300, 'b01');
INSERT INTO prod VALUES ('a004', '피자빵', 2500, 300, 'b01');
INSERT INTO prod VALUES ('a005', '바게트', 2500, 300, 'b01');
INSERT INTO prod VALUES ('a006', '생크림 케이크', 18000, 300, 'c01');
INSERT INTO prod VALUES ('a007', '초코 케이크', 23000, 300, 'c01');
INSERT INTO prod VALUES ('a008', '과일 케이크', 20000, 300, 'c01');
INSERT INTO prod VALUES ('a009', '초코 쿠키', 3500, 300, 'c02');
INSERT INTO prod VALUES ('a010', '버터 쿠키', 3000, 300, 'c02');

----------------- 직원 데이터 입력
ALTER TABLE ADAM.MEMBER_JOB MODIFY MEM_ADD VARCHAR2(50);

SELECT * FROM member_job;

INSERT INTO member_job VALUES ('한지수', '부산시 남구', to_date('23-02-2020', 'dd-mm-yyyy'), 'Manager', 'M-200223-01');
INSERT INTO member_job VALUES ('이윤지', '부산시 북구', to_date('30-04-2019', 'dd-mm-yyyy'), 'Manager', 'M-190430-01');
INSERT INTO member_job VALUES ('이은지', '부산시 부산진구', to_date('25-03-2020', 'dd-mm-yyyy'), 'Staff', 'S-200325-01');
INSERT INTO member_job VALUES ('강소이', '부산시 영도구', to_date('05-06-2022', 'dd-mm-yyyy'), 'Staff', 'S-220605-01');
INSERT INTO member_job VALUES ('한성지', '부산시 해운대구', to_date('01-05-2023', 'dd-mm-yyyy'), 'Intern', 'I-230501-01');
INSERT INTO member_job VALUES ('강정미', '부산시 수영구', to_date('16-10-2021', 'dd-mm-yyyy'), 'Staff', 'S-211016-01');


