
select A.* , D.DepartmentName
from `account` A
join  `department` D
on A.DepartmentID = D.DepartmentID
order by PositionID;

select * from `account`
where CreateDate > '2010-12-20';

select A.* , P.PositionName
From `account` A
join `position` P
on A.PositionID = P.PositionID
where P.PositionName = 'Dev';

select DepartmentID, Count(DepartmentID) SL
from `account`
group by DepartmentID
having count(DepartmentID) >3
order by SL;

with `CTE_Count_Q` as (
select Q.QuestionID, Q.Content, count(Q.QuestionID) as SL
from `question` Q 
join `examquestion` EQ on Q.QuestionID = EQ.QuestionID
group by QuestionID
)
select * From `CTE_Count_Q`
where SL = (select max(SL) from `CTE_Count_Q`);

select CQ.categoryid, CQ.categoryName, count(Q.categoryID) as SL
from `categoryquestion` CQ
join `question` Q
on CQ.CategoryID = Q.CategoryID
Group by CategoryID
order by CategoryID;

Select Q.QuestionID, Q.Content, count(EQ.questionID) AS SL
From `Question` Q
Left Join `Examquestion` EQ ON Q.QuestionID = EQ.QuestionID
Group BY questionID;

select Q.QuestionID, Q.Content, count(A.QuestionID) 
From answer A
Join Question Q ON Q.QuestionID = A.QuestionID
Group by A.QuestionID
having count(A.QuestionID) = (Select max(countQues) From
(select count(B.QuestionID) AS countQues From answer B
group by B.QuestionID) AS countAnsw);

SELECT 
    G.GroupID, G.GroupName, COUNT(GA.AccountID) AS 'SLACCOUNT'
FROM
    `GroupAccount` GA JOIN
    `Group` G 
ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
ORDER BY G.GroupID;

-- Câu 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT d.DepartmentID,d.DepartmentName, p.PositionName, COUNT(p.PositionName) AS SLNV
FROM `Account` a
JOIN `Department` d ON a.DepartmentID = d.DepartmentID
JOIN `Position` p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, p.PositionID
ORDER BY DepartmentID;


