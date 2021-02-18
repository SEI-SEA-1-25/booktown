-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects; 

-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
WHERE title = ('Little Women');

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE string = 'Python';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT b.title, s.subject 
FROM books b
JOIN subjects 
ON ssE s.subject = 'Computers';

SELECT b.title, s.subject -- Start with ????? and fill in last
FROM books b
JOIN subjects s
ON s.id  = b.subject_id
WHERE s.subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
SELECT books.title, s.retail      -- grabbing two columns
FROM books b
JOIN editions e ON b.id =e.book_ie    ---- data from one column
JOIN stock s ON s.isbn = e.isbn       ----- data from the other column
ORDER BY s.retail DESC;



-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns



SELECT books.title, editions.isbn, publishers.name, stock. retail
FROM editions
JOIN books ON editions.book_id = books.id
JOIN stock ON  stock.isbn = editions.isbnWHERE books.title = 'Dune';


-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM shipments
join customers ON customers.id = shipments.customer_id
JOIN editions ON shipments.isbn = editions.book_id
ORDER BY shipments.ship-DATE desc;




-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;


SELECT COUNT(location) FROM subjetcs;

-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjetcs;

-- can also use distinct 
SELECT COUNT(DISTINCT location) FROM subjetcs;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjetcs GROUP BY location;


-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT editions.book_id, books.title, COUNT(editions.book_id) AS editions
FROM books
JOIN 
GROUP BY editions.book_id; ON books.id = editions.book_id