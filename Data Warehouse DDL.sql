CREATE TABLE Year (
    year_key INT PRIMARY KEY,
    year INT NOT NULL
);

CREATE TABLE Month (
    month_key INT PRIMARY KEY,
    month_name VARCHAR(20) NOT NULL,
    year_key INT NOT NULL,
    FOREIGN KEY (year_key) REFERENCES Year(year_key)
);

CREATE TABLE Date (
    day_key INT PRIMARY KEY,
    date DATE NOT NULL,
    day INT NOT NULL,
    month_key INT NOT NULL,
    FOREIGN KEY (month_key) REFERENCES Month(month_key)
);

CREATE TABLE Time (
    time_key INT PRIMARY KEY,
    hour INT NOT NULL,
    minute INT NOT NULL,
    second INT NOT NULL,
    day_key INT NOT NULL,
    FOREIGN KEY (day_key) REFERENCES Date(day_key)
);

CREATE TABLE Country (
    country_key INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    country_pop BIGINT
);

CREATE TABLE State (
    state_key INT PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    state_pop BIGINT,
    country_key INT NOT NULL,
    FOREIGN KEY (country_key) REFERENCES Country(country_key)
);

CREATE TABLE City (
    city_key INT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    city_pop BIGINT,
    state_key INT NOT NULL,
    FOREIGN KEY (state_key) REFERENCES State(state_key)
);

CREATE TABLE Users (
    users_key INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    users_street_add VARCHAR(255),
    from_date DATE,
    to_date DATE,
    city_key INT NOT NULL,
    FOREIGN KEY (city_key) REFERENCES City(city_key)
);

CREATE TABLE Genre (
    genre_key INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE Album (
    album_key INT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    no_of_songs INT NOT NULL
);

CREATE TABLE Record_Label (
    rl_key INT PRIMARY KEY,
    rl_name VARCHAR(255) NOT NULL,
    talentscout_name VARCHAR(255),
    rl_street_address VARCHAR(255),
    city_key INT NOT NULL,
    FOREIGN KEY (city_key) REFERENCES City(city_key)
);

CREATE TABLE Artist (
    artist_key INT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    artist_street_add VARCHAR(255),
    rl_key INT NOT NULL,
    collaborator_key INT,
    city_key INT NOT NULL,
    FOREIGN KEY (rl_key) REFERENCES Record_Label(rl_key),
    FOREIGN KEY (city_key) REFERENCES City(city_key)
);

CREATE TABLE Producer (
    prod_key INT PRIMARY KEY,
    prod_name VARCHAR(255) NOT NULL,
    prod_street_add VARCHAR(255),
    rl_key INT NOT NULL,
    city_key INT NOT NULL,
    FOREIGN KEY (rl_key) REFERENCES Record_Label(rl_key),
    FOREIGN KEY (city_key) REFERENCES City(city_key)
);

CREATE TABLE Prod_Artist (
    prod_key INT,
    artist_key INT,
    PRIMARY KEY (prod_key, artist_key),
    FOREIGN KEY (prod_key) REFERENCES Producer(prod_key),
    FOREIGN KEY (artist_key) REFERENCES Artist(artist_key)
);

CREATE TABLE Songs (
    song_key INT PRIMARY KEY,
    song_name VARCHAR(255) NOT NULL,
    run_time TIME NOT NULL,
    album_key INT NOT NULL,
    genre_key INT NOT NULL,
    artist_key INT NOT NULL,
    users_key INT NOT NULL,
    FOREIGN KEY (album_key) REFERENCES Album(album_key),
    FOREIGN KEY (genre_key) REFERENCES Genre(genre_key),
    FOREIGN KEY (artist_key) REFERENCES Artist(artist_key),
    FOREIGN KEY (users_key) REFERENCES Users(users_key)
);

CREATE TABLE Upload (
    upload_key INT PRIMARY KEY,
    prod_key INT NOT NULL,
    song_key INT NOT NULL,
    artist_key INT NOT NULL,
    time_key INT NOT NULL,
    FOREIGN KEY (prod_key) REFERENCES Producer(prod_key),
    FOREIGN KEY (song_key) REFERENCES Songs(song_key),
    FOREIGN KEY (artist_key) REFERENCES Artist(artist_key),
    FOREIGN KEY (time_key) REFERENCES Time(time_key)
);

CREATE TABLE Stream (
    stream_key INT PRIMARY KEY,
    users_key INT NOT NULL,
    song_key INT NOT NULL,
    time_key INT NOT NULL,
    duration TIME NOT NULL,
    stream_score INT,
    skip BOOLEAN,
    FOREIGN KEY (users_key) REFERENCES Users(users_key),
    FOREIGN KEY (song_key) REFERENCES Songs(song_key),
    FOREIGN KEY (time_key) REFERENCES Time(time_key)
);
