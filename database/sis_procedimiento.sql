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
	IN _idlibrosentregados INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, libros.imagenportada, roles.nombrerol, CONCAT(personas.nombres, ' ',personas.apellidos) AS 'nombres', 
	prestamos.descripcion,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, categorias.categoria, 
	subcategorias.subcategoria, libros.libro, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo, fechadevolucion,
	prestamos.fecharespuesta
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

CALL spu_listar_fichaprestamo(1);
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
 
DELIMITER $$
CREATE PROCEDURE spu_obtener_detalleautores
(
	IN _iddetalleautor INT
)
BEGIN
	SELECT detalleautores.iddetalleautor, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
	libros.libro, libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, CONCAT(autores.autor,' ',autores.apellidos) AS 'Autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.iddetalleautor = _iddetalleautor;
END $$

CALL spu_obtener_detalleautores(2);
 

SELECT * FROM libros WHERE estado = 0

 