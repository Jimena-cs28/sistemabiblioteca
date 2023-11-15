USE sistemabiblioteca 

INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso) VALUES
	(1, 1, '75123489', '1234567'),-- administrador
	(2, 3, '78674219', '1234567'); -- usuario
--	(2, 3, '75140236', '223344'),
--	(3, 3, '73129045', 'sofi12'),
--	(4, 3, '78674219', '121223'),
--	(5, 3, '76401538', 'SalaLu23'),
--	(6, 3, '74102589', 'Nyla19'),
--	(7, 3, '76410258', 'Ari'),
--	(15, 3,'73194180', '1234'),

UPDATE usuarios SET claveacceso = '$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC'
WHERE idusuario = 1;

-- 1234
-- 73129045
UPDATE usuarios SET claveacceso = '$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC'
WHERE idusuario = 2;

SELECT * FROM usuarios
SELECT * FROM roles

INSERT INTO personas (apellidos, nombres, tipodocumento, nrodocumento, fechanac, direccion, telefono, email) VALUES
	('Berrocal paima', 'Luis Fernando', 'DNI', '76543001', '', 'Sunampe', '964513274', ''),
	('Cartagena Salazar','Jimena Adriana','DNI','73194180','','El carmen','','95107563'),
	('Palma Navarro','Sylvie','DNI','74150120','','Grocio Prado','951207403',''),
	('Cartagena Salas','Maira','DNI','83215278','','Chincha','956432176',''),
	('Lopez Salas','Sofia','DNI','73129045','','Chincha','956432176',''),
	('Duren Buenamarca','Layla','DNI','78674219','','Chincha','956432176',''),
	('Salazar Rojas','Luisa','DNI','76401538','','El carmen','912458130',''),
	('Fajardo Cordova','Nayla','DNI','74102589','','Chincha Alta','987400335',''),
	('Urbano Florez','Ariana','DNI','76410258','','Pueblo nuevo','917845230','');

-- UPDATE personas SET direccion = 'Calle Grau #3'
-- WHERE idpersona = 2;

SELECT * FROM categorias

INSERT INTO roles (nombrerol, cantidadmax) VALUES
('Administrador',5),
('Profesor',40),
('Estudiante',3);

INSERT INTO editoriales (nombres, telefono, website, email, paisorigen) VALUES
('Ariel', '943883123', '', 'jonathanc@gmail.com', 'EEUU'),
('Paidos', '913033923', '', 'max@gmail.com', 'España');

INSERT INTO categorias (categoria, codigo) VALUES
('Obras Generales','000'),
('Filosofia y Psicologia','100'),
('Religion','200'),
('Ciencias Sociales','300'),
('Lenguas','400'),
('Ciencias Naturales y Matematicas', '500'),
('Tecnología, Ciencias Aplicadas','600'),
('Las Artes, Bellas Artes y Artes Decorativas','700'),
('Literatura', '800'),
('Historia y Geografía', '900');

SELECT * FROM subcategorias

-- FALTA SUBCATEGORIAS
INSERT INTO subcategorias (idcategoria, subcategoria, codigo) VALUES
(2, 'Escuelas Filosóficas Específicas', '140'), 
(4, 'Educacion', '370'),
(6, 'Matemáticas', '510'), 
(6, 'Astronomía y ciencias afines', '520'), -- 1362383
(6, 'Física', '530'),
(6, 'Ciencias de la vida Biología', '570'),
(9, 'Literatura estadounidense', '810'),
(9, 'Literatura inglesa e inglesa antigua(Anglosajona)', '820'),
(9, 'Literatura de lenguas germánicas literatura alemana', '830'),
(9, 'Literatura Francesa y literaturas de las lenguas romances', '840'),
(9, 'Literatura española y portuguesa', '860'),
(10,'Historia Universal', '909'),
(10,'Geografía y viajes', '910'),
(10,'Historia de américa del sur', '980');

INSERT INTO autores (apellidos, autor, pseudonimio, nacionalidad) VALUES
('Crary', 'Jonathan', '', 'Vermont'),
('Verdy', 'Luis', '', 'Frances'),
('Cortes', 'Jeremy', '', 'Estadunidence');

INSERT INTO libros (idsubcategoria, ideditorial,libro, tipo,cantidad, numeropaginas, codigo, edicion, formato, anio, idioma, descripcion, imagenportada) VALUES
	(1, 1, 'Historia del mundo contemporáneo', 'texto', 9,'132', '140.053', '','', '', 'castellano', '','');
	(3, 2, 'El mentor de matematicas', 'texto', 11,'102', '513', '','', '2010', 'castellano', '',''),
	(4, 2, 'Atlas del cielo', 'texto', 12 ,'100', '525', '','', '2020', 'castellano', '',''),
	(6, 2, 'Atlas del cuerpo humano', 'texto', 9,'12', '574', '','', '2001', 'castellano', '',''),
	(7, 1, 'El guardián entre el enteno', 'texto', 12,'232', '813.005', '','', '2000', 'castellano', '',''),
	(10, 2, 'La vuelta al mundo entero en 80 días', 'texto', 23,'22', '843.008', '','', '2011', 'castellano', '','');

SELECT * FROM libros

INSERT INTO detalleautores (idlibro, idautor) VALUES
(2, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

SELECT * FROM ejemplares
INSERT INTO ejemplares (idlibro,codigo_libro) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9);

-- NO EJECUTADO
INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo, fecharespuesta, fechaentrega, descripcion, enbiblioteca, lugardestino) VALUES
			(6,11,'2023-10-28', '', '', '2F', 'SI', '');

SELECT * FROM ejemplares
INSERT INTO ejemplares(idlibro,codigo_libro) VALUES
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,8),
(2,9);



