CREATE DATABASE StudentsDB;
USE StudentsDB;

CREATE TABLE Students (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

CREATE TABLE Marks (
    Id INT PRIMARY KEY,
    StudentId INT FOREIGN KEY REFERENCES Students(Id),
    Mark INT NOT NULL
);

INSERT INTO Students (Id, Name, Age) VALUES
(1, 'Alice', 18),
(2, 'Bobby', 20),
(3, 'Ann', 22),
(4, 'Nastya', 20),
(5, 'Eva', 18);

INSERT INTO Marks (Id, StudentId, Mark) VALUES
(9, 6, 85),
(10, 6, 90),
(11, 7, 78),
(12, 7, 92),
(13, 8, 85),
(14, 8, 88),
(15, 8, 90);

SELECT * FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students);

SELECT Age, COUNT(*) AS StudentCount
FROM Students
GROUP BY Age
HAVING COUNT(*) > 1;

SELECT S.Id, S.Name, AVG(M.Mark) AS AvgMark
FROM Students S
JOIN Marks M ON S.Id = M.StudentId
GROUP BY S.Id, S.Name
HAVING AVG(M.Mark) > 80;
