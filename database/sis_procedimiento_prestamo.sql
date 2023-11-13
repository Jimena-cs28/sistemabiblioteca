USE sistemabiblioteca

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

CALL spu_registrar_prestamo_reservar(3,1,'2023-11-12',"2A","SI","");
SELECT * FROM usuarios;
-- ejecutado
DELIMITER $$
CREATE PROCEDURE spu_libroentregado_register
(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	DECLARE _idlibro INT;
	DECLARE _idbene INT;
	
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
	SELECT idlibro INTO _idlibro
	FROM ejemplares
	WHERE idejemplar = _idejemplar;	
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= 1 THEN
	START TRANSACTION;
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - 1
        WHERE idlibro = _idlibro;
        
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
        -- select * from usuarios
        COMMIT;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$

CALL spu_libroentregado_register(2,2,'Nuevo','2023-11-12');
SELECT * FROM prestamos
SELECT * FROM librosentregados -- 9 9
SELECT * FROM ejemplares

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

CALL spu_registrar_prestamo_ahora(11,1, '5B','SI','')

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
	DECLARE cantidad_actual INT;
	DECLARE _idlibro INT;
	DECLARE _idbene INT;
	
	IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;
	SELECT idlibro INTO _idlibro
	FROM ejemplares
	WHERE idejemplar = _idejemplar;	
			
	SELECT cantidad INTO cantidad_actual
	FROM libros
	WHERE idlibro = _idlibro;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
	-- select * from prestamos
		
	    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= 1 THEN
	START TRANSACTION;
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar, condicionentrega,fechadevolucion) VALUES
			(_idprestamo,_idejemplar, _condicionEntrega,_fechadevolución);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - 1
        WHERE idlibro = _idlibro;
        
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
        -- select * from usuarios
        COMMIT;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$

CALL spu_libroentregado_AddAhora(4,3,'Nuevo','2023-11-14');
-- falta ejecutar
SELECT * FROM ejemplares
SELECT * FROM librosentregados
CALL spu_libroentregado_register(2,2,1,'Bien','2023-11-16');

SELECT * FROM libros -- 10 12/14
SELECT * FROM usuarios
DELIMITER $$

-- REGISTRAR LIBROENTREGADO PASO 2  /cuando pide un libro altoke es s/cuando hace una reserva es A
-- OBtener libro
SELECT * FROM prestamos
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


SELECT * FROM ejemplares

SELECT * FROM prestamos
-- listarlibros
DELIMITER $$
CREATE PROCEDURE spu_libro(IN _idprestamo INT)
BEGIN
	SELECT idlibroentregado, subcategorias.subcategoria, libros.libro, librosentregados.cantidad, 
	librosentregados.fechadevolucion, librosentregados.condicionentrega
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idlibroentregado
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	WHERE librosentregados.idprestamo = _idprestamo;
END $$

SELECT * FROM prestamos
SELECT * FROM librosentregados

-- PASO 3 LISTAR ENTREGAS PENDIENTES ejecuitado
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
-- PASO 4 ACTUALIZAR  FECHAENTREGADELIMITER $$
CALL spu_listar_entregaspendiente()
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
-- quede
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
SELECT * FROM prestamos
SELECT * FROM librosentregados

CALL spu_update_pentregasp(2);

-- --------------------------------------------------------------
SELECT * FROM librosentregados
SELECT * FROM prestamos

-- PASO 7 LISTAR TODOS LOS PRESTAMOS
DELIMITER $$
CREATE PROCEDURE spu_listar_todoprestamos()
BEGIN
	SELECT librosentregados.idlibroentregado, libros.libro, libros.tipo, prestamos.`fechasolicitud`, 
	prestamos.fechaentrega, librosentregados.fechadevolucion, personas.nombres
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios usu2 ON usu2.idusuario = prestamos.idbeneficiario
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.`idbibliotecario`
	INNER JOIN personas ON personas.`idpersona` = usu2.`idpersona`
	WHERE prestamos.estado = 'T'
	ORDER BY idlibroentregado ASC;
END $$

SELECT * FROM librosentregados
SELECT * FROM prestamos
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


