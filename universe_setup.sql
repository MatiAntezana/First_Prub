-- Connect to the universe database
\c universe

-- Create galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  galaxy_type VARCHAR(50) NOT NULL,
  diameter_in_millions_of_miles INT NOT NULL,
  age_in_millions_of_years INT,
  has_life BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  galaxy_id INT NOT NULL,
  name VARCHAR(100) NOT NULL UNIQUE,
  star_type VARCHAR(50) NOT NULL,
  distance_from_earth INT NOT NULL,
  is_spherical BOOLEAN NOT NULL DEFAULT TRUE,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Create planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  star_id INT NOT NULL,
  name VARCHAR(100) NOT NULL UNIQUE,
  planet_type VARCHAR(50) NOT NULL,
  distance_from_star_in_km NUMERIC NOT NULL,
  is_habitable BOOLEAN NOT NULL DEFAULT FALSE,
  gravity NUMERIC,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

-- Create moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  planet_id INT NOT NULL,
  name VARCHAR(100) NOT NULL UNIQUE,
  moon_type VARCHAR(50) NOT NULL,
  diameter_in_km INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL DEFAULT FALSE,
  description TEXT,
  FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

-- Create asteroid table (5th table)
CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  galaxy_id INT NOT NULL,
  name VARCHAR(100) NOT NULL UNIQUE,
  diameter_in_km INT NOT NULL,
  composition TEXT NOT NULL,
  is_metallic BOOLEAN NOT NULL DEFAULT FALSE,
  distance_from_sun INT,
  FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Insert data into galaxy table (6 rows)
INSERT INTO galaxy (name, galaxy_type, diameter_in_millions_of_miles, age_in_millions_of_years, has_life)
VALUES
  ('Milky Way', 'Spiral', 100000, 13600, TRUE),
  ('Andromeda', 'Spiral', 220000, 10000, FALSE),
  ('Triangulum', 'Spiral', 60000, 13800, FALSE),
  ('Centaurus A', 'Elliptical', 130000, 12000, FALSE),
  ('Sombrero', 'Elliptical', 50000, 14000, FALSE),
  ('Whirlpool', 'Spiral', 76000, 13400, FALSE);

-- Insert data into star table (6 rows)
INSERT INTO star (galaxy_id, name, star_type, distance_from_earth, is_spherical)
VALUES
  (1, 'Sun', 'Yellow Dwarf', 0, TRUE),
  (1, 'Sirius', 'Blue-White', 9, TRUE),
  (1, 'Alpha Centauri A', 'Yellow Dwarf', 4, TRUE),
  (2, 'Andromeda Prime', 'Red Giant', 25000, TRUE),
  (3, 'Triangulum Star', 'White Dwarf', 28000, TRUE),
  (4, 'Centaurus Star', 'Red Supergiant', 47000, TRUE);

-- Insert data into planet table (12 rows)
INSERT INTO planet (star_id, name, planet_type, distance_from_star_in_km, is_habitable, gravity)
VALUES
  (1, 'Mercury', 'Terrestrial', 57909100, FALSE, 3.7),
  (1, 'Venus', 'Terrestrial', 108208000, FALSE, 8.87),
  (1, 'Earth', 'Terrestrial', 149597870, TRUE, 9.8),
  (1, 'Mars', 'Terrestrial', 227923000, FALSE, 3.71),
  (1, 'Jupiter', 'Gas Giant', 778340821, FALSE, 24.79),
  (1, 'Saturn', 'Gas Giant', 1426725000, FALSE, 10.44),
  (2, 'Sirius I', 'Terrestrial', 75000000, FALSE, 5.5),
  (2, 'Sirius II', 'Gas Giant', 200000000, FALSE, 15.0),
  (3, 'Alpha Centauri I', 'Terrestrial', 100000000, FALSE, 4.2),
  (4, 'Andromeda I', 'Ice Giant', 300000000, FALSE, 12.5),
  (5, 'Triangulum I', 'Terrestrial', 50000000, FALSE, 6.1),
  (6, 'Centaurus I', 'Gas Giant', 400000000, FALSE, 20.0);

-- Insert data into moon table (20 rows)
INSERT INTO moon (planet_id, name, moon_type, diameter_in_km, has_atmosphere, description)
VALUES
  (3, 'Moon', 'Rocky', 3474, FALSE, 'Earth''s natural satellite'),
  (3, 'Luna Major', 'Rocky', 2500, FALSE, 'Hypothetical second moon'),
  (4, 'Phobos', 'Rocky', 23, FALSE, 'Mars'' inner moon'),
  (4, 'Deimos', 'Rocky', 12, FALSE, 'Mars'' outer moon'),
  (5, 'Io', 'Volcanic', 3643, FALSE, 'Volcanically active'),
  (5, 'Europa', 'Icy', 3122, FALSE, 'Has subsurface ocean'),
  (5, 'Ganymede', 'Icy', 5268, FALSE, 'Largest moon in solar system'),
  (5, 'Callisto', 'Rocky', 4821, FALSE, 'Heavily cratered'),
  (6, 'Titan', 'Icy', 5150, TRUE, 'Has thick atmosphere'),
  (6, 'Enceladus', 'Icy', 504, FALSE, 'Geysers observed'),
  (6, 'Mimas', 'Rocky', 396, FALSE, 'Has prominent crater'),
  (6, 'Triton', 'Icy', 2707, FALSE, 'Retrograde orbit'),
  (7, 'Sirius Moon 1', 'Rocky', 1500, FALSE, 'Small satellite'),
  (7, 'Sirius Moon 2', 'Rocky', 2000, FALSE, 'Larger satellite'),
  (8, 'Sirius II Moon 1', 'Icy', 5000, FALSE, 'Ice moon'),
  (9, 'Alpha Moon 1', 'Rocky', 1200, FALSE, 'Small moon'),
  (10, 'Andromeda Moon 1', 'Icy', 3500, FALSE, 'Ice giant moon'),
  (11, 'Triangulum Moon 1', 'Rocky', 1800, FALSE, 'Small terrestrial moon'),
  (12, 'Centaurus Moon 1', 'Icy', 6000, FALSE, 'Large ice moon'),
  (12, 'Centaurus Moon 2', 'Rocky', 2500, FALSE, 'Rocky companion');

-- Insert data into asteroid table (5 rows minimum for requirement)
INSERT INTO asteroid (galaxy_id, name, diameter_in_km, composition, is_metallic, distance_from_sun)
VALUES
  (1, 'Ceres', 950, 'Rock and Ice', FALSE, 413),
  (1, 'Vesta', 530, 'Silicate Rock', FALSE, 352),
  (1, 'Pallas', 582, 'Carbon Rock', FALSE, 414),
  (1, 'Juno', 240, 'Carbon Rock', FALSE, 500),
  (1, 'Psyche', 225, 'Iron and Nickel', TRUE, 532);
