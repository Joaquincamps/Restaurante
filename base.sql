-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2023 a las 19:05:26
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(8, 'bebidas'),
(9, 'cafes/infusiones'),
(4, 'carne'),
(2, 'ensaladas'),
(1, 'entrantes'),
(11, 'helados'),
(3, 'pasta/arroces'),
(5, 'pescado'),
(7, 'postres'),
(10, 'refrescos'),
(12, 'Sopas'),
(6, 'verduras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_carta`
--

CREATE TABLE IF NOT EXISTS `pedidos_carta` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `mesa` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plato` int(11) NOT NULL,
  `cobrado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `pedidos_carta`
--

INSERT INTO `pedidos_carta` (`id_pedido`, `mesa`, `fecha`, `plato`, `cobrado`) VALUES
(1, 2, '2023-06-05', 12, NULL),
(2, 2, '2023-06-05', 30, NULL),
(3, 2, '2023-06-05', 50, NULL),
(4, 2, '2023-06-05', 22, NULL),
(5, 2, '2023-06-05', 46, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE IF NOT EXISTS `plato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `ingredientes` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=56 ;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`id`, `nombre`, `categoria_id`, `ingredientes`, `precio`) VALUES
(1, 'Lazos con verduras ', 3, 'pasta corta seca\r\nespárragos verdes\r\ncebolla blanca\r\nguisantes\r\ncalabacín\r\norégano', '3.53'),
(2, 'Ensalada de endivias y ventresca', 2, 'endivias\r\nventresca de atún\r\ncebollino\r\nvinagre balsámico\r\nsalsa worcestershire', '4.41'),
(3, 'Merluza en salsa', 5, 'merluza\r\npatatas\r\nzanahorias\r\ntomates\r\ncebolla\r\npimientos de colores\r\n', '5.99'),
(4, 'Solomillo de cerdo con salsa de cerezas', 4, 'solomillo de cerdo\r\nnaranja\r\nlimón\r\ncerezas\r\nmiel\r\nwhisky', '4.98'),
(5, 'Sopa de pollo con garbanzos', 12, 'pechuga de pollo\r\njenjibre\r\ncúrcuma\r\npimiento rojo\r\ncebolla\r\nzanahorias\r\ngarbanzos\r\npergegil', '2.90'),
(6, 'Gazpacho de cerezas', 12, 'tomate pera\r\nanchoas\r\ncerezas\r\nvinagre de frambuesa\r\npepino\r\najo\r\npimiento verde\r\npan', '3.47'),
(7, 'Zanahorias aliñadas', 6, 'zanahorias\r\ncomino\r\npimentón picante\r\norégano\r\najo\r\nsal gruesa\r\nvinagre de manzana\r\n', '3.34'),
(8, 'Atún encebollado', 5, 'ventresca de atún\r\ncebolla\r\nvino de jerez\r\n', '7.50'),
(9, 'Revuelto de setas', 6, 'setas de temporada\r\nhuevo\r\nyemas de huevo\r\nperegil\r\najo', '4.60'),
(10, 'Pollo a la Marengo', 4, 'muslos de pollo\r\ntomates\r\nchampiñones\r\ncebolla\r\ncoñac\r\najo\r\nvino blanco\r\nlaurel\r\npicatostes de pan', '7.12'),
(11, 'Pizza dipper', 3, 'beicón\r\ncarne picada\r\nqueso cream\r\nmozzarella\r\nricotta\r\norégano\r\nalbahaca\r\najo molido', '4.98'),
(12, 'Ensalada de gambas, mango y aguacate', 2, 'gambas\r\nmango\r\naguacate\r\nvinagre de jerez\r\nmostaza de Dijon', '4.73'),
(13, 'Lomo de cerdo al horno', 4, 'lomo de cerdo\r\nvinagre\r\npimienta negra\r\npimento dulce\r\ncomino\r\ntomillo\r\nvino blanco\r\nzumo de naranja', '7.12'),
(14, 'Judías verdes con jamón', 6, 'judías verdes\r\njamón ibérico\r\nbrandy\r\nvino de jerez', '3.77'),
(15, 'Fideuá negra de langostinos', 3, 'fideo cabellín\r\nmejillones\r\nlangostinos\r\nchipirón\r\ntomate\r\najo\r\npimiento verde', '9.45'),
(16, 'Mousse de calabacín', 6, 'calabacín\r\ncebolla\r\nhuevo\r\n', '5.67'),
(17, 'Hummus', 1, 'garbanzo\r\nbrócoli\r\najo\r\ntahini\r\nzumo de limón\r\ncomino molido', '5.99'),
(18, 'Tostas de albaricoque asados', 1, 'albaricoque\r\najo\r\nsal\r\nromero\r\ntomillo\r\npimienta negra\r\norégano\r\nqueso de cabra\r\npan\r\nalbahaca', '5.67'),
(19, 'Jerky de tofu', 1, 'tofu\r\ntomate\r\nadobo de chipotle\r\nmiel\r\nsalsa de soja\r\npimentón dulce\r\ncomino', '4.98'),
(20, 'Brownie sin gluten', 7, 'mantequilla\r\nazúcar moreno\r\nazúcar blanco\r\nhuevos\r\nvainilla\r\nharina sin gluten\r\ncacao en polvo\r\nsal', '4.41'),
(21, 'Tarta de chocolate blanco y queso', 7, 'chocolate blanco\r\nqueso crema\r\nhuevo', '5.67'),
(22, 'Tarta de frambuesa', 7, 'cobertura de chocolate de frambuesa\r\ngelatina\r\nnata líquida\r\nmantequilla\r\nazúcar glas\r\nalmendra molida\r\nhuevo\r\nharina de trigo\r\navellanas\r\nframbuesas\r\nsalvia', '7.06'),
(23, 'Cremoso de marcarpone y cerezas', 7, 'cerezas\r\nqueso mascarpone\r\nnata líquida\r\nyema de huevo\r\nazúcar\r\ngelatina', '5.67'),
(24, 'Puré de calabacín', 12, 'calabacín\r\npatata\r\ncebolla\r\nnata', '2.84'),
(25, 'Albóndigas de pollo', 4, 'pechuga de pollo\r\najo\r\npuerro\r\ncebolla\r\ncalabacín\r\nzanahoria\r\ntomillo\r\nhuevo', '4.47'),
(26, 'Lentejas vegetales', 6, 'lentejas\r\nzanahoria\r\najo\r\npuerro\r\npimiento verde\r\npatatas\r\ncebolla\r\nlaurel\r\ntomates', '3.34'),
(27, 'Macarrones con verduras', 3, 'penne integral Garofalo\r\nzanahorias\r\nberenjena\r\ncebolla\r\npimiento rojo\r\ndiente de ajo\r\nsalsa de tomate', '3.65'),
(28, 'Pollo a la cerveza', 4, 'pollo troceados para guisar\r\ncebolla\r\ncebolleta\r\npimiento rojo grande\r\npimientos verdes tipo italiano\r\ndientes de ajo\r\nzanahorias\r\nhojas de laurel\r\ncerveza Cruzcampo Gran Reserva\r\nPlantas aromáticas (opcional): Perejil, albahaca, tomillo, romero...', '4.35'),
(29, 'Ternera estofada', 4, 'carne de ternera de aguja\r\nzanahorias\r\ncebolla grande\r\najo\r\nvino blanco\r\nAgua\r\nSal y pimienta negra recién molida (al gusto de cada casa)\r\nTomillo seco\r\nAceite de oliva virgen extra', '5.67'),
(30, 'Marmitaco de salmón', 5, 'salmón\r\npatatas medianas\r\npimiento verde\r\ncebolla grande\r\najo\r\npimiento choricero seco\r\nlaurel\r\nperejil\r\npuerro pequeño\r\nSal (al gusto)\r\nAceite de oliva virgen extra', '7.37'),
(31, 'Berenjenas rellenas', 6, 'carne picada de cerdo\r\nberenjenas\r\ncebolla\r\nzanahoria\r\najo\r\njamón serrano\r\nnata liquida\r\nqueso rallado para gratinar.\r\nnuez moscada\r\n', '3.72'),
(32, 'Paella de pollo', 3, 'pollo\r\narroz bomba\r\njudías\r\npimiento rojo\r\npimiento verde\r\ncebolla\r\nzanahoria\r\najo\r\nsalsa tomate\r\ncarne pimiento choricero\r\nazafrán\r\nlaurel\r\ntomillo', '8.25'),
(33, 'Menestra de verduras', 6, 'patata\r\ncebolla\r\nzanahorias\r\njudías verdes\r\nguisantes\r\ncoliflor\r\njamón serrano en taquitos', '4.41'),
(34, 'Sopa juliana', 12, 'tomate\r\najo\r\npimentón dulce\r\ncebolla\r\nzanahorias\r\napio\r\nnabo\r\npuerro\r\nrepollo\r\nnuez moscada\r\nperejil picado\r\ncilantro', '3.21'),
(35, 'Corvina al ajillo', 5, 'corvina\r\nHarina de trigo\r\nManzanilla\r\najo\r\n', '8.19'),
(36, 'Pisto de verduras', 6, 'tomates maduros\r\ncebolla\r\npimiento rojo\r\npimiento verde\r\ncalabacín\r\najo\r\nvino blanco', '3.59'),
(37, 'Crema de puerros', 12, 'puerros\r\npatatas\r\njamón serrano\r\ncebolla', '2.96'),
(38, 'Conejo quisado', 4, 'conejo\r\najo\r\nvino blanco\r\ntomillo fresco', '4.73'),
(39, 'Pizza Napolitana', 3, 'Queso mozarrella\r\nTomates\r\nAlbahaca fresca', '4.10'),
(42, 'Tarta helada de fresas', 11, '', '3.15'),
(43, 'Tarta helada de whisky', 11, '', '3.15'),
(44, 'Banana split', 11, '', '3.53'),
(45, 'Helado sabores', 11, '', '2.52'),
(46, 'Café', 9, '', '0.90'),
(47, 'capuchino', 9, '', '1.20'),
(48, 'infusiones', 9, '', '0.80'),
(49, 'vino', 8, '', '1.50'),
(50, 'cerveza', 8, '', '0.75'),
(51, 'bebidas con alchohol', 8, '', '2.50'),
(52, 'coca-cola', 10, '', '0.90'),
(53, 'fanta', 10, '', '0.75'),
(54, 'nestea', 10, '', '0.75'),
(55, 'aquarius', 10, '', '0.80');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
