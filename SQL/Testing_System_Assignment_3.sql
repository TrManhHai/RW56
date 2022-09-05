

SELECT 
    *
FROM
    `Department`
ORDER BY DepartmentID;

SELECT 
    DepartmentID
FROM
    `Department`
WHERE
    DepartmentName = 'Sale';
    
    select * from `ACCOUNT`
    where length(FULLNAME) = (SELECT max(length(FULLNAME)) from `ACCOUNT`)
    order by ACCOUNTID;
    
    WITH CTE_DEP3 AS (select * from `account` WHERE DepartmentID = 3)
    
    select * FROM `CTE_DEP3`
    WHERE  length(FULLNAME) = (select max(length(FULLNAME)) FROM `CTE_DEP3`)
    order by FULLNAME;
    
SELECT 
    GroupName,
    CreateDate
FROM
    `Group`
where
    CreateDate < '2019-12-20';
    
SELECT QuestionID
FROM
    `Answer`
GROUP BY QuestionID
Having count(QuestionID) >= 4;

SELECT 
    `Code`
FROM
    Exam
WHERE
    Duration >= 60 AND CreateDate < '2019-12-20';
    
SELECT * 
FROM
    `Group`
ORDER BY CreateDate DESC
LIMIT 5;

select
    COUNT(AccountID) AS NumberOfAccount
FROM
    `Account`
WHERE
    DepartmentID = 2;
    
    
    SELECT 
    Fullname
FROM
    `Account`
WHERE
    FullName LIKE 'D%o';
    
    
    DELETE FROM Exam 
WHERE
    CreateDate < '2019-12-20';
    
DELETE FROM `Question` 
WHERE
    (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi';
    
SELECT (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi' FROM `Question`;

UPDATE `Account`
SET Fullname = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

UPDATE `GroupAccount` 
SET 
    AccountID = 5
WHERE
    GroupID = 4;
    
    


    