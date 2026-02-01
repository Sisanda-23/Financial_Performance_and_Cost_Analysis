-- Monthly profit trend
SELECT
    r.date,
    SUM(r.revenue) AS total_revenue,
    SUM(c.cost) AS total_cost,
    SUM(r.revenue) - SUM(c.cost) AS profit
FROM revenue r
JOIN costs c
  ON r.date = c.date
 AND r.department_id = c.department_id
GROUP BY r.date
ORDER BY r.date;

-- Profit by department
SELECT
    d.department_name,
    SUM(r.revenue) AS total_revenue,
    SUM(c.cost) AS total_cost,
    SUM(r.revenue) - SUM(c.cost) AS profit
FROM revenue r
JOIN costs c
  ON r.date = c.date
 AND r.department_id = c.department_id
JOIN departments d
  ON r.department_id = d.department_id
GROUP BY d.department_name
ORDER BY profit DESC;

-- Department Efficiency (Revenue-to-Cost Ratio)
SELECT
    d.department_name,
    ROUND(SUM(r.revenue) / NULLIF(SUM(c.cost), 0), 2) AS efficiency_ratio
FROM revenue r
JOIN costs c
  ON r.date = c.date
 AND r.department_id = c.department_id
JOIN departments d
  ON r.department_id = d.department_id
GROUP BY d.department_name
ORDER BY efficiency_ratio DESC;


-- Revenue vs cost
WITH monthly_totals AS (
    SELECT
        r.date,
        SUM(r.revenue) AS revenue,
        SUM(c.cost) AS cost
    FROM revenue r
    JOIN costs c
      ON r.date = c.date
     AND r.department_id = c.department_id
    GROUP BY r.date
)
SELECT
    date,
    revenue,
    cost,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY date))
        / LAG(revenue) OVER (ORDER BY date) * 100, 2
    ) AS revenue_growth_pct,
    ROUND(
        (cost - LAG(cost) OVER (ORDER BY date))
        / LAG(cost) OVER (ORDER BY date) * 100, 2
    ) AS cost_growth_pct
FROM monthly_totals
ORDER BY date;

-- Cost Overrun Detection
WITH dept_costs AS (
    SELECT
        department_id,
        date,
        cost,
        LAG(cost) OVER (
            PARTITION BY department_id
            ORDER BY date
        ) AS prev_cost
    FROM costs
)
SELECT
    d.department_name,
    date,
    cost,
    prev_cost,
    ROUND((cost - prev_cost) / prev_cost * 100, 2) AS cost_increase_pct
FROM dept_costs dc
JOIN departments d
  ON dc.department_id = d.department_id
WHERE (cost - prev_cost) / prev_cost > 0.15
ORDER BY cost_increase_pct DESC;

