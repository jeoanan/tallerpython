-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2022 a las 01:36:25
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueaderobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblceldas`
--

CREATE TABLE `tblceldas` (
  `Id_Celda` int(10) UNSIGNED NOT NULL,
  `Disponible` enum('si','no') NOT NULL,
  `Id_Tarifa` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblregistro`
--

CREATE TABLE `tblregistro` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Placa` varchar(6) NOT NULL,
  `Fecha_Ingreso` datetime NOT NULL,
  `Fecha_Salida` datetime NOT NULL,
  `Id_Celda` int(10) UNSIGNED NOT NULL,
  `Valor_Pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltarifas`
--

CREATE TABLE `tbltarifas` (
  `Id_Tarifa` int(10) UNSIGNED NOT NULL,
  `Valor_Tarifa` int(10) UNSIGNED NOT NULL,
  `Year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblceldas`
--
ALTER TABLE `tblceldas`
  ADD PRIMARY KEY (`Id_Celda`),
  ADD KEY `Id_Tarifa` (`Id_Tarifa`);

--
-- Indices de la tabla `tblregistro`
--
ALTER TABLE `tblregistro`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Celda` (`Id_Celda`);

--
-- Indices de la tabla `tbltarifas`
--
ALTER TABLE `tbltarifas`
  ADD PRIMARY KEY (`Id_Tarifa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblceldas`
--
ALTER TABLE `tblceldas`
  MODIFY `Id_Celda` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblregistro`
--
ALTER TABLE `tblregistro`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbltarifas`
--
ALTER TABLE `tbltarifas`
  MODIFY `Id_Tarifa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblceldas`
--
ALTER TABLE `tblceldas`
  ADD CONSTRAINT `tblceldas_ibfk_1` FOREIGN KEY (`Id_Tarifa`) REFERENCES `tbltarifas` (`Id_Tarifa`);

--
-- Filtros para la tabla `tblregistro`
--
ALTER TABLE `tblregistro`
  ADD CONSTRAINT `tblregistro_ibfk_1` FOREIGN KEY (`Id_Celda`) REFERENCES `tblceldas` (`Id_Celda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
