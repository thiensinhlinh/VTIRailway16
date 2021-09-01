USE TestingSystem;

-- Question 2: lấy ra tất cả các phòng ban 
SELECT DepartmentName
FROM department;

-- Question 3: lấy ra id của phòng ban "Sale" 
SELECT DepartmentID
FROM department
WHERE DepartmentName = "Sale";

-- Question 4: lấy ra thông tin account có full name dài nhất 
SELECT *,length(FullName) AS "Độ dài"
FROM `account`
ORDER BY length(FullName) DESC;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 
SELECT *,MAX(LENGTH(FullName)) AS "Độ dài tên"
FROM `account`
WHERE DepartmentID=3;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT GroupName
FROM `group`
WHERE CreateDate < "2019-12-20 00:00:00";

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời 
-- SELECT 



-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
SELECT `Code`
FROM exam
WHERE Duration >= 60 AND CreateDate <= "2019-12-20 00:00:00";

-- Question 9: Lấy ra 5 group được tạo gần đây nhất 
SELECT GroupName,CreateDate
FROM `group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2 
SELECT COUNT(DepartmentID) AS "Số NV"
FROM `account`
WHERE DepartmentID=2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT FullName
FROM `account`
WHERE FullName LIKE "%D%o";

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019 
SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM exam
WHERE CreateDate < "2019-12-20 00:00:00"; 
SELECT * 
FROM exam;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM question
WHERE Content LIKE "Câu hỏi%";
SELECT *
FROM question;

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET FullName = "Nguyễn Bá Lộc", Email = "loc.nguyenba@vti.com.vn"
WHERE AccountID=5;
SELECT *
FROM `account`
WHERE AccountID=5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
SET foreign_key_checks=0;
UPDATE groupaccount
SET GroupID = 4
WHERE AccountID = 5;
SELECT *
FROM groupaccount
WHERE AccountID = 5;
