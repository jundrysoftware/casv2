-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2013 a las 16:30:17
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sic115`
--
CREATE DATABASE IF NOT EXISTS `sic115` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sic115`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `reiniciar_saldos`()
BEGIN
		update subcuentas set saldo_debe=0.00, saldo_haber=0.00;
		update cuentas set saldo_debe=0.00, saldo_haber=0.00;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anio_contable`
--

CREATE TABLE IF NOT EXISTS `anio_contable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anio_contable` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `anio_contable`
--

INSERT INTO `anio_contable` (`id`, `anio_contable`) VALUES
(1, 2013);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_empleados`
--

CREATE TABLE IF NOT EXISTS `cargos_empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `cargos_empleados`
--

INSERT INTO `cargos_empleados` (`id`, `cargo`) VALUES
(1, 'Gerente General'),
(2, 'Contador'),
(3, 'Encargado de Comercialización'),
(4, 'Encargado de Producción'),
(5, 'Recepcionista'),
(6, 'Motorista'),
(7, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_clasificaciones`
--

CREATE TABLE IF NOT EXISTS `catalogo_clasificaciones` (
  `codigo_clasificacion` int(11) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogo_clasificaciones`
--

INSERT INTO `catalogo_clasificaciones` (`codigo_clasificacion`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Pasivo'),
(3, 'Capital'),
(4, 'Resultado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_cuentas`
--

CREATE TABLE IF NOT EXISTS `catalogo_cuentas` (
  `codigo_cuenta` varchar(20) NOT NULL,
  `naturaleza` varchar(20) NOT NULL,
  `subgrupo` varchar(10) NOT NULL,
  `nombre_cuenta` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_cuenta`),
  KEY `subgrupo` (`subgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogo_cuentas`
--

INSERT INTO `catalogo_cuentas` (`codigo_cuenta`, `naturaleza`, `subgrupo`, `nombre_cuenta`) VALUES
('1.2.1.1', 'activo', '1.2.1', 'Materiales Directos'),
('1.2.1.2', 'activo', '1.2.1', 'Materiales Indirectos'),
('1.2.2.1', 'activo', '1.2.2', 'Botellas de Vino de Naranja'),
('1.2.2.2', 'activo', '1.2.2', 'Botellas de Vino de Mandarina'),
('1.2.2.3', 'activo', '1.2.2', 'Botellas de Vino de Piña'),
('1.2.2.4', 'activo', '1.2.2', 'Botellas de Vino de Marañón'),
('1.2.2.5', 'activo', '1.2.2', 'Botellas de Vino de Coco'),
('1.2.2.6', 'activo', '1.2.2', 'Botellas de Vino de Rosa de Jamaica'),
('4.1.1.1', 'resultado', '4.1.1', 'Mano de Obra Directa'),
('4.1.1.2', 'resultado', '4.1.1', 'Costo de Materias Primas'),
('4.1.2.1', 'resultado', '4.1.2', 'Sueldos y Salarios'),
('4.1.2.2', 'resultado', '4.1.2', 'Prestaciones Laborales'),
('4.1.2.3', 'resultado', '4.1.2', 'Servicios Médicos'),
('4.1.3.1', 'resultado', '4.1.3', 'Luz'),
('4.1.3.2', 'resultado', '4.1.3', 'Teléfono'),
('4.1.3.3', 'resultado', '4.1.3', 'Agua'),
('4.1.3.4', 'resultado', '4.1.3', 'Internet'),
('4.1.4.1', 'resultado', '4.1.4', 'Depreciación de bienes Muebles'),
('4.1.4.2', 'resultado', '4.1.4', 'Depreciación de Maquinaria y equipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_grupos`
--

CREATE TABLE IF NOT EXISTS `catalogo_grupos` (
  `codigo_grupo` varchar(10) NOT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `naturaleza` varchar(15) NOT NULL,
  `nombre_grupo` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_grupo`),
  KEY `clasificacion` (`clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogo_grupos`
--

INSERT INTO `catalogo_grupos` (`codigo_grupo`, `clasificacion`, `naturaleza`, `nombre_grupo`) VALUES
('1.1', 1, 'activo', 'Activo Circulante'),
('1.2', 1, 'activo', 'Inventarios'),
('1.3', 1, 'activo', 'Activo Fijo'),
('1.4', 1, 'activo', 'Depreciación Acumulada'),
('2.1', 2, 'pasivo', 'Cuentas por Pagar'),
('3.1', 3, 'capital', 'Capital Social'),
('4.1', 4, 'resultado', 'Costos'),
('4.2', 4, 'resultado', 'Ingresos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_subcuentas`
--

CREATE TABLE IF NOT EXISTS `catalogo_subcuentas` (
  `codigo_subcuenta` varchar(20) NOT NULL,
  `naturaleza` varchar(20) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `nombre_subcuenta` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_subcuenta`),
  KEY `cuenta` (`cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogo_subcuentas`
--

INSERT INTO `catalogo_subcuentas` (`codigo_subcuenta`, `naturaleza`, `cuenta`, `nombre_subcuenta`) VALUES
('1.2.1.1.1', 'activo', '1.2.1.1', 'Naranja'),
('1.2.1.1.2', 'activo', '1.2.1.1', 'Mandarina'),
('1.2.1.1.3', 'activo', '1.2.1.1', 'Piña'),
('1.2.1.1.4', 'activo', '1.2.1.1', 'Marañón'),
('1.2.1.1.5', 'activo', '1.2.1.1', 'Coco'),
('1.2.1.1.6', 'activo', '1.2.1.1', 'Rosa de Jamaica'),
('1.2.1.2.1', 'activo', '1.2.1.2', 'Azúcar'),
('1.2.1.2.2', 'activo', '1.2.1.2', 'Levadura'),
('1.2.1.2.3', 'activo', '1.2.1.2', 'Cápsulas de Seguridad'),
('1.2.1.2.4', 'activo', '1.2.1.2', 'Etiquetas'),
('1.2.1.2.5', 'activo', '1.2.1.2', 'Cajas'),
('4.1.2.2.1', 'resultado', '4.1.2.2', 'Aguinaldo'),
('4.1.2.2.2', 'resultado', '4.1.2.2', 'Vacaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_subgrupos`
--

CREATE TABLE IF NOT EXISTS `catalogo_subgrupos` (
  `codigo_subgrupo` varchar(20) NOT NULL,
  `naturaleza` varchar(15) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `nombre_subgrupo` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_subgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogo_subgrupos`
--

INSERT INTO `catalogo_subgrupos` (`codigo_subgrupo`, `naturaleza`, `grupo`, `nombre_subgrupo`) VALUES
('1.1.1', 'activo', '1.1', 'Efectivo en Caja'),
('1.2.1', 'activo', '1.2', 'Materia Prima'),
('1.2.2', 'activo', '1.2', 'Producto Terminado'),
('1.3.1', 'activo', '1.3', 'Edificio'),
('1.3.2', 'activo', '1.3', 'Maquinaria'),
('1.3.3', 'activo', '1.3', 'Inventario'),
('1.3.4', 'activo', '1.3', 'Automóviles'),
('2.1.1', 'pasivo', '2.1', 'Proveedores'),
('2.1.2', 'pasivo', '2.1', 'Pasivos a Largo plazo'),
('4.1.1', 'resultado', '4.1', 'Costos de Producción'),
('4.1.2', 'resultado', '4.1', 'Gastos de Administración'),
('4.1.3', 'resultado', '4.1', 'Costos Indirectos'),
('4.1.4', 'resultado', '4.1', 'Depreciación'),
('4.2.1', 'resultado', '4.2', 'Ingresos por Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaciones`
--

CREATE TABLE IF NOT EXISTS `clasificaciones` (
  `codigo_clasificacion` int(11) NOT NULL,
  `nombre_clasificacion` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`codigo_clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `clasificaciones`
--

INSERT INTO `clasificaciones` (`codigo_clasificacion`, `nombre_clasificacion`) VALUES
(1, 'Activo'),
(2, 'Pasivo'),
(3, 'Capital'),
(4, 'Resultado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE IF NOT EXISTS `cuentas` (
  `codigo_cuenta` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `subgrupo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_cuenta` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `tiene_subcuenta` enum('Si','No') COLLATE latin1_general_ci NOT NULL,
  `descripcion_cuenta` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `saldo_debe` double NOT NULL,
  `saldo_haber` double NOT NULL,
  PRIMARY KEY (`codigo_cuenta`),
  KEY `subgrupo` (`subgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`codigo_cuenta`, `subgrupo`, `nombre_cuenta`, `tiene_subcuenta`, `descripcion_cuenta`, `saldo_debe`, `saldo_haber`) VALUES
('1.2.1.1', '1.2.1', 'Materiales Directos', 'Si', NULL, 1600, 0),
('1.2.1.2', '1.2.1', 'Materiales Indirectos', 'Si', NULL, 0, 0),
('1.2.2.1', '1.2.2', 'Botellas de Vino de Naranja', 'No', NULL, 0, 0),
('1.2.2.2', '1.2.2', 'Botellas de Vino de Mandarina', 'No', NULL, 0, 0),
('1.2.2.3', '1.2.2', 'Botellas de Vino de Piña', 'No', NULL, 0, 0),
('1.2.2.4', '1.2.2', 'Botellas de Vino de Marañón', 'No', NULL, 0, 0),
('1.2.2.5', '1.2.2', 'Botellas de Vino de Coco', 'No', NULL, 0, 0),
('1.2.2.6', '1.2.2', 'Botellas de Vino de Rosa de Jamaica', 'No', NULL, 0, 0),
('1.3.5.1', '1.3.5', 'Inversión en Mobiliario y Equipo de Oficina', 'No', 'En este rubro se incluye todo el mobiliario y equipo para la totalidad de las áreas administrativas a considerar para la empresa Vinos Nonualcos y Cia. De C.V.', 0, 0),
('1.3.6.1', '1.3.6', 'Inversión en Obra Civil', 'No', 'Cuenta para registrar las inversiones relacionadas con el trabajo de Obra Civil.', 0, 0),
('4.1.1.1', '4.1.1', 'Mano de Obra Directa', 'No', NULL, 0, 1500),
('4.1.1.2', '4.1.1', 'Costo de Materias Primas', 'No', NULL, 0, 0),
('4.1.2.1', '4.1.2', 'Sueldos y Salarios', 'No', NULL, 0, 0),
('4.1.2.2', '4.1.2', 'Prestaciones Laborales', 'Si', NULL, 0, 0),
('4.1.2.3', '4.1.2', 'Servicios Médicos', 'No', NULL, 0, 0),
('4.1.3.1', '4.1.3', 'Luz', 'No', NULL, 0, 0),
('4.1.3.2', '4.1.3', 'Teléfono', 'No', NULL, 0, 0),
('4.1.3.3', '4.1.3', 'Agua', 'No', NULL, 0, 0),
('4.1.3.4', '4.1.3', 'Internet', 'No', NULL, 0, 0),
('4.1.4.1', '4.1.4', 'Depreciación de bienes Muebles', 'No', NULL, 0, 0),
('4.1.4.2', '4.1.4', 'Depreciación de Maquinaria y Equipo', 'No', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_empleado` varchar(8) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `salario_mensual_contratado` double NOT NULL,
  `isss_trabajador` double DEFAULT NULL,
  `isss_patrono` double DEFAULT NULL,
  `afp_trabajador` double DEFAULT NULL,
  `afp_patrono` double DEFAULT NULL,
  `renta` double DEFAULT NULL,
  `salario_diario` double DEFAULT NULL,
  `vacaciones` double DEFAULT NULL,
  `aguinaldo` double DEFAULT NULL,
  `salario_mensual` double DEFAULT NULL,
  `aportaciones_mensuales_patrono` double DEFAULT NULL,
  `pago_salario_patrono` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_empleado` (`codigo_empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `codigo_empleado`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `cargo`, `salario_mensual_contratado`, `isss_trabajador`, `isss_patrono`, `afp_trabajador`, `afp_patrono`, `renta`, `salario_diario`, `vacaciones`, `aguinaldo`, `salario_mensual`, `aportaciones_mensuales_patrono`, `pago_salario_patrono`) VALUES
(1, 'GG000001', 'Juan', 'José', 'Pérez', 'Martínez', 'Gerente General', 500, 15, 37.5, 31.25, 22.5, 33.81, 16.67, 27.08, 13.89, 460.91, 60, 520.91),
(2, 'CR000001', 'Carlos', 'Alberto', 'Rivas', 'Rodríguez', 'Contador', 400, 12, 30, 25, 18, 23.81, 13.33, 21.67, 11.11, 371.97, 48, 419.97),
(3, 'EC000001', 'María', 'Sandra', 'Romero', 'López', 'Encargado de Comercialización', 300, 9, 22.5, 18.75, 13.5, 13.81, 10, 16.25, 8.33, 283.02, 36, 319.02),
(4, 'EP000001', 'Carmen', 'Alejandra', 'Villalobos', 'Hernández', 'Encargado de Producción', 300, 9, 22.5, 18.75, 13.5, 13.81, 10, 16.25, 8.33, 283.02, 36, 319.02),
(5, 'RR000001', 'Susana', 'Carolina', 'Martínez', 'Romero', 'Recepcionista', 207.78, 6.23, 15.58, 12.99, 9.35, NULL, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52),
(6, 'MM000001', 'Pedro', 'Antonio', 'Monterrosa', 'Vanegas', 'Motorista', 207.78, 6.23, 15.58, 12.99, 9.35, NULL, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52),
(7, 'AX000001', 'Stephanie', 'Emperatriz', 'Cerna', 'Espinosa', 'Auxiliar', 207.78, 6.23, 15.58, 12.99, 9.35, NULL, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `codigo_grupo` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `nombre_grupo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_grupo`),
  KEY `clasificacion` (`clasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`codigo_grupo`, `nombre_grupo`, `descripcion`, `clasificacion`) VALUES
('1.1', 'Activo Circulante', NULL, 1),
('1.2', 'Inventarios', NULL, 1),
('1.3', 'Activo Fijo', NULL, 1),
('1.4', 'Depreciacion Acumulada', NULL, 1),
('2.1', 'Cuentas por Pagar', NULL, 2),
('3.1', 'Capital Social', NULL, 3),
('3.2', 'Capital', 'capital', 3),
('4.1', 'Costos', NULL, 4),
('4.2', 'Ingresos', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE IF NOT EXISTS `iva` (
  `id` int(1) unsigned NOT NULL,
  `iva` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id`, `iva`) VALUES
(1, '0.13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mayor`
--

CREATE TABLE IF NOT EXISTS `mayor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `debe` double NOT NULL,
  `haber` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuenta` (`cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `transaccion` int(11) NOT NULL,
  `tipo` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cuenta` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `concepto` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `debe` decimal(18,2) DEFAULT NULL,
  `haber` decimal(18,2) DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partida_doble` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_creacion` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `usuario_modif` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `fecha`, `transaccion`, `tipo`, `cuenta`, `concepto`, `debe`, `haber`, `descripcion`, `partida_doble`, `fecha_modificacion`, `usuario_creacion`, `usuario_modif`, `ip`) VALUES
(11, '2013-11-28', 1, '', '1.2.1.1.1', 'test', '100.00', '0.00', 'eetert', NULL, NULL, 'administrador', NULL, '127.0.0.1'),
(12, '2013-11-28', 1, 'simple', '1.2.1.1.1', 'test', '1500.00', '0.00', 'test', NULL, NULL, 'administrador', NULL, '127.0.0.1'),
(13, '2013-11-28', 1, 'simple', '4.1.1.1', 'test', '0.00', '1500.00', 'test', NULL, NULL, 'administrador', NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `security_log`
--

CREATE TABLE IF NOT EXISTS `security_log` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `evento` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ip` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `security_log`
--

INSERT INTO `security_log` (`id_evento`, `fecha`, `evento`, `user`, `ip`) VALUES
(1, '2013-11-27 08:24:30', 'Se insertó un nuevo registro en la tabla subcuentas. El valor es: 1.1.1.1.1', 'root@localhost', 'root@localhost'),
(2, '2013-11-27 08:25:06', 'Se insertó un nuevo registro en la tabla subcuentas. El valor es: 1.1.1.1.2', 'root@localhost', 'root@localhost'),
(3, '2013-11-27 08:47:19', 'Se insertó un nuevo registro en la tabla subcuentas. El valor es: 1.1.1.1.1', 'root@localhost', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcuentas`
--

CREATE TABLE IF NOT EXISTS `subcuentas` (
  `codigo_subcuenta` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cuenta` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `nombre_subcuenta` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `saldo_debe` double NOT NULL,
  `saldo_haber` double NOT NULL,
  PRIMARY KEY (`codigo_subcuenta`),
  KEY `cuenta` (`cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `subcuentas`
--

INSERT INTO `subcuentas` (`codigo_subcuenta`, `cuenta`, `nombre_subcuenta`, `descripcion`, `saldo_debe`, `saldo_haber`) VALUES
('1.2.1.1.1', '1.2.1.1', 'Naranja', 'Cuenta para registrar los movimientos del activo "Naranja"', 1600, 0),
('1.2.1.1.2', '1.2.1.1', 'Mandarina', 'Cuenta para registrar los movimientos del activo "Mandarina"', 0, 0),
('1.2.1.1.3', '1.2.1.1', 'Piña', 'Cuenta para registrar los movimientos del activo "Piña"', 0, 0),
('1.2.1.1.4', '1.2.1.1', 'Marañón', 'Cuenta para registrar los movimientos del activo "Marañón"', 0, 0),
('1.2.1.1.5', '1.2.1.1', 'Coco', 'Cuenta para registrar los movimientos del activo "Coco"', 0, 0),
('1.2.1.1.6', '1.2.1.1', 'Rosa de Jamaica', 'Cuenta para registrar los movimientos del activo "Rosa de Jamaica"', 0, 0),
('1.2.1.2.1', '1.2.1.2', 'Azúcar', 'Cuenta para registrar los movimientos del activo "Azucar"', 0, 0),
('1.2.1.2.2', '1.2.1.2', 'Levadura', 'Cuenta para registrar los movimientos del activo "Levadura"', 0, 0),
('1.2.1.2.3', '1.2.1.2', 'Cápsulas de Seguridad', 'Cuenta para registrar los movimientos del activo "Cápsulas de Seguridad"', 0, 0),
('1.2.1.2.4', '1.2.1.2', 'Etiquetas', 'Cuenta para registrar los movimientos del activo "Etiquetas"', 0, 0),
('1.2.1.2.5', '1.2.1.2', 'Cajas', 'Cuenta para registrar los movimientos del activo "Cajas"', 0, 0),
('4.1.2.2.1', '4.1.2.2', 'Aguinaldo', 'Pago equivalente a una quincena de trabajo. El aguinaldo se le dará a un empleado que tenga más de 1 año laborando para la empresa.', 0, 0),
('4.1.2.2.2', '4.1.2.2', 'Vacaciones', 'Pago de las vacaciones del empleado.', 0, 0);

--
-- Disparadores `subcuentas`
--
DROP TRIGGER IF EXISTS `log_insert_subcuentas`;
DELIMITER //
CREATE TRIGGER `log_insert_subcuentas` AFTER INSERT ON `subcuentas`
 FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) 
		VALUES (concat_ws(' ',CURDATE(), curtime()), concat_WS(' ','Se insertó un nuevo registro en la tabla subcuentas. El valor es:',new.codigo_subcuenta), user(), current_user());
    END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subgrupos`
--

CREATE TABLE IF NOT EXISTS `subgrupos` (
  `codigo_subgrupo` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `nombre_subgrupo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `grupo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_subgrupo`),
  KEY `grupo` (`grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `subgrupos`
--

INSERT INTO `subgrupos` (`codigo_subgrupo`, `nombre_subgrupo`, `descripcion`, `grupo`) VALUES
('1.1.1', 'Efectivo en Caja', NULL, '1.1'),
('1.2.1', 'Materia Prima', NULL, '1.2'),
('1.2.2', 'Producto Terminado', NULL, '1.2'),
('1.3.1', 'Edificio', NULL, '1.3'),
('1.3.2', 'Maquinaria', NULL, '1.3'),
('1.3.3', 'Inventario', NULL, '1.3'),
('1.3.4', 'Automóviles', NULL, '1.3'),
('1.3.5', 'Mobiliario y Equipo de Oficina', 'Subgrupo para las cuentas relacionadas al mobiliario y equipo de oficina', '1.3'),
('1.3.6', 'Obra Civil', 'Este rubro se refiere a todas las actividades de construcción de la obra civil, desde la preparación del terreno hasta la infraestructura externa e interna de todas las áreas establecidas como necesarias en la sección de Distribución en planta.', '1.3'),
('2.1.1', 'Proveedores', NULL, '2.1'),
('2.1.2', 'Pasivos a Largo Plazo', NULL, '2.1'),
('3.2.1', 'test', 'test', '3.2'),
('4.1.1', 'Costos de Producción', NULL, '4.1'),
('4.1.2', 'Gastos de Administración', NULL, '4.1'),
('4.1.3', 'Costos Indirectos', NULL, '4.1'),
('4.1.4', 'Depreciación', NULL, '4.1'),
('4.2.1', 'Ingresos por Venta', NULL, '4.2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`, `fecha`, `tipo`) VALUES
('administrador', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2013-01-10', 'administrador'),
('alex', '60c6d277a8bd81de7fdde19201bf9c58a3df08f4', '2011-08-01', 'estandar'),
('jose', '4a3487e57d90e2084654b6d23937e75af5c8ee55', '2013-11-17', 'administrador'),
('juan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2013-11-17', 'estandar'),
('pedro', '4410d99cefe57ec2c2cdbd3f1d5cf862bb4fb6f8', '2013-11-22', 'estandar');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_subcuentas`
--
CREATE TABLE IF NOT EXISTS `ver_subcuentas` (
`codigo_clasificacion` int(11)
,`codigo_grupo` varchar(10)
,`codigo_subgrupo` varchar(20)
,`codigo_cuenta` varchar(20)
,`codigo_subcuenta` varchar(20)
,`naturaleza` varchar(20)
,`nombre_subcuenta` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `ver_subcuentas`
--
DROP TABLE IF EXISTS `ver_subcuentas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_subcuentas` AS (select `a`.`codigo_clasificacion` AS `codigo_clasificacion`,`b`.`codigo_grupo` AS `codigo_grupo`,`c`.`codigo_subgrupo` AS `codigo_subgrupo`,`d`.`codigo_cuenta` AS `codigo_cuenta`,`e`.`codigo_subcuenta` AS `codigo_subcuenta`,`e`.`naturaleza` AS `naturaleza`,`e`.`nombre_subcuenta` AS `nombre_subcuenta` from ((((`clasificaciones` `a` join `catalogo_grupos` `b`) join `catalogo_subgrupos` `c`) join `catalogo_cuentas` `d`) join `catalogo_subcuentas` `e`) where ((`e`.`cuenta` = `d`.`codigo_cuenta`) and (`d`.`subgrupo` = `c`.`codigo_subgrupo`) and (`c`.`grupo` = `b`.`codigo_grupo`) and (`b`.`clasificacion` = `a`.`codigo_clasificacion`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo_cuentas`
--
ALTER TABLE `catalogo_cuentas`
  ADD CONSTRAINT `catalogo_cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `catalogo_subgrupos` (`codigo_subgrupo`);

--
-- Filtros para la tabla `catalogo_grupos`
--
ALTER TABLE `catalogo_grupos`
  ADD CONSTRAINT `catalogo_grupos_ibfk_1` FOREIGN KEY (`clasificacion`) REFERENCES `catalogo_clasificaciones` (`codigo_clasificacion`);

--
-- Filtros para la tabla `catalogo_subcuentas`
--
ALTER TABLE `catalogo_subcuentas`
  ADD CONSTRAINT `catalogo_subcuentas_ibfk_1` FOREIGN KEY (`cuenta`) REFERENCES `catalogo_cuentas` (`codigo_cuenta`);

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `subgrupos` (`codigo_subgrupo`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`clasificacion`) REFERENCES `clasificaciones` (`codigo_clasificacion`);

--
-- Filtros para la tabla `subcuentas`
--
ALTER TABLE `subcuentas`
  ADD CONSTRAINT `subcuentas_ibfk_1` FOREIGN KEY (`cuenta`) REFERENCES `cuentas` (`codigo_cuenta`);

--
-- Filtros para la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  ADD CONSTRAINT `subgrupos_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`codigo_grupo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
