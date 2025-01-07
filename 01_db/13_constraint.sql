/* constraint */
/* 1. not null 제약조건 */
-- null 값을 포함할 수 없는 컬럼에 대한 제약조건이자 컬럼레벨에서만 제약조건 추가 가능
DROP TABLE if EXISTS user_notnull;
CREATE TABLE if not EXISTS user_notnull (
	 user_no INT NOT NULL,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255)
);

INSERT
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_notnull;



INSERT
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', NULL, '남', '010-1234-5678', 'hong123@gmail.com');

/* 2. unique 제약 조건 */
-- 컬럼레벨 및 테이블 레벨 모두 가능
-- 기존의 데이터와 중복되지 않는 데이터가 들어가도록 하는 제약조건이다.
CREATE TABLE if NOT EXISTS user_unique(
	 user_no INT NOT NULL unique,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 UNIQUE(phone)
);

INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');


INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', 'pass03', '홍길동2', '남2', '010-1234-5678', 'hong123456@gmail.com');

/* 3. primary key 제약조건 */
-- not null + unique 제약조건이라고 볼 수 있다.
-- 모든 테이블은 반드시 primary key를 가져야 한다.
DROP TABLE user_primarykey;
CREATE TABLE if NOT EXISTS user_primarykey(
	 user_no INT,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 UNIQUE(phone),
	 PRIMARY key(user_no)
);

DESC user_primarykey;

INSERT
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');


INSERT
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user03', 'pass03', '홍길동2', '남2', '010-1234-0000', 'hong123446@gmail.com');
  

SELECT * FROM user_primarykey;

/*4. foreign key 제약조건 */
-- 4-1 회원등급 부모 테이블 먼저 생성
DROP TABLE if EXISTS user_grade;
DROP TABLE if EXISTS user_foreignkey1;
CREATE TABLE if NOT EXISTS user_grade (
	 grade_code INT NOT NULL UNIQUE,
	 grade_name VARCHAR(255) NOT null
);

-- 4-2 회원 자식 테이블 이후에 생성
CREATE TABLE if NOT EXISTS user_foreignkey1 (
	 user_no INT PRIMARY KEY,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 grade_code INT,
	 FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
);

INSERT
  INTO user_grade
VALUES
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

SELECT * FROM user_grade;
SELECT * FROM user_foreignkey1;

INSERT
  INTO user_foreignkey1
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 20),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', NULL);

-- foreign key 제약조건이 걸린 컬럼은 부모테이블의 pk값(또는 not null unique) + null값이 들어갈 수 있다.
INSERT
  INTO user_foreignkey1
VALUES
(3, 'user03', 'pass03', '유관순3', '여3', '010-777-7777', 'yu77@gmail.com', 40); -- 참조 무결성


-- fk 제약조건에 의해 문제가 발생
-- 1) 참조하지 않는 등급 삭제
DELETE FROM user_grade WHERE grade_code = 10;
SELECT * FROM user_grade;
-- 2) 참조하는 등급 삭제
DELETE FROM user_grade WHERE grade_code = 20;

-- 참조하고 있는(자식 테이블) 데이터부터 삭제해야 부모테이블 데이터도 삭제가 온전히 된다.

-- 참조하고 있는 자식테이블을 신경쓰지 않고 부모테이블의 데이터를 지울려면 삭제를 가진 fk 제약조건을 만들어야 한다.
-- 4-3
CREATE TABLE if NOT EXISTS user_foreignkey2 (
	 user_no INT PRIMARY KEY,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 grade_code INT,
	 FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code)
	 ON DELETE SET null
);

-- 앞에 삭제룰이 적용되지 않은 회원 데이터는 지워주자
DELETE FROM user_foreignkey1 WHERE 1 = 1;

INSERT
  INTO user_foreignkey2
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 20);

SELECT * FROM user_foreignkey2;

-- 부모테이블인 user_grade에서 참조와 관련 없이 등급을 삭제해 보자.
DELETE FROM user_grade WHERE grade_code = 20;



/* 5. check 제약조건(조건식을 활용한) */
DROP TABLE if EXISTS user_check;
CREATE TABLE if NOT EXISTS user_check (
	 user_no INT AUTO_INCREMENT PRIMARY KEY,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3) CHECK(gender IN ('남', '여')),
	 age INT CHECK(age >= 19 AND age <= 30)
);

INSERT
  INTO user_check
VALUES
(NULL, '홍길동', '남', 25),
(NULL, '신사임당', '여', 23);

-- check 제약조건 위반
INSERT
  INTO user_check
VALUES
(NULL, '플라나리아', '중', 19);

-- default 제약조건
CREATE TABLE if NOT EXISTS tbl_country(
	 country_code INT AUTO_INCREMENT PRIMARY KEY,
	 country_name VARCHAR(255) DEFAULT '한국',
	 population VARCHAR(255) DEFAULT '0명',
	 add_day DATE DEFAULT (CURRENT_DATE),
	 add_time DATETIME DEFAULT (CURRENT_TIME)
);

INSERT
  INTO tbl_country
VALUES
(NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM tbl_country;



