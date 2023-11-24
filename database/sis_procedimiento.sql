USE sistemabiblioteca

DELIMITER$$
CREATE PROCEDURE spu_login 
( 
	IN _nombreusuarios VARCHAR(30)
)
BEGIN
SELECT usuarios.idusuario, personas.nombres, personas.apellidos, personas.nrodocumento, personas.fechanac, 
	personas.direccion,usuarios.nombreusuario, roles.nombrerol,
	usuarios.claveacceso
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE nombreusuario = _nombreusuarios;
END$$

CALL spu_login ('75123489');
SELECT * FROM personas

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

DELIMITER $$ -- ejecutado
CREATE PROCEDURE spu_filtro_student()
BEGIN
	SELECT usuarios.idusuario, CONCAT(personas.nombres,' ', personas.apellidos) AS 'nombres', usuarios.estado
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol IN(2,3) AND usuarios.estado = 1;
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
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion,
	prestamos.fecharespuesta
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idprestamo = _prestamo AND prestamos.estado = 'T';
END $$

SELECT * FROM libros
CALL spu_listar_fichaprestamo(6);

UPDATE prestamos SET estado = 'D' WHERE idprestamo = 8

CALL spu_listar_profesor();
SELECT * FROM librosentregados;

-- libros

SELECT * FROM subcategorias

DELIMITER $$
CREATE PROCEDURE spu_obtener_libroentregado
(
	IN _idlibroentregado INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, personas.nombres, personas.apellidos, prestamos.descripcion,
	libros.libro, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplare.idejemplar = librosentregados.idejemplar
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.estado = 'R' AND idlibroentregado = _idlibroentregado;
END $$

CALL spu_obtener_libroentregado(1);

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

SELECT * FROM prestamos
