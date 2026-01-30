-- write your solution here

SELECT 
    EMPLOYEE, BASIC, ALLOWANCE, OTHERS,
    (BASIC + ALLOWANCE + OTHERS) AS GROSS,
    INSURANCE, HEALTH, HOUSE,
    (INSURANCE + HEALTH + HOUSE) AS TOTAL_DEDUCTIONS,
    ((BASIC + ALLOWANCE + OTHERS) - (INSURANCE + HEALTH + HOUSE)) AS NET_PAY
FROM (
    SELECT 
        emp_name AS EMPLOYEE,
        base_salary AS BASIC,
        (base_salary * 0.04) AS ALLOWANCE,
        (base_salary * 0.06) AS OTHERS,
        (base_salary * 0.05) AS INSURANCE,
        (base_salary * 0.06) AS HEALTH,
        (base_salary * 0.04) AS HOUSE
    FROM salary
) AS sub
ORDER BY EMPLOYEE;


WITH Salary AS (
    SELECT 
        emp_name AS EMPLOYEE,
        base_salary AS BASIC,
        (base_salary * 0.04) AS ALLOWANCE,
        (base_salary * 0.06) AS OTHERS,
        (base_salary * 0.05) AS INSURANCE,
        (base_salary * 0.06) AS HEALTH,
        (base_salary * 0.04) AS HOUSE
    FROM salary
)
SELECT 
    EMPLOYEE, BASIC, ALLOWANCE, OTHERS,
    (BASIC + ALLOWANCE + OTHERS) AS GROSS,
    INSURANCE, HEALTH, HOUSE,
    (INSURANCE + HEALTH + HOUSE) AS TOTAL_DEDUCTIONS,
    ((BASIC + ALLOWANCE + OTHERS) - (INSURANCE + HEALTH + HOUSE)) AS NET_PAY
FROM Salary
ORDER BY EMPLOYEE;