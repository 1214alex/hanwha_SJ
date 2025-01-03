-- where 절
-- 주문가능한 메뉴만 조회(메뉴명만 조회)
SELECT * FROM tbl_menu;

-- 테이블의 구조(스키마)를 바로 파악할 수 있다.
DESC tbl_menu;

SELECT 
		 orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'n'; 
 
SELECT 
		 menu_name
  FROM tbl_menu
 WHERE orderable_status = 'n';
 
SELECT 
		 *
  FROM tbl_menu
 WHERE orderable_status = 'Y';   -- mariadb는 대소문자 크게 상관X, 순서 잘 인지할 것
 
-- -----------------------------------------------------------------------
-- '기타' 카테고리에 해당하지 않는 메뉴를 조회하시오.
SELECT
		  *
  FROM tbl_category
 WHERE category_name = '기타';   -- '=' 하나가 '같냐'라는 뜻(결과는 true 아니면 false)
 
-- 카테고리 테이블을 통해 메뉴에도 있는 카테고리 코드 번호를 알게 됨(10번)
SELECT
		 *
  FROM tbl_menu
 WHERE category_code != 10;
 -- WHERE category_code <> 10;   -- '!='과 '<>'는 '같지 않냐'라는 뜻(mariadb 기준) 
 

-- 추후에 배울 서브쿼리라는 것(위에서 2번에 나눠서 했던 것을 하나의 sql로 작성 가능)
SELECT
		 *
  FROM tbl_menu
 WHERE category_code != (SELECT category_code
 								 FROM tbl_category
								 WHERE category_name = '기타');
								 
-- =,!=과 같이 대소 비교 연산자(>, <, >=, <=)를 통해서도 where절에 활용할 수 있다.
-- 5000원 이상의 메뉴 모든 컬러 보기
SELECT
		 *
  FROM tbl_menu
 WHERE menu_price >= 5000
 ORDER BY menu_price ASC;
 
-- 5000원 이상이면서 7000원 미만인 메뉴 조회(AND)
SELECT
		  *
  FROM tbl_menu
 WHERE menu_price >= 5000 
   AND menu_price < 7000;
   
-- 10000원보다 초과이거나 5000원 이하인 메뉴 조합(OR)
SELECT
		  *
  FROM tbl_menu
 WHERE menu_price > 10000
    OR menu_price <= 5000
 ORDER BY menu_price;
 
-- 5000원 이하이거나 카테고리 번호가 10번인 메뉴 조회
SELECT * FROM tbl_menu;
DESC tbl_menu;
SELECT
		  menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
  FROM tbl_menu
 WHERE menu_price <= 5000
    OR category_code = 10;
-- -----------------------------------------------------
-- between 연산자 활용하기
-- 가격이 5000원 이상이면서 9000원 이하인 메뉴 전체 컬럼 조회
SELECT
		  *
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND menu_price <= 9000;
   
SELECT
		  *
  FROM tbl_menu
 WHERE menu_price BETWEEN 5000 AND 9000;
 
-- 반대 범위인 5000원 미만 또는 9000원 초과인 메뉴 전체 컬럼 조회
SELECT
		  *
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 5000 AND 9000;
 
-- ------------------------------------------------------------------------

-- like문
-- 제목, 작성자 등을 검색할 때 사용 
-- %라는  와일드카드는 0개 이상의 문자를 뜻하는 특수기호이다.
SELECT
		  *
  FROM tbl_menu
 WHERE menu_name LIKE '%밥%';
 

SELECT
		  *
  FROM tbl_menu
 WHERE menu_name NOT LIKE '%밥%';
 
-- -------------------------------------------------------------------------
-- in 연산자
-- 카테고리가 '중식', '커피', '기타'인 메뉴 조회하기
SELECT
		  *
  FROM tbl_menu
 WHERE category_code = 5
	 OR category_code = 8
 	 OR category_code = 10;
 	 
 	 
SELECT
		  *
  FROM tbl_menu
-- WHERE category_code IN (5, 8, 10);
 WHERE category_code NOT IN (5, 8, 10);
 
-- ----------------------------------------------------------------------------
-- is null 연산자 활용
-- 1) 상위 카테고리를 조회
SELECT
		  *
  FROM tbl_category
 WHERE ref_category_code IS NULL;

--2) 하위 카테고리를 조회
SELECT
		  *
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;