-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT subject FROM subjects;

-- 2. Find all subjects sorted by location
booktown=# SELECT subject, location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT title FROM books WHERE title = 'Little Women';
    title
--------------
 Little Women
(1 row)

-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT subject FROM subjects WHERE location = 'Main St';
     subject
-----------------
 Drama
 Entertainment
 Romance
 Science Fiction
(4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT books.title FROM books
booktown-# JOIN subjects
booktown-# ON books.subject_id = subjects.id
booktown-# WHERE subjects.subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books
JOIN authors ON authors.id = books.author_id
JOIN subjects ON subjects.id = books.subject_id;

-- 8. Find all books that are listed in the stock table

SELECT books.title FROM books 
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
GROUP BY books.title;

-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price


SELECT books.title, stock.cost FROM books 
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
ORDER BY stock.cost DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT books.title, editions.isbn, publishers.name, stock.cost FROM books
JOIN editions ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT shipments.ship_date, customers.first_name, customers.last_name, books.title FROM books
JOIN editions ON books.id = editions.book_id
JOIN shipments ON editions.isbn = shipments.isbn
Join customers ON shipments.customer_id = customers.id
ORDER BY shipments.ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books; 

-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. 
-- Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, COUNT(editions.book_id) 
FROM books 
JOIN editions 
ON books.id = editions.book_id
GROUP BY books.title;