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
	WHERE prestamos.idbeneficiario = 2 AND DATE(prestamos.fechasolicitud) = CURDATE()
	ORDER BY prestamos.idprestamo DESC LIMIT 1;
END $$


SELECT * FROM prestamos