-- ========================================================
-- PROJECT FILE: library_data_insertion.sql
-- PURPOSE: Populates the LibraryDB system using exact schema casing
-- ========================================================

USE LibraryDB;

-- 1. Populate the Authors Table
INSERT INTO Authors (AuthorName, Nationality) VALUES
('George Orwell', 'British'),
('J.K. Rowling', 'British'),
('Harper Lee', 'American'),
('Stephen King', 'American');

-- 2. Populate the Books Table
INSERT INTO Books (Title, ISBN, PublishedYear, TotalCopies, AvailableCopies) VALUES
('1984', '9780451524935', 1949, 5, 3),
('Harry Potter and the Philosophers Stone', '9780747532699', 1997, 8, 7),
('To Kill a Mockingbird', '9780061120084', 1960, 4, 4),
('The Shining', '9780307743657', 1977, 3, 2);

-- 3. Populate the Book_Authors Bridge Table (Links BookID to AuthorID)
INSERT INTO Book_Authors (BookID, AuthorID) VALUES
(1, 1), -- 1984 written by George Orwell
(2, 2), -- Harry Potter written by J.K. Rowling
(3, 3), -- To Kill a Mockingbird written by Harper Lee
(4, 4); -- The Shining written by Stephen King

-- 4. Populate the Members Table (Matching FirstName and LastName split)
INSERT INTO Members (FirstName, LastName, Email, JoinDate) VALUES
('John', 'Doe', 'john.doe@email.com', '2025-01-15'),
('Jane', 'Smith', 'jane.smith@email.com', '2025-02-20'),
('Alice', 'Johnson', 'alice.j@email.com', '2025-03-10');

-- 5. Populate the Loans Table (Matching BookID, MemberID, and ENUM Statuses)
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate, ReturnDate, Status) VALUES
(1, 1, '2026-05-01', '2026-05-15', '2026-05-14', 'Returned'), 
(1, 2, '2026-05-10', '2026-05-24', NULL, 'Overdue'),          
(2, 1, '2026-05-20', '2026-06-03', NULL, 'Borrowed'),          
(4, 3, '2026-05-12', '2026-05-26', NULL, 'Borrowed');