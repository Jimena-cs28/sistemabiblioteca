USE sistemabiblioteca;
-- VALIDACIONEEEEEES

SELECT * FROM prestamos
SELECT * FROM ejemplares
SELECT * FROM librosentregados

UPDATE librosentregados SET 
condiciondevolucion = 'bien',
observaciones = 'bien'
WHERE idejemplar = 1;

SELECT * FROM libros
-- FUNCIONAAAAAAAAAAAAAAAAA - solo uno
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

CALL spu_update_ejemplar(115,12)
-- CALL spu_actualizar_estado_prestamo(4,'nuevo','bien',20);

UPDATE ejemplares SET ocupado = 'SI' WHERE idejemplar = 2 -- 7,9
UPDATE usuarios SET estado = 0 WHERE idusuario = 2

SELECT * FROM usuarios
SELECT * FROM ejemplares
SELECT * FROM librosentregados
SELECT * FROM prestamos

CALL spu_update_devoluciones(10,4,'bien','bien');
SELECT * FROM librosentregados

-- REPORTES
SELECT * FROM prestamos WHERE fechasolicitud BETWEEN '2023-11-13' AND '2023-11-16' AND estado = 'T';
-- esta funcionanado este es para todos los prestamos
DELIMITER $$
CREATE PROCEDURE spu_updateD_todo_prestamo
(
    IN _idprestamo INT,
    -- IN _idlibroentregado INT,
    IN _condiciondevolucion VARCHAR(50),
    IN _observaciones  VARCHAR(50)
)
BEGIN
    DECLARE _count_ocupados INT;

    -- Actualizar ejemplares a 'NO' para los idejemplar asociados al idprestamo
    UPDATE ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    SET ej.ocupado = 'NO'
    WHERE le.idprestamo = _idprestamo;

    -- Actualizar observaciones para los idlibroentregado que coincidan con el idprestamo
    UPDATE librosentregados SET 
    observaciones = _observaciones,
    condiciondevolucion = _condiciondevolucion,
    fechadevolucion = NOW()
    WHERE idprestamo = _idprestamo;

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    -- Si todos los idejemplar tienen ocupado='NO', actualizar el estado del préstamo a 'T'
    IF _count_ocupados > 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
    END IF;
END$$
SELECT * FROM librosentregados

DELIMITER $$
CREATE PROCEDURE spu_updateD_todo_prestamo
(
    IN _idprestamo INT,
    -- IN _idlibroentregado INT,
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

    -- Verificar si todos los idejemplar tienen ocupado='NO'
    SELECT COUNT(*) INTO _count_ocupados
    FROM ejemplares ej
    JOIN librosentregados le ON ej.idejemplar = le.idejemplar
    WHERE le.idprestamo = _idprestamo AND ej.ocupado = 'NO';

    -- Si todos los idejemplar tienen ocupado='NO', actualizar el estado del préstamo a 'T'
    IF _count_ocupados > 0 THEN
        UPDATE prestamos SET estado = 'T' WHERE idprestamo = _idprestamo;
    END IF;
END$$

SELECT * FROM personas
SELECT * FROM librosentregados
UPDATE usuarios SET estado = 1 WHERE idusuario = 11
CALL spu_updateD_todo_prestamo(16,'bien','bien');  -- FUNCIONA

UPDATE libros SET cantidad = 9 WHERE idlibro = 3

SELECT * FROM prestamos WHERE estado = 'D'
SELECT * FROM librosentregados
SELECT * FROM ejemplares
UPDATE ejemplares SET ocupado = 'NO' WHERE idejemplar = 73

SELECT * FROM prestamos
SELECT * FROM librosentregados -- atlas 8
SELECT * FROM usuarios
SELECT * FROM ejemplares
UPDATE ejemplares SET ocupado = 'NO' WHERE idejemplar = 6
UPDATE prestamos SET estado = 'D' WHERE idprestamo = 7

UPDATE libros SET cantidad = 10 WHERE idlibro = 4