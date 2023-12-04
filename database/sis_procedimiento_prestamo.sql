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

SELECT * FROM ejemplares
UPDATE ejemplares SET ocupado = 'NO' WHERE idejemplar = 38 -- 25

SELECT * FROM librosentregados
-- ejecutado RESERVAR
DELIMITER $$
CREATE PROCEDURE spu_libroentregado_register
(
	IN _idprestamo INT,
	IN _idejemplar INT,
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE _idbene INT;
	-- IF _fechadevolución = "" THEN SET _fechadevolución = NULL; END IF;

	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;
    
        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar ,fechadevolucion) VALUES
			(_idprestamo,_idejemplar,_fechadevolución);
        
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

CALL spu_libroentregado_register(2,1,'2023-11-30');
-- AQUI SE TRAE EL PRESTAMO PARA REGISTRAR LOS LIBROS
SELECT * FROM ejemplares
UPDATE libros SET cantidad = 12 WHERE idlibro = 6
SELECT * FROM librosentregados

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
	IN _fechadevolución DATETIME
)
BEGIN

	DECLARE _idbene INT;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos
	WHERE idprestamo = _idprestamo;

        -- Registra el libro entregado
	INSERT INTO librosentregados (idprestamo, idejemplar,fechadevolucion) VALUES
			(_idprestamo,_idejemplar,_fechadevolución);
        
        UPDATE prestamos SET
        estado = 'D',
        fechaentrega = NOW()
        WHERE idprestamo = _idprestamo;
        
        UPDATE ejemplares SET
        ocupado = 'SI'
        WHERE idejemplar = _idejemplar;
        
        UPDATE usuarios SET
        estado = '0',
        inactive_at = NOW()
        WHERE idusuario = _idbene;
END $$
CALL spu_libroentregado_AddAhora(1,1,'2023-11-30');
-- CANCELAR RESERVA

DELIMITER $$
CREATE PROCEDURE spu_cancelar_reserva
(
	IN _idprestamo INT,
	IN _motivo VARCHAR(10)
)
BEGIN
	DECLARE _idbene INT;
	
	SELECT idbeneficiario INTO _idbene
	FROM prestamos WHERE idprestamo = _idprestamo;
	
    -- Actualizar ejemplares a 'NO' para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO'
    WHERE le.idprestamo = _idprestamo;
	
    UPDATE usuarios SET 
    estado = '1'
    WHERE idusuario = _idbene;
    
    UPDATE prestamos SET 
    estado = 'C',
    motivorechazo = _motivo
    WHERE idprestamo = _idprestamo;
END $$

CALL spu_cancelar_reserva(4)

SELECT * FROM prestamos -- 4
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

SELECT * FROM prestamos
CALL spu_conseguir_libro();
-- Nuevo prestamo
DELIMITER $$
CREATE PROCEDURE spu_filtrar_ejemplares
(
	IN _idlibro INT
)
BEGIN
	SELECT ejemplares.idejemplar, libros.libro,CONCAT( libros.codigo, '-',codigo_libro) AS 'Ejemplares', ejemplares.condicion
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = _idlibro AND ejemplares.ocupado = 'NO' AND ejemplares.estado = 1;
END $$

CALL spu_filtrar_ejemplares(1)

-- RESERVAAAAAAAAAAAAAS
-- PASO 3 LISTAR ENTREGAS PENDIENTES ejecutado
DELIMITER $$
CREATE PROCEDURE spu_listar_entregaspendiente()
BEGIN   
	SELECT prestamos.idprestamo, librosentregados.idlibroentregado, libros.libro, libros.idlibro, libros.codigo, libros.imagenportada,CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', prestamos.descripcion, 
	prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	-- order by librosentregados.idlibroentregado
	GROUP BY prestamos.idprestamo DESC;
END $$

SELECT * FROM prestamos

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


SELECT * FROM usuarios -- 78674219
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
	SELECT COUNT(idprestamo) AS 'categorias'
	FROM prestamos WHERE estado = 'S';
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
	FROM prestamos WHERE estado = 'T';
END$$

SELECT * FROM prestamos

CALL spu_registrar_libro(3,1,'nose','texto',2,33,233.3,'','','','español','','',3);

SELECT * FROM libros

CALL spu_solicitud_listar();

SELECT * FROM prestamos

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

DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.cantidad, libros.idlibro
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END $$

CALL spu_solicitud_listar()
-- procedimiento 

SELECT idprestamo, personas.nombres, personas.apellidos
FROM prestamos
INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
INNER JOIN personas ON personas.idpersona = usuarios.idpersona
WHERE 


DELIMITER $$
CREATE PROCEDURE spu_search_prestamo
(
	IN _nombres VARCHAR(50)
)
BEGIN
	SELECT idprestamo,prestamos.`fechasolicitud`, prestamos.descripcion, prestamos.enbiblioteca,
	fechaprestamo, prestamos.fechaentrega, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres'
	FROM prestamos
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE prestamos.estado = 'T' AND (_nombres ="" OR personas.nombres LIKE CONCAT("%",_nombres, "%"))
	ORDER BY idprestamo DESC;
END $$

CALL spu_search_prestamo('Maria')
SELECT * FROM personas


DELIMITER $$
CREATE PROCEDURE spu_datos_personales
(
	IN _idusuario INT
)
BEGIN
	SELECT idusuario, CONCAT(personas.apellidos, ' ', personas.nombres) AS 'Datos', personas.nrodocumento, personas.fechanac, personas.direccion,
	personas.telefono, personas.email, usuarios.nombreusuario, roles.nombrerol
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idusuario = _idusuario;
END $$

CALL spu_datos_personales(1)
SELECT * FROM roles

DELIMITER $$
CREATE PROCEDURE updated
(
    IN p_idprestamo INT
)
BEGIN
    DECLARE v_condicion_devolucion VARCHAR(50);

    -- Obtener la condición de devolución
    SELECT condiciondevolucion INTO v_condicion_devolucion
    FROM librosentregados
    WHERE idprestamo = p_idprestamo
    AND condiciondevolucion = 'bien';

    -- Actualizar la condición en la tabla ejemplares si condiciondevolucion = 'bien'
    IF v_condicion_devolucion = 'bien' THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = v_condicion_devolucion
        WHERE le.idprestamo = p_idprestamo;
    END IF;
END $

DELIMITER $$
CREATE PROCEDURE ActualizarCondicionEjemplar
(
    IN p_idlibroentregado INT
    IN _condicion_devolucion VARCHAR(50);
)
BEGIN
    DECLARE 

    -- Obtener la condición de devolución
    SELECT condiciondevolucion INTO _condicion_devolucion
    FROM librosentregados
    WHERE idlibroentregado = p_idlibroentregado;

    -- Actualizar la condición en la tabla ejemplares solo si condiciondevolucion = 'bien'
    IF v_condicion_devolucion IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condicion_devolucion
        WHERE le.idlibroentregado = p_idlibroentregado;
    END IF;
END $$

CALL ActualizarCondicionEjemplar(12) -- 16
SELECT * FROM ejemplares
SELECT * FROM librosentregados
SELECT * FROM prestamos


DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT prestamos.idprestamo, CONCAT(personas.nombres, ' ' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.cantidad, libros.idlibro
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END $$







