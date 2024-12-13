-- 1. Can you get all data about movies? 

use project_movie_database;

select * from movies;


-- 2.How do you get all data about directors?

select * from directors ;


-- 3.Check how many movies are present in IMDB.

SELECT COUNT(*) AS present_movies
FROM movies
WHERE title IS NOT NULL AND release_date IS NOT NULL AND id IS NOT NULL;



-- 4.Find these 3 directors: James Cameron ; Luc Besson ; John Woo

SELECT name,id, gender, uid, department
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');



-- 5.Find all directors with name starting with S.
SELECT name, id,gender, uid, department
FROM directors
WHERE name LIKE 'S%';



-- 6.Count female directors.


SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 'Female';




-- 7.Find the name of the 10th first women directors?

SELECT name
FROM directors
WHERE gender = 'Female'
ORDER BY id
LIMIT 10;



-- 8.What are the 3 most popular movies?

SELECT original_title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;


-- 9.What are the 3 most bankable movies?

SELECT title, budget, revenue, (revenue - budget) AS profit
FROM movies
ORDER BY profit DESC
LIMIT 3;


--  10.What is the most awarded average vote since the January 1st, 2000?

SELECT title, vote_average
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;



-- 11. Which movie(s) were directed by Brenda Chapman?

-- 1. query

SELECT id, name
FROM directors
WHERE name = 'Brenda Chapman';

-- 2.QUERY 

SELECT title
FROM movies m
WHERE m.id = 4801;

-- THERE IS MISSING VALUES 

-- 3.QUERY FOR CONFORMATION

SELECT title 
FROM movies 
WHERE TRIM(id) = '4801';

-- 4.QUERY FOR FINAL CROSS CHECK

SELECT m.id, m.title
FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

-- note :If There still unable to find the movie with id = 4801, itâ€™s possible that the movie data is missing, the id values in the  query aren't correct, 
-- or the movie was deleted or updated without the expected consistency. In such cases,  may need to verify the data integrity of the database or check with
-- whoever manages the data to see if there are issues.


-- 12. Which director made the most movies?
 
SELECT d.name, COUNT(m.director_id) AS movie_count
FROM directors d
JOIN movies m ON m.director_id = d.id
GROUP BY d.name
ORDER BY movie_count DESC
LIMIT 1;



-- 13. Which director is the most bankable?


SELECT d.name, SUM(m.revenue) AS total_revenue
FROM directors d
JOIN movies m ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;