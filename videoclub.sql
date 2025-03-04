CREATE SCHEMA videoclub;
SET search_path TO videoclub;

CREATE TABLE Socio (
   id SERIAL PRIMARY KEY,
   nombre VARCHAR(50) NOT NULL,
   apellido_1 VARCHAR(50) NOT NULL,
   apellido_2 VARCHAR(50),
   fecha_nacimiento DATE NOT NULL,
   DNI VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Direccion (
   id SERIAL PRIMARY KEY,
   calle VARCHAR(50) NOT NULL,
   numero INT NOT NULL,
   piso CHAR(2),
   codigo_postal CHAR(5) NOT NULL,
   id_socio INT UNIQUE NOT NULL,
   CONSTRAINT fk_direccion_socio FOREIGN KEY (id_socio) REFERENCES Socio(id) ON DELETE CASCADE
);

CREATE TABLE Pelicula (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  director VARCHAR(50),
  sinopsis TEXT,
  copias INT NOT NULL DEFAULT 0
);

CREATE TABLE Alquiler (
  id SERIAL PRIMARY KEY,
  fecha_alquiler DATE NOT NULL,
  fecha_devo DATE NULL,
  id_socio INT NOT NULL,
  id_pelicula INT NOT NULL,
  CONSTRAINT fk_alquiler_socio FOREIGN KEY (id_socio) REFERENCES Socio(id) ON DELETE CASCADE,
  CONSTRAINT fk_alquiler_pelicula FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id) ON DELETE CASCADE
);

CREATE TABLE Genero (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE GeneroPelicula (
    id SERIAL PRIMARY KEY,
    id_pelicula INT NOT NULL,
    id_genero INT NOT NULL,
    CONSTRAINT fk_genero_pelicula FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id) ON DELETE CASCADE,
    CONSTRAINT fk_genero_genero FOREIGN KEY (id_genero) REFERENCES Genero(id) ON DELETE CASCADE,
    CONSTRAINT unique_genero_pelicula UNIQUE (id_pelicula, id_genero)
);

INSERT INTO Socio (nombre, apellido_1, apellido_2, fecha_nacimiento, DNI) VALUES
  ('Juan', 'Pérez', 'Gómez', '1985-06-15', '12345678A'),
  ('María', 'López', 'Fernández', '1992-09-23', '87654321B'),
  ('Carlos', 'Martínez', NULL, '1978-12-05', '11223344C');

INSERT INTO Direccion (calle, numero, piso, codigo_postal, id_socio) VALUES
 ('Calle Mayor', 10, '2A', '28001', 1),
 ('Avenida del Sol', 25, NULL, '28002', 2);


INSERT INTO Pelicula (titulo, director, sinopsis, copias) VALUES
  ('El Padrino', 'Francis Ford Coppola', 'Historia de la mafia italoamericana.', 5),
  ('Titanic', 'James Cameron', 'Historia de amor en el trágico hundimiento del Titanic.', 3),
  ('Matrix', 'Lana y Lilly Wachowski', 'Un hacker descubre la verdad sobre su realidad.', 4);

INSERT INTO Genero (nombre) VALUES
    ('Drama'),
    ('Acción'),
    ('Ciencia Ficción'),
    ('Romance');

INSERT INTO GeneroPelicula (id_pelicula, id_genero) VALUES
    (1, 1),
    (2, 4),
    (3, 2),
    (3, 3);

INSERT INTO Alquiler (fecha_alquiler, fecha_devo, id_socio, id_pelicula) VALUES
     ('2025-02-01', '2025-02-10', 1, 1),
     ('2025-02-15', NULL, 2, 2),
     ('2025-02-20', NULL, 3, 3);

SELECT
    p.titulo AS titulo_pelicula,
    (p.copias - COALESCE(COUNT(a.id), 0)) AS copias_disponibles
FROM Pelicula p
         LEFT JOIN Alquiler a ON p.id = a.id_pelicula AND a.fecha_devo IS NULL
GROUP BY p.id, p.titulo
ORDER BY p.titulo;
