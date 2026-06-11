--Netflix project
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(208),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);

SELECT * FROM netflix;

select COUNT(*) AS TOTAL_CONTENT from netflix;

SELECT DISTINCT TYPE FROM netflix;

-- 15 Business Problems & Solutions

--1. Count the number of Movies vs TV Shows
SELECT TYPE ,
COUNT(*) AS TOTAL_CONTENTS
FROM netflix
GROUP BY Type;

--2. Find the most common rating for movies and TV shows
SELECT *
FROM
(
    SELECT
        type,
        rating,
        COUNT(*) AS total_count,
        RANK() OVER (
            PARTITION BY type
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM netflix
    GROUP BY type, rating
) AS t
WHERE ranking = 1;
--3. List all movies released in a specific year (e.g., 2020)
 SELECT * FROM netflix
 WHERE 
       type='Movie'
	   AND release_year = 2020;

--4. Find the top 5 countries with the most content on Netflix

 SELECT 
  UNNEST( STRING_TO_ARRAY(country,',')) as new_country ,
  count(show_id ) as total_content
 FROM netflix
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 5;
 
--5. Identify the longest movie

SELECT *
FROM netflix
 WHERE type='Movie'
 AND 
 duration =(select MAX(duration) from netflix)

--6. Find content added in the last 5 years
SELECT *
FROM netflix
WHERE  TO_DATE(date_added, 'MONTH, DD, YYYY')>= CURRENT_DATE - INTERVAL '5 years'
 

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT type ,director
FROM netflix
where director IlIKE '%Rajiv Chilaka%'
-- using i if it's in small case and like % if multiple directors are present

--8. List all TV shows with more than 5 seasons
SELECT *
--SPLIT_PART(duration,' ',1) AS seasons
FROM netflix
WHERE type= 'TV Show' AND CAST(SPLIT_PART(duration,' ',1) AS INT)  > 5

--9. Count the number of content items in each genre
SELECT 
UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
count(show_id)
FROM netflix
group by 1;

--10.Find each year and the average numbers of content release in India on netflix. 

SELECT 
EXTRACT(YEAR FROM to_date(date_added,'Month DD, YYYY')) AS year,
count(*) from netflix
where country='India'
GROUP BY 1;
--return top 5 year with highest avg content release!
SELECT 
EXTRACT(YEAR FROM to_date(date_added,'Month DD, YYYY')) AS year,
count(*) from netflix
where country='India'
GROUP BY 1;

SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
    COUNT(*) AS yearly_content,

    ROUND(
        COUNT(*)::numeric /
        (SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric
        * 100,
        2
    ) AS avg_content_per_year

FROM netflix
WHERE country = 'India'
GROUP BY 1;
--11. List all movies that are documentaries
SELECT * ,
listed_in ilike '%documentaries%'
FROM netflix

--12. Find all content without a director
SELECT * FROM netflix
where director IS NULL


--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
 SELECT * FROM netflix
 WHERE casts ILIKE '%Salman Khan%'
 AND 
 release_year > EXTRACT(YEAR FROM CURRENT_DATE) -  10

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT 
UNNEST(STRING_TO_ARRAY(casts,','))AS actors,
count (*) as number_of_movies
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--15.
--Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.

WITH new_table 
AS(
SELECT 
* ,
 CASE 
 WHEN description ILIKE '%kill%' OR 
       description ILIKE '%violence%'
	    THEN 'Bad_content'
	ELSE 'Good_content'
	END category
FROM netflix)

SELECT category,
count(*) AS total_content
FROM new_table
GROUP BY 1;





