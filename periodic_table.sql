DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table;
\connect periodic_table

CREATE TABLE types (
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(20) NOT NULL
);

CREATE TABLE elements (
  atomic_number INT PRIMARY KEY,
  symbol VARCHAR(5) UNIQUE NOT NULL,
  name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE properties (
  atomic_number INT PRIMARY KEY REFERENCES elements(atomic_number),
  atomic_mass NUMERIC NOT NULL,
  melting_point_celsius NUMERIC NOT NULL,
  boiling_point_celsius NUMERIC NOT NULL,
  type_id INT NOT NULL REFERENCES types(type_id)
);

INSERT INTO types(type) VALUES ('metal'), ('metalloid'), ('nonmetal');

INSERT INTO elements(atomic_number, symbol, name) VALUES
  (1, 'H', 'Hydrogen'),
  (2, 'He', 'Helium'),
  (3, 'Li', 'Lithium'),
  (4, 'Be', 'Beryllium'),
  (5, 'B', 'Boron'),
  (6, 'C', 'Carbon'),
  (7, 'N', 'Nitrogen'),
  (8, 'O', 'Oxygen'),
  (9, 'F', 'Fluorine'),
  (10, 'Ne', 'Neon');

INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES
  (1, 1.008, -259.1, -252.9, 3),
  (2, 4.0026, -272.2, -268.9, 3),
  (3, 6.94, 180.5, 1342, 1),
  (4, 9.0122, 1287, 2469, 1),
  (5, 10.81, 2075, 4000, 2),
  (6, 12.011, 3550, 4027, 3),
  (7, 14.007, -210.1, -195.8, 3),
  (8, 15.999, -218.8, -183, 3),
  (9, 18.998, -220, -188.1, 3),
  (10, 20.18, -248.6, -246.1, 3);

