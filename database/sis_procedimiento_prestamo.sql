USE sistemabiblioteca
-- PRESTAMOS
-- ejecutado
DELIMITER $$
CREATE PROCEDURE spu_registrar_prestamo_reservar
(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _fechaprestamo DATETIME, -- null
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90)
)
BEGIN
	-- DECLARE lastinsert INT;
	IF _lugardestino = "" THEN SET _lugardestino = NULL; END IF;       
	INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,descripcion,enbiblioteca,lugardestino, estado) VALUES
			(_idbeneficiario, _idbibliotecario,_fechaprestamo,_descripcion,_enbiblioteca,_lugardestino, 'E');
END $$

CALL spu_registrar_prestamo_reservar(2,1,'2023-11-22',"2A","SI","");
SELECT * FROM prestamos;
-- ejecutado RESERVAR
DELIMITER $$
CREATE PROCEDURE spu_libroentregado_register
(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE _idbene INT;
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;

	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        UPDATE prestamos SET
        estado = 'R'
        WHERE idprestamo = _idprestamo;
        
        UPDATE ejemplares SET
        ocupado = 'SI'
        WHERE idejemplar = _idejemplar;
        
        UPDATE usuarios SET
        estado = '0',
        inactive_at = NOW()
        WHERE idusuario = _idbene;
END $$

CALL spu_libroentregado_register(44,6,'Nuevo','2023-11-23');
-- AQUI SE TRAE EL PRESTAMO PARA REGISTRAR LOS LIBROS
SELECT * FROM ejemplares
UPDATE libros SET cantidad = 12 WHERE idlibro = 6
DELIMITER $$
CREATE PROCEDURE spu_traer_prestamo
(
	IN _idbeneficiario INT
)
BEGIN
	SELECT prestamos.idprestamo, prestamos.idbeneficiario
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	WHERE prestamos.idbeneficiario = _idbeneficiario AND DATE(prestamos.fechasolicitud) = CURDATE()
	ORDER BY prestamos.idprestamo DESC LIMIT 1;
END $$

CALL spu_traer_prestamo(2)

-- PARA REGISTRAR AHORA - ejecutado
DELIMITER $$
CREATE PROCEDURE spu_registrar_prestamo_ahora
(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90)
)
BEGIN
	-- DECLARE lastinsert INT;
	IF _lugardestino = "" THEN SET _lugardestino = NULL; END IF;	
	INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,fechaentrega,descripcion,enbiblioteca,lugardestino) VALUES
			(_idbeneficiario, _idbibliotecario,NOW(),NOW(),_descripcion,_enbiblioteca,_lugardestino);
END $$

CALL spu_registrar_prestamo_ahora(3,1, '5B','SI','')
SELECT * FROM ejemplares
SELECT * FROM prestamos

DELIMITER $$
CREATE PROCEDURE spu_libroentregado_AddAhora
(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN

	DECLARE _idbene INT;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;

        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        UPDATE prestamos SET
        estado = 'D'
        WHERE idprestamo = _idprestamo;
        
        UPDATE ejemplares SET
        ocupado = 'SI'
        WHERE idejemplar = _idejemplar;
        
        UPDATE usuarios SET
        estado = '0',
        inactive_at = NOW()
        WHERE idusuario = _idbene;
END $$

CALL spu_libroentregado_AddAhora(45,7,'Bien','2023-11-14')
CALL spu_libroentregado_AddAhora(45,8,'Bien','2023-11-14')
CALL spu_libroentregado_AddAhora(45,9,'Bien','2023-11-14')

SELECT * FROM ejemplares -- 4
-- LISTAR LIBROS EN PRESTAMO
SELECT * FROM librosentregados
DELIMITER $$
CREATE PROCEDURE spu_conseguir_libro()
BEGIN 
	SELECT idlibro, libro, subcategorias.subcategoria, categorias.categoria
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 1;
END $$

CALL spu_conseguir_libro();
-- Nuevo prestamo
DELIMITER $$
CREATE PROCEDURE spu_filtrar_ejemplares
(
	IN _idlibro INT
)
BEGIN
	SELECT ejemplares.idejemplar, CONCAT(libros.libro, ' ',codigo_libro) AS 'Ejemplares'
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = _idlibro AND ejemplares.ocupado = 'NO' AND ejemplares.estado = 1;
END $$

CALL spu_filtrar_ejemplares(1)

SELECT * FROM prestamos

SELECT * FROM prestamos
SELECT * FROM librosentregados
-- RESERVAAAAAAAAAAAAAS
-- PASO 3 LISTAR ENTREGAS PENDIENTES ejecutado
DELIMITER $$
CREATE PROCEDURE spu_listar_entregaspendiente()
BEGIN
	SELECT idlibroentregado, prestamos.idprestamo, libros.libro, ejemplares.codigo_libro, libros.idlibro, libros.imagenportada, personas.nombres, prestamos.descripcion, 
	prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', 
	DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	ORDER BY idlibroentregado DESC;
END $$

CALL spu_listar_entregaspendiente();
DELIMITER $$ -- ejecutado
CREATE PROCEDURE spu_update_pentregasp
(
	IN _idprestamo  INT
)
BEGIN 
	UPDATE prestamos SET
	fechaentrega = NOW(),
	estado =  'D'
	WHERE idprestamo = _idprestamo;
END $$
-- QUEDE----------------------------------
SELECT * FROM libros
-- ACTUALIZAR F PRESTA,P Y DEVOLUCION
DELIMITER $$
CREATE PROCEDURE spu_editar_Ependientes
(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _fechadevolucion DATETIME,
	IN _fechaprestamo DATETIME
)
BEGIN
	UPDATE librosentregados SET
	fechadevolucion = _fechadevolucion
	WHERE idlibroentregado = _idlibroentregado;
	
	UPDATE prestamos SET
	fechaprestamo = _fechaprestamo,
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END $$

CALL spu_editar_Ependientes(9,3,'2023-10-24','2023-10-22');

DELIMITER $$ -- FALTAAAAAAA
CREATE PROCEDURE spu_cancelar_reserva
(
	IN _idprestamo INT,
	IN _idlibro INT, -- estado N
	IN _cantidad INT
)
BEGIN
	 DECLARE cantidad_actual INT;
	 DECLARE _cantidad SMALLINT;
	 
	 SELECT cantidad INTO _cantidad
	 FROM libros WHERE idlibro = _idlibro;
	 
	 UPDATE prestamos SET
	 estado = 'N'
	 WHERE idprestamo = _idprestamo;
	 
	-- Obtiene la cantidad actual del libro
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + _cantidad
        WHERE idlibro = _idlibro;
END $$

-- DEVOLUCIOOOOOOOOOOOOOOOOOOOOOOOON
DELIMITER $$
CREATE PROCEDURE spu_listar_devolucionpendientes()
BEGIN
	SELECT prestamos.idprestamo, prestamos.idbeneficiario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', prestamos.descripcion, prestamos.fechasolicitud, prestamos.fechaentrega, prestamos.fechaprestamo
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idprestamo DESC;
END $$
UPDATE prestamos SET estado = 'D' WHERE idprestamo = 27
SELECT * FROM usuarios
SELECT * FROM prestamos
-- FALTA EJECUTARM PARA ABAJOOO
DELIMITER $$
CREATE PROCEDURE spu_update_devoluciones
(
	IN _idlibroentregado INT,
	-- IN _idprestamos INT,
	IN _idejemplar INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50)	
)
BEGIN
	 DECLARE cantidad_actual INT;
	 DECLARE _idbene INT;
	 DECLARE _idlibro INT;
	 DECLARE _idprestamos INT;
	 
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	
	 SELECT idprestamo INTO _idprestamos
	 FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	 
	 SELECT idlibro INTO _idlibro
	 FROM ejemplares WHERE idejemplar = _idejemplar;
	 
	 SELECT idbeneficiario INTO _idbene
	 FROM prestamos WHERE idprestamo = _idprestamos;
	 
	 UPDATE usuarios SET estado = 1
	 WHERE idusuario = _idbene;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamos;
	 
	 UPDATE ejemplares SET ocupado = 'NO'
	 WHERE idejemplar = _idejemplar;
	
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + 1
        WHERE idlibro = _idlibro;
END $$

-- select * from usuarios
-- ejecurtae
CALL spu_update_devoluciones(1,1,'bien','bien');
SELECT * FROM ejemplares

DELIMITER $$
CREATE PROCEDURE spu_update_ejemplar
(
	IN _idjemplar INT,	
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50)	
)
BEGIN
	 DECLARE cantidad_actual INT;
	 DECLARE _idbene INT;
	 DECLARE _idlibro INT;
	 DECLARE _idprestamos INT;
	 
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	
	 SELECT idprestamo INTO _idprestamos
	 FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	 
	 SELECT idlibro INTO _idlibro
	 FROM ejemplares WHERE idejemplar = _idejemplar;
	 
	 SELECT idbeneficiario INTO _idbene
	 FROM prestamos WHERE idprestamo = _idprestamos;
	 
	 UPDATE usuarios SET estado = 1
	 WHERE idusuario = _idbene;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamos;
	 
	 UPDATE ejemplares SET ocupado = 'NO'
	 WHERE idejemplar = _idejemplar;
	
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual + 1
        WHERE idlibro = _idlibro;
END $$

SELECT * FROM prestamos
-- LISTAR TODOS LOS PRESTAMOS
DELIMITER $$ -- ejecutado 
CREATE PROCEDURE spu_listar_todoprestamos()
BEGIN
	SELECT idprestamo,prestamos.`fechasolicitud`, prestamos.descripcion, prestamos.enbiblioteca,
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres'
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado = 'T'
	ORDER BY idprestamo DESC;
END $$
SELECT * FROM UPDATE prestamos SET fechaprestamo= '2023-11-' WHERE idprestamo = 47
SELECT librosentregados.idlibroentregado, libros.libro, ejemplares.codigo_libro, libros.tipo, prestamos.`fechasolicitud`, 
prestamos.fechaentrega, librosentregados.fechadevolucion, personas.nombres
FROM librosentregados
INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
INNER JOIN usuarios usu2 ON usu2.idusuario = prestamos.idbeneficiario
INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.`idbibliotecario`
INNER JOIN personas ON personas.`idpersona` = usu2.`idpersona`
WHERE prestamos.estado = 'T'
ORDER BY idlibroentregado ASC;

SELECT * FROM usuarios
SELECT * FROM librosentregados
CALL spu_listar_prestamos();

-- Contadores 
DELIMITER $$
CREATE PROCEDURE spu_cantidad_Administrador()
BEGIN
	SELECT COUNT(idusuario) AS 'administrador'
	FROM usuarios
	WHERE idrol = 1;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_profesor()
BEGIN
	SELECT COUNT(idusuario) AS 'profesor'
	FROM usuarios
	WHERE idrol = 2 AND estado = 1;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_estudiantes()
BEGIN
	SELECT COUNT(idusuario) AS 'estudiantes'
	FROM usuarios
	WHERE idrol = 3 AND estado = 1;
END$$

SELECT * FROM usuarios

DELIMITER $$
CREATE PROCEDURE spu_cantidad_libros()
BEGIN
	SELECT COUNT(idlibro) AS 'libros'
	FROM libros
	WHERE estado = 1;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_categorias()
BEGIN
	SELECT COUNT(idcategoria) AS 'categorias'
	FROM categorias;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_reservaciones()
BEGIN
	SELECT COUNT(idprestamo) AS 'reservaciones'
	FROM prestamos 
	WHERE estado = 'R';
END$$

SELECT * FROM prestamos
CALL spu_cantidad_reservaciones()

DELIMITER $$
CREATE PROCEDURE spu_cantidad_devoluciones()
BEGIN
	SELECT COUNT(idprestamo) AS 'devoluciones'
	FROM prestamos
	WHERE estado = 'D';
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_prestamos()
BEGIN
	SELECT COUNT(idprestamo) AS 'prestamo'
	FROM prestamos;
END$$

SELECT * FROM prestamos

CALL spu_registrar_libro(3,1,'nose','texto',2,33,233.3,'','','','español','','',3);

SELECT * FROM libros
-- listar Solicitud
DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT idlibroentregado,  prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END $$

CALL spu_solicitud_listar();

SELECT * FROM librosentregados

DELIMITER $$
CREATE PROCEDURE spu_aceptar_solicitud
(
	_idprestamo INT
)
BEGIN
	
	UPDATE prestamos SET
	fecharespuesta = NOW(),
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END $$

SELECT * FROM prestamos


-- procedimiento 