USE sistemabiblioteca
DROP DATABASE sistemabiblioteca
DELIMITER$$
CREATE PROCEDURE spu_login 
( 
	IN _nombreusuarios VARCHAR(30)
)
BEGIN
SELECT usuarios.idusuario, personas.nombres, personas.apellidos, usuarios.nombreusuario, roles.nombrerol,
	personas.nrodocumento, personas.fechanac, personas.direccion,
	usuarios.claveacceso
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE nombreusuario = _nombreusuarios;
END$$

CALL spu_login ('75123489');
UPDATE libros SET libro = 'La Ciudad de los perros' WHERE idlibro = 10
UPDATE ejemplares SET estado = 0 WHERE idejemplar = 64
-- 62 
SELECT * FROM librosentregados
-- delimiter $$
-- create procedure spu_listar_subcategoria( in )
-- SECCION LIBROS
DELIMITER $$
CREATE PROCEDURE spu_listar_libro
(
	IN _idsubcategoria INT
)
BEGIN
	SELECT idlibro, libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.idsubcategoria = _idsubcategoria;
END$$

-- ---------------------------------------------------------------------------------------------------------------------------

DELIMITER $$ -- ejecutado ESTUDIANTES
CREATE PROCEDURE spu_filtro_student()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres' , usuarios.estado, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 3 AND usuarios.estado = 1;
END $$

DELIMITER $$ -- ejecutado ESTUDIANTES
CREATE PROCEDURE spu_filtro_teacher()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres' , usuarios.estado, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = 2 AND usuarios.estado = 1;
END $$

CALL spu_filtro_student();
SELECT * FROM prestamos
SELECT * FROM roles;
SELECT * FROM prestamos;
UPDATE prestamos SET estado = 'D' WHERE
UPDATE prestamos SET fecharespuesta = NOW() WHERE idprestamo = 1;

SELECT * FROM usuarios
SELECT * FROM librosentregados

-- LISTAR TODO
DELIMITER $$
CREATE PROCEDURE spu_listar_fichaprestamo
(
	IN _prestamo INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, ejemplares.codigo_libro, libros.codigo, libros.imagenportada, roles.nombrerol, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres', 
	prestamos.descripcion,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, categorias.categoria, 
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, librosentregados.fechadevolucion, prestamos.lugardestino,
	prestamos.fecharespuesta, prestamos.lugardestino, prestamos.motivorechazo, prestamos.estado
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idprestamo = _prestamo AND prestamos.estado IN ('T','C');
END $$
UPDATE prestamos SET descripcion = '4B'WHERE idprestamo = 55
SELECT *FROM libros
-- UNICO = NOMBRE, ROL,DESCRIPCION
-- IDEEJMPLO =IKN
SELECT * FROM prestamos
CALL spu_listar_fichaprestamo(90);

UPDATE prestamos SET estado = 'D' WHERE idprestamo = 8
SELECT * FROM detalleautores
CALL spu_listar_profesor();
SELECT * FROM librosentregados;
UPDATE detalleautores SET
estado = 0 WHERE iddetalleautor = 33
-- libros

SELECT * FROM prestamos

DELIMITER $$
CREATE PROCEDURE spu_obtener_libroentregado
(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, CONCAT(personas.nombres, ' ',personas.apellidos) 'nombres' , personas.apellidos, prestamos.descripcion,
	libros.libro, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.estado = 'R' AND idlibroentregado = _idlibroentregado;
END $$

CALL spu_obtener_libroentregado(115);
SELECT * FROM prestamos
SELECT * FROM librosentregados

DELIMITER $$
CREATE PROCEDURE spu_traer_datosD
(
	IN _idlibroentregado INT
)
BEGIN
	SELECT * FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
END $$

CALL spu_traer_datosD(2)

SELECT * FROM prestamos

SELECT * FROM libros
 -- para subcategoria
 SELECT * FROM autores

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
 


CALL spu_obtener_detalleautores(2);
 

SELECT * FROM librosentregados WHERE estado = 0


DELIMITER $$
CREATE PROCEDURE spu_traer_grado
(
	IN _idusuario INT
)
BEGIN 
	SELECT u.idusuario, p.descripcion
	FROM usuarios u
	-- JOIN roles r ON u.idrol = r.idrol
	JOIN prestamos p ON u.idusuario = p.idbeneficiario
	WHERE u.idusuario = 5 AND p.estado = 'T'
	GROUP BY u.idusuario;
END $$

CALL spu_traer_grado(11)

SELECT * FROM libros

-- DATOS DEL USUARIO	
DELIMITER $$
CREATE PROCEDURE spu_datos_personales_user
(
	IN _idusuario INT
)
BEGIN
	SELECT idusuario, personas.apellidos, personas.nombres, personas.nrodocumento, personas.fechanac, personas.direccion,
	personas.telefono, personas.email, usuarios.nombreusuario, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idusuario = _idusuario;
END$$

DELIMITER ;
CALL spu_datos_personales_user(4)

DELIMITER $$
CREATE PROCEDURE spu_update_user
(
    IN _idpersona INT,
    IN _apellidos VARCHAR(50), 
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50)
)
BEGIN
    -- Inserta el registro en la tabla "personas"
    UPDATE personas SET 
    apellidos = _apellidos,
    nombres = _nombres,
    nrodocumento = _nrodocumento,
    fechanac = _fechanac,
    direccion = _direccion,
    telefono = _telefono,
    email = _email
    WHERE idpersona = _idpersona;
    
    UPDATE usuarios SET
    nombreusuario = _nombreusuario
    WHERE idpersona = _idpersona;
END$$

SELECT * FROM personas

DELIMITER $$
CREATE PROCEDURE spu_update_admin 
(
	IN _idusu INT,
    IN _apellidos VARCHAR(50), 
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50)
)
BEGIN
	-- Actualizar la tabla personas
    UPDATE personas SET 
    apellidos = _apellidos,
    nombres = _nombres,
    nrodocumento = _nrodocumento,
    fechanac = _fechanac,
    direccion = _direccion,
    telefono = _telefono,	
    email = _email
    WHERE idpersona = (SELECT idpersona FROM usuarios WHERE idusuario = _idusu);

	-- Actualizar la tabla usuarios
	UPDATE usuarios
	SET nombreusuario = _nombreusuario
	WHERE idusuario = _idusu;
END $$

