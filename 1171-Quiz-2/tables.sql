DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums(
album_id serial PRIMARY KEY,
album_title text NOT NULL,
created_at timestamp (0) with time  zone NOT NULL DEFAULT NOW ()
);

CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    track_title text NOT NULL,
    track_length_minutes int NOT NULL,
    created_at timestamp (0) with time  zone NOT NULL DEFAULT NOW ()
);

CREATE TABLE albums_tracks (
    albums_tracks_id serial PRIMARY KEY,
    album_id integer REFERENCES albums(album_id),
    track_id integer REFERENCES tracks(track_id),
    created_at timestamp (0) with time  zone NOT NULL DEFAULT NOW ()
);

INSERT INTO albums(album_title)
VALUES ('Noon'),
('Dusk'),
('Dawn'),
('Evening'),
('Afternoon'),
('Midday'),
('Sunrise'),
('Sunset'),
('Day'),
('Night');

INSERT INTO tracks (track_title, track_length_minutes)
VALUES ('Indigo', 2),
('Hotpink', 4),
('Maroon', 5),
('Cyan', 1),
('Crimson', 3),
('Olive', 10),
('Beige', 2),
('Khaki', 4),
('Lime', 4),
('Orange', 2);

INSERT INTO albums_tracks(album_id, track_id)
VALUES(1, 1),
(1, 3),
(2, 5),
(6, 8),
(9, 9),
(10, 8),
(7, 3),
(2, 3),
(5, 8),
(9, 6),
(6, 2),
(1, 9);

SELECT A.album_title, T.track_title
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id =  AT.track_id
ORDER BY album_title
;

SELECT T.track_title, A.album_title
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id =  AT.track_id
ORDER BY track_title;


SELECT A.album_title, T.track_id
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id =  AT.track_id
ORDER BY album_title;

SELECT T.track_title, A.album_id
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id =  AT.track_id
ORDER BY track_title;



