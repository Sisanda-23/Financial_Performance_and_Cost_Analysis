# 💰 Financial Performance & Cost Analysis Dashboard

## 📌 Project Overview
Management lacked visibility into where money was being lost across the organization. This project analyzes revenue and cost data across multiple departments to identify inefficiencies, cost overruns, and profitability trends.

The analysis simulates a real-world business scenario and delivers actionable insights using **SQL**, **Python**, and **data visualization**.

---

## 🎯 Business Problem
> “Management doesn’t know where money is being lost.”

Key challenges:
- No clear view of departmental profitability
- Rising costs without proportional revenue growth
- Inconsistent month-to-month performance

---

## 🔍 Objectives
- Analyze monthly revenue, costs, and profit trends
- Identify cost overruns and inefficiencies
- Evaluate department-level performance
- Measure month-over-month financial growth
- Provide management-ready insights

---

## 🗂️ Dataset Description

### Revenue Table
| Column | Description |
|------|------------|
| department_id | Department identifier |
| revenue_date | Revenue transaction date |
| revenue_amount | Revenue generated |

### Costs Table
| Column | Description |
|------|------------|
| department_id | Department identifier |
| cost_date | Cost transaction date |
| cost_type | Category of cost (e.g. Salaries, Marketing) |
| cost_amount | Cost incurred |

Granularity: **Department × Month**

---

## 🛠️ Tech Stack
- **SQL** (CTEs, joins, aggregations)
- **Python** (pandas, matplotlib)
- **Matplotlib** (visualization)


---

## 📊 Key Metrics Calculated
- Total Revenue
- Total Cost
- Profit (Revenue − Cost)
- Cost-to-Revenue Ratio
- Department Efficiency (Profit Margin)
- Month-on-Month Growth

---

## 📈 Key Insights

Operations costs increased significantly without corresponding revenue growth, indicating inefficiency.

Multiple departments experienced recurring monthly losses due to cost spikes rather than revenue decline.

Marketing and discretionary spend showed weak correlation with revenue growth.

Some departments maintained stable margins, suggesting best-practice cost management.

