SELECT albums.id,
      albums.title
  FROM albums
    JOIN artists
    ON artists.id = albums.artist_id
	WHERE artists.name = 'Taylor Swift';

-- OUTPUT:

--   id |  title   
-- ----+----------
--   6 | Lover
--   7 | Folklore