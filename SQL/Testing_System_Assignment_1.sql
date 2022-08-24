Drop database if exists Testing_System_Assignment_1;
Create database Testing_System_Assignment_1;

Use Testing_System_Assignment_1;

Drop table if exists `Department`;
create table `Department`(
	DepartmentID tinyint unsigned auto_increment primary key,
    DepartmentName VARCHAR(30) not null UNIQUE KEY
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum','PM') not null unique key
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) not null UNIQUE,
    Username VARCHAR(50) not null unique,
    FullName VARCHAR(50) not null,
    DepartmentID TINYINT UNSIGNED not NULL,
    PositionID TINYINT UNSIGNED not NULL,
    CreateDate  DATETIME DEFAULT NOW(),
    Foreign key(DepartmentID) references Department(DepartmentID),
    Foreign key(PositionID) References `Position`(PositionID)
);


DROP TABLE if exists `Group`;
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY key,
    GroupName VARCHAR(50) not NULL UNIQUE KEY,
    CreatorID TINYINT UNSIGNED,
    Creatdate DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
    );
    
    Drop TABLE IF EXISTS `GroupAccount`;
    CREATE TABLE `GroupAccount`(
		GroupID TINYINT UNSIGNED Not null,
        AccountID TINYINT UNSIGNED Not null,
        JoinDate DATETIME DEFAULT NOW(),
        PRIMARY KEY (GroupID,AccountID),
        Foreign Key(GroupID) References `Group`(GroupID),
        FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
        );
        
        DROP TABLE IF EXISTS `TypeQuestion`;
        CREATE TABLE `TypeQuesion` (
			TypeID Tinyint unsigned auto_increment primary key,
            TypeName ENUM('Essay','Multiple-Choise') not null unique key
		);
        
        DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE CategoryQuestion(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	TypeID TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	isCorrect BIT DEFAULT 1,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code` CHAR(10) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	Duration TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID TINYINT UNSIGNED NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
	PRIMARY KEY (ExamID,QuestionID)
);

        
        