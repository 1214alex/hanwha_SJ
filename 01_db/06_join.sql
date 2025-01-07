-- join

SELECT * FROM tbl_menu;
SELECT * FROM tbl_category;

--별칭 안 적었을 때
SELECT
		  menu_name
		, category_name
		, category_code -- 이 부분은 ambiguos 에러 발생
  FROM tbl_menu
  JOIN tbl_category ON tbl_menu.category_code = tbl_category.category_code;
  
-- 별칭 작성 시
-- 테이블 또는 form 절에 별칭을 추가할 때는 mariadb는 싱글쿼테이션(')없이 별칭을 작성해야한다.(as는 생략이 가능하다)
SELECT
		  a.menu_name
		, b.category_name
		, a.category_code -- 이 부분은 ambiguos 에러 발생해결 (tbl_menu의 category_code인지 tbl_category의 category_code인지 명확하기 때문)
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code;
  
  -- -------------------------------------------------------------------------
  -- inner join
  -- 1)on 활용(join할 조건 작성)(컬럼명이 다를 때는 반드시 on을 작성)
  
SELECT
		  a.menu_name
		, b.category_name
		, a.category_code -- 이 부분은 ambiguos 에러 발생해결 (tbl_menu의 category_code인지 tbl_category의 category_code인지 명확하기 때문)
  FROM tbl_menu a
 INNER JOIN tbl_category b ON a.category_code = b.category_code;
  
-- 2)using 활용(컬럼명이 같을 때는 using을 활용해서 짧은 구문으로 작성가능)
SELECT
		  a.menu_name
		, b.category_name
		, a.category_code -- 이 부분은 ambiguos 에러 발생해결 (tbl_menu의 category_code인지 tbl_category의 category_code인지 명확하기 때문)
  FROM tbl_menu a
 INNER JOIN tbl_category b USING (category_code)
 ORDER BY category_code ASC;
 
 -- ------------------------------------------------------------------------------
 -- outer join
 -- 1) Left join
 SELECT
 		  a.category_name
 		, b.menu_name 
   FROM tbl_category a
   LEFT JOIN tbl_menu b ON a.category_code = b.category_code;
   
 -- 2) right join
  SELECT
 		  b.category_name
 		, a.menu_name 
   FROM tbl_menu a
  RIGHT JOIN tbl_category b ON a.category_code = b.category_code;
  
 -- 3) cross join
SELECT
 		 *
  FROM tbl_menu a
 CROSS JOIN tbl_category b; -- 잘못된 join(잘못해서 있는 모든것에 join되서 나오는것)
 
 -- 4) self join
SELECT
		 *
  FROM tbl_category a
  JOIN tbl_category b ON (a.ref_category_code = b.category_code);
  
SELECT
		 a.category_name
	  , b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON (a.ref_category_code = b.category_code);
  
SELECT
		 *
  FROM tbl_menu a
  JOIN tbl_category b ON (a.ref_category_code = b.category_code);
  