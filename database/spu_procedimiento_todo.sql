SELECT * FROM libros


SELECT * FROM prestamos WHERE estado = 'T'

SELECT * FROM librosentregados WHERE idprestamo = 5

DELIMITER $$
CREATE PROCEDURE spu_traerEjemplar_libroentregado
(
	IN _idprestamo INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, prestamos.idprestamo, ejemplares.idejemplar, ejemplares.codigo_libro, ejemplares.ocupado, libros.libro, 
	librosentregados.condicionentrega, DATE(librosentregados.fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.idprestamo = _idprestamo
	ORDER BY ejemplares.idejemplar ASC;
END $$

CALL spu_traerEjemplar_libroentregado(6)

SELECT * FROM usuarios
SELECT * FROM ejemplares

DELIMITER $$ -- ejecutado
CREATE PROCEDURE spu_obtener_prestamo
(
	IN _idprestamo INT
)
BEGIN 
	SELECT * FROM prestamos WHERE idprestamo = _idprestamo;
END$$

-- EJECUTADO
DELIMITER $$
CREATE PROCEDURE spu_desactivar_ejemplar
(
	IN _idejemplar INT
)
BEGIN 
	UPDATE ejemplares SET
	estado = 0,
	inactive_at = NOW()
	WHERE idejemplar = _idejemplar;
END $$
CALL spu_desactivar_ejemplar(1)


DELIMITER $$
CREATE PROCEDURE spu_desactivar_usuario
(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '0',
	inactive_at = NOW()
	WHERE idusuario = _idusuario;
END $$
SELECT * FROM prestamos
UPDATE prestamos SET estado = 'D' WHERE idprestamo = 12

-- listar libros, ejemplar
DELIMITER $$
CREATE PROCEDURE spu_obtener_detalleautores
(
	IN _idlibro INT
)
BEGIN
	SELECT detalleautores.iddetalleautor, libros.idlibro, categorias.categoria, subcategorias.subcategoria, CONCAT(editoriales.nombres,' ', editoriales.paisorigen) AS 'Editorial',
	libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, CONCAT(autores.autor,' ',autores.apellidos) AS 'Autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.idlibro = _idlibro;
END $$
SELECT * FROM libros
CALL spu_obtener_detalleautores(2);

SELECT * FROM detalleautores
-- TRAER EJEMPLAR (LIST  LIBROS)
DELIMITER $$
CREATE PROCEDURE spu_ejemplar_idlibro
(
	IN _idlibro INT
)
BEGIN	
	SELECT ejemplares.idejemplar, libros.libro, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE ejemplares.idlibro = _idlibro
	ORDER BY idejemplar ASC;
END $$


SELECT * FROM ejemplares -- 11

DELIMITER $$
CREATE PROCEDURE spu_listado_libros()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.libro, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.autor,' ',autores.apellidos) AS 'autor'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 1
	ORDER BY iddetalleautor DESC;
END $$


