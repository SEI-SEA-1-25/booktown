-- 1. Find all subjects sorted by subject
ans-- 
SELECT * FROM subjects;



-- 2. Find all subjects sorted by location
ans-- 
SELECT * FROM subjects
ORDER BY location;

-- 3. Find the book "Little Women"
ans-- 
SELECT * FROM books
WHERE title = 'Little Women';


-- 4. Find all books containing the word "Python"
ans--
SELECT * FROM books
WHERE title like '%Python%';


--5. Find all subjects with the location "Main St" sort them by subject
ans-- 
SELECT * FROM subjects
WHERE location = 'Main St'
ORDER BY subject;

--6. Find all books about Computers and list ONLY the book titles
ans--
Select b.title 
from books b 
Join subjects s on s.id = b.subject_id 
Where s.subject = 'Computers';


--7. Find all books and display a result table with ONLY the following columns
--Book title
--Author's first name
--Author's last name
--Book subject

ans--
Select b.title, a.first_name, a.last_name, s.subject 
from books b 
Join subjects s on s.id = b.subject_id
Join authors a on a.id = b.author_id; 

--8
--9
--10

--11 Get the COUNT of all books

ans--
SELECT COUNT (*) FROM books;

--12 Get the COUNT of all Locations

ans--
SELECT COUNT (location) FROM subjects;




--12 Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
ans--
SELECT COUNT(DISTINCT location) FROM subjects;