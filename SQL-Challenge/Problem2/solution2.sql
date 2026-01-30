SELECT
  s.emp_name AS employee,
  s.base_salary AS basic,

  s.base_salary * i.allowance / 100 AS allowance,
  s.base_salary * i.others / 100 AS others,

  s.base_salary + 
  s.base_salary * (i.allowance + i.others) / 100 AS gross,

  s.base_salary * d.insurance / 100 AS insurance,
  s.base_salary * d.health / 100 AS health,
  s.base_salary * d.house / 100 AS house,

  s.base_salary * (d.insurance + d.health + d.house) / 100 AS total_deductions,

  s.base_salary +
  s.base_salary * (i.allowance + i.others) / 100 -
  s.base_salary * (d.insurance + d.health + d.house) / 100 AS net_pay

FROM salary s
CROSS JOIN (
  SELECT
    MAX(CASE WHEN income='Allowance' THEN percentage END) AS allowance,
    MAX(CASE WHEN income='Others' THEN percentage END) AS others
  FROM income
) i
CROSS JOIN (
  SELECT
    MAX(CASE WHEN deduction='Insurance' THEN percentage END) AS insurance,
    MAX(CASE WHEN deduction='Health' THEN percentage END) AS health,
    MAX(CASE WHEN deduction='House' THEN percentage END) AS house
  FROM deduction
) d
ORDER BY employee;