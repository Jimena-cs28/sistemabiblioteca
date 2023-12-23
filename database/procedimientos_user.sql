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
SELECT * FROM ejemplares WHERE idlibro = 6

SELECT * FROM librosentregados

-- 3 FILTROS PARA BUSCAR
DELIMITER $$
CREATE PROCEDURE spu_listar_libro_user
(
	IN _idsubcategoria INT,
	IN _idcategoria INT,
	IN _nombre VARCHAR(70)
)
BEGIN
	SELECT libros.idlibro,libros.imagenportada,libros.libro,subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.numeropaginas,libros.codigo,
	GROUP_CONCAT(CONCAT(autores.autor, ' ', autores.apellidos)) AS "autor", editoriales.nombres AS "editorial",
	(SELECT COUNT(*) FROM ejemplares WHERE idlibro = libros.idlibro AND ocupado = 'NO' AND estado = 1) AS "cantidad"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE (_idsubcategoria ="" OR libros.idsubcategoria = _idsubcategoria) 
	AND (_idcategoria ="" OR categorias.idcategoria = _idcategoria)
	AND (_nombre ="" OR libros.libro LIKE CONCAT("%", _nombre, "%"))
	GROUP BY libros.idlibro;
END$$

CALL spu_listar_libro_user(NULL, 6, 'funciona');
SELECT * FROM libro

DELIMITER $$
CREATE PROCEDURE spu_validar_libroprestado
(
	IN _idusuario INT
)
BEGIN
	SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idusuario AND estado IN ('S', 'R', 'D') ;

END $$
UPDATE prestamos SET estado = 'T'
CALL spu_validar_libroprestado(2)
SELECT * FROM prestamos


-- LISTAR LIBROS
DELIMITER $$
CREATE PROCEDURE spu_list_libro
(	
)
BEGIN
	SELECT libros.idlibro, libros.libro, libros.imagenportada, subcategorias.subcategoria, categorias.categoria, libros.tipo, libros.codigo,
	GROUP_CONCAT(CONCAT(autores.autor, " ",autores.apellidos)) AS "autor", editoriales.nombres AS "editorial", 
	(SELECT COUNT(*) FROM ejemplares WHERE idlibro = libros.idlibro AND ocupado = 'NO' AND estado = 1) AS "cantidad"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN  categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial
	GROUP BY libros.idlibro;
	
END$$
CALL spu_list_libro();

SELECT * FROM ejemplares WHERE idlibro = 2 AND ocupado = 'NO'
SELECT * FROM libros

-- BUSCADOR
DELIMITER $$
CREATE PROCEDURE spu_buscar_libro
(
    IN _idlibro INT
)
BEGIN
        SELECT libros.idlibro, libros.imagenportada, libros.libro, subcategorias.subcategoria,
        categorias.categoria, libros.tipo, libros.numeropaginas, libros.codigo,
        GROUP_CONCAT(CONCAT(autores.autor, " ", autores.apellidos)) AS "autor", editoriales.nombres AS "editorial",
        libros.descripcion, (SELECT COUNT(*) FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1) AS "cantidad"
	FROM libros
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN detalleautores ON detalleautores.idlibro = libros.idlibro
	INNER JOIN autores ON autores.idautor = detalleautores.idautor
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN editoriales ON editoriales.ideditorial = libros.ideditorial 
	WHERE libros.idlibro = _idlibro
	GROUP BY libros.idlibro;
END$$


CALL spu_buscar_libro(2);
SELECT * FROM librosentregados
SELECT * FROM libros
SELECT * FROM prestamos

UPDATE prestamos SET estado = 'D'

-- HISTORIAL DEL USUARIO
DELIMITER $$
CREATE PROCEDURE spu_historial
(
	IN _idusuario INT
)
BEGIN
	SELECT prestamos.idprestamo, libros.libro AS 'libro', libros.imagenportada, prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.estado,
	prestamos.cantidad, prestamos.motivorechazo, librosentregados.fechadevolucion, libros.codigo
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	LEFT JOIN librosentregados ON librosentregados.idprestamo = prestamos.idprestamo
	WHERE prestamos.idbeneficiario = _idusuario
	GROUP BY prestamos.idprestamo ORDER BY idprestamo DESC;
END $$


UPDATE usuarios SET estado = 1
UPDATE librosentregados SET fechadevolucion = NOW()
SELECT * FROM librosentregados
SELECT * FROM prestamos WHERE idlibro = NULL
CALL spu_historial(2)

DELETE FROM librosentregados
DELETE FROM prestamos

SELECT * FROM librosentregados
DELIMITER $$
CREATE PROCEDURE spu_ejemplarlibro (
	IN _idlibro INT
)
BEGIN 
	SELECT* FROM ejemplares WHERE estado = 1 AND ocupado = "NO" AND idlibro = _idlibro;
END $$

CALL spu_ejemplarlibro(2)

-- REGISTRAR SOLICITUD USUARIO(DESACTIVAR ESTADO)
DELIMITER $$
CREATE PROCEDURE spu_registrar_solicitud_usuario
(
	IN _idlibro INT,
	IN _idbeneficiario INT,
	IN _cantidad INT,
	IN _descripcion VARCHAR(20),
	IN _enbiblioteca CHAR(2),
	IN _lugardestino VARCHAR(100),
	IN _fechaprestamo DATETIME
)
BEGIN
	DECLARE _cantidadusuario INT;
	DECLARE _rolusuario INT;
	INSERT INTO prestamos(idlibro, idbeneficiario, cantidad, descripcion, enbiblioteca, lugardestino, fechaprestamo, estado) VALUES 
	(_idlibro, _idbeneficiario, _cantidad, _descripcion, _enbiblioteca, 
	_lugardestino, _fechaprestamo, 'S');
	
	SET _cantidadusuario = (SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario = _idbeneficiario AND estado IN ('S', 'R', 'D'));
	SET _rolusuario = (SELECT idrol FROM usuarios WHERE idusuario = _idbeneficiario);
	

	IF _rolusuario = 3 AND _cantidadusuario = 1 THEN
		UPDATE usuarios SET estado = 0 WHERE idusuario = _idbeneficiario; 
	END IF;
	
	IF _rolusuario = 2 AND _cantidadusuario = 2 THEN
		UPDATE usuarios SET estado = 0 WHERE idusuario = _idbeneficiario; 
	END IF;

END $$

UPDATE prestamos SET estado = 'T'

UPDATE usuarios SET estado = 1

CALL spu_registrar_solicitud_usuario(3,2,1,'4B','SI','','2023-11-30')

SELECT * FROM roles

-- DATOS DEL USUARIO	
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

-- LISTAR EJEMPLARES DE LIBROS
DELIMITER $$
CREATE PROCEDURE spu_listar_ejemplares
(
	IN _idlibro INT,
	IN _cantidad INT
)
BEGIN
	SELECT idejemplar, codigo_libro, condicion FROM ejemplares WHERE idlibro = _idlibro AND ocupado = 'NO' AND estado = 1 LIMIT _cantidad;
END $$
SELECT * FROM librosentregados
CALL spu_listar_ejemplares(1,2)
SELECT * FROM ejemplares WHERE idlibro = 6

-- REGISTRAR LIBROS
DELIMITER $$
CREATE PROCEDURE spu_registrar_libros_entregados
(
	IN _idejemplar INT,
	IN _observacion VARCHAR(50),
	IN _idprestamo INT,
	IN _fechadevolucion DATETIME
	
)
BEGIN
	INSERT INTO librosentregados(idprestamo, idejemplar, condicionentrega, fechadevolucion) 
	VALUE (_idprestamo, _idejemplar, _observacion, _fechadevolucion);
	
	UPDATE ejemplares SET ocupado = 'SI' WHERE idejemplar = _idejemplar;
	UPDATE prestamos SET fecharespuesta = NOW() WHERE idprestamo = _idprestamo;
END $$
SELECT * FROM librosentregados
SELECT * FROM prestamos

-- ACTUALIZAR ESTADOS DE LIBROS
DELIMITER $$
CREATE PROCEDURE spu_actualizar_estados_librosentregados
(
	IN _estado CHAR(1),
	IN _idprestamo INT
)
BEGIN
	UPDATE prestamos SET estado = _estado WHERE idprestamo = _idprestamo;

END$$

SELECT * FROM prestamos WHERE estado = 'S'

-- ADMIN
DELIMITER $$
CREATE PROCEDURE spu_solicitud_listar()
BEGIN
	SELECT prestamos.idprestamo, CONCAT(personas.nombres, '' , personas.apellidos) AS 'Nombres', libros.libro AS 'libro', prestamos.descripcion,fechasolicitud, 
	DATE(fechaprestamo) AS 'fechaprestamo', prestamos.cantidad, libros.idlibro
	FROM prestamos
	INNER JOIN libros ON libros.idlibro = prestamos.idlibro
	INNER JOIN usuarios  ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'S';
END $$

SELECT * FROM personas
SELECT * FROM libros
SELECT * FROM prestamos

-- BOTÓN RECHAZAR
DELIMITER $$
CREATE PROCEDURE spu_rechazar_solicitud
(
	IN _idprestamo INT,
	IN _idejemplar	INT,
	IN _motivo	VARCHAR(200)
)
BEGIN
	INSERT INTO librosentregados (idprestamo, idejemplar)
	VALUE (_idprestamo, _idejemplar);
	
	UPDATE prestamos SET motivorechazo = _motivo, estado = 'C' WHERE idprestamo = _idprestamo;
END$$

SELECT * FROM prestamos WHERE idbeneficiario = 2
SELECT * FROM librosentregados
SELECT * FROM libros

-- VALIDAR ESTADO USUARIOS(PRÉSTAMO)(ACTIVAR ESTADO)
DELIMITER $$
CREATE TRIGGER tg_validar_prestamo_usuario
AFTER UPDATE ON prestamos 
FOR EACH ROW 
BEGIN
	DECLARE _cantidadusuario INT;
	DECLARE _rolusuario INT;
	
	SET _cantidadusuario = (SELECT COUNT(*) AS 'cantidad' FROM prestamos WHERE idbeneficiario =  new.idbeneficiario AND estado IN ('S', 'R', 'D'));
	SET _rolusuario = (SELECT idrol FROM usuarios WHERE idusuario = new.idbeneficiario);
	

	IF _rolusuario = 3 AND _cantidadusuario = 0 THEN
		UPDATE usuarios SET estado = 1 WHERE idusuario = new.idbeneficiario; 
	END IF;
	
	IF _rolusuario = 2 AND _cantidadusuario < 2 THEN
		UPDATE usuarios SET estado = 1 WHERE idusuario = new.idbeneficiario; 
	END IF;
END $$

 SELECT * FROM prestamos
 
  UPDATE usuarios SET estado = 1
