USE sistemabiblioteca;

SELECT * 
FROM usuarios 
INNER JOIN personas ON personas.idpersona = usuarios.idpersona

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

CALL spu_traer_prestamo(4)
SELECT * FROM prestamos
SELECT * FROM libros

DELIMITER $$
CREATE PROCEDURE spu_listar_entregaspendiente()
BEGIN
	SELECT idlibroentregado, prestamos.idprestamo, libros.libro, libros.idlibro, libros.imagenportada, librosentregados.cantidad, personas.nombres, prestamos.descripcion, prestamos.fechasolicitud, DATE(fechaprestamo) AS 'fechaprestamo', 
	DATE(fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'R'
	ORDER BY idlibroentregado DESC;
END $$


DELIMITER $$
CREATE PROCEDURE spu_cancelar_reserva
(
	IN _idprestamo INT,
	IN _idlibro INT, -- estado N
	IN _cantidad INT
)
BEGIN
	 DECLARE cantidad_actual INT;
	 
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

CALL spu_cancelar_reserva(7,1,1)
SELECT * FROM prestamos








