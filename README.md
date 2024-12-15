This repository demonstrates a common SQL error related to using `COUNT(*)` with `GROUP BY` when dealing with potentially empty groups. The `bug.sql` file shows the erroneous query that misses departments with no employees.  The `bugSolution.sql` file offers the corrected version that uses a `LEFT JOIN` to include all departments regardless of employee count.