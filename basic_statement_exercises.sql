-- 1. Use the albums_db database.
SHOW DATABASES;
USE albums_db;
SELECT DATABASE();

-- 2. What is the primary key for the albums table?
 -- "id"

-- 3. What does the column named 'name' represent?
 -- it is the name of the album

-- 4. What do you think the sales column represents?
 -- the number of albums sold

-- 5. Find the name of all albums by Pink Floyd.
SELECT * FROM albums WHERE artist = "Pink Floyd";

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date from albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
SELECT release_date, name, artist from albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";


-- 7. What is the genre for the album Nevermind?
SELECT genre FROM albums WHERE name = "Nevermind";

-- 8. Which albums were released in the 1990s?
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;

-- 9. Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT DISTINCT sales AS low_selling_albums FROM albums;
SELECT * FROM albums WHERE sales <= 20;

SELECT name AS low_selling_albums FROM albums WHERE sales < 20;