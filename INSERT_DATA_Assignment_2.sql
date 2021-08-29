-- INSERT DATA
USE Testing_System_Assignment_2;

-- thêm mới dữ liệu vào Department
INSERT INTO Department	(DepartmentName )
VALUES 					(N'Marketing'	),
						(N'Bảo Vệ'		),
                        (N'Kỹ Thuật'	),
                        (N'Nhân Sự'		),
                        (N'Tài Chính'	);
SELECT * FROM Department;
 
-- thêm mới dữ liệu vào `Position`
INSERT INTO `Position`(PositionName)
VALUES 					('Dev'			),
						('Test'			),
                        ('Scrum Master' ),
                        ('PM'			);
SELECT * FROM `Position`;
 
-- thêm mới dữ liệu vào `Account`
INSERT INTO	 `Account`(Email 						, Username 		 ,  FullName 		, DepartmentID  , PositionID)
VALUES 					('nguyenvanA1@gmail.com' 	, 'A1'			 , 'nguyenvan' 		,	 1 			,		 1	),
						('nguyenvanA2@gmail.com' 	, 'A2'			 , 'nguyenvan' 		,	 2 			,		 1	),
                        ('nguyenvanA3@gmail.com' 	, 'A3'			 , 'nguyenvan' 		,	 3 			,		 1	),
                        ('nguyenvanA4@gmail.com' 	, 'A4'			 , 'nguyenvan' 		,	 4 			,		 1	),
                        ('nguyenvanA5@gmail.com' 	, 'A5'			 , 'nguyenvan' 		,	 5 			,		 1	);
SELECT * FROM `Account`;   
 
-- thêm mới dữ liệu vào `Group`
INSERT INTO	 `Group`(GroupName	,	CreatorID)
VALUES 				(N'Nhóm 1'	,	1		),
					(N'Nhóm 2'	,	2		),
					(N'Nhóm 3'	,	3		),
					(N'Nhóm 4'	,	4		),
                    (N'Nhóm 5'	,	5		);	
SELECT * FROM `Group`; 

-- thêm mới dữ liệu vào GroupAccount
INSERT INTO	 GroupAccount(GroupID,	AccountID)
VALUES					 ( 1	 ,	5		),
						 ( 2	 ,	3		),
                         ( 3	 ,	1		),
                         ( 4	 ,	2		),
                         ( 5	 ,	4		);
SELECT * FROM GroupAccount; 

-- thêm mới dữ liệu vào TypeQuestion
INSERT INTO	 TypeQuestion(TypeName)
VALUES					 ( 'Essay'				),
						 ( 'Multiple-Choice'	),
                         ( 'Essay' 				),
                         ( 'Essay' 				),
                         ( 'Multiple-Choice'	);
SELECT * FROM TypeQuestion; 

-- thêm mới dữ liệu vào CategoryQuestion
INSERT INTO	 CategoryQuestion(CategoryName)
VALUES						 ( 'Java'	),
							 ( 'Postman'),
							 ( 'SQL' 	),
							 ( 'Ruby'	),
							 ( 'NET'	);
SELECT * FROM CategoryQuestion; 

-- thêm mới dữ liệu vào Question
INSERT INTO	 Question(Content	,	CategoryID	,	TypeID	,	CreatorID)
VALUES				 ('1+1'  	,	1			,	1	   	,	1		),
					 ('1+2'  	,	1			,	2	   	,	3		),
                     ('1+3'  	,	1			,	3	   	,	5		),
                     ('1+4'  	,	1			,	4	   	,	4		),
                     ('1+5'  	,	1			,	5	   	,	2		);
SELECT * FROM Question; 

-- thêm mới dữ liệu vào Answer
INSERT INTO	 Answer	 (Content	 ,	QuestionID 		,	isCorrect)
VALUES				 ('2' 		 ,	1		   		,	'T'		),
					 ('3' 		 ,	5		 		,	'T'		),
                     ('3' 		 ,	2		 	  	,	'F'		),
                     ('4' 		 ,	4		  		,	'F'		),
                     ('6' 		 ,	3		  		,	'T'		);
SELECT * FROM Answer; 

-- thêm mới dữ liệu vào Exam
INSERT INTO	 Exam	 (CodeExam	,	Title				,	CategoryID	,	Duration	,	CreatorID)
VALUES				 ('A_1'   	,	'Đánh Giá'		 	,	1		  	,		60		,	1 	  	 ),
					 ('A_2'   	,	'Đánh Giá'		    ,	2		  	,		60		,	4		 ),
                     ('A_3'   	,	'Đánh Giá'		    ,	2		  	,		60		,	2		 ),
                     ('B_1'   	,	'Kết Thúc'		    ,	4		  	,		120		,	5		 ),
                     ('B_2'   	,	'Kết Thúc'		    ,	5		  	,		120		,	3		 );
SELECT * FROM Exam; 

-- thêm mới dữ liệu vào ExamQuestion
INSERT INTO	 ExamQuestion	(ExamID		,	QuestionID 	)
VALUES				 		(1		  	,	3		),
							(5			,	1		),
							(2		  	,	4		),
							(4		 	,	5		),
							(3		 	,	2		);
SELECT * FROM ExamQuestion;