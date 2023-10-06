-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2023 a las 00:52:42
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
-- Base de datos: `manzanascuidadoras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id_establecimiento` int(11) NOT NULL,
  `nom_establecimiento` varchar(30) DEFAULT NULL,
  `admin_establecimiento` varchar(30) DEFAULT NULL,
  `dir_establecimiento` varchar(30) DEFAULT NULL,
  `fk_servicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas`
--

CREATE TABLE `manzanas` (
  `id_manzanas` int(11) NOT NULL,
  `nom_manzanas` varchar(30) DEFAULT NULL,
  `locali_manzanas` varchar(30) DEFAULT NULL,
  `dir_manzanas` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas_servicios`
--

CREATE TABLE `manzanas_servicios` (
  `fk_manzanas` int(11) DEFAULT NULL,
  `fk_servicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mujeres`
--

CREATE TABLE `mujeres` (
  `idDoc` int(11) NOT NULL,
  `tipo_documento` varchar(5) DEFAULT NULL,
  `nom_mujer` varchar(30) DEFAULT NULL,
  `ape_mujer` varchar(30) DEFAULT NULL,
  `tel_mujer` varchar(30) DEFAULT NULL,
  `correo_mujer` varchar(30) DEFAULT NULL,
  `ciu_mujer` varchar(30) DEFAULT NULL,
  `dir_mujer` varchar(30) DEFAULT NULL,
  `ocu_mujer` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipios` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `fk_manzanas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuesta`
--

CREATE TABLE `propuesta` (
  `id_propuesta` int(11) NOT NULL,
  `man_propuesta` varchar(30) DEFAULT NULL,
  `ser_propuesta` varchar(30) DEFAULT NULL,
  `fecha_propuesta` datetime DEFAULT NULL,
  `fk_mujeres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicios` int(11) NOT NULL,
  `nom_servicios` varchar(30) DEFAULT NULL,
  `descri_servicios` varchar(30) DEFAULT NULL,
  `tipo_servicios` varchar(30) DEFAULT NULL,
  `cate_servicios` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_mujeres`
--

CREATE TABLE `servicios_mujeres` (
  `fk_servicios` int(11) DEFAULT NULL,
  `fk_mujeres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id_establecimiento`),
  ADD KEY `fk_servicios` (`fk_servicios`);

--
-- Indices de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  ADD PRIMARY KEY (`id_manzanas`);

--
-- Indices de la tabla `manzanas_servicios`
--
ALTER TABLE `manzanas_servicios`
  ADD KEY `fk_manzanas1` (`fk_manzanas`),
  ADD KEY `fk_servicios1` (`fk_servicios`);

--
-- Indices de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  ADD PRIMARY KEY (`idDoc`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipios`),
  ADD KEY `fk_manzanas` (`fk_manzanas`);

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
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `servicios_mujeres`
--
ALTER TABLE `servicios_mujeres`
  ADD KEY `fk_servicios2` (`fk_servicios`),
  ADD KEY `fk_mujeres1` (`fk_mujeres`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `id_establecimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  MODIFY `id_manzanas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  MODIFY `idDoc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propuesta`
--
ALTER TABLE `propuesta`
  MODIFY `id_propuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicios` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `fk_servicios` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);

--
-- Filtros para la tabla `manzanas_servicios`
--
ALTER TABLE `manzanas_servicios`
  ADD CONSTRAINT `fk_manzanas1` FOREIGN KEY (`fk_manzanas`) REFERENCES `manzanas` (`id_manzanas`),
  ADD CONSTRAINT `fk_servicios1` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_manzanas` FOREIGN KEY (`fk_manzanas`) REFERENCES `manzanas` (`id_manzanas`);

--
-- Filtros para la tabla `propuesta`
--
ALTER TABLE `propuesta`
  ADD CONSTRAINT `fk_mujeres` FOREIGN KEY (`fk_mujeres`) REFERENCES `mujeres` (`idDoc`);

--
-- Filtros para la tabla `servicios_mujeres`
--
ALTER TABLE `servicios_mujeres`
  ADD CONSTRAINT `fk_mujeres1` FOREIGN KEY (`fk_mujeres`) REFERENCES `mujeres` (`idDoc`),
  ADD CONSTRAINT `fk_servicios2` FOREIGN KEY (`fk_servicios`) REFERENCES `servicios` (`id_servicios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
