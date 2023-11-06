USE sistemabiblioteca
-- PASO 5 LISTAR DEVOLUCIONES.PENDIENTES
DELIMITER $$
CREATE PROCEDURE spu_listar_devolucionpendientes()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, libros.idlibro, libros.libro, librosentregados.cantidad, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(fechadevolucion) AS 'fechadevolucion'
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
        SET cantidad = cantidad_actual + _cantidad
        WHERE idlibro = _idlibro;
END $$

CALL spu_obtener_libroentregado(1);

CALL spu_update_devoluciones()
SELECT * FROM libros -- 9 for default
-- FALTA EJECUTAR
DELIMITER $$
CREATE PROCEDURE spu_inabilitar_libro
(
	IN _idlibro	INT,
)
BEGIN
	UPDATE libros SET
	estado = '0',
	inactive_at = NOW()
	WHERE idlibro = _idlibro
END $$

DELIMITER $$
CREATE PROCEDURE spu_inabilitar_usuario
(
	IN _idusuario	INT,
)
BEGIN
	UPDATE usuarios SET
	estado = '0',
	inactive_at = NOW()
	WHERE idusuario = _idusuario;
END $$
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

