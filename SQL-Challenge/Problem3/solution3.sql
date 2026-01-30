-- write your solution here

with cte as (
	select test_id, marks, lag(marks) over(order by test_id) as previous from student_marks
)
select test_id from cte where marks > previous;
