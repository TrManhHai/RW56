USE Testing_System_Assignment_1;
SELECT 
    *
FROM
    `Department`
ORDER BY DepartmentID;

-- Câu 3: Lấy ra ID của phòng ban "Sale"
SELECT 
    DepartmentID
FROM
    `Department`
WHERE
    DepartmentName = 'Sale';

-- Câu 4: Lấy ra thông tin account có fullname dài nhất (độ dài số kí tự)
SELECT * FROM `Account` 
WHERE LENGTH(Fullname) = (
	SELECT MAX(LENGTH(Fullname)) FROM `Account`
)
ORDER BY AccountID;

-- Câu 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
WITH CTE_DEP3 AS (
	SELECT * FROM `Account` WHERE DepartmentID = 3
)
SELECT * FROM `CTE_DEP3`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `CTE_DEP3`) 
ORDER BY Fullname;


-- Câu 6: Lấy ra tên group đã tạo trước ngày 20/12/2019
SELECT 
    GroupName,
    CreateDate
FROM
    `Group`
WHERE
    CreateDate < '2019-12-20';

-- Câu 7: Lấy ra ID của Question có >= 4 câu trả lời
SELECT 
    A.QuestionID
FROM
    `Answer` A
GROUP BY A.QuestionID
HAVING COUNT(A.QuestionID) >= 4;

-- Câu 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút ho được tạo trước ngày 20/12/2019
SELECT 
    `Code`
FROM
    `Exam`
WHERE
    Duration >= 60 AND CreateDate < '2019-12-20';
    
-- Câu 9: Lấy ra 5 Group được tạo gần đây nhất
SELECT 
    *
FROM
    `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Câu 10: Đếm số nhân viên thuộc department có id = 2
SELECT 
    COUNT(AccountID) AS NumberOfAccountDepartment2
FROM
    `Account`
WHERE
    DepartmentID = 2;
    
-- Câu 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT 
    Fullname
FROM
    `Account`
WHERE
    FullName LIKE 'D%o';

-- Câu 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM `Exam`
WHERE
    CreateDate < '2019-12-20';

-- Câu 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `Question` 
WHERE
    (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi';
    
SELECT (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi' FROM `Question`;

-- Câu 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account`
SET Fullname = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Câu 15: 
UPDATE `GroupAccount` 
SET 
    AccountID = 5
WHERE
    GroupID = 4;