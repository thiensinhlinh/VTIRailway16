-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS view_account;
CREATE VIEW view_account AS
		SELECT *
		FROM `account`
		JOIN department USING(DepartmentID)
        WHERE DepartmentName = 'sale';
SELECT *
FROM view_account;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS view_account_1;
CREATE VIEW view_account_1 AS 
		SELECT *,COUNT(AccountID),GROUP_CONCAT(GroupID)
		FROM `account`
		JOIN groupaccount USING (AccountID)
		GROUP BY (AccountID)
		HAVING COUNT(AccountID) = (
										SELECT COUNT(AccountID)
										FROM `account`
                                        JOIN groupaccount USING (AccountID)
										GROUP BY (AccountID)
										ORDER BY COUNT(AccountID) DESC
										LIMIT 1
									);                           
SELECT *
FROM view_account_1;
                            
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content lớn hơn 20 từ) và xóa nó đi
DROP VIEW IF EXISTS view_account_3;
CREATE VIEW view_account_3 AS
		SELECT *,length(content)
        FROM question
        WHERE length(content) < 20;
SELECT	*
FROM view_account_3;

-- Question 4: Tạo view có chứa danh sách phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS view_account_4;
CREATE VIEW view_account_4 AS 
		SELECT DepartmentName,COUNT(DepartmentID) AS 'Số NV'
		FROM department
		JOIN `account` USING (DepartmentID)
		GROUP BY (DepartmentID)
		HAVING COUNT(DepartmentID) = (
										SELECT COUNT(DepartmentID)
										FROM department
                                        JOIN `account` USING (DepartmentID)
										GROUP BY (DepartmentID)
										ORDER BY COUNT(DepartmentID) DESC
										LIMIT 1
									);
SELECT *
FROM view_account_4;                      

-- Question 5: Tạo view có chứa tất cả các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS view_account_5;
CREATE VIEW view_account_5 AS
		SELECT QuestionID,Content,A.*
        FROM question Q
        JOIN `account` A ON Q.CreatorID = A.AccountID
        WHERE FullName LIKE ('nguyen%') ;
SELECT *
FROM view_account_5;
