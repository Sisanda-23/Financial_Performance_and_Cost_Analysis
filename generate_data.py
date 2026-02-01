# Step 1: Create our data for the dashboard project

import pandas as pd
import numpy as np

np.random.seed(42)

# Create date range (24 months)
dates = pd.date_range(start="2023-01-01", periods=24, freq="MS")

# Departments
departments = {
    1: "Sales",
    2: "Operations",
    3: "Marketing",
    4: "HR",
    5: "IT"
}

# Base values per department
base_revenue = {
    1: 150000,
    2: 60000,
    3: 80000,
    4: 20000,
    5: 30000
}

base_cost = {
    1: 90000,
    2: 70000,
    3: 60000,
    4: 25000,
    5: 35000
}

revenue_rows = []
cost_rows = []

for dept_id, dept_name in departments.items():
    revenue = base_revenue[dept_id]
    cost = base_cost[dept_id]
    
    for date in dates:
        # Growth patterns
        revenue_growth = np.random.uniform(0.01, 0.05)
        cost_growth = np.random.uniform(0.02, 0.07) if dept_name == "Operations" else np.random.uniform(0.01, 0.04)
        
        revenue *= (1 + revenue_growth)
        cost *= (1 + cost_growth)
        
        revenue_rows.append([date, dept_id, round(revenue, 2)])
        cost_rows.append([date, dept_id, round(cost, 2)])

# Create DataFrames
revenue_df = pd.DataFrame(revenue_rows, columns=["date", "department_id", "revenue"])
cost_df = pd.DataFrame(cost_rows, columns=["date", "department_id", "cost"])
departments_df = pd.DataFrame(list(departments.items()), columns=["department_id", "department_name"])

# Save datasets
revenue_df.to_csv("/mnt/data/revenue.csv", index=False)
cost_df.to_csv("/mnt/data/costs.csv", index=False)
departments_df.to_csv("/mnt/data/departments.csv", index=False)

revenue_df.head(), cost_df.head(), departments_df
