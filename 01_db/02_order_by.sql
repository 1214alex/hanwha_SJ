 -- order by(정렬)
 
 -- 오름차순(Ascending, ASC)
 -- 내림차순(Descending, DESC)
SELECT
  		  menu_code
		, menu_name
  		, menu_price
  FROM tbl_menu
-- ORDER BY menu_price ASC;
-- ORDER BY menu_price;    				  -- 생략가능(생략 시 ASC)
-- ORDER BY menu_price, menu_name DESC;  -- 정렬의 우선순위를 가지고 여러 정렬 기준 적용 가능
 ORDER BY 3, 2 DESC;							  -- select 절에 작성한 컬럼의 순번 활용 가능
 
 --별칭을 이용한 정렬
SELECT
 		  menu_code AS 메뉴코드
 		, menu_name AS 메뉴얼
 		, menu_price AS 메뉴단가
	FROM tbl_menu
 ORDER BY 메뉴코드 DESC;                 -- 별칭에 특수기호가 있을 시 별칭을 활용한 정렬 X(특수기호 쓰지 말기)
 
-- field 함수를 활용한 정렬이 가능하다.

SELECT FIELD('a', 'b', 'c', 'a');

--주문 불가능한 메뉴부터 보기
SELECT
		  orderable_status
		, FIELD(orderable_status, 'Y', 'N') AS 가능여부
  FROM tbl_menu
  -- ORDER BY FIELD(orderable_status, 'Y', 'N') desc;
  -- ORDER BY 2 desc;
 ORDER BY 가능여부  desc; 
 
 -- -------------------------------------------------------------------------------------------------------------------------------
 -- null 값(비어 있는 컬럼 값)에 대한 정렬
 SELECT *FROM tbl_category;
 
 -- 1) 오름차순 시: null값이 먼저 나옴
 SELECT
 		 *
   FROM tbl_category
 ORDER BY ref_category_code ASC;
 
 -- 2) 내림차순 시 : null값이 나중에 나옴
SELECT
		 *
  FROM tbl_category
 ORDER BY ref_category_code DESC;
 
 
 
  -- 3) 오름차순 시: null값이 나중에  나옴
 SELECT
 		 *
   FROM tbl_category
 ORDER BY -ref_category_code DESC;  -- desc를 통해 null의 위치를 (나중)으로 선정하고 desc와 반대(asc)로 컬럽값 정렬
 
 -- 4) 내림차순 시 : null값이 먼저  나옴
SELECT
		 *
  FROM tbl_category
 ORDER BY -ref_category_code ASC;  -- asc를 통해 null의 위치를 (앞)으로 선정하고 ASC와 반대(DESC)로 컬럼값 정렬