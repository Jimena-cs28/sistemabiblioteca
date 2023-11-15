USE sistemabiblioteca;
-- VALIDACIONEEEEEES

SELECT * FROM prestamos
SELECT * FROM ejemplares
SELECT * FROM librosentregados

UPDATE librosentregados SET 
condiciondevolucion = 'bien',
observaciones = 'bien'
WHERE idejemplar = 1;

DELIMITER $$
CREATE PROCEDURE spu_prueba
(
    IN _idejemplar INT,
    IN _idlibroentregado INT,
    IN _idprestamos INT,
    IN _observacion VARCHAR(50),
    IN _condiciondevolucion VARCHAR(30)
)
BEGIN 
    DECLARE _ocupado CHAR(2);
    
    -- Obtener el valor de la columna ocupado para el idejemplar dado
    SELECT ocupado INTO _ocupado
    FROM ejemplares WHERE idejemplar = _idejemplar;
    
    UPDATE ejemplares SET ocupado = 'NO'
    WHERE idejemplar =_idejemplar;
    
    UPDATE librosentregados SET
    condiciondevolucion = _condiciondevolucion,
    observaciones = _observacion
    WHERE idlibroentregado = _idlibroentregado;
    
    -- Verificar si ocupado es 'SI'
    IF _ocupado = 'NO' THEN
        -- Verificar si el idprestamo coincide
        IF EXISTS (SELECT 1 FROM librosentregados WHERE idprestamo = _idprestamos AND idejemplar = _idejemplar) THEN
            -- Actualizar el estado del prestamo a 'T'
            UPDATE prestamos SET
            estado = 'T'
            WHERE idprestamo = _idprestamos;
        ELSE
            -- Manejar la situación en la que el idprestamo no coincide
            SELECT 'El idprestamo no coincide' AS mensaje;
        END IF;
    ELSE 
        -- Manejar la situación en la que ocupado no es 'SI'
        SELECT 'El ejemplar no está ocupado' AS mensaje;
    END IF;
END$$

DELIMITER $$
CREATE PROCEDURE spu_prueba
(
    IN _idlibroentregado INT,
    IN _observacion VARCHAR(50),
    IN _condiciondevolucion VARCHAR(30)
)
BEGIN 
    DECLARE _ocupado CHAR(2);
	
    -- Obtener el valor de la columna ocupado para el idlibroentregado dado
    SELECT ocupado INTO _ocupado
    FROM librosentregados WHERE idlibroentregado = _idlibroentregado;

    -- Actualizar el estado del ejemplar
    UPDATE ejemplares SET ocupado = 'NO'
    WHERE idlibroentregado = _idlibroentregado;

    -- Actualizar la información de librosentregados
    UPDATE librosentregados SET
        condiciondevolucion = _condiciondevolucion,
        observaciones = _observacion
    WHERE idlibroentregado = _idlibroentregado;

    -- Verificar si todos los idejemplar asociados al mismo idprestamo están en 'NO'
    IF NOT EXISTS (
        SELECT 1
        FROM librosentregados le
        WHERE le.idejemplar = _idprestamos AND le.ocupado = 'SI'
    ) THEN
        -- Cambiar el estado del préstamo a 'T'
        UPDATE prestamos SET
            estado = 'T'
        WHERE idprestamo = (SELECT idprestamo FROM librosentregados WHERE idlibroentregado = _idlibroentregado);
    ELSE 
        -- Manejar la situación en la que al menos un ejemplar está ocupado
        SELECT 'Al menos un ejemplar está ocupado' AS mensaje;
    END IF;
END$$

SELECT * FROM librosentregados

CALL spu_prueba(9,'Bien','Bien');

-- FUNCIONA
DELIMITER $$
CREATE PROCEDURE spu_actualizar_estado_prestamo
(
    IN _idejemplar INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones VARCHAR(50),
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
    fechadevolucion =  NOW(),
    condiciondevolucion = _condiciondevolucion,
    observaciones = _observaciones
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

SELECT * FROM prestamos
SELECT * FROM ejemplares
SELECT * FROM librosentregados
CALL spu_actualizar_estado_prestamo(1,2,'bien','bien',2);

SELECT * FROM usuarios

UPDATE usuarios SET estado = 0 WHERE idusuario = 2
UPDATE ejemplares SET ocupado = 'SI' WHERE idejemplar = 2







