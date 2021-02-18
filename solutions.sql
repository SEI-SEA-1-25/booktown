-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects;
-- 2. Find all subjects sorted by location
SELECT location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books 
JOIN subjects 
ON books.subject_id = subjects.id
WHERE subjects.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
SELECT b.title, a.first_name, a.last_name, s.subject 
FROM books b
JOIN authors a ON b.subject_id = a.id 
JOIN subjects s ON b.subject_id = s.id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON s.isbn = e.isbn;
GROUP BY s.retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, e.isbn, p.name, s.retail FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON s.isbn = e.isbn
JOIN publishers p ON p.id = e.publisher_id;

-- 10. Find all shipments sorted by ship date display a 
--     result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title FROM editions e 
JOIN books b ON e.book_id = b.id 
JOIN shipments s ON s.isbn = e.isbn
JOIN customers c ON c.id = s.customer_id;


-- ### Grouping and Counting
-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(*) FROM locations;
-- 13. Get the COUNT of each unique location in the subjects table. 
--     Display the count and the location name. 
--     (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. 
--     Display the book_id, title, and a count of 
--     how many editions each book has. 
--     (hint: requires GROUP BY and JOIN)
SELECT COUNT(e.book_id), b.title
FROM books b
JOIN editions e ON b.id = e.book_id
GROUP BY b.title;


-- SELECT b.title, COUNT(e.book_id) AS editions
-- FROM books b
-- JOIN editions e
-- ON b.id = e.book_id
-- GROUP BY b.title;