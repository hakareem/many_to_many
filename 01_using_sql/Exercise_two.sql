
SELECT albums.id, albums.title FROM albums
JOIN artists ON artists.id = albums.artist_id WHERE artists.name = 'Pixies' AND release_year = 1988;

-- OUTPUT 

--  id |    title    
-- ----+-------------
--   2 | Surfer Rosa