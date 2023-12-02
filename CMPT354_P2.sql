-- Part 2: FD and Normalization
CREATE DATABASE relation;
USE relation;

-- Not normalized structure
CREATE TABLE R (
  S char(20), -- Student
  A char(20), -- Address
  C char(20), -- Course
  D char(20), -- Department
  T char(20)  -- Teacher
);

INSERT INTO R (S, A, C, T, D) VALUES
('Student1', 'Address1', 'Course1', 'Department1', 'Teacher1'),
('Student1', 'Address1', 'Course2', 'Department2', 'Teacher2'),
('Student2', 'Address2', 'Course1', 'Department1', 'Teacher1'),
('Student2', 'Address2', 'Course3', 'Department3', 'Teacher3');

-- Normalization structure
CREATE TABLE Students (
  S char(20) PRIMARY KEY,
  A char(20)
);

CREATE TABLE Teachers (
  T char(20) PRIMARY KEY,
  D char(20)
);

CREATE TABLE Courses (
  C char(20),
  S char(20),
  T char(20),
  PRIMARY KEY (C, S),
  FOREIGN KEY (S) REFERENCES Students(S),
  FOREIGN KEY (T) REFERENCES Teachers(T)
);

INSERT INTO Students (S, A) VALUES
('Student1', 'Address1'),
('Student2', 'Address2');

INSERT INTO Teachers (T, D) VALUES
('Teacher1', 'Department1'),
('Teacher2', 'Department2'),
('Teacher3', 'Department3');

INSERT INTO Courses (C, S, T) VALUES
('Course1', 'Student1', 'Teacher1'),
('Course2', 'Student1', 'Teacher2'),
('Course1', 'Student2', 'Teacher1'),
('Course2', 'Student2', 'Teacher3');
