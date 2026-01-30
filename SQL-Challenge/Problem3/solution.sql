-- --------------------------------
-- SOLUTION 1: INCLUDING FIRST TEST CASE 
-- --------------------------------
SELECT test_id, marks
FROM (
  SELECT test_id, marks,
    marks > IFNULL(LAG(marks) OVER (ORDER BY test_id), 0) AS improved
  FROM student_marks
) t
WHERE improved = 1;

-- --------------------------------
-- SOLUTION 2: EXCLUDING FIRST TEST CASE 
-- --------------------------------

SELECT test_id, marks
FROM (
  SELECT test_id, marks,
    marks > LAG(marks) OVER (ORDER BY test_id) AS improved
  FROM student_marks
) t
WHERE improved = 1;
