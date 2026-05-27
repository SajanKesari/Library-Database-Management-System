# 📚 My First SQL Project: Library Database System

Hey there! Welcome to my very first SQL database project. I built this database to figure out how real businesses track their inventory, members, and daily transactions without relying on messy spreadsheets. 

This project models a functioning community library system, keeping everything cleanly organized, linked, and ready to query.

---

## 🏗️ Database Setup & Structure
I created a relational database named `LibraryDB` from scratch. Instead of throwing everything into one giant, confusing sheet, I broke the data down into 5 distinct, connected tables:

* **`Authors` Table:** Stores author profiles separately so we write a creator's name and nationality exactly once.
* **`Books` Table:** Tracks our core inventory. It tracks titles, unique ISBN codes, and stock. I set up defaults here so that if a book exists in our system, it automatically defaults to having at least 1 total and 1 available copy.
* **`Members` Table:** Keeps a record of our readers, including their names, unique email addresses, and the exact date they joined the library.
* **`Book_Authors` Table:** A bridge table that handles the relationship between books and authors. I set this up with `ON DELETE CASCADE`, meaning if a book or author is removed from the library, this link gets cleaned up automatically.
* **`Loans` Table:** Our transaction engine. It tracks exactly who borrowed what book, when it went out, and when it's due. The status defaults to `'Borrowed'` because that's right where the process starts!

---

## 📊 10 Real-World Queries I Solved
To test the database and extract actual data insights, I wrote and executed 10 specific queries targeting our library's data:

1. **Inventory Check:** Displays all columns and rows for every book stored in our inventory table.
2. **Nationality Filter:** Target filtering to pull the full details of all authors who are 'American'.
3. **Pattern Matching:** Runs a wildcard search to locate all members whose first name starts with the letter 'J'.
4. **Relational Join:** Links the books, authors, and bridge tables to display a clean master list of all book titles alongside their author names.
5. **Asset Aggregation:** Uses the `SUM()` function to count up the total number of physical books owned across the entire library system.
6. **Categorical Grouping:** Uses `GROUP BY` and `COUNT()` to figure out exactly how many authors the library has from each country.
7. **Date Filtering:** Filters the members table using data comparisons to find everyone who joined after January 1st, 2025.
8. **Overdue Tracker:** Joins the members and loans tables to flag the names and emails of readers who currently have a book marked as 'Overdue'.
9. **Stock Discrepancy Math:** Uses dynamic column comparison (`TotalCopies > AvailableCopies`) to instantly show only the titles of books that are currently checked out by readers.
10. **The Popularity Contest:** Combines joins, `COUNT()`, `GROUP BY`, descending sorting, and a `LIMIT 1` constraint to pinpoint the single most popular book based on check-out frequency.

---

## 🚀 How to Spin It Up
1. Open up **MySQL Workbench**.
2. Run the script to create the `LibraryDB` database workspace.
3. Execute the schema file to generate the tables, load up the sample library data, and watch the queries do their magic!

***
*Note: This repository marks the official start of my data portfolio. I'm actively learning relational database logic and optimization, so thanks for stopping by to check out my first project!*