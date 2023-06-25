-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-06-2023 a las 18:27:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fabricante`
--

CREATE TABLE `Fabricante` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `Fabricante`
--

INSERT INTO `Fabricante` (`codigo`, `nombre`) VALUES
(1, 'A & C ACEITUNAS SL'),
(2, 'A A Z SL'),
(3, 'A ARTESA VIGO SL'),
(4, 'A. B. PARTICIPACIONES INDUSTRIALES SL'),
(9, 'A FOGAZA SL'),
(10, 'A FOGAZA SM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `codigo_fabricante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `Producto`
--

INSERT INTO `Producto` (`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES
(1, 'refresco', 2.99, 4),
(2, 'aceite', 3.99, 1),
(3, 'helado', 4.44, 3),
(4, 'pasta', 1.99, 2),
(5, 'fruta', 6.66, 9),
(6, 'verdura', 6.66, 10),
(7, 'arroz', 0.99, 9),
(8, 'garbanzos', 2.33, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Fabricante`
--
ALTER TABLE `Fabricante`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo__fabricante` (`codigo_fabricante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Fabricante`
--
ALTER TABLE `Fabricante`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `codigo__fabricante` FOREIGN KEY (`codigo_fabricante`) REFERENCES `Fabricante` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT nombre FROM Producto;
SELECT nombre, precio FROM Producto;
SELECT * FROM Producto;
SELECT nombre, precio, precio * 1.18 AS dolares FROM Producto;
SELECT nombre AS "nombre", precio AS euros, precio * 1.18 AS dolars FROM Producto;
SELECT UPPER(nombre) AS nombre_mayusculas, precio FROM Producto;
SELECT LOWER(nombre) AS nombre_minusculas, precio FROM Producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) AS dos_primeros_caracteres FROM Fabricante;
SELECT nombre, ROUND(precio) AS precio_redondeado FROM Producto;
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM Producto;
SELECT DISTINCT codigo_fabricante FROM Producto;
SELECT DISTINCT codigo_fabricante FROM Producto;
SELECT nombre FROM Fabricante ORDER BY nombre ASC;
SELECT nombre FROM Fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM Producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM Fabricante LIMIT 5;
SELECT * FROM Fabricante LIMIT 4, 2;
SELECT nombre, precio FROM Producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM Producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM Producto WHERE codigo_fabricante = 2;
SELECT Producto.nombre, Producto.precio, Fabricante.nombre AS fabricante FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo;
SELECT Producto.nombre, Producto.precio, Fabricante.nombre AS fabricante FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo ORDER BY fabricante ASC;
SELECT Producto.codigo, Producto.nombre AS nombre_producto, Fabricante.codigo AS codigo_fabricante, Fabricante.nombre AS nombre_fabricante FROM Producto
JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo;
SELECT Producto.nombre, Producto.precio, Fabricante.nombre AS fabricante FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Producto.precio = (SELECT MIN(precio) FROM Producto);
SELECT Producto.nombre, Producto.precio, Fabricante.nombre AS fabricante FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Producto.precio = (SELECT MAX(precio) FROM Producto);
SELECT * FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre = 'A_FOGAZA_SM';
SELECT * FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL' AND Producto.precio > 200;
SELECT * FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL' OR Fabricante.nombre = 'A_FOGAZA_SM' OR Fabricante.nombre = 'A_FOGAZA_SL';
SELECT * FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre IN ('A_B_PARTICIPACIONES_INDUSTRIALES_SL', 'A_FOGAZA_SM', 'A_FOGAZA_SL');
SELECT Producto.nombre, Producto.precio FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre LIKE '%e';
SELECT Producto.nombre, Producto.precio FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.nombre LIKE '%w%';
SELECT Producto.nombre, Producto.precio, Fabricante.nombre AS fabricante FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Producto.precio >= 180 ORDER BY Producto.precio DESC, Producto.nombre ASC;
SELECT Fabricante.codigo, Fabricante.nombre FROM Fabricante JOIN Producto ON Producto.codigo_fabricante = Fabricante.codigo GROUP BY Fabricante.codigo, Fabricante.nombre;
SELECT Fabricante.codigo, Fabricante.nombre, Producto.nombre AS producto FROM Fabricante
LEFT JOIN Producto ON Producto.codigo_fabricante = Fabricante.codigo;
SELECT Fabricante.codigo, Fabricante.nombre FROM Fabricante LEFT JOIN Producto ON Producto.codigo_fabricante = Fabricante.codigo WHERE Producto.codigo IS NULL;
SELECT * FROM Producto JOIN Fabricante ON Producto.codigo_fabricante = Fabricante.codigo WHERE Fabricante.codigo = 3 ORDER BY Fabricante.nombre;
SELECT Fabricante.nombre, COUNT(Producto.codigo) AS total_productos FROM Fabricante LEFT JOIN Producto ON Producto.codigo_fabricante = Fabricante.codigo GROUP BY Fabricante.codigo, Fabricante.nombre;
SELECT nombre FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL') ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL') ORDER BY precio ASC LIMIT 1;
SELECT * FROM Producto WHERE precio >= (SELECT MAX(precio) FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL'));
SELECT * FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL') AND precio > (SELECT AVG(precio) FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'A_B_PARTICIPACIONES_INDUSTRIALES_SL'));
