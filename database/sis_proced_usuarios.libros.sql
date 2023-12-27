DROP DATABASE sistemabiblioteca;
--  LIBROS Y USUARIOS
SELECT * FROM libros
SELECT *FROM detalleautores
-- REGISTRAR LIBRO
DELIMITER $$
CREATE PROCEDURE spu_registrar_libro
(
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _libro VARCHAR(70),
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
    IN _condicion VARCHAR(100)
)
BEGIN
    DECLARE cantidad_libros INT;
    DECLARE contador INT DEFAULT 1;
    DECLARE nuevo_codigo INT;
    
     INSERT INTO libros (idsubcategoria, ideditorial, libro, tipo, cantidad, numeropaginas, codigo, edicion,formato,anio,idioma,descripcion,imagenportada)
     VALUES (_idsubcategoria, _ideditorial, _libro, _tipo, _cantidad, _numeropaginas, _codigo, _edicion,_formato,_anio,_idioma,_descripcion,_imagenportada);
	
     SET @idlibro = LAST_INSERT_ID();
     
    -- Obtener la cantidad de libros para el ID 
    SELECT cantidad INTO cantidad_libros FROM libros WHERE idlibro = @idlibro;

    -- Obtener el último código_libro global
    SELECT COALESCE(MAX(codigo_libro), 0) INTO nuevo_codigo FROM ejemplares;

    -- Incrementar el código_libro global
    SET nuevo_codigo = nuevo_codigo + 1;

    -- Insertar ejemplares para el ID del libro
    WHILE contador <= cantidad_libros DO
        -- Encontrar el próximo código_libro disponible
        WHILE EXISTS (SELECT 1 FROM ejemplares WHERE codigo_libro = nuevo_codigo AND idlibro = @idlibro ) DO
            SET nuevo_codigo = nuevo_codigo + 1;
        END WHILE;

        -- Insertar el nuevo ejemplar
        INSERT INTO ejemplares (idlibro, codigo_libro, condicion)
        VALUES (@idlibro , nuevo_codigo, _condicion);
        SET contador = contador + 1;
        SET nuevo_codigo = nuevo_codigo + 1;
    END WHILE;
END $$

 -- para aumentar la cantidad funciona
DELIMITER $$ 
CREATE PROCEDURE spu_aumentar_libro
(
    IN p_idlibro INT, 
    IN p_nueva_cantidad INT,
    IN _condicion VARCHAR(50)
)
BEGIN
      DECLARE v_ultimo_codigo_libro INT;
      DECLARE v_nuevo_codigo_libro INT;
      DECLARE contador INT DEFAULT 1;
    -- Obtener el último número de código_libro
     -- SELECT COALESCE(MAX(codigo_libro), 0) INTO v_ultimo_codigo_libro FROM ejemplares;
     
    SELECT MAX(codigo_libro) INTO v_ultimo_codigo_libro
    FROM ejemplares
    WHERE idlibro = p_idlibro;

    -- Verificar si hay ejemplares existentes
    IF v_ultimo_codigo_libro IS NOT NULL THEN
        -- Calcular el nuevo número de código_libro
        SET v_nuevo_codigo_libro = v_ultimo_codigo_libro + 1;

        -- Insertar ejemplares para la nueva cantidad
        
        WHILE contador <= p_nueva_cantidad DO
            INSERT INTO ejemplares (idlibro, codigo_libro, condicion)
            VALUES (p_idlibro, v_nuevo_codigo_libro,_condicion);

            SET contador = contador + 1;
            SET v_nuevo_codigo_libro = v_nuevo_codigo_libro + 1;
        END WHILE;

        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        cantidad = cantidad + p_nueva_cantidad
        WHERE idlibro = p_idlibro;


        -- Imprimir mensaje o devolver resultado si es necesario
        SELECT 'Cantidad y código_libro actualizados correctamente' AS 'Mensaje';
    ELSE
        -- Si no hay ejemplares existentes, mostrar mensaje de error
        SELECT 'No hay ejemplares existentes para el libro especificado' AS 'Error';
    END IF;

END $$

CALL spu_actualizar_libro(14,1,'Nuevo')
SELECT * FROM libros WHERE idlibro = 33    -- 31,32
SELECT * FROM ejemplares WHERE idlibro = 33
SELECT * FROM detalleautores WHERE detalleautores.idlibro = 33
UPDATE libros SET
libro = 'Historia del Cálculo',
cantidad = 2
WHERE idlibro = 33

INSERT INTO detalleautores (idlibro,idautor) VALUES
	(33,3),
	(33,6);

DELIMITER $$
CREATE PROCEDURE spu_update_libro
(
    IN _idlibro INT, 
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _libro VARCHAR(100),
    IN _tipo VARCHAR(50),
    IN _numeropaginas SMALLINT,
    IN _codigo DECIMAL(6,3),
    IN _edicion VARCHAR(100),
    IN _formato VARCHAR(50),
    IN _anio	DATE,
    IN _idioma  VARCHAR(20),
    IN _descripcion VARCHAR(200)
)
BEGIN

        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        idsubcategoria = _idsubcategoria,
        ideditorial = _ideditorial,
        libro = _libro,
        tipo = _tipo,
        numeropaginas = _numeropaginas,
        codigo = _codigo,
        edicion = _edicion,
        formato = _formato,
        anio = _anio,
        idioma = _idioma,
        descripcion = _descripcion
        WHERE idlibro = _idlibro;
END $$


DELIMITER $$
CREATE PROCEDURE spu_update_img
(
    IN _idlibro INT, 
    IN _idsubcategoria INT,
    IN _ideditorial INT,
    IN _libro VARCHAR(100),
    IN _tipo VARCHAR(50),
    IN _numeropaginas SMALLINT,
    IN _codigo DECIMAL(6,3),
    IN _edicion VARCHAR(100),
    IN _formato VARCHAR(50),
    IN _anio	DATE,
    IN _idioma  VARCHAR(20),
    IN _descripcion VARCHAR(200),
    IN _imagenportada VARCHAR(100)
    
)
BEGIN
        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        idsubcategoria = _idsubcategoria,
        ideditorial = _ideditorial,
        libro = _libro,
        tipo = _tipo,
        numeropaginas = _numeropaginas,
        codigo = _codigo,
        edicion = _edicion,
        formato = _formato,
        anio = _anio,
        idioma = _idioma,
        descripcion = _descripcion,
        imagenportada = _imagenportada
        WHERE idlibro = _idlibro;
END $$

DELIMITER $$
CREATE PROCEDURE spu_traer_idlibro_autor()
BEGIN
	SELECT libros.idlibro, libros.libro
	FROM libros
	ORDER BY libros.idlibro DESC LIMIT 1;
END $$

CALL spu_traer_Autor()
ALTER TABLE autores ADD COLUMN estado CHAR(1) NOT NULL DEFAULT 1;


-- UPDATE AUTORES
DELIMITER $$
CREATE PROCEDURE spu_actualizar_actores
(
	IN _iddetalleautor INT,
	IN _idlibro INT,
	IN _idautor INT
)
BEGIN
	UPDATE detalleautores SET
	idautor = _idautor,
	idlibro = _idlibro
	WHERE iddetalleautor = _iddetalleautor AND detalleautores.estado = 1;
END $$



CALL spu_actualizar_actores(34,34,10)
CALL spu_actualizar_actores(34,34,3)
SELECT * FROM detalleautores
-- falta
DELIMITER $$
CREATE PROCEDURE spu_registrar_autores
(
	IN _idlibro INT,
	IN _idautor INT
)
BEGIN
	INSERT INTO detalleautores(idlibro,idautor) VALUES
		(_idlibro,_idautor);
END $$


CALL spu_update_libro(1,5,1,'fisica conceptual','text',142,'534','','','','español','','',2)
SELECT * FROM autores
SELECT * FROM libros

DELIMITER $$
CREATE PROCEDURE spu_traer_Autor
(
	IN _idlibro INT
)
BEGIN
	SELECT iddetalleautor, autores.idautor,libros.idlibro, CONCAT(autores.apellidos,' ', autores.autor) AS 'nombres'
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	WHERE detalleautores.idlibro = _idlibro AND detalleautores.estado = 1;
END $$
CALL spu_traer_Autor(34)

SELECT * FROM detalleautores
INSERT INTO ejemplares (idlibro,codigo_libro,condicion) VALUES
	(1,2,'Usado'),
	(1,2,'Usado'),
	(1,3,'Usado');

UPDATE ejemplares SET codigo_libro = 1 WHERE idejemplar = 1

-- este no
DELIMITER $$
CREATE PROCEDURE spu_actualizar_libro
(
    IN p_idlibro INT, 
    IN p_nueva_cantidad INT
)
BEGIN
    DECLARE v_ultimo_codigo_libro INT;
    DECLARE v_nuevo_codigo_libro INT;
    DECLARE contador INT DEFAULT 1;

    -- Obtener el último número de código_libro para el libro específico
    SELECT COALESCE(MAX(codigo_libro), 0) INTO v_ultimo_codigo_libro
    FROM ejemplares
    WHERE idlibro = p_idlibro;

    -- Verificar si hay ejemplares existentes
    IF v_ultimo_codigo_libro IS NOT NULL THEN
        -- Calcular el nuevo número de código_libro
        SET v_nuevo_codigo_libro = v_ultimo_codigo_libro + 1;

        -- Insertar ejemplares para la nueva cantidad
        WHILE contador <= p_nueva_cantidad DO
            INSERT INTO ejemplares (idlibro, codigo_libro)
            VALUES (p_idlibro, v_nuevo_codigo_libro);

            SET contador = contador + 1;
            SET v_nuevo_codigo_libro = v_nuevo_codigo_libro + 1;
        END WHILE;

        -- Actualizar la cantidad del libro          
        UPDATE libros SET 
        cantidad = cantidad + p_nueva_cantidad
        WHERE idlibro = p_idlibro;

        -- Imprimir mensaje o devolver resultado si es necesario
        SELECT 'Cantidad y código_libro actualizados correctamente' AS 'Mensaje';
    ELSE
        -- Si no hay ejemplares existentes, mostrar mensaje de error
        SELECT 'No hay ejemplares existentes para el libro especificado' AS 'Error';
    END IF;

END $$

CALL spu_actualizar_libro2(5,1)
SELECT * FROM libros
-- Después de insertar un nuevo libro, llamar a spu_actualizar_ejemplares
CALL spu_actualizar_libro(4,2);

CALL spu_registrar_libro(4,2,'prueba','texto',4,23,23.2,'','mediano','','','','',2);
-- ejecutado LIBROS ACTIVOS

DELIMITER $$
CREATE PROCEDURE spu_listado_libros()
BEGIN

SELECT 
    ej.idlibro, det.iddetalleautor, cat.categoria, sub.subcategoria,lib.libro,lib.cantidad ,(SELECT COUNT(*) FROM ejemplares WHERE idlibro = lib.idlibro AND ocupado = 'NO' AND estado = 1) AS 'Disponible',
    lib.codigo,
    CONCAT(aut.autor, ' ', aut.apellidos) AS 'autor'
FROM 
    subcategorias sub
    JOIN categorias cat ON sub.idcategoria = cat.idcategoria
    JOIN libros lib ON sub.idsubcategoria = lib.idsubcategoria
    JOIN detalleautores det ON lib.idlibro = det.idlibro
    JOIN autores aut ON det.idautor = aut.idautor
    LEFT JOIN ejemplares ej ON lib.idlibro = ej.idlibro
WHERE 
    lib.estado IN (1,0) AND det.estado = 1
GROUP BY 
    ej.idlibro
ORDER BY 
    ej.idlibro DESC;

-- Luego, la sentencia UPDATE
UPDATE libros AS lib
SET 
    lib.estado = 
        CASE
            WHEN (
                SELECT COUNT(*) 
                FROM ejemplares ej
                WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado = 1
            ) > 0 THEN 1
            ELSE 0
        END
WHERE 
    EXISTS (
        SELECT 1
        FROM ejemplares ej
        WHERE ej.idlibro = lib.idlibro AND ej.ocupado = 'NO' AND ej.estado IN (1, 0)
    );
END $$

CALL spu_listado_libros()
UPDATE libros SET cantidad =  21 WHERE idlibro = 7

SELECT * FROM libros
-- LIBROS INACTIVOS
DELIMITER $$
CREATE PROCEDURE spu_inactivo_libros()
BEGIN
	SELECT iddetalleautor, libros.idlibro, subcategorias.subcategoria, categorias.categoria, libros.libro, libros.tipo, libros.cantidad, libros.numeropaginas,
	libros.codigo, libros.edicion, libros.formato, libros.anio, libros.idioma, libros.descripcion, CONCAT(autores.autor,' ',autores.apellidos) AS 'autor', libros.inactive_at
	FROM detalleautores
	INNER JOIN libros ON libros.idlibro = detalleautores.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE estado = 0
	ORDER BY iddetalleautor DESC;
END $$

CALL spu_conseguir_libro()
SELECT * FROM libros
-- TRAER EJEMPLARES DE UN LIBRO
DELIMITER $$
CREATE PROCEDURE spu_mostrar_detallejemplar
(
	IN _idlibro INT
)
BEGIN
	SELECT idejemplar, libros.idlibro, libros.libro, ejemplares.codigo_libro, ejemplares.ocupado, ejemplares.estado
	FROM ejemplares
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = _idlibro;
END $$


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

DELIMITER $$
CREATE PROCEDURE spu_abilitar_libro
(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '1'
	WHERE idlibro = _idlibro;
END $$

-- LISTAR PROFESORES Y ESTUDIANTES INACTIVOS
DELIMITER $$
CREATE PROCEDURE spu_inactivo_estudiantes()
BEGIN
	SELECT idusuario, roles.nombrerol, CONCAT(personas.nombres, ' ', personas.apellidos) AS 'Nombres', personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario,usuarios.inactive_at
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3 AND usuarios.estado = 0
	ORDER BY idusuario DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_inactivo_profesores()
BEGIN
	SELECT idusuario, roles.nombrerol, personas.nombres, personas.apellidos, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2 AND estado = 0
	ORDER BY idusuario DESC;
END $$

CALL spu_inactivo_estudiantes();

DELIMITER $$ -- EJECUTADO
CREATE PROCEDURE spu_inabilitar_usuario
(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = 0,
	inactive_at = NOW()
	WHERE idusuario = _idusuario;
END $$

CALL spu_inabilitar_usuario(2);
SELECT * FROM usuarios
-- 
DELIMITER $$
CREATE PROCEDURE spu_abilitar_usuario
(
	IN _idusuario	INT
)
BEGIN
	UPDATE usuarios SET
	estado = '1'
	WHERE idusuario = _idusuario;
END $$

SELECT * FROM prestamos
CALL spu_abilitar_usuario(6);

-- SECCION ESTUDIANTE Y PROFESOR
DELIMITER $$
CREATE PROCEDURE spu_listar_estudiantes()
BEGIN
	SELECT idusuario,personas.idpersona, roles.nombrerol, personas.nombres, personas.apellidos, personas.fechanac, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 3 AND estado = 1;
END$$

SELECT * FROM personas

CALL spu_listar_profesor();
-- ejecutado
DELIMITER $$
CREATE PROCEDURE spu_listar_profesor()
BEGIN
	SELECT idusuario,personas.idpersona, roles.nombrerol, personas.nombres, personas.apellidos,personas.fechanac, personas.nrodocumento, personas.telefono, personas.email, personas.direccion, nombreusuario
	FROM usuarios
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuarios.idrol = 2 AND estado = 1;
END$$

CALL spu_listar_estudiantes();
SELECT * FROM personas WHERE nrodocumento = '73194181'
-- REGISTRO ESTUDIANTE Y PROFESOR
DELIMITER $$
CREATE PROCEDURE spu_registrar_estudiante
(
    IN _apellidos VARCHAR(50),
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Insertar el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Insertar el registro en la tabla "usuarios" con el rol de Estudiante (idrol = 3)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 3, _nombreusuario, _claveacceso);
END$$

CALL spu_registrar_estudiante('Lopez García', 'Elizabeth', '78290181','DNI','',
'Chincha Baja','928782981','','78290181','654321');


CALL spu_listar_estudiantes();
SELECT * FROM usuarios

DELIMITER $$
CREATE PROCEDURE spu_registrar_profesor
(
    IN _apellidos VARCHAR(50), 
    IN _nombres VARCHAR(30),
    IN _nrodocumento CHAR(8),
    IN _tipodocumento VARCHAR(50),
    IN _fechanac DATE,
    IN _direccion VARCHAR(100),
    IN _telefono CHAR(9),
    IN _email VARCHAR(100),
    IN _nombreusuario VARCHAR(50),
    IN _claveacceso VARCHAR(200)
)
BEGIN
    -- Inserta el registro en la tabla "personas"
    INSERT INTO personas (apellidos, nombres, nrodocumento, tipodocumento, fechanac, direccion, telefono, email)
    VALUES (_apellidos, _nombres, _nrodocumento, _tipodocumento, _fechanac, _direccion, _telefono, _email);

    -- Obtiene el ID de persona recién insertada
    SET @idpersona = LAST_INSERT_ID();

    -- Inserta el registro en la tabla "usuarios" con el rol de Profesor (idrol = 2)
    INSERT INTO usuarios (idpersona, idrol, nombreusuario, claveacceso)
    VALUES (@idpersona, 2, _nombreusuario, _claveacceso);
END$$

CALL spu_registrar_profesor('Tasayco Cardenas', 'Juan','72890123','DNI','2006-10-10','Chincha Alta',
'938789282','','72890123','4321');
 
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategoria
( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END$$

SELECT * FROM EJEmplares WHERE estado = 'D'
 
-- Category
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategorias()
BEGIN
	SELECT idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	FROM subcategorias
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria;
END$$

CALL spu_listar_libro(4);

DELIMITER $$
CREATE PROCEDURE spu_filtro_categoria(IN _idcategoria INT)
BEGIN 
	SELECT *
	FROM subcategorias
	WHERE idcategoria =  _idcategoria;
END $$


DELIMITER $$
CREATE PROCEDURE spu_cambiarEstado_Devolucion(IN _idprestamo INT)
BEGIN
    -- Actualizar el estado de los ejemplares con ocupado='SI' asociados al idprestamo a 0
    UPDATE ejemplares
    SET estado = '0'
    WHERE idejemplar IN (SELECT le.idejemplar FROM librosentregados le JOIN ejemplares e ON le.idejemplar = e.idejemplar
        WHERE le.idprestamo = _idprestamo AND e.ocupado = 'SI');
END $$

-- 61
CALL spu_cambiarEstado_Devolucion(34);
SELECT * FROM prestamos WHERE estado = 'D' -- 34, 40
SELECT *FROM librosentregados
SELECT * FROM ejemplares
--  ACTIVAR OCUPADO Y ACTIVAR ESTADO
DELIMITER $$
CREATE PROCEDURE spu_activar_estado_ejem
(
	IN _idejemplar INT,
	IN _condicion VARCHAR(10)
)
BEGIN
	UPDATE ejemplares SET
	estado = 1,
	condicion = _condicion,
	update_at = NOW()
	WHERE idejemplar = _idejemplar;
	
END $$

CALL spu_activar_estado(24)
SELECT * FROM ejemplares
SELECT * FROM libros

UPDATE ejemplares SET condicion = 'Deteriorado' WHERE idejemplar = 99

SELECT * FROM ejemplares

DELIMITER $$
CREATE PROCEDURE spu_traercondicion_ejemplar
(
	IN _idejemplar INT
)
BEGIN
	SELECT idejemplar, condicion
	FROM ejemplares
	WHERE idejemplar = _idejemplar;
END $$

CALL spu_traercondicion_ejemplar(1)

SELECT * FROM prestamos


--  filtro de subcategoria
DELIMITER $$
CREATE PROCEDURE spu_traer_subcategoria
(
	IN _idcategoria INT
)
BEGIN 
	SELECT idsubcategoria, categorias.categoria, subcategorias.subcategoria, subcategorias.codigo
	FROM subcategorias
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	WHERE subcategorias.idcategoria = _idcategoria
	ORDER BY subcategorias.idsubcategoria DESC;
END $$

ALTER TABLE detalleautores ADD COLUMN estado CHAR(1) NOT NULL DEFAULT '1'

SELECT * FROM detalleautores
-- desactivar Estado

DELIMITER $$
CREATE PROCEDURE spu_desactivar_detalleautor
(
	IN _iddetalleautor INT
)
BEGIN
	UPDATE detalleautores SET
	estado = '0'
	WHERE iddetalleautor = _iddetalleautor;
END $$


CALL spu_desactivar_autor(1)

UPDATE autores SET
estado = 1 WHERE idautor = 18



