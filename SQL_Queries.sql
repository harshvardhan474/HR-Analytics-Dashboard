-- HR Analytics Dashboard - SQL Queries
-- Table name assumed: Employee

-- 1. Total employees
SELECT COUNT(*) AS TotalEmployees
FROM Employee;

-- 2. Employees who left
SELECT COUNT(*) AS EmployeesLeft
FROM Employee
WHERE Attrition = 'Yes';

-- 3. Attrition rate
SELECT
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM Employee;

-- 4. Employees by department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department
ORDER BY EmployeeCount DESC;

-- 5. Attrition by department
SELECT Department,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
FROM Employee
GROUP BY Department;

-- 6. Average salary by department
SELECT Department, ROUND(AVG(Salary), 2) AS AverageSalary
FROM Employee
GROUP BY Department
ORDER BY AverageSalary DESC;

-- 7. Attrition by work mode
SELECT WorkMode, Attrition, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY WorkMode, Attrition
ORDER BY WorkMode, Attrition;

-- 8. Gender distribution
SELECT Gender, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Gender;

-- 9. High-performing employees
SELECT EmployeeID, EmployeeName, Department, JobRole, Salary, PerformanceRating
FROM Employee
WHERE PerformanceRating >= 5
ORDER BY Salary DESC;

-- 10. Salary vs experience
SELECT Experience, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Experience
ORDER BY Experience;
