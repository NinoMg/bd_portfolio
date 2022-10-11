-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-10-2022 a las 19:12:07
-- Versión del servidor: 10.6.7-MariaDB-2ubuntu1.1
-- Versión de PHP: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id_certificado` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `url_logo` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

CREATE TABLE `experiencia_laboral` (
  `id_experienci_laboral` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `url_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `id_habilidad` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `url_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `url_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id_redes` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `url_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sobre_mi`
--

CREATE TABLE `sobre_mi` (
  `id_sobre_mi` int(11) NOT NULL,
  `url_foto` varchar(250) NOT NULL,
  `url_baner` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `url_footer` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `contrasenia` varchar(25) NOT NULL,
  `id_redes_fk` int(11) NOT NULL,
  `id_habilidades_fk` int(11) NOT NULL,
  `id_sobreMi_fk` int(11) NOT NULL,
  `id_proyectos_fk` int(11) NOT NULL,
  `id_educacion_fk` int(11) NOT NULL,
  `id_experienciaLab_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id_certificado`);

--
-- Indices de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD PRIMARY KEY (`id_experienci_laboral`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id_habilidad`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id_redes`);

--
-- Indices de la tabla `sobre_mi`
--
ALTER TABLE `sobre_mi`
  ADD PRIMARY KEY (`id_sobre_mi`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_redes_fk` (`id_redes_fk`),
  ADD KEY `id_habilidades_fk` (`id_habilidades_fk`),
  ADD KEY `id_sobreMi_fk` (`id_sobreMi_fk`),
  ADD KEY `id_proyectos_fk` (`id_proyectos_fk`),
  ADD KEY `id_educacion_fk` (`id_educacion_fk`),
  ADD KEY `id_experienciaLab_fk` (`id_experienciaLab_fk`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_habilidades_fk`) REFERENCES `habilidades` (`id_habilidad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_educacion_fk`) REFERENCES `educacion` (`id_certificado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_sobreMi_fk`) REFERENCES `sobre_mi` (`id_sobre_mi`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`id_experienciaLab_fk`) REFERENCES `experiencia_laboral` (`id_experienci_laboral`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_5` FOREIGN KEY (`id_redes_fk`) REFERENCES `redes` (`id_redes`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_6` FOREIGN KEY (`id_proyectos_fk`) REFERENCES `proyecto` (`id_proyecto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
