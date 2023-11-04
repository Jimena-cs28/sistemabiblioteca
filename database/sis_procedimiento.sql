USE sisbiblioteca

DELIMITER$$
CREATE PROCEDURE spu_login 
( 
	IN _nombreusuarios VARCHAR(30)
)
BEGIN
SELECT usuarios.idusuario, personas.nombres, personas.apellidos, usuarios.nombreusuario, roles.nombrerol,
	usuarios.claveacceso
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE nombreusuario = _nombreusuarios;
END$$

CALL spu_login ('75123489');

SELECT * FROM usuarios


-- SECCION LIBROS
DELIMITER $$
CREATE PROCEDURE spu_listar_libro
(
	IN _idsubcategoria INT
)
BEGIN
	SELECT idlibro, libros.nombre,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.idsubcategoria = _idsubcategoria;
END$$

CALL spu_listar_libro(4);

DELIMITER $$
CREATE PROCEDURE spu_filtro_categoria(IN _idcategoria INT)
BEGIN 
	SELECT *
	FROM subcategorias
	WHERE idcategoria =  _idcategoria;
END $$

-- SECCION ESTUDIANTE Y PROFESOR

DELIMITER $$
CREATE PROCEDURE spu_listar_estudiantes()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario, claveacceso
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3;
END$$

CALL spu_listar_estudiantes();

DELIMITER $$
CREATE PROCEDURE spu_listar_profesor()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario, claveacceso
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2;
END$$

CALL spu_listar_profesor();
SELECT * FROM libros

SELECT * FROM roles WHERE idrol = 3

-- ---------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_filtro_student()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres,' ', personas.apellidos) AS 'nombres'
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 3 AND 2;
END $$

CALL spu_filtro_student();

SELECT * FROM roles;
SELECT * FROM personas;
SELECT * FROM librosentregados;

SELECT * FROM libros
SELECT * FROM subcategorias

-- LISTAR TODO
DELIMITER $$
CREATE PROCEDURE spu_listar_fichaprestamo
(
	IN _idlibrosentregados INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, roles.nombrerol, personas.nombres, personas.apellidos, prestamos.descripcion,
	categorias.categoria, subcategorias.subcategoria, libros.nombre, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE idlibroentregado = _idlibrosentregados;
END $$

CALL spu_listar_fichaprestamo(2);
SELECT * FROM prestamos


-- REGISTRO ESTUDIANTE Y PROFESOR
DELIMITER $$
CREATE PROCEDURE spu_registrar_estudiante
(
    IN _apellidos VARCHAR(50),
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Insertar el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Insertar el registro en la tabla "usuarios" con el rol de Estudiante (idrol = 3)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 3, _nombreusuario, _claveacceso);
END$$

CALL spu_registrar_estudiante('Lopez García', 'Elizabeth', '78290181','DNI','',
'Chincha Baja','928782981','','78290181','654321');

CALL spu_listar_estudiantes();

SELECT * FROM prestamos;

DELIMITER $$
CREATE PROCEDURE spu_registrar_profesor
(
    IN _apellidos VARCHAR(50),
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Inserta el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Inserta el registro en la tabla "usuarios" con el rol de Profesor (idrol = 2)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 2, _nombreusuario, _claveacceso);
END$$

CALL spu_registrar_profesor('Tasayco Gomez', 'Raúl','72890192','DNI','1990-10-10','Chincha Alta',
'938789282','','72890192','4321');

CALL spu_listar_profesor();
SELECT * FROM librosentregados;

-- libros
DELIMITER $$
CREATE PROCEDURE spu_obtener_prestamo
(
	IN _idprestamo INT
)
BEGIN 
	SELECT * FROM prestamos WHERE idprestamo = _idprestamo;
END$$

SELECT * FROM subcategorias

DELIMITER $$
CREATE PROCEDURE spu_obtener_libroentregado
(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, personas.nombres, personas.apellidos, librosentregados.cantidad, prestamos.descripcion,
	libros.nombre, prestamos.fechasolicitud, prestamos.fechaprestamo, fechadevolucion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE estado = 'R' AND idlibroentregado = _idlibroentregado;
END $$

CALL spu_obtener_libroentregado(9);

SELECT * FROM librosentregados WHERE estado = 'D' AND idlibroentregado = 8 SET ;

UPDATE librosentregados SET fechadevolucion = '2023-11-06'
WHERE idlibroentregado = 27;

DELIMITER $$
CREATE PROCEDURE spu_listado_libros()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.nombre, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.nombres,' ',autores.apellidos) AS 'autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	ORDER BY iddetalleautor DESC;
END $$

SELECT * FROM libros
 -- para subcategoria
 SELECT * FROM autores
 
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategoria
( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END$$

 SELECT * FROM prestamos WHERE estado = 'T'
 
-- Category
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategorias()
BEGIN
	SELECT idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	FROM subcategorias
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria;
END$$

 -- REPORTES
 SELECT libros.nombre
 FROM librosentregados
 INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
 INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
 INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
 INNER JOIN usuarios usu2 ON usu2.idusuario = prestamos.idbibliotecario
 INNER JOIN roles ON roles.idrol = usu1.idrol
 INNER JOIN personas ON personas.idpersona = usu1.idpersona;
 
 -- 2f y 3m
 SELECT idlibroentregado, prestamos.descripcion, COUNT(prestamos.idprestamo) AS 'cantPrestamos', 
 libros.nombre
 FROM librosentregados
 INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
 INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
 WHERE prestamos.estado = 'T' AND prestamos.descripcion = '3m'
 
 
 -- Traer libros 
 SELECT * FROM detalleautores
  SELECT * FROM libros
 
DELIMITER $$
CREATE PROCEDURE spu_obtener_detalleautores
(
	IN _iddetalleautor INT
)
BEGIN
	SELECT detalleautores.iddetalleautor, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
	libros.nombre, libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, CONCAT(autores.nombres,' ',autores.apellidos) AS 'Autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.iddetalleautor = _iddetalleautor;
END $$

CALL spu_obtener_detalleautores(4);
 
 
 -- actualizar libro
SELECT * FROM libros 
 
DELETE FILE  TABLE libros WHERE idlibro = 10
 
 
 
 
 
 