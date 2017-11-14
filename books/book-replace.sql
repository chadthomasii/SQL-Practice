SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 20)
    AS "e's to 3's"
FROM books;

--Replaces the e's with 3's