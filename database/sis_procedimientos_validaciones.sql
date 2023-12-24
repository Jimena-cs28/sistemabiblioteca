DROP DATABASE sistemabiblioteca;
-- VALIDACIONEEEEEES

SELECT * FROM prestamos
SELECT * FROM ejemplares
SELECT * FROM librosentregados

UPDATE librosentregados SET 
condiciondevolucion = 'bien',
observaciones = 'bien'
WHERE idejemplar = 1;

SELECT * FROM libros
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
-- FUNCIONAAAAAAAAAAAAAAAAA - solo uno (BIEN)
DELIMITER $$
CREATE PROCEDURE spu_update_ejemplar
(
    IN _idejemplar INT,
    IN _idlibroentregado INT
)
BEGIN
    DECLARE _count_ocupados INT;
    DECLARE _idbene INT;
    DECLARE _idprestamo INT;
    
    SELECT idprestamo INTO _idprestamo
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	
    SELECT idbeneficiario INTO _idbene
    FROM prestamos WHERE idprestamo = _idprestamo;
    
    UPDATE ejemplares SET
    ocupado = 'NO'
    WHERE idejemplar = _idejemplar;
    
    UPDATE librosentregados SET
    condiciondevolucion = 'Bien',
    observaciones = 'Bien'
    WHERE idlibroentregado = _idlibroentregado;


    -- Contar los idejemplar asociados al idprestamo que tienen ocupado='SI'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo
        AND ej.ocupado = 'SI';

    -- Actualizar el estado del préstamo en función de la cantidad de ejemplares ocupados
    IF _count_ocupados = 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        UPDATE usuarios SET estado = 1 WHERE idusuario = _idbene;
    ELSE
        UPDATE prestamos SET estado = 'D' WHERE idprestamo = _idprestamo;
    END IF;
END$$

-- (MAL)
DELIMITER $$
CREATE PROCEDURE spu_update_ejemplar_mal
(
    IN _idejemplar INT,
    IN _idlibroentregado INT,
    IN _observaciones VARCHAR(50),
    IN _condiciondevoluciones VARCHAR(20)
)
BEGIN
    DECLARE _count_ocupados INT;
    DECLARE _idbene INT;
    DECLARE _idprestamo INT;
    
    SELECT idprestamo INTO _idprestamo
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;
	
    SELECT idbeneficiario INTO _idbene
    FROM prestamos WHERE idprestamo = _idprestamo;
    
    UPDATE ejemplares SET
    ocupado = 'NO'
    WHERE idejemplar = _idejemplar;
    
    UPDATE librosentregados SET
    condiciondevolucion = _condiciondevoluciones,
    observaciones = _observaciones
    WHERE idlibroentregado = _idlibroentregado;

    IF _condiciondevoluciones IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condiciondevoluciones
        WHERE le.idlibroentregado = _idlibroentregado;
    END IF;
    
    -- Contar los idejemplar asociados al idprestamo que tienen ocupado='SI'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo
        AND ej.ocupado = 'SI';

    -- Actualizar el estado del préstamo en función de la cantidad de ejemplares ocupados
    IF _count_ocupados = 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
        UPDATE usuarios SET estado = 1 WHERE idusuario = _idbene;
    ELSE
        UPDATE prestamos SET estado = 'D' WHERE idprestamo = _idprestamo;
    END IF;
END$$

CALL spu_update_ejemplar_mal(3,16,'rayada','Mal')
-- CALL spu_actualizar_estado_prestamo(4,'nuevo','bien',20);

DELIMITER $$
CREATE PROCEDURE spu_updateD_todo_prestamo
(
    IN _idprestamo INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones  VARCHAR(50)
)
BEGIN
    DECLARE _count_ocupados INT;
    -- Actualizar ejemplares a 'NO' y registrar observaciones y fecha de devolución para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO',
        le.observaciones = _observaciones,
        le.condiciondevolucion = _condiciondevolucion,
        le.fechadevolucion = NOW()
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'SI';

      IF _condiciondevolucion  IN ('Deteriorado','Mal')THEN
        UPDATE ejemplares e
        JOIN librosentregados le ON e.idejemplar = le.idejemplar
        SET e.condicion = _condiciondevolucion
        WHERE le.idprestamo = _idprestamo;
    END IF;

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
END$$

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

CALL spu_updateD_todo_prestamo(81,'Deteriorado','sin pasta');
SELECT * FROM usuarios -- 14
SELECT * FROM prestamos WHERE estado = 'D'
UPDATE usuarios SET estado = 0 WHERE idusuario = 15

SELECT
    l.idlibro,
    l.libro,
    COUNT(p.idprestamo) AS cantidad_prestamos
FROM
    prestamos p
JOIN
    usuarios u ON p.idbeneficiario = u.idusuario
JOIN
    libros l ON p.idlibro = l.idlibro
JOIN
    roles r ON u.idrol = r.idrol
WHERE
    r.nombrerol = 'Profesor'
GROUP BY
    l.idlibro, l.libro
ORDER BY
    cantidad_prestamos DESC
LIMIT 5;
UPDATE libros SET imagenportada = 'd6ce6ed8edfb40bcaee8671f91012b2f4a175597.jpg' WHERE idlibro = 12


-- CAMBIAR CONTRASEÑA



DELIMITER $$
CREATE PROCEDURE spu_olvidar_contraseña
(
	IN _user VARCHAR(20),
	IN _clave VARCHAR(100)
)
BEGIN
	UPDATE usuarios SET
	claveacceso = _clave,
	update_at = NOW()
	WHERE nombreusuario = _user;
END $$


SELECT * FROM usuarios -- 78290181

UPDATE usuarios SET claveacceso = '$2y$10$1EwQL/puaUQHsn3KpLDQge.QJ5zTmDQ3PmQkd2du.4H91O8UsatWC'
WHERE idusuario = 3;

SELECT * FROM personas

