-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books
WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books
WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects
WHERE subject.location = 'Main St'
ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title
FROM books
JOIN subjects ON books.subject_id = subjects.id 
WHERE subjects.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books
JOIN authors ON books.author_id = authors.id
JOIN subjects ON books.subject_id = subjects.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail
FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON s.isbn = e.isbn
ORDER BY s.retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retial
FROM editions
JOIN books ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
JOIN publishers ON editions.publisher_id = publishers.id
WHERE books.title = 'Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customer.first_name, customer.last_name, shipments.ship_date, books.title
FROM shipments
JOIN customers ON customers.id = shipments.cutomer_id
JOIN editions ON shipments.isbn = editions.isbn
JOIN books ON books.id = editions.book_id
ORDER BY shipments.ship_date DESC;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) 
FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) 
FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, 
COUNT(location) 
FROM subjects 
GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT editions.book_id, books.title, 
COUNT(editions.book_id)
AS editions
FROM books
JOIN editions ON books.id = editions.book_id
GROUP BY editions.book_id, books.title;
