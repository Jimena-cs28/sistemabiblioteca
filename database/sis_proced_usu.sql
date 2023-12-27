USE sistemabiblioteca
-- PASO 5 LISTAR DEVOLUCIONES.PENDIENTES
DELIMITER $$
CREATE PROCEDURE spu_listar_devolucionpendientes()
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, prestamos.descripcion, libros.idlibro, ejemplares.codigo_libro, libros.libro, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(prestamos.fechaprestamo) AS 'fechaprestamo', prestamos.estado,MIN(DATE(librosentregados.fechadevolucion)) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D'
	GROUP  BY prestamos.idprestamo
	ORDER BY idlibroentregado DESC;
END $$
SELECT * FROM prestamos WHERE prestamos.estado= 'N' 
DELIMITER $$
CREATE PROCEDURE spu_search_prestamo
(
	IN _nombres VARCHAR(50)
)
BEGIN
	SELECT idlibroentregado,prestamos.idprestamo, prestamos.descripcion, libros.idlibro, ejemplares.codigo_libro, libros.libro, usuarios.idusuario, CONCAT( personas.nombres, ' ', personas.apellidos) AS 'nombres', 
	libros.tipo, prestamos.fechasolicitud,prestamos.fechaentrega, DATE(prestamos.fechaprestamo) AS 'fechaprestamo', prestamos.estado,MIN(DATE(librosentregados.fechadevolucion)) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'D' AND (_nombres ="" OR personas.apellidos LIKE CONCAT("%",_nombres, "%"));
END$$
CALL spu_search_prestamo('Guillen');
DELIMITER ;
SELECT * FROM personas
-- PASO 6 ACTUALIZAR FECHADEVOLUCION

CALL spu_obtener_libroentregado(1);
SELECT * FROM prestamos
CALL spu_listar_devolucionpendientes()
SELECT * FROM libros -- 9 for default
-- FALTA EJECUTAR-se ejecuto
DELIMITER $$
CREATE PROCEDURE spu_inabilitar_libro
(
	IN _idlibro	INT
)
BEGIN
	UPDATE libros SET
	estado = '0',
	inactive_at = NOW()
	WHERE idlibro = _idlibro;
END $$

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

CALL spu_inabilitar_usuario(6);

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

CALL spu_abilitar_usuario(2);

DELIMITER $$ 
CREATE  PROCEDURE GRAFICO_INDEX()
BEGIN
	SELECT  COUNT(ejemplares.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY ejemplares.idlibro
	ORDER BY totales DESC
	LIMIT 7;
END $$

UPDATE librosentregados SET fechadevolucion = '2023-11-18' WHERE idlibroentregado = 61

DELIMITER $$
CREATE PROCEDURE spu_grafico_rol ( IN _idrol INT)
BEGIN
	SELECT  COUNT(ejemplares.idlibro) AS 'totales', libros.libro
	FROM librosentregados
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usuarios.idrol
	WHERE usuarios.idrol = _idrol AND prestamos.estado = 'T'
	GROUP BY ejemplares.idlibro
	ORDER BY totales DESC
	LIMIT 5;
END $$


CALL spu_grafico_rol(3);


DELIMITER $$
CREATE PROCEDURE spu_select_descripcion()
BEGIN
	SELECT prestamos.descripcion
	FROM librosentregados 
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	WHERE prestamos.estado = 'T'
	GROUP BY prestamos.descripcion
	ORDER BY prestamos.descripcion;
END $$

CALL spu_select_descripcion();

DELIMITER $$
CREATE PROCEDURE spu_reporte_descripcion
(
	IN _descripcion VARCHAR(10)
)
BEGIN
	SELECT idlibroentregado, categorias.categoria, subcategorias.subcategoria, libros.libro, 
	CONCAT(personas.nombres, ' ' ,personas.apellidos) AS 'nombres',	prestamos.descripcion
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios ON usuarios.idusuario = prestamos.idbeneficiario
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE prestamos.estado = 'T' AND prestamos.descripcion = _descripcion
	GROUP BY personas.nombres;
END $$

CALL spu_reporte_descripcion('3m');
SELECT * FROM personas
SELECT * FROM usuarios
-- REPORTE 2 
-- ejemplo
SELECT idlibro, COUNT(idlibro) AS totalPedidos

SELECT * FROM librosentregados  
INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
WHERE prestamos.fechaprestamo BETWEEN '2023-11-11' AND '2023-11-18' AND estado = 'T';


SELECT * FROM prestamos
FROM librosentregados
GROUP BY idlibro
ORDER BY totalPedidos DESC
LIMIT 10;
	
SELECT * FROM LIBROS

-- REPORTES

DELIMITER $$
CREATE PROCEDURE Reporte()
BEGIN
    SELECT c.categoria, COUNT(p.idprestamo) AS 'CantidadPrestada'
    FROM categorias c
    LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
    LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
    LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
    LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
    LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
    WHERE p.estado = 'T' -- Cambiar según el estado de préstamo deseado
    GROUP BY c.idcategoria;
END $$

CALL ReporteLibrosPrestadosPorCategoria();

DELIMITER $$
CREATE PROCEDURE spu_reporte_fechasolicitud
( 
	IN _fechasolicitud DATE,
	IN _fechasolicitud1 DATE
)
BEGIN
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	WHERE DATE(p.fechasolicitud) BETWEEN _fechasolicitud AND _fechasolicitud1
	GROUP BY c.idcategoria;
END $$

SELECT * FROM prestamos
SELECT * FROM librosentregados
CALL spu_reporte_fechasolicitud('2023-12-01','2023-12-04')

-- LOSLIBROS MAS PEDIDOS (POR DIA, MES,AÑO)-POR CATEGORIA
DELIMITER $$
CREATE PROCEDURE spu_listar_reporte()
BEGIN
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	GROUP BY c.idcategoria;
END $$

DELIMITER $$
CREATE PROCEDURE spu_reporte_idusuario
(
	IN _idusuario INT
)
BEGIN
	SELECT c.idcategoria, c.categoria, c.codigo, COUNT(p.idprestamo) AS 'CantidadPrestada'
	FROM categorias c
	LEFT JOIN subcategorias sc ON c.idcategoria = sc.idcategoria
	LEFT JOIN libros l ON sc.idsubcategoria = l.idsubcategoria
	LEFT JOIN ejemplares e ON l.idlibro = e.idlibro
	LEFT JOIN librosentregados le ON e.idejemplar = le.idejemplar
	LEFT JOIN prestamos p ON le.idprestamo = p.idprestamo
	LEFT JOIN usuarios u ON p.idbeneficiario = u.idusuario
	LEFT JOIN roles r ON u.idrol = r.idrol
	WHERE r.idrol = _idusuario AND p.estado ='T'
	GROUP BY c.idcategoria;
END $$

CALL spu_reporte_idusuario(3)
SELECT * FROM roles

DELIMITER $$
CREATE PROCEDURE SPU_REPORT_USUARIO
(
	IN DESCRIPCION INT
)
BEGIN
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, CONCAT(personas.nombres , ' ',personas.apellidos) AS 'nombres' , prestamos.descripcion, roles.nombrerol, ejemplares.codigo_libro, libros.codigo,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, 
	libros.libro, DATE(prestamos.fechasolicitud) AS 'fechasolicitud', DATE(prestamos.fechaentrega) AS 'fechaentrega', DATE(prestamos.fechaprestamo) AS 'fechaprestamo', DATE(librosentregados.fechadevolucion) AS 'fechadevolucion', prestamos.lugardestino,prestamos.fecharespuesta
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idbeneficiario = 3 AND prestamos.estado = 'T';
END $$

DELIMITER $$
CREATE PROCEDURE spu_report_group_descripcion
(
	IN descripcion INT
)
BEGIN
	SELECT idprestamo, CONCAT(personas.nombres , ' ',personas.apellidos) AS 'nombres' , prestamos.descripcion, roles.nombrerol
	FROM prestamos
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE prestamos.idbeneficiario = descripcion AND prestamos.estado = 'T'
	GROUP BY idbeneficiario;
END $$
SELECT * FROM ejemplares WHERE idlibro = 7
CALL SPU_REPORT_USUARIO(6)

DELIMITER $$
CREATE PROCEDURE spu_reporte_libro
( IN idlibro INT)
BEGIN
	SELECT librosentregados.idlibroentregado, ejemplares.idejemplar, CONCAT(personas.nombres , ' ',personas.apellidos) AS 'nombres' , prestamos.descripcion, roles.nombrerol, ejemplares.codigo_libro, libros.codigo,librosentregados.condicionentrega,librosentregados.condiciondevolucion, librosentregados.observaciones, 
	libros.libro,DATE(prestamos.fechaprestamo) AS 'fechaprestamo', DATE(librosentregados.fechadevolucion) AS 'fechadevolucion'
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	INNER JOIN subcategorias ON subcategorias.idsubcategoria = libros.idsubcategoria
	INNER JOIN categorias ON categorias.idcategoria = subcategorias.idcategoria
	INNER JOIN usuarios usu1 ON usu1.idusuario = prestamos.idbeneficiario
	INNER JOIN roles ON roles.idrol = usu1.idrol
	INNER JOIN personas ON personas.idpersona = usu1.idpersona
	WHERE libros.idlibro = 3 AND prestamos.estado = 'T'
	ORDER BY idlibroentregado ASC;
END $$
-- UNIQUE : LIBRO,CODIGO

DELIMITER $$
CREATE PROCEDURE spu_reporte_libro_group
(
	IN idlibro INT
)
BEGIN
	SELECT libros.libro, libros.codigo
	FROM librosentregados
	INNER JOIN prestamos ON prestamos.idprestamo = librosentregados.idprestamo
	INNER JOIN ejemplares ON ejemplares.idejemplar = librosentregados.idejemplar 
	INNER JOIN libros ON libros.idlibro = ejemplares.idlibro
	WHERE libros.idlibro = idlibro AND prestamos.estado = 'T'
	GROUP BY libros.idlibro;
END $$

CALL spu_listar_todoprestamos()



