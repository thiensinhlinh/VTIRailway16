-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DROP PROCEDURE IF EXISTS get_all_account_of_deparment;
DELIMITER $$
CREATE PROCEDURE get_all_account_of_deparment(IN tenPhongBan NVARCHAR(50))
	BEGIN
		SELECT *
        FROM `account`
        JOIN department USING (DepartmentID)
        WHERE DepartmentName = tenPhongBan;
    END $$
DELIMITER ;
CALL get_all_account_of_deparment('BẢO VỆ');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS question_2;
DELIMITER $$
CREATE PROCEDURE question_2()
	BEGIN
		SELECT GroupID,GroupName,
				COUNT(AccountID) AS 'SỐ LƯỢNG'
        FROM `group`
        JOIN groupaccount USING (GroupID)
        GROUP BY (GroupID);
    END $$
DELIMITER ;
CALL question_2();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DROP PROCEDURE IF EXISTS question_3;
DELIMITER $$
CREATE PROCEDURE question_3()
	BEGIN
		SELECT TypeID,TypeName,
				COUNT(TypeID) AS 'SỐ LƯỢNG'
        FROM typequestion
        JOIN question USING (TypeID)
        WHERE month(CreateDate) = month(NOW()) AND  year(CreateDate) = year(NOW())
        GROUP BY (TypeID);
	END $$
DELIMITER ;
CALL question_3();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS question_4;
DELIMITER $$
CREATE PROCEDURE question_4()
	BEGIN
		SELECT TypeID,
				COUNT(QuestionID) AS 'SỐ LƯỢNG'
        FROM question
        GROUP BY (TypeID);
    END $$
DELIMITER ;
CALL question_4();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS question_5;
DELIMITER $$
CREATE PROCEDURE question_5()
	BEGIN
		SELECT TypeID,TypeName,
				COUNT(QuestionID) AS 'SỐ LƯỢNG'
        FROM question
        JOIN typequestion USING (TypeID)
        GROUP BY (TypeID);    
    END $$
DELIMITER ;
CALL question_5();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS question_6;
DELIMITER $$
CREATE PROCEDURE question_6(IN ThongTinTimKiem NVARCHAR(50))
	BEGIN
		SELECT GroupName,FullName
        FROM `group` G
        JOIN `account` A ON G.CreatorID = A.AccountID
        WHERE Username LIKE ('%'+ThongTinTimKiem+'%')
        GROUP BY (G.CreatorID);
    END $$
DELIMITER ;
call testingsystem.question_6('dangblack');


/* Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
trong store sẽ tự động gán:
username sẽ giống email nhưng bỏ phần @..mail đi
positionID: sẽ có default là developer
departmentID: sẽ được cho vào 1 phòng chờ
Sau đó in ra kết quả tạo thành công
*/

-- Question 8: Viết 1 store cho phép người dùng nhập vào  hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS question_8;
DELIMITER $$
CREATE PROCEDURE question_8(IN NHAP ENUM('Essay','Multiple-Choice'))
	BEGIN
		SELECT QuestionID,
				length(Content) AS 'Độ dài CH'
        FROM question
        WHERE TypeID = NHAP AND 
				length(Content) = (
									SELECT MAX(length(Content))
                                    FROM question
                                    JOIN typequestion USING (TypeID)
                                    WHERE TypeID = NHAP
									)
		;
    END$$
DELIMITER ;
CALL question_8('Essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
SET foreign_key_checks=0;
DROP PROCEDURE IF EXISTS question_9;
DELIMITER $$
CREATE PROCEDURE question_9(IN ID_exam TINYINT)
	BEGIN
		DELETE
        FROM  exam
        WHERE ExamID = ID_exam
        ;
    END$$
DELIMITER ;
CALL question_9(1);
SELECT * 
FROM exam;

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
SET foreign_key_checks=0;
DROP PROCEDURE IF EXISTS question_10;
DELIMITER $$
CREATE PROCEDURE question_10()
	BEGIN
		DELETE
        FROM  exam
        WHERE CreateDate = ID_exam
        ;
    END$$
DELIMITER ;
CALL question_10();
SELECT * 
FROM exam;


Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
chuyển về phòng ban default là phòng ban chờ việc
Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
nay2
Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
tháng gần đây nhất
(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong
tháng")