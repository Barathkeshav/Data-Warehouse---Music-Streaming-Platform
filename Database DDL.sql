
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Record_Label (
    rl_id INT PRIMARY KEY,
    rl_name VARCHAR(255),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Talent_Scout (
    ts_id INT PRIMARY KEY,
    ts_name VARCHAR(255),
    rl_id INT NOT NULL,
    FOREIGN KEY (rl_id) REFERENCES Record_Label(rl_id)
);

CREATE TABLE Producer (
    producer_id INT PRIMARY KEY,
    producer_name VARCHAR(255),
    address_id INT,
    rl_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (rl_id) REFERENCES Record_Label(rl_id)
);

CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255),
    total_streams INT,
    total_songs INT,
    address_id INT,
	ts_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (ts_id) REFERENCES Talent_Scout(ts_id)
);

CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(255),
    no_of_songs INT
);

CREATE TABLE Create_Album (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE Collaborates (
    artist_id1 INT,
    artist_id2 INT,
    artist_id3 INT,
    PRIMARY KEY (artist_id1, artist_id2, artist_id3),
    FOREIGN KEY (artist_id1) REFERENCES Artist(artist_id),
    FOREIGN KEY (artist_id2) REFERENCES Artist(artist_id),
    FOREIGN KEY (artist_id3) REFERENCES Artist(artist_id)
);

CREATE TABLE Song (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(255),
    genre VARCHAR(100),
    run_time TIME,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE Song_Upload (
    artist_id INT,
    song_id INT,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    username VARCHAR(255),
    DOB DATE,
    email VARCHAR(255),
    age INT,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Listen (
    users_id INT,
    song_id INT,
    PRIMARY KEY (users_id, song_id),
    FOREIGN KEY (users_id) REFERENCES Users(users_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

CREATE TABLE Artist_Prod (
    artist_id INT,
    producer_id INT,
    PRIMARY KEY (artist_id, producer_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (producer_id) REFERENCES Producer(producer_id)
);

CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    playlist_name VARCHAR(255),
    users_id INT NOT NULL,
	FOREIGN KEY (users_id) REFERENCES Users(users_id)
);

CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);


INSERT INTO Address (address_id, country, state, city) VALUES
(1, 'USA', 'California', 'Los Angeles'),
(2, 'USA', 'New York', 'New York City'),
(3, 'USA', 'Texas', 'Houston'),
(4, 'Canada', 'Ontario', 'Toronto'),
(5, 'Canada', 'British Columbia', 'Vancouver'),
(6, 'UK', 'England', 'London'),
(7, 'Germany', 'Bavaria', 'Munich'),
(8, 'France', 'Ile_de_France', 'Paris'),
(9, 'Italy', 'Lombardy', 'Milan'),
(10, 'Spain', 'Catalonia', 'Barcelona'),
(11, 'Australia', 'New South Wales', 'Sydney'),
(12, 'Australia', 'Victoria', 'Melbourne'),
(13, 'Japan', 'Tokyo', 'Tokyo'),
(14, 'China', 'Beijing', 'Beijing'),
(15, 'India', 'Maharashtra', 'Mumbai'),
(16, 'Brazil', 'São Paulo', 'São Paulo'),
(17, 'Mexico', 'Mexico City', 'Mexico City'),
(18, 'South Africa', 'Gauteng', 'Johannesburg'),
(19, 'Russia', 'Moscow', 'Moscow'),
(20, 'UAE', 'Dubai', 'Dubai'),
(21, 'USA', 'Illinois', 'Chicago'),
(22, 'USA', 'Nevada', 'Las Vegas'),
(23, 'USA', 'Florida', 'Miami'),
(24, 'Canada', 'Quebec', 'Montreal'),
(25, 'UK', 'Scotland', 'Edinburgh'),
(26, 'Germany', 'Berlin', 'Berlin'),
(27, 'France', 'Provence_Alpes_Cote dAzur', 'Nice'),
(28, 'Italy', 'Lazio', 'Rome'),
(29, 'Spain', 'Andalusia', 'Seville'),
(30, 'Australia', 'Queensland', 'Brisbane'),
(31, 'New Zealand', 'Auckland', 'Auckland'),
(32, 'Japan', 'Osaka', 'Osaka'),
(33, 'China', 'Shanghai', 'Shanghai'),
(34, 'India', 'Delhi', 'New Delhi'),
(35, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro'),
(36, 'Mexico', 'Jalisco', 'Guadalajara'),
(37, 'South Africa', 'Western Cape', 'Cape Town'),
(38, 'Russia', 'Saint Petersburg', 'Saint Petersburg'),
(39, 'UAE', 'Abu Dhabi', 'Abu Dhabi'),
(40, 'USA', 'Washington', 'Seattle'),
(41, 'USA', 'Massachusetts', 'Boston'),
(42, 'Canada', 'Alberta', 'Calgary'),
(43, 'UK', 'Wales', 'Cardiff'),
(44, 'Germany', 'Hamburg', 'Hamburg'),
(45, 'France', 'Nouvelle_Aquitaine', 'Bordeaux'),
(46, 'Italy', 'Tuscany', 'Florence'),
(47, 'Spain', 'Valencia', 'Valencia'),
(48, 'Australia', 'South Australia', 'Adelaide'),
(49, 'New Zealand', 'Wellington', 'Wellington'),
(50, 'Japan', 'Hokkaido', 'Sapporo'),
(51, 'China', 'Guangdong', 'Guangzhou'),
(52, 'India', 'West Bengal', 'Kolkata'),
(53, 'Brazil', 'Bahia', 'Salvador'),
(54, 'Mexico', 'Nuevo León', 'Monterrey'),
(55, 'South Africa', 'KwaZulu_Natal', 'Durban'),
(56, 'Russia', 'Tatarstan', 'Kazan'),
(57, 'UAE', 'Sharjah', 'Sharjah'),
(58, 'USA', 'Colorado', 'Denver'),
(59, 'USA', 'Georgia', 'Atlanta'),
(60, 'Canada', 'Manitoba', 'Winnipeg'),
(61, 'UK', 'Northern Ireland', 'Belfast'),
(62, 'Germany', 'Hesse', 'Frankfurt'),
(63, 'France', 'Brittany', 'Rennes'),
(64, 'Italy', 'Campania', 'Naples'),
(65, 'Spain', 'Basque Country', 'Bilbao'),
(66, 'Australia', 'Tasmania', 'Hobart'),
(67, 'New Zealand', 'Canterbury', 'Christchurch'),
(68, 'Japan', 'Fukuoka', 'Fukuoka'),
(69, 'China', 'Sichuan', 'Chengdu'),
(70, 'India', 'Tamil Nadu', 'Chennai'),
(71, 'USA', 'Arizona', 'Phoenix'),
(72, 'USA', 'Michigan', 'Detroit'),
(73, 'Canada', 'Saskatchewan', 'Saskatoon'),
(74, 'UK', 'England', 'Manchester'),
(75, 'Germany', 'North Rhine_Westphalia', 'Dusseldorf'),
(76, 'France', 'Occitanie', 'Toulouse'),
(77, 'Italy', 'Sicily', 'Palermo'),
(78, 'Spain', 'Galicia', 'Santiago de Compostela'),
(79, 'Australia', 'Western Australia', 'Perth'),
(80, 'New Zealand', 'Otago', 'Dunedin'),
(81, 'Japan', 'Aichi', 'Nagoya'),
(82, 'China', 'Zhejiang', 'Hangzhou'),
(83, 'India', 'Karnataka', 'Bangalore'),
(84, 'Brazil', 'Minas Gerais', 'Belo Horizonte'),
(85, 'Mexico', 'Puebla', 'Puebla City'),
(86, 'South Africa', 'Eastern Cape', 'Port Elizabeth'),
(87, 'Russia', 'Novosibirsk Oblast', 'Novosibirsk'),
(88, 'UAE', 'Ajman', 'Ajman'),
(89, 'USA', 'Missouri', 'St. Louis'),
(90, 'USA', 'Oregon', 'Portland'),
(91, 'Canada', 'New Brunswick', 'Fredericton'),
(92, 'UK', 'England', 'Liverpool'),
(93, 'Germany', 'Saxony', 'Dresden'),
(94, 'France', 'Grand Est', 'Strasbourg'),
(95, 'Italy', 'Veneto', 'Venice'),
(96, 'Spain', 'Castile and León', 'Valladolid'),
(97, 'Australia', 'Northern Territory', 'Darwin'),
(98, 'New Zealand', 'Hawkes Bay', 'Napier'),
(99, 'Japan', 'Hiroshima', 'Hiroshima'),
(100, 'China', 'Yunnan', 'Kunming'),
(101, 'India', 'Andhra Pradesh', 'Visakhapatnam'),
(102, 'Brazil', 'Pernambuco', 'Recife'),
(103, 'Mexico', 'Chihuahua', 'Chihuahua City'),
(104, 'South Africa', 'Limpopo', 'Polokwane'),
(105, 'Russia', 'Sverdlovsk Oblast', 'Yekaterinburg'),
(106, 'UAE', 'Fujairah', 'Fujairah'),
(107, 'USA', 'Pennsylvania', 'Philadelphia'),
(108, 'USA', 'North Carolina', 'Charlotte'),
(109, 'Canada', 'Nova Scotia', 'Halifax'),
(110, 'UK', 'England', 'Birmingham'),
(111, 'Germany', 'Lower Saxony', 'Hanover'),
(112, 'France', 'Pays de la Loire', 'Nantes'),
(113, 'Italy', 'Piedmont', 'Turin'),
(114, 'Spain', 'Extremadura', 'Mérida'),
(115, 'Australia', 'Australian Capital Territory', 'Canberra'),
(116, 'New Zealand', 'Bay of Plenty', 'Tauranga'),
(117, 'Japan', 'Miyagi', 'Sendai'),
(118, 'China', 'Hunan', 'Changsha'),
(119, 'India', 'Kerala', 'Thiruvananthapuram'),
(120, 'Brazil', 'Ceará', 'Fortaleza');

INSERT INTO Address (address_id, country, state, city) VALUES
(121, 'USA', 'California', 'Los Angeles'),
(122, 'USA', 'New York', 'New York City'),
(123, 'USA', 'Texas', 'Houston'),
(124, 'USA', 'Illinois', 'Chicago'),
(125, 'USA', 'Arizona', 'Phoenix'),
(126, 'USA', 'Pennsylvania', 'Philadelphia'),
(127, 'USA', 'Florida', 'Miami'),
(128, 'USA', 'Washington', 'Seattle'),
(129, 'USA', 'Massachusetts', 'Boston'),
(130, 'USA', 'Georgia', 'Atlanta'),
(131, 'Canada', 'Ontario', 'Toronto'),
(132, 'Canada', 'Quebec', 'Montreal'),
(133, 'Canada', 'British Columbia', 'Vancouver'),
(134, 'Canada', 'Alberta', 'Calgary'),
(135, 'Canada', 'Manitoba', 'Winnipeg'),
(136, 'UK', 'England', 'London'),
(137, 'UK', 'Scotland', 'Edinburgh'),
(138, 'UK', 'Wales', 'Cardiff'),
(139, 'UK', 'Northern Ireland', 'Belfast'),
(140, 'Australia', 'New South Wales', 'Sydney'),
(141, 'Australia', 'Victoria', 'Melbourne'),
(142, 'Australia', 'Queensland', 'Brisbane'),
(143, 'Australia', 'Western Australia', 'Perth'),
(144, 'Australia', 'South Australia', 'Adelaide'),
(145, 'Germany', 'Berlin', 'Berlin'),
(146, 'Germany', 'Bavaria', 'Munich'),
(147, 'Germany', 'Hamburg', 'Hamburg'),
(148, 'Germany', 'North Rhine_Westphalia', 'Cologne'),
(149, 'France', 'Ile_de_France', 'Paris'),
(150, 'France', 'Provence-Alpes-Cote dAzur', 'Marseille'),
(151, 'France', 'Auvergne_Rhone_Alpes', 'Lyon'),
(152, 'France', 'Occitanie', 'Toulouse'),
(153, 'Japan', 'Tokyo', 'Tokyo'),
(154, 'Japan', 'Osaka', 'Osaka'),
(155, 'Japan', 'Kyoto', 'Kyoto'),
(156, 'Japan', 'Hokkaido', 'Sapporo'),
(157, 'India', 'Maharashtra', 'Mumbai'),
(158, 'India', 'Delhi', 'Delhi'),
(159, 'India', 'Karnataka', 'Bangalore'),
(160, 'India', 'Tamil Nadu', 'Chennai');

INSERT INTO record_label (rl_id, rl_name, address_id) VALUES
(1, 'Universal Music Group', 1),
(2, 'Sony Music Entertainment', 2),
(3, 'Warner Music Group', 3),
(4, 'EMI Records', 4),
(5, 'Atlantic Records', 5),
(6, 'Columbia Records', 6),
(7, 'Island Records', 7),
(8, 'Def Jam Recordings', 8),
(9, 'Republic Records', 9),
(10, 'Capitol Records', 10),
(11, 'RCA Records', 11),
(12, 'Virgin Records', 12),
(13, 'Arista Records', 13),
(14, 'Interscope Records', 14),
(15, 'Motown Records', 15),
(16, 'Epic Records', 16),
(17, 'Polydor Records', 17),
(18, 'Geffen Records', 18),
(19, 'Parlophone', 19),
(20, 'Big Machine Records', 20),
(21, 'XL Recordings', 21),
(22, 'Sub Pop', 22),
(23, '4AD', 23),
(24, 'Domino Recording Company', 24),
(25, 'Merge Records', 25),
(26, 'Rough Trade Records', 26),
(27, 'Matador Records', 27),
(28, 'Elektra Records', 28),
(29, 'Verve Records', 29),
(30, 'Fueled by Ramen', 30),
(31, 'Anti-', 31),
(32, 'Ninja Tune', 32),
(33, 'Glassnote Records', 33),
(34, 'Mute Records', 34),
(35, 'Hopeless Records', 35),
(36, 'Nonesuch Records', 36),
(37, 'Death Row Records', 37),
(38, 'Roadrunner Records', 38),
(39, 'Jagjaguwar', 39),
(40, 'DGC Records', 40);

INSERT INTO talent_scout (ts_id, ts_name, rl_id) VALUES
(1, 'John Smith', 1),
(2, 'Emily Johnson', 2),
(3, 'Michael Brown', 3),
(4, 'Jessica Davis', 4),
(5, 'David Wilson', 5),
(6, 'Sarah Martinez', 6),
(7, 'Daniel Garcia', 7),
(8, 'Laura Anderson', 8),
(9, 'James Thomas', 9),
(10, 'Sophia Lee', 10),
(11, 'Robert Harris', 11),
(12, 'Olivia Clark', 12),
(13, 'Matthew Lewis', 13),
(14, 'Emma Walker', 14),
(15, 'Joshua Hall', 15),
(16, 'Isabella Allen', 16),
(17, 'Andrew Young', 17),
(18, 'Mia Hernandez', 18),
(19, 'Christopher King', 19),
(20, 'Abigail Wright', 20),
(21, 'Joseph Scott', 21),
(22, 'Charlotte Green', 22),
(23, 'Anthony Adams', 23),
(24, 'Amelia Baker', 24),
(25, 'Ryan Nelson', 25),
(26, 'Grace Carter', 26),
(27, 'Nicholas Mitchell', 27),
(28, 'Lily Perez', 28),
(29, 'Brandon Roberts', 29),
(30, 'Ella Turner', 30),
(31, 'Justin Phillips', 31),
(32, 'Chloe Campbell', 32),
(33, 'Ethan Parker', 33),
(34, 'Avery Evans', 34),
(35, 'Kevin Edwards', 35),
(36, 'Hannah Collins', 36),
(37, 'Jason Stewart', 37),
(38, 'Natalie Sanchez', 38),
(39, 'Brian Morris', 39),
(40, 'Sofia Rogers', 40);

INSERT INTO producer (producer_id, producer_name, address_id, rl_id) VALUES
(1, 'Rick Rubin', 41, 1),
(2, 'Max Martin', 42, 2),
(3, 'Quincy Jones', 43, 3),
(4, 'Dr. Dre', 44, 4),
(5, 'George Martin', 45, 5),
(6, 'Pharrell Williams', 46, 6),
(7, 'Brian Eno', 47, 7),
(8, 'Timbaland', 48, 8),
(9, 'Mark Ronson', 49, 9),
(10, 'Nigel Godrich', 50, 10),
(11, 'Butch Vig', 51, 11),
(12, 'Linda Perry', 52, 12),
(13, 'Danger Mouse', 53, 13),
(14, 'Jeff Lynne', 54, 14),
(15, 'Steve Albini', 55, 15),
(16, 'Paul Epworth', 56, 16),
(17, 'Mike Will Made It', 57, 17),
(18, 'Greg Kurstin', 58, 18),
(19, 'Scott Storch', 59, 19),
(20, 'Jimmy Jam', 60, 20),
(21, 'Terry Lewis', 61, 21),
(22, 'Jack Antonoff', 62, 22),
(23, 'Diplo', 63, 23),
(24, 'Metro Boomin', 64, 24),
(25, 'Berry Gordy', 65, 25),
(26, 'Sylvia Massy', 66, 26),
(27, 'Trevor Horn', 67, 27),
(28, 'David Foster', 68, 28),
(29, 'Glen Ballard', 69, 29),
(30, 'Joe Meek', 70, 30),
(31, 'Larry Klein', 71, 31),
(32, 'Tony Visconti', 72, 32),
(33, 'Stephen Street', 73, 33),
(34, 'Roy Thomas Baker', 74, 34),
(35, 'Stuart Price', 75, 35),
(36, 'John Leckie', 76, 36),
(37, 'Murda Beatz', 77, 37),
(38, 'Daniel Lanois', 78, 38),
(39, 'Eric Valentine', 79, 39),
(40, 'Rick Nowels', 80, 40);

INSERT INTO Artist (artist_id, artist_name, total_streams, total_songs, address_id, ts_id) VALUES
(1, 'John Doe', 150000, 25, 81, 1),
(2, 'Jane Smith', 200000, 30, 82, 2),
(3, 'Alice Johnson', 50000, 15, 83, 3),
(4, 'Bob Brown', 300000, 40, 84, 4),
(5, 'Charlie Davis', 75000, 20, 85, 5),
(6, 'Eve White', 100000, 22, 86, 6),
(7, 'Frank Wilson', 250000, 35, 87, 7),
(8, 'Grace Lee', 80000, 18, 88, 8),
(9, 'Henry Martin', 120000, 28, 89, 9),
(10, 'Ivy Thompson', 90000, 24, 90, 10),
(11, 'Jack Anderson', 400000, 50, 91, 11),
(12, 'Karen Thomas', 60000, 16, 92, 12),
(13, 'Leo Garcia', 180000, 32, 93, 13),
(14, 'Mia Martinez', 70000, 19, 94, 14),
(15, 'Noah Robinson', 220000, 36, 95, 15),
(16, 'Olivia Clark', 95000, 23, 96, 16),
(17, 'Paul Rodriguez', 130000, 27, 97, 17),
(18, 'Quinn Lewis', 110000, 26, 98, 18),
(19, 'Rachel Walker', 30000, 12, 99, 19),
(20, 'Steve Hall', 170000, 31, 100, 20),
(21, 'Tina Young', 85000, 21, 101, 21),
(22, 'Uma Allen', 140000, 29, 102, 22),
(23, 'Victor Hernandez', 260000, 37, 103, 23),
(24, 'Wendy King', 50000, 14, 104, 24),
(25, 'Xander Wright', 190000, 33, 105, 25),
(26, 'Yara Lopez', 65000, 17, 106, 26),
(27, 'Zack Scott', 230000, 38, 107, 27),
(28, 'Amy Green', 105000, 25, 108, 28),
(29, 'Ben Adams', 320000, 42, 109, 29),
(30, 'Cara Nelson', 55000, 13, 110, 30),
(31, 'Dylan Carter', 160000, 30, 111, 31),
(32, 'Eva Mitchell', 95000, 22, 112, 32),
(33, 'Finn Perez', 270000, 39, 113, 33),
(34, 'Gina Roberts', 45000, 11, 114, 34),
(35, 'Hank Turner', 200000, 34, 115, 35),
(36, 'Iris Phillips', 115000, 26, 116, 36),
(37, 'Jake Campbell', 290000, 41, 117, 37),
(38, 'Kara Parker', 80000, 20, 118, 38),
(39, 'Liam Evans', 135000, 28, 119, 39),
(40, 'Mona Rivera', 175000, 31, 120, 40);

INSERT INTO Album (album_id, album_name, no_of_songs) VALUES
(1, 'Midnight Dreams', 12),
(2, 'Echoes of Silence', 10),
(3, 'Golden Hour', 14),
(4, 'Neon Nights', 11),
(5, 'Starlight Symphony', 13),
(6, 'Ocean Breeze', 9),
(7, 'Electric Pulse', 15),
(8, 'Sunset Serenade', 12),
(9, 'Moonlight Melodies', 10),
(10, 'Urban Legends', 11),
(11, 'Celestial Harmony', 14),
(12, 'Rustic Rhythms', 9),
(13, 'Velvet Skies', 12),
(14, 'Crimson Echoes', 10),
(15, 'Mystic Waves', 13),
(16, 'Enchanted Forest', 11),
(17, 'Aurora Lights', 14),
(18, 'Desert Mirage', 9),
(19, 'Frozen Tides', 12),
(20, 'Infinite Horizons', 10),
(21, 'Lunar Phases', 11),
(22, 'Polaris', 13),
(23, 'Sapphire Skies', 12),
(24, 'Twilight Reverie', 10),
(25, 'Vivid Dreams', 14),
(26, 'Whispering Winds', 9),
(27, 'Xanadu', 11),
(28, 'Yearning Souls', 12),
(29, 'Zenith', 10),
(30, 'Aether', 13),
(31, 'Beyond the Stars', 11),
(32, 'Cosmic Dance', 14),
(33, 'Dawn of Eternity', 9),
(34, 'Elysian Fields', 12),
(35, 'Fading Embers', 10),
(36, 'Galactic Odyssey', 11),
(37, 'Harmonic Convergence', 13),
(38, 'Island Breeze', 12),
(39, 'Jade Horizons', 10),
(40, 'Kaleidoscope', 14);

INSERT INTO Create_Album (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40);

INSERT INTO Collaborates (artist_id1, artist_id2, artist_id3) VALUES
(5, 12, 23),
(7, 18, 34),
(3, 14, 29),
(9, 21, 37),
(2, 16, 31),
(11, 24, 40),
(6, 19, 33),
(8, 22, 36),
(4, 17, 30),
(10, 25, 38),
(1, 13, 27),
(15, 26, 39),
(20, 28, 35),
(5, 18, 32),
(7, 14, 29),
(3, 21, 37),
(9, 16, 31),
(2, 24, 40),
(6, 22, 36),
(8, 17, 30);

INSERT INTO Song (song_id, song_name, genre, run_time, album_id) VALUES
(1, 'Starlight', 'Pop', '03:45', 1),
(2, 'Echoes', 'Rock', '04:12', 2),
(3, 'Golden Days', 'Pop', '03:30', 3),
(4, 'Neon Lights', 'Electronic', '05:00', 4),
(5, 'Ocean Waves', 'Ambient', '04:45', 5),
(6, 'Electric Love', 'EDM', '03:55', 6),
(7, 'Sunset Glow', 'Pop', '04:10', 7),
(8, 'Moonlit Sky', 'Jazz', '05:20', 8),
(9, 'Urban Nights', 'Hip-Hop', '03:40', 9),
(10, 'Celestial Dreams', 'Ambient', '06:00', 10),
(11, 'Rustic Roads', 'Country', '03:50', 11),
(12, 'Velvet Shadows', 'R&B', '04:15', 12),
(13, 'Crimson Dawn', 'Rock', '04:30', 13),
(14, 'Mystic Forest', 'New Age', '05:10', 14),
(15, 'Aurora Borealis', 'Ambient', '06:05', 15),
(16, 'Desert Winds', 'World', '04:20', 16),
(17, 'Frozen Dreams', 'Pop', '03:35', 17),
(18, 'Infinite Skies', 'Electronic', '05:15', 18),
(19, 'Lunar Eclipse', 'Rock', '04:40', 19),
(20, 'Polaris', 'Pop', '03:50', 20),
(21, 'Sapphire Seas', 'Ambient', '05:30', 21),
(22, 'Twilight Zone', 'Electronic', '04:25', 22),
(23, 'Vivid Memories', 'Pop', '03:55', 23),
(24, 'Whispering Shadows', 'Jazz', '05:00', 24),
(25, 'Xanadu', 'New Age', '06:10', 25),
(26, 'Yearning Hearts', 'R&B', '04:15', 26),
(27, 'Zenith', 'Rock', '04:50', 27),
(28, 'Aether', 'Ambient', '05:45', 28),
(29, 'Beyond the Horizon', 'Pop', '03:40', 29),
(30, 'Cosmic Journey', 'Electronic', '05:20', 30),
(31, 'Dawn of Time', 'Rock', '04:35', 31),
(32, 'Elysian Dreams', 'Ambient', '06:00', 32),
(33, 'Fading Lights', 'Pop', '03:50', 33),
(34, 'Galactic Waves', 'Electronic', '05:10', 34),
(35, 'Harmonic Bliss', 'New Age', '05:45', 35),
(36, 'Island Breeze', 'World', '04:30', 36),
(37, 'Jade Skies', 'Ambient', '05:50', 37),
(38, 'Kaleidoscope', 'Pop', '03:55', 38),
(39, 'Lost in Time', 'Rock', '04:20', 39),
(40, 'Midnight Mirage', 'Electronic', '05:05', 40),
(41, 'Silent Echoes', 'Ambient', '05:15', 1),
(42, 'Radiant Sun', 'Pop', '03:50', 2),
(43, 'Crimson Tide', 'Rock', '04:25', 3),
(44, 'Electric Pulse', 'Electronic', '04:40', 4),
(45, 'Ocean Depths', 'Ambient', '06:10', 5),
(46, 'Neon Dreams', 'EDM', '03:55', 6),
(47, 'Golden Horizon', 'Pop', '04:05', 7),
(48, 'Moonlight Sonata', 'Classical', '05:30', 8),
(49, 'Urban Groove', 'Hip-Hop', '03:45', 9),
(50, 'Celestial Dawn', 'Ambient', '05:50', 10),
(51, 'Rustic Charm', 'Country', '03:40', 11),
(52, 'Velvet Touch', 'R&B', '04:20', 12),
(53, 'Mystic River', 'New Age', '05:15', 13),
(54, 'Aurora Sky', 'Ambient', '06:00', 14),
(55, 'Desert Storm', 'World', '04:35', 15),
(56, 'Frozen Heart', 'Pop', '03:55', 16),
(57, 'Infinite Stars', 'Electronic', '05:25', 17),
(58, 'Lunar Glow', 'Rock', '04:50', 18),
(59, 'Polaris Rising', 'Pop', '03:50', 19),
(60, 'Sapphire Moon', 'Ambient', '05:40', 20),
(61, 'Twilight Shadows', 'Electronic', '04:30', 21),
(62, 'Vivid Horizon', 'Pop', '03:55', 22),
(63, 'Whispering Winds', 'Jazz', '05:10', 23),
(64, 'Xanadu Dreams', 'New Age', '06:15', 24),
(65, 'Yearning Love', 'R&B', '04:20', 25),
(66, 'Zenith Sky', 'Rock', '04:55', 26),
(67, 'Aetherial Waves', 'Ambient', '05:50', 27),
(68, 'Beyond the Stars', 'Pop', '03:45', 28),
(69, 'Cosmic Dance', 'Electronic', '05:30', 29),
(70, 'Dawn of Light', 'Rock', '04:40', 30),
(71, 'Elysian Fields', 'Ambient', '06:05', 31),
(72, 'Fading Stars', 'Pop', '03:50', 32),
(73, 'Galactic Dreams', 'Electronic', '05:20', 33),
(74, 'Harmonic Waves', 'New Age', '05:55', 34),
(75, 'Island Sunset', 'World', '04:25', 35),
(76, 'Jade Moon', 'Ambient', '05:45', 36),
(77, 'Kaleidoscope Dreams', 'Pop', '03:55', 37),
(78, 'Lost Horizon', 'Rock', '04:30', 38),
(79, 'Midnight Sun', 'Electronic', '05:10', 39),
(80, 'Northern Lights', 'Ambient', '06:00', 40);

INSERT INTO Song_Upload (artist_id, song_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(1, 41),
(2, 42),
(3, 43),
(4, 44),
(5, 45),
(6, 46),
(7, 47),
(8, 48),
(9, 49),
(10, 50),
(11, 51),
(12, 52),
(13, 53),
(14, 54),
(15, 55),
(16, 56),
(17, 57),
(18, 58),
(19, 59),
(20, 60),
(21, 61),
(22, 62),
(23, 63),
(24, 64),
(25, 65),
(26, 66),
(27, 67),
(28, 68),
(29, 69),
(30, 70),
(31, 71),
(32, 72),
(33, 73),
(34, 74),
(35, 75),
(36, 76),
(37, 77),
(38, 78),
(39, 79),
(40, 80);

INSERT INTO Users (users_id, username, DOB, email, age, address_id) VALUES
(1, 'john_doe', '1990-05-15', 'john.doe@example.com', 33, 121),
(2, 'jane_smith', '1985-08-22', 'jane.smith@example.com', 38, 122),
(3, 'alice_johnson', '1995-03-10', 'alice.johnson@example.com', 28, 123),
(4, 'bob_brown', '1980-11-30', 'bob.brown@example.com', 43, 124),
(5, 'charlie_davis', '1992-07-25', 'charlie.davis@example.com', 31, 125),
(6, 'eve_white', '1988-04-18', 'eve.white@example.com', 35, 126),
(7, 'frank_wilson', '1993-09-12', 'frank.wilson@example.com', 30, 127),
(8, 'grace_lee', '1987-06-20', 'grace.lee@example.com', 36, 128),
(9, 'henry_martin', '1991-02-14', 'henry.martin@example.com', 32, 129),
(10, 'ivy_thompson', '1986-12-05', 'ivy.thompson@example.com', 37, 130),
(11, 'jack_anderson', '1994-01-28', 'jack.anderson@example.com', 29, 131),
(12, 'karen_thomas', '1989-10-15', 'karen.thomas@example.com', 34, 132),
(13, 'leo_garcia', '1996-08-08', 'leo.garcia@example.com', 27, 133),
(14, 'mia_martinez', '1984-07-03', 'mia.martinez@example.com', 39, 134),
(15, 'noah_robinson', '1997-05-19', 'noah.robinson@example.com', 26, 135),
(16, 'olivia_clark', '1983-04-22', 'olivia.clark@example.com', 40, 136),
(17, 'paul_rodriguez', '1998-03-11', 'paul.rodriguez@example.com', 25, 137),
(18, 'quinn_lewis', '1982-02-09', 'quinn.lewis@example.com', 41, 138),
(19, 'rachel_walker', '1999-01-07', 'rachel.walker@example.com', 24, 139),
(20, 'steve_hall', '1981-12-25', 'steve.hall@example.com', 42, 140),
(21, 'tina_young', '2000-11-20', 'tina.young@example.com', 23, 141),
(22, 'uma_allen', '1980-10-18', 'uma.allen@example.com', 43, 142),
(23, 'victor_hernandez', '2001-09-15', 'victor.hernandez@example.com', 22, 143),
(24, 'wendy_king', '1979-08-12', 'wendy.king@example.com', 44, 144),
(25, 'xander_wright', '2002-07-10', 'xander.wright@example.com', 21, 145),
(26, 'yara_lopez', '1978-06-08', 'yara.lopez@example.com', 45, 146),
(27, 'zack_scott', '2003-05-05', 'zack.scott@example.com', 20, 147),
(28, 'amy_green', '1977-04-03', 'amy.green@example.com', 46, 148),
(29, 'ben_adams', '2004-03-01', 'ben.adams@example.com', 19, 149),
(30, 'cara_nelson', '1976-02-28', 'cara.nelson@example.com', 47, 150),
(31, 'dylan_carter', '2005-01-25', 'dylan.carter@example.com', 18, 151),
(32, 'eva_mitchell', '1975-12-22', 'eva.mitchell@example.com', 48, 152),
(33, 'finn_perez', '2006-11-20', 'finn.perez@example.com', 17, 153),
(34, 'gina_roberts', '1974-10-18', 'gina.roberts@example.com', 49, 154),
(35, 'hank_turner', '2007-09-15', 'hank.turner@example.com', 16, 155),
(36, 'iris_phillips', '1973-08-13', 'iris.phillips@example.com', 50, 156),
(37, 'jake_campbell', '2008-07-11', 'jake.campbell@example.com', 15, 157),
(38, 'kara_parker', '1972-06-09', 'kara.parker@example.com', 51, 158),
(39, 'liam_evans', '2009-05-07', 'liam.evans@example.com', 14, 159),
(40, 'mona_rivera', '1971-04-05', 'mona.rivera@example.com', 52, 160);

INSERT INTO Listen (users_id, song_id) VALUES
(5, 12),
(12, 23),
(3, 34),
(18, 45),
(7, 56),
(22, 67),
(9, 78),
(31, 5),
(14, 16),
(27, 27),
(2, 38),
(19, 49),
(33, 60),
(8, 71),
(25, 12),
(36, 9),
(11, 20),
(29, 31),
(4, 42),
(17, 53),
(30, 64),
(6, 75),
(21, 66),
(38, 13),
(10, 24),
(23, 35),
(35, 46),
(16, 57),
(28, 68),
(39, 79),
(1, 8),
(13, 19),
(24, 30),
(37, 41),
(20, 52),
(32, 63),
(15, 74),
(26, 75),
(34, 10),
(40, 21);

INSERT INTO Artist_Prod (artist_id, producer_id) VALUES
(5, 12),
(12, 23),
(3, 34),
(18, 5),
(7, 16),
(22, 27),
(9, 38),
(31, 9),
(14, 20),
(27, 31),
(2, 4),
(19, 13),
(33, 24),
(8, 35),
(25, 6),
(36, 17),
(11, 28),
(29, 39),
(4, 8),
(17, 19),
(30, 30),
(6, 1),
(21, 22),
(38, 33),
(10, 14),
(23, 25),
(35, 36),
(16, 7),
(28, 18),
(39, 29),
(1, 10),
(13, 21),
(24, 32),
(37, 3),
(20, 15),
(32, 26),
(15, 37),
(26, 8),
(34, 19),
(40, 2);

INSERT INTO Playlist (playlist_id, playlist_name, users_id) VALUES
(1, 'Chill Vibes', 5),
(2, 'Workout Beats', 12),
(3, 'Road Trip Mix', 3),
(4, 'Relaxing Tunes', 18),
(5, 'Party Hits', 7),
(6, 'Study Focus', 22),
(7, 'Morning Motivation', 9),
(8, 'Late Night Feels', 31),
(9, 'Throwback Jams', 14),
(10, 'Indie Picks', 27),
(11, 'Summer Vibes', 2),
(12, 'Rainy Day Melodies', 19),
(13, 'Dance Floor Anthems', 33),
(14, 'Acoustic Sessions', 8),
(15, 'Rock Classics', 25),
(16, 'Hip-Hop Essentials', 36),
(17, 'Jazz Lounge', 11),
(18, 'Country Roads', 29),
(19, 'EDM Bangers', 4),
(20, 'R&B Soul', 17),
(21, 'Pop Hits', 30),
(22, 'Instrumental Focus', 6),
(23, 'Feel-Good Favorites', 21),
(24, '90s Nostalgia', 38),
(25, '00s Throwbacks', 10),
(26, 'Chillstep Mix', 23),
(27, 'Lo-Fi Beats', 35),
(28, 'Metal Mayhem', 16),
(29, 'Piano Melodies', 28),
(30, 'Reggae Rhythms', 39),
(31, 'K-Pop Hits', 1),
(32, 'Bollywood Beats', 13),
(33, 'Latin Grooves', 24),
(34, 'Classical Masterpieces', 37),
(35, 'Folk Favorites', 20),
(36, 'Gaming Soundtrack', 32),
(37, 'Motivational Mix', 15),
(38, 'Romantic Ballads', 26),
(39, 'Disco Fever', 34),
(40, 'Ambient Sounds', 40);

INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES
(1, 12),
(2, 23),
(3, 34),
(4, 45),
(5, 56),
(6, 67),
(7, 78),
(8, 5),
(9, 16),
(10, 27),
(11, 38),
(12, 49),
(13, 60),
(14, 71),
(15, 22),
(16, 9),
(17, 20),
(18, 31),
(19, 42),
(20, 53),
(21, 64),
(22, 75),
(23, 46),
(24, 13),
(25, 24),
(26, 35),
(27, 46),
(28, 57),
(29, 68),
(30, 79),
(31, 8),
(32, 19),
(33, 30),
(34, 41),
(35, 52),
(36, 63),
(37, 74),
(38, 55),
(39, 10),
(40, 21);