-- 1. Create and select the database workspace
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2. Create independent tables first (Tables w/o FOREIGN KEYS)
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL, -- Using NOT NULL for mandatory fields
    Nationality VARCHAR(50)
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedYear INT,
    TotalCopies INT NOT NULL DEFAULT 1, -- If book is mentioned in database atleast 1 copies is there hence default 1
    AvailableCopies INT NOT NULL DEFAULT 1 -- The Library should have 1 available copy if nothing is mentioned
);

-- 3. The library memeber (reader) table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- 4. Create dependent tables (Tables that link to others)
CREATE TABLE Book_Authors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE, -- If the source is deleted this instance will be deleted as well.
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);


-- 5. Ceating a table for issued books (Should require BookID and MemberID)
CREATE TABLE Loans (              
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NULL,
    Status ENUM('Borrowed', 'Returned', 'Overdue') DEFAULT 'Borrowed', -- setting the default to borrowed cause that is where the process starts haha 
    FOREIGN KEY (BookID) REFERENCES Books(BookID),  
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);




