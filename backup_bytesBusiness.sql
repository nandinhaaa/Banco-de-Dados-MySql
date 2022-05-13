-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.19 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bytesbusiness_2022
DROP DATABASE IF EXISTS `bytesbusiness_2022`;
CREATE DATABASE IF NOT EXISTS `bytesbusiness_2022` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bytesbusiness_2022`;

-- Copiando estrutura para tabela bytesbusiness_2022.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoCategoria` varchar(200) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.categoria: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `descricaoCategoria`) VALUES
	(1, 'Camisetas de Time'),
	(2, 'Bolas'),
	(3, 'Shorts'),
	(5, 'Medalhas'),
	(6, 'Tênis'),
	(7, 'Bermudas'),
	(8, 'Garrafas'),
	(9, 'Skates'),
	(10, 'Acessórios');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela bytesbusiness_2022.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `cpf`) VALUES
	(1, 'Joaquim Silva', '014.777.188-96'),
	(3, 'Renata Mendes', '444.888.478-78'),
	(5, 'Karla Leite', '999.874.145-88');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela bytesbusiness_2022.fornecedor
DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `codFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeFornecedor` varchar(200) NOT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT 'Centro',
  `cidade` varchar(100) DEFAULT 'Machado',
  `estado` char(2) DEFAULT 'MG',
  `telefone` varchar(200) NOT NULL,
  PRIMARY KEY (`codFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.fornecedor: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`codFornecedor`, `nomeFornecedor`, `endereco`, `bairro`, `cidade`, `estado`, `telefone`) VALUES
	(3, 'Camargo Medalhas', 'Travessa das Palmeiras, 88', 'Centro', 'Machado', 'MG', '(35)3295-7166'),
	(4, 'Kalenji', 'Rua dos Ipês, 23', 'Jardim das Oliveiras', 'Machado', 'MG', '(35)3295-1422'),
	(5, 'Medalhas Triunfo', 'Praça Ana Margarida, ', 'Centro', 'Alfenas', 'MG', '(35)3292-1214'),
	(6, 'Adidas', 'Avenida Santa Paula, 58', 'Jardim Aeroporto', 'Alfenas', 'MG', '(35)3292-1212'),
	(7, 'Nike', NULL, '', 'Machado', 'MG', '(35)3295-7878'),
	(8, 'Mizuno', NULL, 'Centro', 'São Paulo', 'SP', '(11)98844-7878'),
	(9, 'Asics', NULL, 'Centro', 'São Paulo', 'MG', '(11)94512-7312');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Copiando estrutura para procedure bytesbusiness_2022.inserirCategoria
DROP PROCEDURE IF EXISTS `inserirCategoria`;
DELIMITER //
CREATE PROCEDURE `inserirCategoria`(in descricao varchar(200))
BEGIN
	insert into categoria values (null, descricao);
END//
DELIMITER ;

-- Copiando estrutura para tabela bytesbusiness_2022.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `codVenda` int(11) NOT NULL,
  `codProduto` int(11) NOT NULL,
  `quantVenda` decimal(10,2) NOT NULL,
  KEY `codVenda` (`codVenda`),
  KEY `codProduto` (`codProduto`),
  CONSTRAINT `FK_itemvenda_produto` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`),
  CONSTRAINT `FK_itemvenda_venda` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.itemvenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela bytesbusiness_2022.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(150) DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL,
  `estoque` decimal(10,2) DEFAULT NULL,
  `codCategoria` int(11) DEFAULT NULL,
  `codFornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`codProduto`),
  KEY `codCategoria` (`codCategoria`),
  KEY `codFornecedor` (`codFornecedor`),
  CONSTRAINT `FK_produto_categoria` FOREIGN KEY (`codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `FK_produto_fornecedor` FOREIGN KEY (`codFornecedor`) REFERENCES `fornecedor` (`codFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.produto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `nomeProduto`, `precoUnitario`, `estoque`, `codCategoria`, `codFornecedor`) VALUES
	(1, 'Medalha ABC', 60.50, 25.00, 5, 5),
	(2, 'Medalha XYZ', 44.00, 50.00, 5, 3),
	(5, 'Tênis Coreracer Masculino', 169.99, 12.00, 6, 6),
	(6, 'Bermuda Monster Mesh 5.0', 79.80, 10.00, 7, 7);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela bytesbusiness_2022.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataEntrega` datetime NOT NULL,
  `dataPagamento` datetime NOT NULL,
  `dataVenda` datetime NOT NULL,
  `codCliente` int(11) NOT NULL,
  PRIMARY KEY (`codVenda`),
  KEY `codCliente` (`codCliente`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bytesbusiness_2022.venda: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `dataEntrega`, `dataPagamento`, `dataVenda`, `codCliente`) VALUES
	(1, '2021-11-09 10:00:00', '2021-11-08 19:53:05', '2021-11-08 19:53:31', 1),
	(2, '2021-12-07 19:54:37', '2021-12-07 19:54:38', '2021-12-07 19:54:40', 5),
	(3, '2021-12-08 19:55:06', '2021-12-08 19:55:07', '2021-12-08 19:55:08', 3);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
