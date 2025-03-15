WITH RECURSIVE EmployeeHierarchy AS (
    SELECT
        EmployeeID,
        Name,
        ManagerID,
        DepartmentID,
        RoleID
    FROM
        Employees
    WHERE
        EmployeeID = 1
    UNION ALL
    SELECT
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM
        Employees e
    INNER JOIN
        EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
),
EmployeeDetails AS (
    SELECT
        eh.EmployeeID,
        eh.Name AS EmployeeName,
        eh.ManagerID,
        d.DepartmentName,
        r.RoleName,
        STRING_AGG(DISTINCT p.ProjectName, ', ' ORDER BY p.ProjectName) AS ProjectNames,
        STRING_AGG(DISTINCT t.TaskName, ', ' ORDER BY t.TaskName) AS TaskNames
    FROM
        EmployeeHierarchy eh
    LEFT JOIN
        Departments d ON eh.DepartmentID = d.DepartmentID
    LEFT JOIN
        Roles r ON eh.RoleID = r.RoleID
    LEFT JOIN
        Projects p ON p.DepartmentID = eh.DepartmentID
    LEFT JOIN
        Tasks t ON t.AssignedTo = eh.EmployeeID
    GROUP BY
        eh.EmployeeID, eh.Name, eh.ManagerID, d.DepartmentName, r.RoleName
)
SELECT
    EmployeeID,
    EmployeeName,
    ManagerID,
    DepartmentName,
    RoleName,
    ProjectNames,
    TaskNames
FROM
    EmployeeDetails
ORDER BY
    EmployeeName;
