USE TestingSystem;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT *
FROM `account`
JOIN department
USING (DepartmentID);

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
WHERE CreateDate > '2020-12-20 00:00:00';

-- Question 3: Viết lệnh để lấy ra tất cả các developer  
SELECT *
FROM `account`
JOIN position
USING (PositionID)
WHERE PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên 
SELECT DepartmentID,DepartmentName,COUNT(DepartmentID)
FROM department
JOIN `account`
USING (DepartmentID)
GROUP BY (DepartmentID)
HAVING COUNT(DepartmentID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT QuestionID
FROM question
JOIN examquestion
USING (QuestionID)
GROUP BY (QuestionID)
HAVING COUNT(QuestionID) = (
								SELECT COUNT(QuestionID)
                                FROM examquestion
                                GROUP BY (QuestionID)
                                ORDER BY COUNT(QuestionID) DESC
                                LIMIT 1
							);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT *,COUNT(CategoryID),CategoryName
FROM question
JOIN categoryquestion
USING (CategoryID)
GROUP BY CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 
SELECT 	QuestionID 			AS 'Câu hỏi dạng',
		COUNT(QuestionID) 	AS 'Có' 
FROM examquestion
JOIN exam USING (ExamID)
GROUP BY QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất 
SELECT QuestionID,COUNT(QuestionID) AS 'Số câu TL'
FROM answer
GROUP BY (QuestionID)
HAVING COUNT(QuestionID) = (
							SELECT COUNT(QuestionID)
                            FROM answer
                            GROUP BY (QuestionID)
                            ORDER BY COUNT(QuestionID) DESC
                            LIMIT 1
							);

-- Question 9: Thống kê số lượng account trong mỗi group  
SELECT  GroupID,GroupName,
		COUNT(AccountID)	AS 'Số Tk',
		GROUP_CONCAT(AccountID) AS 'ID tk'
FROM `group`
JOIN groupaccount USING (GroupID)
GROUP BY (GroupID);

-- Question 10: Tìm chức vụ có ít người nhất
SELECT DepartmentID,DepartmentName,
		COUNT(DepartmentID) AS 'Số NV'
FROM `account`
JOIN department USING (DepartmentID)
GROUP BY (DepartmentID)
HAVING COUNT(DepartmentID) = (
								SELECT COUNT(DepartmentID)
                                FROM `account`
                                GROUP BY (DepartmentID)
                                ORDER BY COUNT(DepartmentID) ASC
                                LIMIT 1
								);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT DepartmentName, COUNT(a.PositionID), PositionName
FROM Account a 
JOIN department d ON a.DepartmentID = d.DepartmentID
JOIN position p ON a.PositionID = p.PositionID
GROUP BY a.DepartmentID, a.positionID; 

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: 
-- thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 
SELECT Q.*,A.AccountID,A.FullName,AnswerID
FROM question Q
JOIN `account` A ON Q.CreatorID = A.AccountID
JOIN answer USING (QuestionID)
GROUP BY Q.CreatorID,QuestionID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT COUNT(TypeID) AS 'ĐẾM',TypeID
FROM question
GROUP BY (TypeID)
HAVING COUNT(TypeID) = (
						SELECT COUNT(TypeID)
                        FROM question
                        GROUP BY (TypeID)
                        ORDER BY (TypeID) ASC 
                        );

-- Question 14:Lấy ra group không có account nào 
SELECT *
FROM `group`
WHERE GroupID NOT IN (
						SELECT GroupID
                        FROM groupaccount
						);

-- Question 15: Lấy ra group không có account nào 
-- Question 16: Lấy ra question không có answer nào 
SELECT *
FROM Question
WHERE QuestionID NOT IN (
							SELECT QuestionID
							From Answer
                            );

-- Question 17:  
-- a)	Lấy các account thuộc nhóm thứ 1 
SELECT FullName
FROM `account` A
JOIN groupaccount G ON A.AccountID = G.AccountID
WHERE GroupID = 1;

-- b)	Lấy các account thuộc nhóm thứ 2 
SELECT FullName
FROM `account` A
JOIN groupaccount G ON A.AccountID = G.AccountID
WHERE GroupID = 2;

-- c)	Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
 SELECT FullName,GroupID
FROM `account` A
JOIN groupaccount G ON A.AccountID = G.AccountID
WHERE GroupID = 1
UNION
SELECT FullName,GroupID
FROM `account` A
JOIN groupaccount G ON A.AccountID = G.AccountID
WHERE GroupID = 2;

-- Question 18:  
-- a)	Lấy các group có lớn hơn 5 thành viên 
SELECT G.GroupID,G.GroupName,COUNT(GA.AccountID) AS 'Số Lượng'
FROM `group` G
JOIN groupaccount GA ON G.GroupID = GA.GroupID
GROUP BY (GA.GroupID)
HAVING COUNT(AccountID) >= 5;

-- b)	Lấy các group có nhỏ hơn 7 thành viên 
SELECT G.GroupID,G.GroupName,COUNT(GA.AccountID) AS 'Số Lượng'
FROM `group` G
JOIN groupaccount GA ON G.GroupID = GA.GroupID
GROUP BY (GA.GroupID)
HAVING COUNT(AccountID) <= 7;

-- c)	Ghép 2 kết quả từ câu a) và câu b) 
SELECT G.GroupID,G.GroupName,COUNT(GA.AccountID) AS 'Số Lượng'
FROM `group` G
JOIN groupaccount GA ON G.GroupID = GA.GroupID
GROUP BY (GA.GroupID)
HAVING COUNT(AccountID) >= 5
UNION
SELECT G.GroupID,G.GroupName,COUNT(GA.AccountID) AS 'Số Lượng'
FROM `group` G
JOIN groupaccount GA ON G.GroupID = GA.GroupID
GROUP BY (GA.GroupID)
HAVING COUNT(AccountID) <= 7;