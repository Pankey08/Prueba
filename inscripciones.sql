-- Database: Inscripciones

-- DROP DATABASE "Inscripciones";

-- Equipo: Madariaga del Río Carlos Daniel. Parra Gude Cynthia.

CREATE DATABASE "Inscripciones";

-CREATE TABLE grupo(id SERIAL PRIMARY KEY NOT NULL, asignatura_id integer NOT NULL, periodo_id integer NOT NULL, clave varchar(4), cupo integer);
-CREATE TABLE inscripcion(id SERIAL PRIMARY KEY NOT NULL, alumno_id integer NOT NULL, grupo_id integer NOT NULL, hora time, fecha date, host char(15));
-CREATE TABLE alumno(id SERIAL PRIMARY KEY NOT NULL, persona_id integer NOT NULL, num_cuenta char(9), generacion integer);
-CREATE TABLE persona(id SERIAL PRIMARY KEY NOT NULL, nombre varchar(75), apaterno varchar(75), amaterno varchar(75));
-CREATE TABLE profesor(id SERIAL PRIMARY KEY NOT NULL, persona_id integer NOT NULL, num_trabajador varchar(10), cedula varchar(10), grado char(1));
-CREATE TABLE asignatura(id SERIAL PRIMARY KEY NOT NULL, nombre varchar(100), plan_estudio char(4));
-CREATE TABLE periodo(id SERIAL PRIMARY KEY NOT NULL, fec_inicio date NOT NULL, fec_fin date, estado bool NOT NULL);
-CREATE TABLE dia(id SERIAL PRIMARY KEY NOT NULL, nombre varchar(9) NOT NULL);
-CREATE TABLE salon(id SERIAL PRIMARY KEY NOT NULL, edificio_piso char(1));
-CREATE TABLE horario(id SERIAL PRIMARY KEY NOT NULL, hora_id integer NOT NULL, grupo_id integer NOT NULL, dia_id integer NOT NULL, salon_id integer NOT NULL);
-CREATE TABLE hora(id SERIAL PRIMARY KEY NOT NULL, hora_ini time, hora_fin time);

ALTER TABLE grupo ADD CONSTRAINT fk_asignatura_id FOREIGN KEY (asignatura_id) references asignatura(id), ADD CONSTRAINT fk_periodo_id FOREIGN KEY (periodo_id) references periodo(id);
ALTER TABLE inscripcion ADD CONSTRAINT fk_alumno_id FOREIGN KEY (alumno_id) references alumno(id), ADD CONSTRAINT fk_grupo_id FOREIGN KEY (grupo_id) references grupo(id);
ALTER TABLE alumno ADD CONSTRAINT fk_persona_id FOREIGN KEY (persona_id) references persona(id);
ALTER TABLE profesor ADD CONSTRAINT fk_persona_id FOREIGN KEY (persona_id) references persona(id);
ALTER TABLE horario ADD CONSTRAINT fk_hora_id FOREIGN KEY (hora_id) references hora(id), ADD CONSTRAINT fk_grupo_id FOREIGN KEY (grupo_id) references grupo(id), ADD CONSTRAINT fk_dia_id FOREIGN KEY (dia_id) references dia(id), ADD CONSTRAINT fk_salon_id FOREIGN KEY (salon_id) references salon(id);

CREATE INDEX grupo_fk1 ON grupo(asignatura_id);
CREATE INDEX grupo_fk2 ON grupo(periodo_id);
CREATE INDEX inscripcion_fk1 ON inscripcion(alumno_id);
CREATE INDEX inscripcion_fk2 ON inscripcion(grupo_id);
CREATE INDEX alumno_fk1 ON alumno(persona_id);
CREATE INDEX profesor_fk1 ON profesor(persona_id);
CREATE INDEX horario_fk1 ON horario(hora_id);
CREATE INDEX horario_fk2 ON horario(grupo_id);
CREATE INDEX horario_fk3 ON horario(dia_id);
CREATE INDEX horario_fk4 ON horario(salon_id);

