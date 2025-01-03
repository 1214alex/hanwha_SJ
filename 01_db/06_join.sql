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
SELECT
		  a.menu_name
		, b.category_name
		, a.category_code -- 이 부분은 ambiguos 에러 발생
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code;