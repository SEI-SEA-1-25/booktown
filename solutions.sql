-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject ASC;

-- 2. Find all subjects sorted by location
SELECT subject, FROM subjects ORDER BY location ASC;  

                -- or to view both subject and location:

SELECT subject, location  FROM subjects ORDER BY location ASC;


-- ### Where
-- 3. Find the book "Little Women"

SELECT title FROM books WHERE title = 'Little Women';

-- 4. Find all books containing the word "Python"

SELECT title FROM books WHERE title LIKE '%Python%';

-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT subject, location FROM subjects WHERE location IN ('Main St') ORDER BY subjects ASC; 

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

SELECT books.title FROM books
JOIN subjects 
ON subjects.id = books.subject_id 
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

SELECT books.title FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn;


-- 	* Sort them by retail price (most expensive first)
SELECT * FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
ORDER BY stock.retail DESC;

-- 	* Display ONLY: title and price

SELECT books.title, stock.retail FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
ORDER BY stock.retail DESC;


-- 9. Find the book "Dune" and display ONLY the following columns

SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
JOIN publishers ON publishers.id = editions.publisher_id
WHERE books.title = 'Dune';


-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price



-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:


SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title  FROM shipments

JOIN customers ON customers.id = shipments.customer_id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON editions.book_id = books.id 
ORDER BY shipments.ship_date DESC;

-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting


-- 11. Get the COUNT of all books

    SELECT COUNT(id) FROM books;

-- 12. Get the COUNT of all Locations

SELECT COUNT (location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT COUNT(location), location FROM subjects 
GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

    SELECT books.id, books.title, editions.edition
    FROM (SELECT COUNT(*) AS 'num_editions'
    )
    JOIN books ON editions.book_id = books.id
    GROUP BY editions.edition;
