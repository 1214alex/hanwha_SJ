/* type casting */
-- 명시적 형변환

-- 1) 숫자 -> 숫자
-- 부호없는 정수형으로 바꿈으로써 소수점 이하를 제거할 수도 있다
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격 평균'
  FROM tbl_menu;
  DESC tbl_menu;

SELECT CAST(AVG(menu_price) AS DOUBLE) AS '가격 평균1'
  FROM tbl_menu;
  
SELECT CONVERT(AVG(menu_price), DOUBLE) AS '가격 평균12'
  FROM tbl_menu
 GROUP BY category_code; 
 
-- 2) 문자 -> 날짜
SELECT CAST('2025,01,07' AS DATE);
SELECT CAST('2025#01#07' AS DATE);
SELECT CAST('2025?01#07' AS DATE);
SELECT CAST('2025!01@07' AS DATE);

-- 3) 숫자 -> 문자
SELECT CAST(1000 AS CHAR);

SELECT CONCAT(CAST(1000 AS CHAR), '원');

SELECT CONCAT(1000, '원');

-- 암시적 형변환
SELECT 1 + '2';
SELECT 5 > '123abc';
SELECT 5 > 'abc123';