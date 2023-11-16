USE sistemabiblioteca
-- PASO 5 LISTAR DEVOLUCIONES.PENDIENTES
DELIMITER $$
DROP PROCEDURE spu_listar_devolucionpendientes()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, usuarios.idusuario, prestamos.descripcion, libros.idlibro, ejemplares.codigo_libro, libros.libro,usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idlibroentregado DESC;
END $$

SELECT * FROM usuarios	
-- PASO 6 ACTUALIZAR FECHADEVOLUCION
DELIMITER $$
CREATE PROCEDURE spu_update_devoluciones
(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50),
	IN _idlibro INT,
	IN _cantidad SMALLINT
)
BEGIN
	 DECLARE cantidad_actual INT;
	 
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamo;
	 
	-- Obtiene la cantidad actual del libro
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + 1
        WHERE idlibro = _idlibro;
END $$

CALL spu_obtener_libroentregado(1);

CALL spu_update_devoluciones()
SELECT * FROM libros -- 9 for default
-- FALTA EJECUTAR-se ejecuto
DELIMITER $$
CREATE PROCEDURE spu_inabilitar_libro
(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '0',
	inactive_at = NOW()
	WHERE idlibro = _idlibro;
END $$

DELIMITER $$
CREATE PROCEDURE spu_abilitar_libro
(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '1'
	WHERE idlibro = _idlibro;
END $$


DELIMITER $$
CREATE PROCEDURE spu_inabilitar_usuario
(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '0',
	inactive_at = NOW()
	WHERE idusuario = _idusuario;
END $$

CALL spu_inabilitar_usuario(6);

DELIMITER $$
CREATE PROCEDURE spu_abilitar_usuario
(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '1'
	WHERE idusuario = _idusuario;
END $$

CALL spu_abilitar_usuario(2);

-- FIN
SELECT * FROM usuarios

SELECT *FROM prestamos
-- ACTUALIZAR contraseña.user
SELECT personas.nombres, personas.apellidos, roles.nombrerol
FROM usuarios
INNER JOIN personas ON personas.idpersona = usuarios.idpersona
INNER JOIN roles ON roles.idrol = usuarios.idrol
WHERE usuarios.nombreusuario= '75123489';


DELIMITER $$
CREATE PROCEDURE spu_registrar_subcategory
(
	IN _idcategoria INT,
	IN _subcategoria VARCHAR(50),
	IN _codigo 	SMALLINT
)
BEGIN 
	INSERT INTO subcategorias (idcategoria, subcategoria, codigo) VALUES
				(_idcategoria, _subcategoria, _codigo );
END $$

CALL spu_registrar_subcategory(10,'Historia de America del Sur', 980);
SELECT * FROM subcategorias

-- LISTAR LIBROS Y ESTUDIANTES INACTIVOS
DELIMITER $$
CREATE PROCEDURE spu_inactivo_estudiantes()
BEGIN
	SELECT idusuario, roles.nombrerol, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres', personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario,usuarios.inactive_at
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3 AND estado = 0;
END $$

DELIMITER $$
CREATE PROCEDURE spu_inactivo_profesores()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2 AND estado = 0;
END $$

CALL spu_inactivo_estudiantes();
CALL spu_listar_estudiantes();

SELECT * FROM prestamos
DROP TABLE productos
-- ejecutado
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
CALL spu_inactivo_libros();

DELIMITER $$
CREATE PROCEDURE spu_inactivo_libros()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.libro, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.autor,' ',autores.apellidos) AS 'autor', libros.inactive_at
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 0
	ORDER BY iddetalleautor DESC;
END $$

DELIMITER $$ 
CREATE  PROCEDURE GRAFICO_INDEX()
BEGIN
	SELECT  COUNT(ejemplares.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY librosentregados.idejemplar DESC;
END $$

SELECT * FROM libros

SELECT  COUNT(librosentregados.idlibroentregado)AS 'todo', libros.libro, prestamos.descripcion
FROM librosentregados
INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
WHERE prestamos.descripcion = '1L' AND prestamos.estado = 'T'
GROUP BY librosentregados.idlibro DESC;

SELECT * FROM libros

UPDATE prestamos SET descripcion = '1L' WHERE idprestamo = 11

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

SELECT * FROM PRESTAMOS
-- REPORTE 2 
-- ejemplo
SELECT idlibro, COUNT(idlibro) AS totalPedidos
FROM librosentregados
GROUP BY idlibro
ORDER BY totalPedidos DESC
LIMIT 10;
	
SELECT * FROM LIBROS
	
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

