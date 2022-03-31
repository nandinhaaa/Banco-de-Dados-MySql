-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.35-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para agenciabancaria3si30março
CREATE DATABASE IF NOT EXISTS `agenciabancaria3si30março` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agenciabancaria3si30março`;

-- Copiando estrutura para tabela agenciabancaria3si30março.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agenciabancaria3si30março.cliente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'Maria Fernanda', '123.456.789-10', 'MG 10.955.711', '1980-03-18', NULL),
	(2, 'Deyvison Nogueira', '125.546.878-45', NULL, '1992-11-10', '(35)99878-5412'),
	(3, 'André Luis', '125.874.875-98', NULL, '1999-03-14', '(35)99838-0741'),
	(4, 'Dayane Núbia', '241.878.584-98', NULL, '2002-02-15', NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela agenciabancaria3si30março.conta
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float NOT NULL,
  `senha` varchar(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agenciabancaria3si30março.conta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(1, 'Salário', 1200.5, '12345678'),
	(2, 'Corrente', 1850, '1234567'),
	(3, 'Poupança', 5460.52, '123456'),
	(4, 'Salário', 2000.5, '1234');
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;

-- Copiando estrutura para tabela agenciabancaria3si30março.contasvinculadas
CREATE TABLE IF NOT EXISTS `contasvinculadas` (
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  `CONTA_idCONTA` int(11) NOT NULL,
  `dataAbertura` date NOT NULL,
  PRIMARY KEY (`CLIENTE_idCLIENTE`,`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CONTA1_idx` (`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CLIENTE_idx` (`CLIENTE_idCLIENTE`),
  CONSTRAINT `fk_CLIENTE_has_CONTA_CLIENTE` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_CONTA_CONTA1` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agenciabancaria3si30março.contasvinculadas: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `contasvinculadas` DISABLE KEYS */;
INSERT INTO `contasvinculadas` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(1, 1, '2022-03-30'),
	(2, 1, '2022-03-30'),
	(3, 2, '2022-03-30'),
	(4, 4, '2022-03-30');
/*!40000 ALTER TABLE `contasvinculadas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
