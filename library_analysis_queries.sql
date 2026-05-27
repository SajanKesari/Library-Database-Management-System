-- ==============================================================================
-- PROJECT PORTFOLIO FILE: library_analysis_queries.sql
-- DESCRIPTION: Core Analytical and Verification Queries for LibraryDB
-- AUTHOR: Sajan Kesari (Future Data Analyst)
-- DATE: May 2026
-- ==============================================================================

USE LibraryDB;

-- ------------------------------------------------------------------------------
-- Q1: Basic Retrieval
-- Purpose: Display all columns and rows for all books stored in the inventory.
-- ------------------------------------------------------------------------------
SELECT 
    BookID, 
    Title, 
    ISBN, 
    PublishedYear, 
    TotalCopies, 
    AvailableCopies
FROM Books;


-- ------------------------------------------------------------------------------
-- Q2: Target Demographic Filtering
-- Purpose: Find full details of all authors whose nationality is exactly 'American'.
-- ------------------------------------------------------------------------------
SELECT 
    AuthorID, 
    AuthorName, 
    Nationality
FROM Authors
WHERE Nationality = 'American';


-- ------------------------------------------------------------------------------
-- Q3: Pattern Matching / Wildcard Search
-- Purpose: Locate all library members whose first name begins with the letter 'J'.
-- ------------------------------------------------------------------------------
SELECT 
    MemberID, 
    FirstName, 
    LastName, 
    Email, 
    JoinDate
FROM Members
WHERE FirstName LIKE 'J%';


-- ------------------------------------------------------------------------------
-- Q4: Multi-Table Relational Join (Many-to-Many Bridge)
-- Purpose: Extract full cross-reference list of book titles alongside their authors.
-- ------------------------------------------------------------------------------
SELECT 
    b.Title, 
    a.AuthorName
FROM Books b
JOIN Book_Authors ba ON b.BookID = ba.BookID
JOIN Authors a      ON ba.AuthorID = a.AuthorID;


-- ------------------------------------------------------------------------------
-- Q5: System Aggregation (Asset Valuation)
-- Purpose: Compute the total quantity of physical books owned by the library.
-- ------------------------------------------------------------------------------
SELECT 
    SUM(TotalCopies) AS TotalLibraryVolume
FROM Books;


-- ------------------------------------------------------------------------------
-- Q6: Categorical Grouping & Frequency Analysis
-- Purpose: Group authors by geographical origin and calculate regional frequencies.
-- ------------------------------------------------------------------------------
SELECT 
    Nationality, 
    COUNT(*) AS AuthorCount
FROM Authors
GROUP BY Nationality;


-- ------------------------------------------------------------------------------
-- Q7: Chronological / Range Filtering
-- Purpose: Identify active member cohorts who registered after January 1st, 2025.
-- ------------------------------------------------------------------------------
SELECT 
    MemberID, 
    FirstName, 
    LastName, 
    Email, 
    JoinDate
FROM Members
WHERE JoinDate > '2025-01-01';


-- ------------------------------------------------------------------------------
-- Q8: Conditional Multi-Table Join (Risk Mitigation)
-- Purpose: Isolate personal profiles of members holding critically overdue loans.
-- ------------------------------------------------------------------------------
SELECT 
    m.FirstName, 
    m.LastName, 
    m.Email
FROM Members m
INNER JOIN Loans l ON m.MemberID = l.MemberID
WHERE l.Status = 'Overdue';


-- ------------------------------------------------------------------------------
-- Q9: Dynamic Column Mathematical Comparisons
-- Purpose: Filter down to books that currently have active, unreturned copies on loan.
-- ------------------------------------------------------------------------------
SELECT 
    Title,
    (TotalCopies - AvailableCopies) AS ActiveCopiesOnLoan
FROM Books
WHERE TotalCopies > AvailableCopies;


-- ------------------------------------------------------------------------------
-- Q10: Top-N Performance Subquery / Ranking Analytics
-- Purpose: Determine the single most popular book based on lifetime issue frequency.
-- ------------------------------------------------------------------------------
SELECT 
    b.Title, 
    COUNT(l.LoanID) AS TimesIssued
FROM Loans l
INNER JOIN Books b ON l.BookID = b.BookID
GROUP BY b.BookID, b.Title
ORDER BY TimesIssued DESC
LIMIT 1;