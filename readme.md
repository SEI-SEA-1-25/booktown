# Booktown, USA

For each question below, find the approriate SQL query to obtain the information requested. Put all your answers in the `solutions.txt` file.
## Getting Started

To get started we'll need to import the booktown.sql file.

1. Fork and clone this repository
2. `cd` into the repository
3. use the command `psql -f booktown.sql`
4. type `psql` to open your psql console
5. type `\list` to ensure the booktown database was successfully completed
6. type `\c booktown` to connect to the booktown database
7. type `\d` to see a list of all the tables in the booktown database
                        List of relations

8. type `\d [TABLE_NAME]` to see information about columns and their types for a specific table. You should see output like below:

```
booktown=# \d books
       Table "public.books"
   Column   |  Type   | Modifiers 
------------+---------+-----------
 id         | integer | not null
 title      | text    | not null
 author_id  | integer | 
 subject_id | integer | 
Indexes:
    "books_id_pkey" PRIMARY KEY, btree (id)
    "books_title_idx" btree (title)
```

## Queries

Complete the following exercises to practice using SQL.

### Order
1. Find all subjects sorted by subject
	SELECT subject FROM subjects ORDER BY subject;
2. Find all subjects sorted by location
	SELECT subject FROM subjects ORDER BY location;


### Where
3. Find the book "Little Women"
	SELECT title FROM books WHERE title = 'Little Women';
4. Find all books containing the word "Python"
	SELECT title FROM books WHERE title LIKE '%Python%';
5. Find all subjects with the location "Main St" sort them by subject
	SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;


### Joins

6. Find all books about Computers and list ONLY the book titles
	SELECT books.title FROM books
	JOIN subjects
	ON books.subject_id = subjects.id
	WHERE subject = 'Computers';

7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
		SELECT books.title, authors.first_name, authors.first_name, subjects.subject
		FROM books
		JOIN subjects
		ON books.subject_id = subjects.id
		JOIN authors
		ON books.author_id = authors.id;

8. Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
		SELECT books.title, stock.cost
		FROM editions
		JOIN books
		ON editions.book_id = books.id
		JOIN alternate_stock
		ON editions.isbn = stock.isbn
		ORDER BY stock.retail DESC;


9. Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
		SELECT books.title, editions.isbn, publishers.name, stock.retail
		FROM editions
		JOIN books
		ON editions.book_id = books.id
		JOIN publishers
		ON editions.publisher_id = publishers.id
		JOIN stock
		ON editions.isbn =stock.isbn
		WHERE books.title = 'Dune';

10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
		SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
		FROM books
		JOIN editions
		ON editions.book_id = books.id
		JOIN shipments
		ON editions.isbn = shipments.isbn
		JOIN customers
		ON shipments.customer_id = customers.id
		ORDER BY shipments.ship_date;

### Grouping and Counting

11. Get the COUNT of all books
	SELECT COUNT(*) FROM books;

12. Get the COUNT of all Locations
	SELECT COUNT(location) FROM subjects;

13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
	SELECT location, COUNT(location)AS Frequency FROM subjects GROUP BY location;

14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
	SELECT books.id, title, COUNT(editions.book_id)AS Frequency 
	FROM books 
	JOIN editions
	ON editions.book_id = books.id
	GROUP BY books.id;


#### YAY! You're done!!

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.
