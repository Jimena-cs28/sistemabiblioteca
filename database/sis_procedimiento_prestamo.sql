USE sistemabiblioteca

DELIMITER $$
CREATE PROCEDURE spu_registrar_prestamo
(
	IN _idbeneficiario INT, -- s
	IN _idbibliotecario INT, -- n 
	IN _fechaprestamo DATETIME, -- null
	IN _descripcion VARCHAR(40),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(90),
	
	IN _idlibro INT,
	IN _cantidad INT,
	IN _condicionEntrega VARCHAR(40),
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	-- DECLARE lastinsert INT;	
INSERT INTO prestamos (idbeneficiario, idbibliotecario,fechaprestamo,descripcion,enbiblioteca,lugardestino, estado) VALUES
	(_idbeneficiario, _idbibliotecario,_fechaprestamo,_descripcion,_enbiblioteca,_lugardestino, 'R');
	
	SET @idprestamo = LAST_INSERT_ID();

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idlibro, cantidad, condicionentrega, fechadevolucion)
		VALUES (@idprestamo, _idlibro, _cantidad,_condicionEntrega, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$

CALL spu_registrar_prestamo(7,11,'2023-11-05' ,'5A', 'no', 'salon2', 1,1,'Buen Estado', '2023-11-06');

-- libro1 = 2 y atlas del cielo = 12/23
SELECT * FROM libros
CALL spu_registrar_prestamo(10,11,'2023-11-0','4D','NO','salon8');
SELECT * FROM usuarios

-- LISTAR LOS PRESTAMOS, SIN LIBROS PASO1
DELIMITER $$
CREATE PROCEDURE spu_listar_prestamos()
BEGIN
	SELECT prestamos.idprestamo, personas.nombres, personas.apellidos, usuarios.nombreusuario, prestamos.fechasolicitud,
	prestamos.fechaprestamo, roles.nombrerol
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario =  prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE estado = 'E';
END $$

-- REGISTRAR LIBROENTREGADO PASO 2  /cuando pide un libro altoke es s/cuando hace una reserva es A
-- OBtener libro
DELIMITER $$
CREATE PROCEDURE spu_conseguir_libro()
BEGIN 
	SELECT idlibro, nombre, subcategorias.subcategoria, categorias.categoria
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria;
END $$

CALL spu_conseguir_libro ('ad');
SELECT * FROM libros

-- listarlibros
DELIMITER $$
CREATE PROCEDURE spu_libro(IN _idprestamo INT)
BEGIN
	SELECT idlibroentregado, subcategorias.subcategoria, libros.nombre, librosentregados.cantidad, 
	librosentregados.fechadevolucion, librosentregados.condicionentrega
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idlibroentregado
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	WHERE librosentregados.idprestamo = _idprestamo;
END $$

SELECT * FROM prestamos -- 12
-- reservar('R')
DELIMITER $$
CREATE PROCEDURE spu_registrar_libroentregado_reservar
(
	IN _idprestamo INT,
	IN _idlibro INT,
	IN _cantidad SMALLINT,
	IN _condicionentrega VARCHAR(50),
	IN _fechadevolucion DATE
)
BEGIN 
    DECLARE cantidad_actual INT;

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idlibro, cantidad, condicionentrega, fechadevolucion)
        VALUES (_idprestamo, _idlibro, _cantidad, _condicionentrega, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;

        UPDATE prestamos
        SET estado = 'R'
        WHERE idprestamo = _idprestamo;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$

CALL spu_registrar_libroentregado_reservar(7,16,1,'Nuevo','');

SELECT fechaprestamo FROM prestamo WHERE
SELECT * FROM librosentregados WHERE estado = 'E' AND idprestamo = 15

SELECT * FROM prestamos
-- devolucion('D')
DELIMITER $$
CREATE PROCEDURE spu_registrar_libroentregado_ahora
(
	IN _idprestamo 	INT,
	IN _idlibro 	INT,
	IN _cantidad 	SMALLINT,
	IN _condicionentrega VARCHAR(50),
	IN _fechadevolucion  DATE
)
BEGIN 
    DECLARE cantidad_actual INT;

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idlibro, cantidad, condicionentrega, fechadevolucion)
        VALUES (_idprestamo, _idlibro, _cantidad, _condicionentrega, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;
        
        UPDATE prestamos SET
	estado = 'D',
	fechaentrega = NOW()
	WHERE idprestamo = _idprestamo;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
	
END $$

CALL spu_registrar_libroentregado(1,3,1,'Buen Estado');

SELECT * FROM libros
SELECT * FROM librosentregados

-- PASO 3 LISTAR ENTREGAS PENDIENTES
DELIMITER $$
CREATE PROCEDURE spu_listar_entregaspendiente()
BEGIN
	SELECT idlibroentregado, prestamos.idprestamo, libros.nombre, libros.imagenportada, librosentregados.cantidad, personas.nombres, prestamos.descripcion, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', 
	DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	ORDER BY idlibroentregado DESC;
END $$

-- PASO 4 ACTUALIZAR  FECHAENTREGADELIMITER $$
CALL spu_listar_entregaspendiente()
DELIMITER $$
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
-- PASO 5 LISTAR DEVOLUCIONES.PENDIENTES
DELIMITER $$
CREATE PROCEDURE spu_listar_devolucionpendientes()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, libros.nombre, personas.nombres, libros.tipo, prestamos.fechasolicitud, 
	prestamos.fechaentrega, DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	ORDER BY idlibroentregado DESC;
END $$

-- PASO 6 ACTUALIZAR FECHADEVOLUCION
DELIMITER $$
CREATE PROCEDURE spu_update_devoluciones
(
	IN _idlibroentregado INT,
	IN _idprestamo INT,
	IN _condiciondevolucion VARCHAR(50),
	IN _observaciones   VARCHAR(50)
)
BEGIN
	 UPDATE librosentregados SET
	 condiciondevolucion = _condiciondevolucion,
	 observaciones = _observaciones,
	 fechadevolucion = NOW()
	 WHERE idlibroentregado = _idlibroentregado;
	 
	 UPDATE prestamos SET
	 estado = 'T'
	 WHERE idprestamo = _idprestamo;
END $$

CALL spu_update_devoluciones(1,1,'Intacto','Bien');

-- --------------------------------------------------------------
SELECT * FROM librosentregados
SELECT * FROM prestamos

-- PASO 7 LISTAR TODOS LOS PRESTAMOS
DELIMITER $$
CREATE PROCEDURE spu_listar_todoprestamos()
BEGIN
	SELECT librosentregados.idlibroentregado, libros.nombre, libros.tipo, prestamos.`fechasolicitud`, 
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
	WHERE idrol = 2;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_estudiantes()
BEGIN
	SELECT COUNT(idusuario) AS 'estudiantes'
	FROM usuarios
	WHERE idrol = 3;
END$$

DELIMITER $$
CREATE PROCEDURE spu_cantidad_libros()
BEGIN
	SELECT COUNT(idlibro) AS 'libros'
	FROM libros;
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

SELECT * FROM prestamos WHERE fechasolicitud = '2023-10-13'


-- registrar libro
DELIMITER $$
CREATE PROCEDURE spu_registrar_libro
(
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _nombre VARCHAR(70),
    IN _tipo VARCHAR(50),
    IN _cantidad SMALLINT,
    IN _numeropaginas VARCHAR(100),
    IN _codigo DECIMAL(6,3),
    IN _edicion VARCHAR(50),
    IN _formato VARCHAR(50),
    IN _anio DATE,
    IN _idioma VARCHAR(30),
    IN _descripcion TEXT,
    IN _imagenportada VARCHAR(200),
    IN _idautor  INT
)
BEGIN
    INSERT INTO libros (idsubcategoria, ideditorial, nombre, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
	VALUES (_idsubcategoria, _ideditorial, _nombre, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
     INSERT INTO detalleautores(idlibro,idautor)VALUES
				(@idlibro, _idautor);
END$$

SELECT * FROM prestamos

CALL spu_registrar_libro(3,1,'nose','texto',2,33,233.3,'','','','español','','',3);


-- listar Solicitud
DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT idlibroentregado,  prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.nombre AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE estado = 'S';
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
	fechaentrega = NOW(),
	estado = 'R'
	WHERE idprestamo = _idprestamo;
END $$




