-- write your solution here

SELECT row_id,FIRST_VALUE(job_role) OVER (PARTITION BY grp ORDER BY row_id)
 AS job_role,skills
FROM (
    SELECT row_id,job_role,skills,
        SUM(CASE WHEN job_role IS NOT NULL THEN 1 
        ELSE 0 END)
            OVER (ORDER BY row_id) AS grp
    FROM job_skills
) t
ORDER BY row_id;
