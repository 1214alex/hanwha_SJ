-- 1번
SELECT
		 EMP_NO
		,EMP_NAME
		,DEPT_CODE
  FROM employee
 WHERE EMP_NAME LIKE '%형%';
 
-- 2번
SELECT
		 a.EMP_NAME
		,c.JOB_NAME
		,b.DEPT_ID
		,b.DEPT_TITLE
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN job c ON a.JOB_CODE = c.JOB_CODE
 WHERE b.DEPT_TITLE LIKE '%해외영업%';
 
-- 3번
SELECT
		 a.EMP_NAME
		,a.BONUS
		,b.DEPT_TITLE
		,c.LOCAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
 WHERE a.BONUS IS NOT NULL;

-- 4번
SELECT
		 a.EMP_NAME
		,d.JOB_NAME
		,b.DEPT_TITLE
		,c.LOCAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
  JOIN job d ON a.JOB_CODE = d.JOB_CODE
 WHERE a.DEPT_CODE = 'D2';

 
 
-- 5번
SELECT
		 a.EMP_NAME
		,b.JOB_NAME
		,a.SALARY
		,a.SALARY*12*(IFNULL (a.BONUS,0)+1) AS 연봉
  FROM employee a
  JOIN job b ON a.JOB_CODE = b.JOB_CODE
  JOIN sal_grade c ON a.SAL_LEVEL = c.SAL_LEVEL
 WHERE a.SALARY >= c.MIN_SAL;
 
-- 6번
SELECT
		 a.EMP_NAME
		,b.DEPT_TITLE
		,c.LOCAL_NAME
		,d.NATIONAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON c.LOCAL_CODE = b.LOCATION_ID
  JOIN national d ON d.NATIONAL_CODE = c.NATIONAL_CODE
 WHERE d.NATIONAL_CODE = 'KO' OR d.NATIONAL_CODE = 'JP';
 
-- 7번
SELECT
		 a.EMP_NAME
		,b.DEPT_CODE
		,b.EMP_NAME AS 동료
  FROM employee a
  JOIN employee b ON a.DEPT_CODE = b.DEPT_CODE
 WHERE a.EMP_NAME != b.EMP_NAME;


-- 8번
SELECT
		 a.EMP_NAME
		,b.JOB_NAME
		,a.SALARY
  FROM employee a
  JOIN JOB b ON a.JOB_CODE = b.JOB_CODE
 WHERE a.BONUS IS NULL AND a.JOB_CODE IN('J4','J7');

-- 9번
SELECT
		 a.EMP_ID
		,a.EMP_NAME
		,b.JOB_NAME
		,c.DEPT_TITLE
		,d.LOCAL_NAME
		,a.SALARY
  FROM employee a
  JOIN job b ON a.JOB_CODE = b.JOB_CODE
  JOIN department c ON c.DEPT_ID = a.DEPT_CODE
  JOIN location d ON d.LOCAL_CODE = c.LOCATION_ID
 WHERE b.JOB_CODE = 'J6' 
   AND d.LOCAL_NAME LIKE 'ASIA%';
  
SELECT
		 *
  FROM location; 