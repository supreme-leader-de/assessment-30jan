-- write your solution here
-- Including the first test
SELECT test_id,marks
FROM (
    SELECT test_id,marks,LAG(marks, 1, 0) OVER (ORDER BY test_id) AS prev_marks
    FROM student_marks
) t
WHERE marks > prev_marks;

-- Excluding the first test
SELECT test_id,marks
FROM (
    SELECT test_id,marks,LAG(marks) OVER (ORDER BY test_id) AS prev_marks
    FROM student_marks
) t
WHERE prev_marks IS NOT NULL
  AND marks > prev_marks;
