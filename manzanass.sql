-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 21:14:18
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
-- Base de datos: `manzanass`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id_estab` int(11) NOT NULL,
  `nombre_estab` varchar(30) DEFAULT NULL,
  `admin_estab` varchar(30) DEFAULT NULL,
  `direccion_estab` varchar(40) DEFAULT NULL,
  `fk_establecimiento` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas`
--

CREATE TABLE `manzanas` (
  `id_manzanas` int(11) NOT NULL,
  `nombre_manzanas` varchar(30) DEFAULT NULL,
  `localidad_manzanas` varchar(30) DEFAULT NULL,
  `direccion_manzanas` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mujeres`
--

CREATE TABLE `mujeres` (
  `nombre_muj` varchar(30) DEFAULT NULL,
  `apell_muj` varchar(30) DEFAULT NULL,
  `tipoDoc_muj` varchar(15) DEFAULT NULL,
  `Numdocum_muj` int(12) NOT NULL,
  `tel_muj` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passw` varchar(30) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `dir_muj` varchar(20) DEFAULT NULL,
  `ocup_muj` varchar(20) DEFAULT NULL,
  `ser_muj` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mujeres_manzanas`
--

CREATE TABLE `mujeres_manzanas` (
  `id_manzanas` int(10) DEFAULT NULL,
  `id_mujeres` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuesta`
--

CREATE TABLE `propuesta` (
  `id_propuesta` int(11) NOT NULL,
  `nomManzana_propu` varchar(30) DEFAULT NULL,
  `Servicio_propu` varchar(20) DEFAULT NULL,
  `hora_fecha` datetime DEFAULT NULL,
  `fk_mujeres` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_serv` int(11) NOT NULL,
  `nombre_serv` varchar(30) DEFAULT NULL,
  `descripcion_serv` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_manzanas`
--

CREATE TABLE `servicios_manzanas` (
  `id_manzanas` int(10) DEFAULT NULL,
  `id_serv` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id_estab`),
  ADD KEY `fk_establecimiento` (`fk_establecimiento`);

--
-- Indices de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  ADD PRIMARY KEY (`id_manzanas`);

--
-- Indices de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  ADD PRIMARY KEY (`Numdocum_muj`);

--
-- Indices de la tabla `mujeres_manzanas`
--
ALTER TABLE `mujeres_manzanas`
  ADD KEY `id_manzanas` (`id_manzanas`),
  ADD KEY `id_mujeres` (`id_mujeres`);

--
-- Indices de la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD PRIMARY KEY (`id_propuesta`),
  ADD KEY `fk_mujeres` (`fk_mujeres`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_serv`);

--
-- Indices de la tabla `servicios_manzanas`
--
ALTER TABLE `servicios_manzanas`
  ADD KEY `id_serv` (`id_serv`),
  ADD KEY `id_manzanas` (`id_manzanas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `id_estab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  MODIFY `id_manzanas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propuesta`
--
ALTER TABLE `propuesta`
  MODIFY `id_propuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_serv` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `establecimiento_ibfk_1` FOREIGN KEY (`fk_establecimiento`) REFERENCES `servicios` (`id_serv`);

--
-- Filtros para la tabla `mujeres_manzanas`
--
ALTER TABLE `mujeres_manzanas`
  ADD CONSTRAINT `mujeres_manzanas_ibfk_1` FOREIGN KEY (`id_manzanas`) REFERENCES `manzanas` (`id_manzanas`),
  ADD CONSTRAINT `mujeres_manzanas_ibfk_2` FOREIGN KEY (`id_mujeres`) REFERENCES `mujeres` (`Numdocum_muj`);

--
-- Filtros para la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD CONSTRAINT `propuesta_ibfk_1` FOREIGN KEY (`fk_mujeres`) REFERENCES `mujeres` (`Numdocum_muj`);

--
-- Filtros para la tabla `servicios_manzanas`
--
ALTER TABLE `servicios_manzanas`
  ADD CONSTRAINT `servicios_manzanas_ibfk_1` FOREIGN KEY (`id_serv`) REFERENCES `servicios` (`id_serv`),
  ADD CONSTRAINT `servicios_manzanas_ibfk_2` FOREIGN KEY (`id_manzanas`) REFERENCES `manzanas` (`id_manzanas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
