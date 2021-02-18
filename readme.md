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

 public | alternate_stock       | table    | sarahmariecoogan
 public | authors               | table    | sarahmariecoogan
 public | book_backup           | table    | sarahmariecoogan
 public | book_ids              | sequence | sarahmariecoogan
 public | book_queue            | table    | sarahmariecoogan
 public | books                 | table    | sarahmariecoogan
 public | customers             | table    | sarahmariecoogan
 public | daily_inventory       | table    | sarahmariecoogan
 public | distinguished_authors | table    | sarahmariecoogan
 public | editions              | table    | sarahmariecoogan
 public | employees             | table    | sarahmariecoogan
 public | favorite_authors      | table    | sarahmariecoogan
 public | favorite_books        | table    | sarahmariecoogan
 public | money_example         | table    | sarahmariecoogan
 public | my_list               | table    | sarahmariecoogan
 public | numeric_values        | table    | sarahmariecoogan
 public | publishers            | table    | sarahmariecoogan
 public | schedules             | table    | sarahmariecoogan
 public | shipments             | table    | sarahmariecoogan
 public | states                | table    | sarahmariecoogan
 public | stock                 | table    | sarahmariecoogan
 public | stock_backup          | table    | sarahmariecoogan
 public | subject_ids           | sequence | sarahmariecoogan
 public | subjects              | table    | sarahmariecoogan
 public | text_sorting          | table    | sarahmariecoogan
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
 Arts
 Business
 Children's Books
 Classics
 Computers
 Cooking
 Drama
 Entertainment
 History
 Horror
 Mystery
 Poetry
 Religion
 Romance
 Science
 Science Fiction

2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
 id |     subject      |     location
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         |

### Where
3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6

4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4

5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St


### Joins

6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books
JOIN subjects 
ON books.subject_id = subjects.id
WHERE subject = 'Computers';

 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python


7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

SELECT title, last_name, first_name, subject FROM books 
JOIN authors
ON authors.id = books.author_id
JOIN subjects 
ON subjects.id = books.subject_id;

 Practical PostgreSQL        | Worsley      | John             | Computers
 Franklin in the Dark        | Bourgeois    | Paulette         | Children's Books
 The Velveteen Rabbit        | Bianco       | Margery Williams | Classics
 Little Women                | Alcott       | Louisa May       | Drama
 The Shining                 | King         | Stephen          | Horror
 Dune                        | Herbert      | Frank            | Science Fiction
 Dynamic Anatomy             | Hogarth      | Burne            | Arts
 Goodnight Moon              | Brown        | Margaret Wise    | Children's Books
 The Tell-Tale Heart         | Poe          | Edgar Allen      | Horror
 Programming Python          | Lutz         | Mark             | Computers
 Learning Python             | Lutz         | Mark             | Computers
 Perl Cookbook               | Christiansen | Tom              | Computers
 2001: A Space Odyssey       | Clarke       | Arthur C.        | Science Fiction
 The Cat in the Hat          | Geisel       | Theodor Seuss    | Children's Books
 Bartholomew and the Oobleck | Geisel       | Theodor Seuss    | Children's Books

8. Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

SELECT title, retail FROM books
JOIN editions 
ON editions.book_id = books.id
JOIN stock
ON editions.isbn = stock.isbn
ORDER BY retail DESC;

            title            | retail
-----------------------------+--------
 2001: A Space Odyssey       |  46.95
 Dune                        |  45.95
 The Shining                 |  36.95
 The Cat in the Hat          |  32.95
 Goodnight Moon              |  28.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Cat in the Hat          |  23.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 2001: A Space Odyssey       |  22.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Bartholomew and the Oobleck |  16.95

9. Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

  SELECT title, editions.isbn, publishers.name, retail FROM books
  JOIN editions
  ON editions.book_id = books.id
  JOIN stock
  ON editions.isbn = stock.isbn
  JOIN publishers
  ON publishers.id = editions.publisher_id WHERE title = 'Dune';

   title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95

10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
SELECT customers.first_name, customers.last_name, ship_date, title FROM books
JOIN editions
ON editions.book_id = books.id
JOIN shipments
ON editions.isbn = shipments.isbn
JOIN customers
ON shipments.customer_id = customers.id
ORDER BY ship_date;



### Grouping and Counting
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
12. Get the COUNT of all Locations
SELECT COUNT(location)FROM subjects;

13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjects GROUP BY location;

     location     | frequency
------------------+-----------
                  |         0
 Sunset Dr        |         1
 Kids Ct          |         1
 Black Raven Dr   |         2
 Creativity St    |         2
 Academic Rd      |         2
 Main St          |         4
 Productivity Ave |         3
(8 rows)

14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, title, COUNT(editions.book_id) FROM books 
JOIN editions
ON editions.book_id = books.id
GROUP BY books.id;
#### YAY! You're done!!

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.
