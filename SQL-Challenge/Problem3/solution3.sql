-- write your solution here
#output1
with cte1 as(
select test_id, marks, lag(marks,1,0) over(order by test_id ) as prevm  from student_marks
)
select test_id, marks from cte1 where marks>prevm

#output2
with cte1 as(
select test_id, marks, lag(marks) over(order by test_id ) as prevm  from student_marks
)
select test_id, marks from cte1 where marks>prevm