# Python visualizations using matplotlib 

import pandas as pd
import matplotlib.pyplot as plt

# Load data
revenue = pd.read_csv("/mnt/data/revenue.csv", parse_dates=["date"])
costs = pd.read_csv("/mnt/data/costs.csv", parse_dates=["date"])
departments = pd.read_csv("/mnt/data/departments.csv")

# Merge data
df = revenue.merge(costs, on=["date", "department_id"])\
            .merge(departments, on="department_id")

# 1. Monthly Profit Trend
monthly = df.groupby("date")[["revenue", "cost"]].sum().reset_index()
monthly["profit"] = monthly["revenue"] - monthly["cost"]

plt.figure()
plt.plot(monthly["date"], monthly["profit"])
plt.title("Monthly Company Profit Trend")
plt.xlabel("Date")
plt.ylabel("Profit")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 2. Revenue vs Cost by Department
dept_summary = df.groupby("department_name")[["revenue", "cost"]].sum().reset_index()

plt.figure()
plt.bar(dept_summary["department_name"], dept_summary["revenue"])
plt.bar(dept_summary["department_name"], dept_summary["cost"])
plt.title("Total Revenue and Cost by Department")
plt.xlabel("Department")
plt.ylabel("Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 3. Efficiency Ratio by Department
dept_summary["efficiency_ratio"] = dept_summary["revenue"] / dept_summary["cost"]

plt.figure()
plt.bar(dept_summary["department_name"], dept_summary["efficiency_ratio"])
plt.axhline(1)
plt.title("Department Efficiency Ratio")
plt.xlabel("Department")
plt.ylabel("Efficiency Ratio")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# 4. Operations Cost vs Revenue Over Time
ops = df[df["department_name"] == "Operations"]

plt.figure()
plt.plot(ops["date"], ops["revenue"], label="Revenue")
plt.plot(ops["date"], ops["cost"], label="Cost")
plt.title("Operations: Revenue vs Cost Over Time")
plt.xlabel("Date")
plt.ylabel("Amount")
plt.legend()
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

