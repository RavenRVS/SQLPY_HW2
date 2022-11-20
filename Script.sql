CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_Genres (
	artist_id INTEGER REFERENCES Artist(artist_id),
	genre_id INTEGER REFERENCES Genre(genre_id),
	CONSTRAINT pk_atist_genres PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(50) NOT NULL,
	aibum_relase_year INTEGER
);

CREATE TABLE IF NOT EXISTS Album_Autors (
	artist_id INTEGER REFERENCES Artist(artist_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT pk_album_autors PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Album(album_id),
	track_name VARCHAR(50) NOT NULL,
	track_duration INTEGER
);

CREATE TABLE IF NOT EXISTS Digest (
	digest_id SERIAL PRIMARY KEY,
	digest_name VARCHAR(50) NOT NULL,
	digest_relase_year INTEGER
);

CREATE TABLE IF NOT EXISTS Track_In_Digest (
	track_id INTEGER REFERENCES Track(track_id),
	digest_id INTEGER REFERENCES Digest(digest_id),
	CONSTRAINT pk_track_in_digest PRIMARY KEY (track_id, digest_id)
);
