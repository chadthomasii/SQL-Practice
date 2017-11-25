SELECT
    title,
    rating


FROM series
JOIN reviews
    ON series.id = reviews.series_id;


-- Average Rating

SELECT 
    series.id,
    title,
    AVG(rating) AS Average_Rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY Average_Rating;

-- See all Ratings


SELECT 
    reviewers.id,
    first_name,
    last_name,
    rating
FROM reviewers
RIGHT JOIN reviews
    ON reviewers.id = reviews.reviewer_id;

-- Unreviwed Series

SELECT 
    title AS Unreviewed_Series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;

-- Genre Average Ratings

SELECT 
    genre,
    AVG(rating)
FROM series
JOIN reviews    
    ON series.id = reviews.series_id
GROUP BY genre;

-- Active Users

SELECT first_name, 
       last_name, 
       Count(rating)                               AS COUNT, 
       Ifnull(Min(rating), 0)                      AS MIN, 
       Ifnull(Max(rating), 0)                      AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2)            AS AVG, 
       IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 

-- All Together! 3 TABLES

SELECT 
    title,
    rating,
    CONCAT(first_name,' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id
INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title;

