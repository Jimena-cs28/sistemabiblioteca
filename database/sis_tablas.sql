CREATE DATABASE sistemabiblioteca
USE sistemabiblioteca 

CREATE TABLE personas 
(
	idpersona	INT AUTO_INCREMENT PRIMARY KEY,
	apellidos	VARCHAR(50)	NOT NULL,
	nombres 	VARCHAR(30)	NOT NULL,
	nrodocumento	CHAR(8)		NULL,
	tipodocumento	VARCHAR(50)	NOT NULL,
	fechanac	DATE 		NULL,
	direccion	VARCHAR(100)	NOT NULL,
	telefono	CHAR(9)		NULL,
	email		VARCHAR(100)	NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL
)ENGINE=INNODB;


CREATE TABLE roles
(
	idrol		INT AUTO_INCREMENT PRIMARY KEY,
	nombrerol	VARCHAR(50)	NOT NULL,
	cantidadmax	SMALLINT	NOT NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL,
	CONSTRAINT uk_nombrerol_roles UNIQUE (nombrerol),
	CONSTRAINT ck_nombrerol_roles CHECK(nombrerol IN ("Administrador","Profesor","Estudiante"))
)ENGINE=INNODB;


CREATE TABLE usuarios
(
	idusuario	INT AUTO_INCREMENT PRIMARY KEY,
	idpersona	INT		NOT NULL,
	idrol		INT		NOT NULL,
	nombreusuario	VARCHAR(50)	NOT NULL,
	claveacceso	VARCHAR(200)	NOT NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL,
	CONSTRAINT fk_idpersona FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT fk_idrol FOREIGN KEY (idrol) REFERENCES roles (idrol)
)ENGINE=INNODB;


CREATE TABLE editoriales
(
	ideditorial	INT AUTO_INCREMENT PRIMARY KEY,
	nombres		VARCHAR(100)	NOT NULL,
	telefono	CHAR(9)		NULL,
	website		VARCHAR(150)	NULL,
	email		VARCHAR(50)	NULL,
	paisorigen	VARCHAR(50)	NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL
)ENGINE=INNODB;

CREATE TABLE categorias
(
	idcategoria	INT AUTO_INCREMENT PRIMARY KEY,
	categoria	VARCHAR(100)	NOT NULL,
	codigo		SMALLINT	NOT NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL,
	CONSTRAINT uk_codigo UNIQUE(codigo,categoria)
)ENGINE=INNODB;


CREATE TABLE subcategorias
(
	idsubcategoria	INT AUTO_INCREMENT PRIMARY KEY,
	idcategoria		INT		NOT NULL,
	subcategoria		VARCHAR(50)	NULL,
	codigo			SMALLINT	NULL,
	create_at		DATETIME 	NOT NULL DEFAULT NOW(),
	update_at		DATETIME 	NULL,
	inactive_at		DATETIME 	NULL,
	CONSTRAINT fk_idcategoria FOREIGN KEY (idcategoria) REFERENCES categorias (idcategoria),
	CONSTRAINT uk_subcategoria UNIQUE(subcategoria)
)ENGINE=INNODB;


CREATE TABLE autores
(
	idautor		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos	VARCHAR(50)	NOT NULL,
	nombres		VARCHAR(30)	NOT NULL,
	pseudonimio	VARCHAR(50)	NULL,
	nacionalidad	VARCHAR(50)	NOT NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL
)ENGINE=INNODB;

CREATE TABLE libros
(
	idlibro		INT AUTO_INCREMENT PRIMARY KEY,
	idsubcategoria	INT		NOT NULL,
	ideditorial	INT		NOT NULL,
	nombre		VARCHAR(70)	NOT NULL,
	tipo		VARCHAR(50)	NULL,
	cantidad	SMALLINT	NOT NULL,
	numeropaginas	SMALLINT	NOT NULL,
	codigo		DECIMAL(6,3)	NOT NULL,
	edicion		VARCHAR(50)	NULL,
	formato		VARCHAR(50)	NULL,
	anio		DATE		NULL,
	idioma		VARCHAR(30)	NULL,
	descripcion	TEXT		NULL,
	imagenportada	VARCHAR(200)	NULL,
	create_at	DATETIME 	NOT NULL DEFAULT NOW(),
	update_at	DATETIME 	NULL,
	inactive_at	DATETIME 	NULL,
	CONSTRAINT fk_idsubcategoria FOREIGN KEY (idsubcategoria) REFERENCES subcategorias (idsubcategoria),
	CONSTRAINT fk_ideditorial FOREIGN KEY (ideditorial) REFERENCES editoriales (ideditorial)
)ENGINE=INNODB;

CREATE TABLE detalleautores
(
	iddetalleautor	INT AUTO_INCREMENT PRIMARY KEY,
	idlibro		INT 	NOT NULL,
	idautor 	INT 	NOT NULL,
	creat_at  	DATETIME NOT NULL DEFAULT NOW(),
	update_at 	DATETIME NULL,
	INACTIVE 	DATETIME NULL,
	CONSTRAINT fk_idlibro FOREIGN KEY (idlibro) REFERENCES libros (idlibro),
	CONSTRAINT fk_idautor_text FOREIGN KEY (idautor) REFERENCES autores (idautor)
)ENGINE=INNODB;


CREATE TABLE prestamos
(
	idprestamo		INT AUTO_INCREMENT PRIMARY KEY,
	idbeneficiario 		INT 		NOT NULL,
	idbibliotecario		INT 		NOT NULL,
	fechasolicitud		DATETIME	NOT NULL DEFAULT NOW(),
	fechaprestamo		DATETIME 	NULL,
	fecharespuesta		DATETIME	NULL,
	fechaentrega		DATETIME	NULL,
	descripcion		VARCHAR(20)	NULL,
	enbiblioteca		CHAR(2)		NOT NULL,
	lugardestino		VARCHAR(100) 	NULL,
	estado			CHAR(1)		NOT NULL DEFAULT 'E',
	activo			CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT fk_idbene_prestamo FOREIGN KEY (idbeneficiario) REFERENCES usuarios (idusuario),
	CONSTRAINT fk_idbiblio_prestamo FOREIGN KEY (idbibliotecario) REFERENCES usuarios (idusuario),
	CONSTRAINT ck_enbiblio_presta  CHECK(enbiblioteca IN ("SI","NO")),
	CONSTRAINT ck_estado_ore CHECK(estado IN ("E","S","R","D","T","N")), 
	-- e=Espera, R=reserva, S=solicitud, D=devolucionp, T=todo, N=rechazado
	CONSTRAINT ck_fechas CHECK(fechaprestamo>fechasolicitud)
)ENGINE=INNODB;

SELECT * FROM librosentregados

-- alter table prestamos alter constraint ck_estado_ore CHECK(estado IN ("E","S","A","T","R","D","U")); 

CREATE TABLE librosentregados
(
	idlibroentregado	INT AUTO_INCREMENT PRIMARY KEY,
	idprestamo		INT 		NOT NULL,
	idlibro			INT 		NOT NULL,
	cantidad 		SMALLINT 	NOT NULL,
	condicionentrega	VARCHAR(50)	NULL,
	condiciondevolucion	VARCHAR(50)	NULL,
	observaciones		VARCHAR(40)	NULL, -- modificar a varchar
	fechadevolucion		DATETIME 	NULL,
	CONSTRAINT fk_libro_prestamo FOREIGN KEY (idlibro) REFERENCES libros (idlibro),
	CONSTRAINT fk_prestamo_libentre FOREIGN KEY (idprestamo) REFERENCES prestamos (idprestamo)
)ENGINE=INNODB;
