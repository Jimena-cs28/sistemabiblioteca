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
	SELECT libros.idlibro, libros.nombre, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.nombres AS "autor", editoriales.nombres AS "editorial"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial; 
END$$


-- BUSCADOR DE LIBRO
DELIMITER $$
CREATE PROCEDURE spu_buscar_libro
(
	IN _idlibro INT
)
BEGIN
	SELECT libros.idlibro, libros.nombre,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	autores.nombres AS "autor", editoriales.nombres AS "editorial", libros.descripcion, libros.cantidad
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


