USE sistemabiblioteca


-- LISTAR SUBCATEGORIA
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategoria_user
( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END$$
SELECT * FROM libros

DELIMITER $$
CREATE PROCEDURE spu_listar_libro_user
(
	IN _idsubcategoria INT,
	IN _idcategoria INT,
	IN _nombre VARCHAR(70)
)
BEGIN
	SELECT libros.idlibro,libros.imagenportada,libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE (_idsubcategoria ="" OR libros.idsubcategoria = _idsubcategoria) 
	AND (_idcategoria ="" OR categorias.idcategoria = _idcategoria)
	AND (_nombre ="" OR libros.libro LIKE CONCAT("%", _nombre, "%"));
END$$

CALL spu_listar_libro_user(NULL, 6, 'funciona');
SELECT * FROM libro


SELECT * FROM libros


DELIMITER $$
CREATE PROCEDURE spu_validar_libroprestado
(
	IN _idusuario INT
)
BEGIN
	SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idusuario AND estado IN ('S', 'E') ;

END $$

CALL spu_validar_libroprestado(2)

-- LISTAR LIBRO
DELIMITER $$
CREATE PROCEDURE spu_list_libro
(	
)
BEGIN
	SELECT libros.idlibro, libros.libro, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.cantidad,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial; 
END$$
CALL spu_list_libro();

-- BUSCADOR DE LIBRO
DELIMITER $$
CREATE PROCEDURE spu_buscar_libro
(
	IN _idlibro INT
)
BEGIN
	SELECT libros.idlibro, libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.autor AS "autor", editoriales.nombres AS "editorial", libros.descripcion, libros.cantidad
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE libros.idlibro = _idlibro;
END$$

CALL spu_buscar_libro(2);
SELECT * FROM librosentregados
SELECT * FROM libros

DELIMITER $$
CREATE PROCEDURE spu_prestamo_usuario
(
	IN _idejemplar INT,
	IN _idbeneficiario INT,
	IN _cantidad INT,
	IN _descripcion VARCHAR(20),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(100),
	IN _fechaprestamo DATETIME,
	IN _fechadevolución DATETIME
)
BEGIN
	DECLARE cantidad_actual INT;
	-- DECLARE lastinsert INT;	
	INSERT INTO prestamos(idbeneficiario, fechaprestamo, descripcion, enbiblioteca, lugardestino, estado) 
	VALUES (_idbeneficiario, _fechaprestamo, _descripcion, _enbiblioteca, _lugardestino, 'S');
	
	SET @idprestamo = LAST_INSERT_ID();

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idejemplar, cantidad, fechadevolucion)
	VALUES (@idprestamo, _idejemplar, _cantidad, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$

SELECT * FROM librosentregados
	
CALL spu_prestamo_usuario(1, 2, 1, '5A', 'no', 'salon2', '2023-11-10', '2023-11-11');

SELECT* FROM prestamos
UPDATE prestamos SET estado = 'D'

-- DELIMITER $$
-- CREATE PROCEDURE spu_solicitud_listar()
-- BEGIN
	-- SELECT idlibroentregado,  prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	-- DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion'
	-- FROM librosentregados
	-- INNER JOIN prestamos ON prestamos. idprestamo = librosentregados.idprestamo
	-- INNER JOIN libros ON libros.idlibro = librosentregados.idlibro
	-- INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	-- INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	-- WHERE prestamos.estado = 'S';
-- END $$

DELIMITER $$
CREATE PROCEDURE spu_historial(
	IN _idusuario INT
)
BEGIN
	SELECT prestamos.idprestamo, libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', DATE(fechadevolucion) AS 'fechadevolucion', prestamos.estado,
	prestamos.cantidad
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.idbeneficiario = _idusuario;
	
END $$
SELECT * FROM prestamos
CALL spu_historial(2)

DELETE FROM librosentregados
DELETE FROM prestamos


DELIMITER $$
CREATE PROCEDURE spu_ejemplarlibro (
	IN _idlibro INT
)
BEGIN 
	SELECT* FROM ejemplares WHERE estado = 1 AND ocupado = "NO" AND idlibro = _idlibro;
END $$

CALL spu_ejemplarlibro(2)


DELIMITER $$
CREATE PROCEDURE spu_registrar_solicitud_usuario
(
	IN _idlibro INT,
	IN _idbeneficiario INT,
	IN _cantidad INT,
	IN _descripcion VARCHAR(20),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(100),
	IN _fechaprestamo DATETIME,
	IN _fechadevolución DATETIME
)
BEGIN
	INSERT INTO prestamos(idlibro, idbeneficiario, cantidad, descripcion, enbiblioteca, lugardestino, fechaprestamo, 
	fechadevolucion, estado) VALUES (_idlibro, _idbeneficiario, _cantidad, _descripcion, _enbiblioteca, 
	_lugardestino, _fechaprestamo, _fechadevolucion, 'S');

END $$

SELECT * FROM prestamos
	

	
DELIMITER $$
CREATE PROCEDURE spu_datos_personales
(
	IN _idusuario INT
)
BEGIN 
	SELECT personas.apellidos,personas.nombres,personas.nrodocumento,personas.fechanac,
	personas.direccion,personas.telefono,personas.email,roles.nombrerol FROM usuarios

INNER JOIN personas ON personas.idpersona=usuarios.idpersona
INNER JOIN roles ON roles.idrol=usuarios.idrol WHERE usuarios.idusuario=_idusuario;

END $$

CALL spu_datos_personales(2)

DELIMITER $$
CREATE PROCEDURE spu_listar_ejemplares
(
	IN _idlibro INT,
	IN _cantidad INT
)
BEGIN
	SELECT idejemplar, codigo_libro FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1 LIMIT _cantidad;
END $$

CALL spu_listar_ejemplares(1,2)