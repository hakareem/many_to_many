

-- Find the id and title of all albums from Nina Simone released after 1975.

SELECT albums.id, albums.title FROM albums JOIN artists ON artists.id = albums.artist_id WHERE artists.name = 'Nina Simone' AND release_year > 1975;

-- OUTPUT

--  album_id |       title        
-- ----------+--------------------
--         9 | Baltimore
--        11 | Fodder on My Wings