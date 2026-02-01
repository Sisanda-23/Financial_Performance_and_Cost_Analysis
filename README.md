#  Financial Performance & Cost Analysis Dashboard

##  Business Problem

“Management doesn’t know where money is being lost.”

Despite steady revenue growth, leadership lacked visibility into:

- Profit trends over time
- Department-level efficiency
- Cost overruns and margin erosion

The goal of this project was to identify where profitability is being impacted and why, using SQL and Python-driven financial analysis.

##  Project Objectives

- Analyze company-wide profitability trends
- Identify high- and low-performing departments
- Detect cost overruns and inefficiencies
- Compare month-on-month revenue vs cost growth
- Deliver actionable, executive-level insights

##  Data Model & Dataset

Since realistic public datasets rarely reflect internal financial structures, I simulated a clean, business-realistic dataset.

### Tables

- **departments** — department master data
- **revenue** — monthly revenue by department
- **costs** — monthly costs by department

### Key Characteristics

- 24 months of data (Jan 2023 – Dec 2024)
- Revenue grows steadily across departments
- Operations costs intentionally grow faster to simulate inefficiency
- Clean relational schema suitable for SQL & BI tools

## Tools & Technologies

- **SQL:** joins, aggregations, CTEs, window functions
- **Python:** pandas, matplotlib
- **Database:** SQLite / PostgreSQL (portable SQL)
- **Visualization:** matplotlib (dashboard-ready logic)

##  Key Analyses Performed

1. **Monthly Profit Trend**
   - Calculated total revenue, costs, and profit over time
   - Identified increasing profitability with noticeable volatility
   - **Insight:** Profit increased from ~$62K to ~$83K over 24 months, but fluctuations indicate inconsistent cost control.

2. **Profit by Department**
   - Aggregated revenue and cost at department level
   - **Insight:** Sales and Marketing generate all company profit, while Operations alone incurred a cumulative loss of ~$950K.

3. **Department Efficiency**
   - Efficiency Ratio = Revenue / Cost

   | Department   | Efficiency |
   |--------------|------------|
   | Sales        | 1.67       |
   | Marketing    | 1.43       |
   | IT           | 0.93       |
   | HR           | 0.88       |
   | Operations   | 0.69       |

   - **Insight:** Operations is structurally inefficient, generating only $0.69 for every $1 spent.

4. **Month-on-Month Growth Analysis**
   - Used SQL window functions to compare revenue vs cost growth.
   - **Insight:** Costs frequently outpaced revenue growth, especially in early 2024 and Q4 2024, putting pressure on margins.

5. **Cost Overrun Detection**
   - Identified months where department costs increased more than 6% MoM.
   - **Insight:** Operations experienced repeated 6–7% monthly cost spikes across multiple periods, indicating a systemic cost control issue rather than a one-time anomaly.

##  Visualizations

Key visuals created using matplotlib:

- Monthly profit trend
- Revenue vs cost by department
- Efficiency ratio by department
- Operations revenue vs cost over time

These visuals clearly highlight where money is being lost and why.

## 💡 Final Business Insights

- The company is growing and becoming more profitable overall
- Profitability is unstable due to rising operational costs
- Sales and Marketing are scalable profit drivers
- Operations is the primary source of margin erosion
- Improving cost controls would have a larger impact than increasing revenue

## 🧠 Recommendations

- Conduct operational cost audits
- Set cost-growth thresholds tied to revenue performance
- Reallocate investment toward high-efficiency departments
- Monitor cost growth with automated alerts
