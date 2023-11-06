USE sistemabiblioteca


-- LISTAR SUBCATEGORIA
DELIMITER $$
CREATE PROCEDURE spu_listar_subcategoria_user
( IN _idcat INT)
BEGIN 
SELECT * FROM subcategorias 
WHERE idcategoria = _idcat;
END$$


DELIMITER $$
CREATE PROCEDURE spu_listar_libro_user
(
	IN _idsubcategoria INT,
	IN _idcategoria INT,
	IN _nombre VARCHAR(70)
)
BEGIN
	SELECT libros.idlibro,libros.imagenportada,libros.nombre,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.nombres AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE (_idsubcategoria ="" OR libros.idsubcategoria = _idsubcategoria) 
	AND (_idcategoria ="" OR categorias.idcategoria = _idcategoria)
	AND (_nombre ="" OR libros.nombre LIKE CONCAT("%", _nombre, "%"));
END$$

CALL spu_listar_libro_user(NULL, 6, 'funciona');
SELECT * FROM categorias


SELECT * FROM libros


-- LISTAR LIBRO
DELIMITER $$
CREATE PROCEDURE spu_list_libro
(	
)
BEGIN
	SELECT libros.idlibro, libros.libro, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
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
	DECLARE cantidad_actual INT;
	-- DECLARE lastinsert INT;	
	INSERT INTO prestamos(idbibliotecario,idbeneficiario, fechaprestamo, descripcion, enbiblioteca, lugardestino, estado) 
	VALUES (11,_idbeneficiario, _fechaprestamo, _descripcion, _enbiblioteca, _lugardestino, 'S');
	
	SET @idprestamo = LAST_INSERT_ID();

    -- Obtiene la cantidad actual del libro
    SELECT cantidad INTO cantidad_actual
    FROM libros
    
    WHERE idlibro = _idlibro;

    -- Verifica si hay suficientes libros disponibles para restar
    IF cantidad_actual >= _cantidad THEN
        -- Registra el libro entregado
        INSERT INTO librosentregados (idprestamo, idlibro, cantidad, fechadevolucion)
	VALUES (@idprestamo, _idlibro, _cantidad, _fechadevolucion);
        
        -- SE actualiza la cantidad del libro
        UPDATE libros
        SET cantidad = cantidad_actual - _cantidad
        WHERE idlibro = _idlibro;

        -- SELECT 'Libro entregado y cantidad actualizada correctamente.' AS mensaje;
    ELSE
        SELECT 'No hay suficientes libros disponibles para realizar la entrega.' AS mensaje;
    END IF;
END $$
	
CALL spu_prestamo_usuario(1, 6, 1, '5A', 'no', 'salon2', '2023-11-04', '2023-11-06');
