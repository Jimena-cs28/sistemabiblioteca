USE sistemabiblioteca

-- REPORTES Y GRAFICOS

SELECT *FROM prestamos
-- ACTUALIZAR contraseña.user
SELECT personas.nombres, personas.apellidos, roles.nombrerol
FROM usuarios
INNER JOIN personas ON personas.idpersona = usuarios.idpersona
INNER JOIN roles ON roles.idrol = usuarios.idrol
WHERE usuarios.nombreusuario= '75123489';

DELIMITER $$ 
CREATE  PROCEDURE GRAFICO_INDEX()
BEGIN
	SELECT  COUNT(librosentregados.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY librosentregados.idlibro DESC;
END $$

SELECT * FROM prestamos


SELECT  COUNT(librosentregados.idlibroentregado)AS 'todo', libros.libro, prestamos.descripcion
FROM librosentregados
INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
WHERE prestamos.descripcion = '1L' AND prestamos.estado = 'T'
GROUP BY librosentregados.idlibro DESC;

DELIMITER $$
CREATE PROCEDURE spu_grafico_rol ( IN _idrol INT)
BEGIN
	SELECT  COUNT(librosentregados.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = _idrol AND prestamos.estado = 'T'
	GROUP BY librosentregados.idlibro DESC;
END $$

CALL spu_grafico_rol(3);

SELECT * FROM prestamos
	
SELECT idrol, nombrerol 
FROM roles 
WHERE nombrerol = 'estudiante' AND nombrerol = 'profesores'

-- REPORTES 1

DELIMITER $$
SELECT idlibroentregado, libros.libro, librosentregados.cantidad, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'Nombres', prestamos.descripcion
FROM librosentregados
INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
INNER JOIN personas ON personas.idpersona = usuarios.idpersona
WHERE prestamos.descripcion = '1l'

-- LISTAR SELECT REPORTE
SELECT * FROM libros -- 10

DELIMITER $$
CREATE PROCEDURE spu_select_descripcion()
BEGIN
	SELECT prestamos.descripcion
	FROM librosentregados 
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY prestamos.descripcion
	ORDER BY prestamos.descripcion;
END $$

CALL spu_select_descripcion();

DELIMITER $$
CREATE PROCEDURE spu_reporte_descripcion
(
	IN _descripcion VARCHAR(10)
)
BEGIN
	SELECT idlibroentregado, categorias.categoria, subcategorias.subcategoria, libros.libro, librosentregados.cantidad, 
	CONCAT(personas.nombres, ' ' ,personas.apellidos) AS 'nombres',	prestamos.descripcion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'T' AND prestamos.descripcion = _descripcion
	GROUP BY personas.nombres;
END $$

CALL spu_reporte_descripcion('1l');


-- REPORTE 2 
-- ejemplo
SELECT idlibro, COUNT(idlibro) AS totalPedidos
FROM librosentregados
GROUP BY idlibro
ORDER BY totalPedidos DESC
LIMIT 10;
	
SELECT * FROM LIBROS
-- SOLICITUUUUUUUUUUUD
DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT idlibroentregado,  prestamos.idprestamo, CONCAT(personas.nombres, ' ' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END$$

