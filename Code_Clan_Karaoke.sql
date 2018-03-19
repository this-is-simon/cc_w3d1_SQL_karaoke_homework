DROP TABLE room_songs;
DROP TABLE guests;
DROP TABLE songs;
DROP TABLE rooms;


CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  till INT
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  song_title VARCHAR(255),
  song_artist VARCHAR(255)
  );

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  wallet INT,
  room_id INT8 REFERENCES rooms(id),
  song_id_fave_song INT8 REFERENCES songs(id)
  );

CREATE TABLE room_songs (
  id SERIAL8,
  room_id INT8 REFERENCES rooms(id),
  song_id INT8 REFERENCES songs(id)
);

INSERT INTO rooms (name, till) VALUES ('Beyonce Room', 300);
INSERT INTO rooms (name, till) VALUES ('Britney Room', 400);
INSERT INTO rooms (name, till) VALUES ('JT Room', 500);

INSERT INTO songs (song_title, song_artist) VALUES ('Toxic', 'Britney Spears');
INSERT INTO songs (song_title, song_artist) VALUES ('Ace of Spades', 'Motorhead');
INSERT INTO songs (song_title, song_artist) VALUES ('Breed', 'Nirvana');

INSERT INTO guests (name, wallet, room_id, song_id_fave_song) VALUES ('Simon', 25, 1, 3);
INSERT INTO guests (name, wallet, room_id, song_id_fave_song) VALUES ('Claire', 20, 1, 1);
INSERT INTO guests (name, wallet, room_id, song_id_fave_song) VALUES ('Ewa', 25, 1, 2);

INSERT INTO room_songs (room_id, song_id) VALUES (1, 2);
INSERT INTO room_songs (room_id, song_id) VALUES (1, 3);
INSERT INTO room_songs (room_id, song_id) VALUES (1, 2);
INSERT INTO room_songs (room_id, song_id) VALUES (2, 1);
INSERT INTO room_songs (room_id, song_id) VALUES (2, 3);
INSERT INTO room_songs (room_id, song_id) VALUES (2, 2);

UPDATE songs
SET (song_title, song_artist) = ('Whole Lotta Love', 'ACDC')
WHERE id = 1;

UPDATE room_songs
SET room_id = 3
WHERE song_id = 2;

SELECT * FROM guests;
SELECT * FROM songs ORDER BY id;
SELECT * FROM rooms;
SELECT * FROM room_songs ORDER BY room_id;

SELECT * FROM room_songs WHERE room_id = 1;
SELECT * FROM guests WHERE wallet >= 25
