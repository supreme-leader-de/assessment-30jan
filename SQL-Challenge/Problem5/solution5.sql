with cte as (
	select
        row_id,
        job_role,
        skills,
        sum(case when job_role is not null then 1 else 0 end) over (order by row_id) as grp
    from job_skills
)
select
    row_id,
    max(job_role) over(partition by grp) as job_role,
    skills
from cte