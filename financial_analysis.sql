-- Monthly Revenue and Cost per Department
WITH revenue_monthly AS (
    SELECT
        department_id,
        DATE_TRUNC('month', revenue_date) AS month,
        SUM(revenue_amount) AS total_revenue
    FROM revenue
    GROUP BY department_id, month
),
costs_monthly AS (
    SELECT
        department_id,
        DATE_TRUNC('month', cost_date) AS month,
        SUM(cost_amount) AS total_cost
    FROM costs
    GROUP BY department_id, month
)
SELECT
    r.department_id,
    r.month,
    r.total_revenue,
    c.total_cost,
    (r.total_revenue - c.total_cost) AS profit
FROM revenue_monthly r
JOIN costs_monthly c
  ON r.department_id = c.department_id
 AND r.month = c.month
ORDER BY r.month;

--Cost vs revenue
SELECT
    department_id,
    month,
    total_cost / NULLIF(total_revenue, 0) AS cost_ratio
FROM financials;
