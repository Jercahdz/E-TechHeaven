-- Crear la tabla Marcas
CREATE TABLE Marcas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre nvarchar (MAX),
    descripcion TEXT,
    imagen nvarchar(MAX)
);
 
-- Insertar datos de ejemplo
INSERT INTO Marcas (nombre, descripcion, imagen) VALUES
    ('Samsung', ' Innovaci�n y calidad se unen en los productos Samsung, ofreciendo tecnolog�a de vanguardia para satisfacer tus necesidades diarias. �Descubre el mundo Samsung!', 'images/Samsung.png'),
    ('Huawei', 'Huawei, sin�nimo de innovaci�n, presenta dispositivos tecnol�gicos de primera calidad que combinan dise�o elegante y rendimiento excepcional.', 'images/Huawei.png'),
    ('Apple', 'La excelencia en dise�o y tecnolog�a define a Apple. Descubre productos que van m�s all� de las expectativas, fusionando estilo y funcionalidad.', 'images/Apple.png'),
    ('HP', 'HP, l�der en tecnolog�a, proporciona soluciones potentes y confiables para todas tus necesidades inform�ticas, desde port�tiles hasta impresoras de �ltima generaci�n.', 'images/Hp.png'),
    ('Lenovo', 'Lenovo destaca por su compromiso con la innovaci�n y la durabilidad. Descubre productos que impulsan la productividad y la creatividad.', 'images/Lenovo.png'),
    ('Dell', 'Dell ofrece tecnolog�a que impulsa el progreso. Experimenta la potencia de la innovaci�n con port�tiles y dispositivos dise�ados para el rendimiento.', 'images/Dell.png'),
    ('Asus', 'Asus redefine la excelencia en dispositivos electr�nicos, desde port�tiles hasta componentes para juegos. Descubre un mundo de posibilidades con Asus.', 'images/AsusL.png');
 
 
-- Crear la tabla Categorias
CREATE TABLE Categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(255)
);
 
-- Insertar datos de ejemplo
INSERT INTO Categorias (nombre, descripcion, imagen) VALUES
    ('Celulares', 'Explora la �ltima tecnolog�a en telefon�a m�vil con nuestra selecci�n de smartphones de vanguardia. Mantente conectado con estilo.', 'images/Telefonos.png'),
    ('Port�tiles', 'Potencia y portabilidad se encuentran en nuestra colecci�n de port�tiles. Desde ultrabooks elegantes hasta m�quinas de juego potentes.', 'images/Portatiles.png'),
    ('Componentes', 'Construye tu propia experiencia inform�tica con nuestros componentes de alta calidad. Desde tarjetas madre hasta tarjetas gr�ficas, encuentra todo aqu�.', 'images/Componentes.png');
 
 
-- Crear la tabla Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_marca INT,
    id_categoria INT,
    imagen VARCHAR(255),
    FOREIGN KEY (id_marca) REFERENCES Marcas(id),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);
 
-- Crear la tabla Carrito
CREATE TABLE Carrito (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    usuario_id INT,
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES Productos(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
 
-- Agrega la columna seleccionados a la tabla Productos
ALTER TABLE Productos
ADD COLUMN seleccionados INT DEFAULT 0;
 
 
-- Celulares
INSERT INTO Productos (nombre, descripcion, precio, cantidad, id_marca, id_categoria, imagen) VALUES
    ('Samsung Galaxy S21', 'El Samsung Galaxy S21 es un tel�fono inteligente de gama alta con potentes capacidades fotogr�ficas, una pantalla vibrante y un rendimiento excepcional.', 899.99, 10, 1, 1, 'images/S21.png'),
    ('Samsung Galaxy A51', 'El Samsung Galaxy A51 combina un dise�o elegante con caracter�sticas avanzadas, ofreciendo una experiencia de usuario equilibrada a un precio atractivo.', 399.99, 15, 1, 1, 'images/A51.png'),
    ('Huawei P40', 'El Huawei P40 presenta una impresionante configuraci�n de c�mara Leica, un dise�o elegante y un rendimiento potente, ofreciendo una experiencia premium.', 799.99, 8, 2, 1, 'images/P40.png'),
    ('Huawei P30 Lite', ' El Huawei P30 Lite es una opci�n asequible con un dise�o moderno y caracter�sticas sorprendentes, brindando un equilibrio perfecto entre rendimiento y precio.', 299.99, 12, 2, 1, 'images/P30.png'),
    ('iPhone 12', 'El iPhone 12 destaca por su potente chip A14 Bionic, su pantalla Super Retina XDR y su sistema de c�mara avanzado, ofreciendo una experiencia de usuario excepcional.', 999.99, 12, 3, 1, 'images/Iphone12.png'),
    ('iPhone SE', 'El iPhone SE combina el ic�nico dise�o del iPhone con un rendimiento potente, siendo una opci�n accesible para quienes buscan la experiencia iOS.', 499.99, 20, 3, 1, 'images/IphoneSE.png');
 
-- Portatiles
INSERT INTO Productos (nombre, descripcion, precio, cantidad, id_marca, id_categoria, imagen) VALUES
    ('HP Spectre x360', 'El HP Spectre x360 es un port�til 2 en 1 premium con un dise�o elegante, una pantalla t�ctil de alta resoluci�n y un rendimiento excepcional.', 1299.99, 5, 4, 2, 'images/HPSpectre.png'),
    ('HP Pavilion', 'La serie HP Pavilion ofrece port�tiles asequibles sin comprometer el rendimiento, siendo ideales para tareas diarias y entretenimiento.', 799.99, 8, 4, 2, 'images/HPPavilion.png'),
    ('Lenovo ThinkPad X1 Carbon', 'El Lenovo ThinkPad X1 Carbon es conocido por su durabilidad y rendimiento empresarial, con un dise�o delgado y ligero perfecto para profesionales en movimiento.', 1499.99, 7, 5, 2, 'images/LenovoTPad.png'),
    ('Lenovo Ideapad', 'El Lenovo Ideapad ofrece un equilibrio entre rendimiento y precio, siendo una opci�n vers�til para usuarios que buscan un port�til funcional.', 599.99, 10, 5, 2, 'images/LenovoIdea.png'),
    ('Dell XPS 13', 'El Dell XPS 13 destaca por su dise�o ultradelgado, una pantalla InfinityEdge y un rendimiento potente, ideal para usuarios exigentes.', 1399.99, 6, 6, 2, 'images/DellX.png'),
    ('Dell Inspiron', 'La serie Dell Inspiron ofrece port�tiles vers�tiles y asequibles para una variedad de necesidades, desde tareas cotidianas hasta entretenimiento multimedia.', 899.99, 12, 6, 2, 'images/DellInspiron.png'),
    ('Asus ROG Zephyrus G14', 'El Asus ROG Zephyrus G14 es una potente computadora port�til para juegos con un dise�o elegante y especificaciones de alto rendimiento para jugadores exigentes.', 1699.99, 4, 7, 2, 'images/Asus.png'),
    ('Asus VivoBook', 'El Asus VivoBook es una opci�n asequible con un dise�o moderno, ofreciendo un rendimiento s�lido para tareas diarias y entretenimiento.', 699.99, 15, 7, 2, 'images/AsusVivo.png');
 
-- Componentes
INSERT INTO Productos (nombre, descripcion, precio, cantidad, id_marca, id_categoria, imagen) VALUES
    ('Tarjeta madre ASUS ROG Strix B550', 'La tarjeta madre ASUS ROG Strix B550 es una opci�n premium con caracter�sticas avanzadas, dise�ada para construcciones de PC de alto rendimiento.', 199.99, 15, 7, 3, 'images/TarjetaASUS.png'),
    ('Tarjeta madre MSI B450 TOMAHAWK', 'La tarjeta madre MSI B450 TOMAHAWK ofrece un equilibrio entre rendimiento y precio, siendo una opci�n popular para construcciones de PC de nivel medio.', 129.99, 10, 2, 3, 'images/TarjetaMSI.png'),
    ('Tarjeta de video NVIDIA GeForce RTX 3080', 'La tarjeta de video NVIDIA GeForce RTX 3080 proporciona un rendimiento gr�fico excepcional para juegos y aplicaciones intensivas, con tecnolog�as de vanguardia.', 699.99, 8, 1, 3, 'images/TarjetaNVIDIA.png'),
    ('Tarjeta de video AMD Radeon RX 570', 'La tarjeta de video AMD Radeon RX 570 ofrece un rendimiento s�lido para juegos a un precio atractivo, siendo una opci�n popular para jugadores en presupuestos ajustados.', 249.99, 12, 2, 3, 'images/TarjetaAMD.png'),
    ('Memoria RAM Corsair Vengeance LPX 16GB', 'La memoria RAM Corsair Vengeance LPX 16GB proporciona un rendimiento confiable y r�pido, ideal para mejorar la velocidad y la capacidad de respuesta de tu sistema.', 79.99, 20, 1, 3, 'images/MemoriaRAMCorsair.png'),
    ('Memoria RAM Kingston HyperX Fury 8GB', 'La memoria RAM Kingston HyperX Fury 8GB ofrece un rendimiento eficiente a un precio atractivo, siendo una opci�n popular para actualizaciones de memoria.', 49.99, 25, 2, 3, 'images/MemoriaRAMKingston.png');
 
 
-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);
 
-- Insertar usuarios
-- Contrasenas 345, 567, 789, 111, 000
INSERT INTO Usuarios (nombre_usuario, contrasena_hash, nombre_completo, correo_electronico, rol)
VALUES ('Jerson Hern�ndez Carvajal', '$2y$10$gFwGFW.Vg5DK0AQTOD9goeG7FFZLSN.8oZbdntJ83cnTvlNYtEQgm', 'Jerson Hern�ndez Carvajal', 'jhernandez70629@ufide.ac.cr', 'admin');
 
INSERT INTO Usuarios (nombre_usuario, contrasena_hash, nombre_completo, correo_electronico, rol)
VALUES ('Jos� Varela M�ndez', '$2y$10$7G.IK8zOu1o5bmkcAzx7feOVgK.PZG/Yzr4vg2gDPfLFXCxEhD6Ra', 'Jos� Varela M�ndez', 'Jvarela90675@ufide.ac.cr', 'admin');
 
INSERT INTO Usuarios (nombre_usuario, contrasena_hash, nombre_completo, correo_electronico, rol)
VALUES ('Leonardo Reyes Vargas', '$2y$10$EBH2IKQzxqz2VgRP7/AIkOhqGyX4YL6efxlY9A8LrrNx8ObYJ3RcS', 'Leonardo Reyes Vargas', 'Lreyes70353@ufide.ac.cr', 'admin');
 
INSERT INTO Usuarios (nombre_usuario, contrasena_hash, nombre_completo, correo_electronico, rol)
VALUES ('Empleado1', '$2y$10$t4RTBf07MwCoq57WVvI.6OPjdbmTZI04tdcT7kA1cA06J5S2kOW7K', 'Empleado Guzman', 'empleado@ejemplo.com', 'empleado');
 
INSERT INTO Usuarios (nombre_usuario, contrasena_hash, nombre_completo, correo_electronico, rol)
VALUES ('Usuario1', '$2y$10$PZXJYahwMeA57olAIr7j6e6RLoZC5mFh9v7CMbKbXsZm9OQ31KjgS', 'Usuario Fernandez', 'usuario@ejemplo.com', 'usuario');