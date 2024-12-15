To fix this, use a `LEFT JOIN` with a subquery to ensure all departments are included, even those with zero employees:

```sql
SELECT d.department, COUNT(e.employee_id) AS total_employees, AVG(e.salary) AS avg_salary
FROM departments d
LEFT JOIN employees e ON d.department = e.department
GROUP BY d.department;
```

This revised query first selects all departments. The `LEFT JOIN` ensures that even if there's no match in the `employees` table (meaning no employees in that department), the department will still be included in the result set. `COUNT(e.employee_id)` now accurately counts the number of employees in each department, returning 0 for departments without employees.  The `AVG(e.salary)` function handles NULL salaries gracefully, typically resulting in NULL for departments without employees.