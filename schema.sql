CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL
);
CREATE TABLE revenue (
    date DATE NOT NULL,
    department_id INTEGER NOT NULL,
    revenue NUMERIC(12,2) NOT NULL,
    PRIMARY KEY (date, department_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE costs (
    date DATE NOT NULL,
    department_id INTEGER NOT NULL,
    cost NUMERIC(12,2) NOT NULL,
    PRIMARY KEY (date, department_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE INDEX idx_revenue_date ON revenue(date);
CREATE INDEX idx_costs_date ON costs(date);
CREATE INDEX idx_revenue_dept ON revenue(department_id);
CREATE INDEX idx_costs_dept ON costs(department_id);
