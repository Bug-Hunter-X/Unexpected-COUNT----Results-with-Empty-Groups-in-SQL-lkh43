In SQL, a common but subtle error arises when using `COUNT(*)` within a `GROUP BY` clause alongside other aggregate functions.  If you're not careful, you might get unexpected counts.

For example:

```sql
SELECT department, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

This query works fine if every department has employees. But if a department has no employees, that department won't be included in the result set.  `COUNT(*)` will only count rows that have data after the `GROUP BY` clause has been applied.

The issue is that `COUNT(*)` counts the number of *groups*, not the number of rows in the original table.  To ensure all departments appear even if they have no employees, you should use a `LEFT JOIN` with a subquery that selects all departments.