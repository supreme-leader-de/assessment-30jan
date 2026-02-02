-- write your solution here

with income_cte as (
	select s.emp_id, s.emp_name, i.income,
		   s.base_salary * i.percentage/ 100 as amount
	from salary s
    cross join income i
),
deduction_cte as (
	select s.emp_id, s.emp_name, d.deduction,
		   s.base_salary * d.percentage/ 100 as amount
	from salary s
    cross join deduction d
)
select
	i.emp_name as employee,

    sum(case when i.income = 'Basic' then i.amount end) as basic,
    sum(case when i.income = 'Allowance' then i.amount end) as allowance,
	sum(case when i.income = 'Others' then i.amount end) as "others",
    sum(case when i.income in ('Basic','Allowance','Others') then i.amount end) as 'gross salary',

    sum(case when d.deduction = 'Insurance' then d.amount end) as insurance,
    sum(case when d.deduction = 'Health' then d.amount end) as health,
    sum(case when d.deduction = 'House' then d.amount end) as house,
    sum(case when d.deduction in ('Insurance','Health','House') then d.amount end) as 'total deductions',

	((sum(case when i.income in ('Basic','Allowance','Others') then i.amount end))
	-
    (sum(case when d.deduction in ('Insurance','Health','House') then d.amount end)))
    as 'net pay'

    from income_cte i
    join deduction_cte d
    on i.emp_id = d.emp_id
    group by i.emp_name;