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
