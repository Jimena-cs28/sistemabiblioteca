DROP DATABASE sistemabiblioteca;

SELECT * FROM libros
SELECT * FROM prestamos WHERE estado = 'T'

SELECT * FROM librosentregados WHERE idprestamo = 5

DELIMITER $$
CREATE PROCEDURE spu_traerEjemplar_libroentregado
(
	IN _idprestamo INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, prestamos.idprestamo, ejemplares.idejemplar,librosentregados.condiciondevolucion, ejemplares.codigo_libro, libros.codigo, ejemplares.ocupado, libros.libro, 
	librosentregados.condicionentrega, DATE(librosentregados.fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.idprestamo = _idprestamo
	ORDER BY ejemplares.idejemplar ASC;
END $$

CALL spu_traerEjemplar_libroentregado()

SELECT * FROM usuarios
SELECT * FROM librosentregados

DELIMITER $$ -- ejecutado
CREATE PROCEDURE spu_obtener_prestamo
(
	IN _idprestamo INT
)
BEGIN 
	SELECT * FROM prestamos WHERE idprestamo = _idprestamo
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
	SELECT detalleautores.iddetalleautor, libros.idlibro, libros.libro,categorias.idcategoria, subcategorias.subcategoria, editoriales.nombres, editoriales.paisorigen,autores.apellidos, autores.autor, autores.nacionalidad,
	 categorias.categoria, subcategorias.idsubcategoria, editoriales.ideditorial,
	libros.cantidad, libros.numeropaginas, libros.codigo, libros.formato,
	libros.descripcion, libros.idioma, libros.anio, libros.tipo, libros.imagenportada, libros.edicion, autores.idautor
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor 
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE detalleautores.idlibro = _idlibro;
END $$
SELECT * FROM autores
CALL spu_obtener_detalleautores(2);

SELECT * FROM editoriales
SELECT * FROM librosentregados
-- TRAER EJEMPLAR (LIST  LIBROS)
DELIMITER $$
CREATE PROCEDURE spu_ejemplar_idlibro
(
	IN _idlibro INT
)
BEGIN	
	SELECT ejemplares.idejemplar, libros.libro, libros.codigo, ejemplares.condicion, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE ejemplares.idlibro = _idlibro
	ORDER BY idejemplar ASC;
END $$

-- FALTA EJECUTAR
DELIMITER $$
CREATE PROCEDURE spu_conseguir_libro()
BEGIN 
	SELECT libros.idlibro, libros.libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	LEFT JOIN ejemplares ON libros.idlibro = ejemplares.idejemplar
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.estado = 1; -- AND ejemplares.estado IN (1,0);
END $$

DELIMITER $$
CREATE PROCEDURE spu_conseguir_libro_historial()
BEGIN 
	SELECT libros.idlibro, libros.libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	LEFT JOIN ejemplares ON libros.idlibro = ejemplares.idejemplar
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE libros.estado IN( 1,0); -- AND ejemplares.estado IN (1,0);
END $$

UPDATE ejemplares SET
estado = 0
WHERE idejemplar = 72

SELECT * FROM EJEMPLARES WHERE idlibro = 7

CALL spu_conseguir_libro()

SELECT * FROM libros

IF NOT EXISTS (

SELECT 1
FROM ejemplares
WHERE idlibro = _idlibro AND estado <> 0
) THEN
-- Actualizar el estado del libro a 0
UPDATE libros
SET estado = 0,
inactive_at = NOW()
WHERE idlibro = _idlibro;
END IF;

