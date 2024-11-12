-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: wktechnology
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal do cliente.',
  `NOME` varchar(50) DEFAULT NULL COMMENT 'Nome completo do cliente.',
  `CIDADE` varchar(50) DEFAULT NULL COMMENT 'Cidade onde o cliente reside.',
  `UF` char(2) DEFAULT NULL COMMENT 'Estado (UF) onde o cliente reside.',
  PRIMARY KEY (`CODIGO`),
  KEY `IDX_CIDADE` (`CIDADE`),
  KEY `IDX_UF` (`UF`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para armazenar dados dos clientes, incluindo identificação única, nome, cidade e estado.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Oliveira','Rio Branco','AC'),(2,'Bruno Santos','Maceió','AL'),(3,'Carlos Almeida','Macapá','AP'),(4,'Daniela Fernandes','Manaus','AM'),(5,'Eduardo Pereira','Salvador','BA'),(6,'Fernanda Silva','Fortaleza','CE'),(7,'Gabriel Costa','Brasília','DF'),(8,'Helena Castro','Vitória','ES'),(9,'Igor Mendes','Goiânia','GO'),(10,'Juliana Ribeiro','São Luís','MA'),(11,'Lucas Martins','Cuiabá','MT'),(12,'Mariana Carvalho','Campo Grande','MS'),(13,'Nicolas Rocha','Belo Horizonte','MG'),(14,'Olivia Lima','Belém','PA'),(15,'Paulo Andrade','João Pessoa','PB'),(16,'Quintino Nogueira','Curitiba','PR'),(17,'Renata Teixeira','Recife','PE'),(18,'Samuel Barbosa','Teresina','PI'),(19,'Tatiana Moreira','Rio de Janeiro','RJ'),(20,'Ulysses Ferreira','Natal','RN'),(21,'Vanessa Cardoso','Porto Alegre','RS'),(22,'Wesley Souza','Porto Velho','RO'),(23,'Xavier Campos','Boa Vista','RR'),(24,'Yara Oliveira','Florianópolis','SC'),(25,'Zilda Freitas','São Paulo','SP'),(26,'Arthur Vieira','Aracaju','SE'),(27,'Beatriz Azevedo','Palmas','TO');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `NUMERO_PEDIDO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número único do pedido, usado como identificador principal.',
  `DATA_EMISSAO` datetime DEFAULT NULL COMMENT 'Data e hora em que o pedido foi emitido.',
  `CODIGO_CLIENTE` int(11) DEFAULT NULL COMMENT 'Código do cliente que realizou o pedido, referenciado na tabela CLIENTES.',
  `VALOR_TOTAL` decimal(16,2) DEFAULT NULL COMMENT 'Valor total do pedido em reais, com duas casas decimais.',
  PRIMARY KEY (`NUMERO_PEDIDO`),
  KEY `CODIGO_CLIENTE` (`CODIGO_CLIENTE`),
  KEY `IDX_DATA_EMISSAO` (`DATA_EMISSAO`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`CODIGO_CLIENTE`) REFERENCES `clientes` (`CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para armazenar dados dos pedidos realizados, incluindo data de emissão, cliente e valor total.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-11-11 23:50:29',1,166.00),(2,'2024-11-11 23:51:19',2,929.40),(3,'2024-11-11 23:51:34',20,1229.40),(4,'2024-11-11 23:51:58',4,327.60);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_produtos` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal da entrada na tabela de itens do pedido.',
  `NUMERO_PEDIDO` int(11) NOT NULL COMMENT 'Número do pedido ao qual este item pertence, referenciado na tabela PEDIDOS.',
  `CODIGO_PRODUTO` int(11) DEFAULT NULL COMMENT 'Código do produto neste pedido, referenciado na tabela PRODUTOS.',
  `QUANTIDADE` int(11) DEFAULT NULL COMMENT 'Quantidade do produto solicitada neste pedido.',
  `VALOR_UNITARIO` decimal(16,2) DEFAULT NULL COMMENT 'Valor unitário do produto no pedido, armazenado com quatro casas decimais.',
  `VALOR_TOTAL` decimal(16,2) DEFAULT NULL COMMENT 'Valor total do item (quantidade x valor unitário) no pedido, com duas casas decimais.',
  PRIMARY KEY (`CODIGO`),
  KEY `CODIGO_PRODUTO` (`CODIGO_PRODUTO`),
  KEY `IDX_PEDIDO_PRODUTO` (`NUMERO_PEDIDO`,`CODIGO_PRODUTO`),
  CONSTRAINT `pedidos_produtos_ibfk_1` FOREIGN KEY (`NUMERO_PEDIDO`) REFERENCES `pedidos` (`NUMERO_PEDIDO`),
  CONSTRAINT `pedidos_produtos_ibfk_2` FOREIGN KEY (`CODIGO_PRODUTO`) REFERENCES `produtos` (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela de itens dos pedidos, associando produtos aos pedidos com quantidade e valores unitário e total.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
INSERT INTO `pedidos_produtos` VALUES (1,1,10,20,6.00,166.00),(2,1,11,23,2.00,166.00),(3,2,20,12,0.80,929.40),(4,2,25,21,35.00,929.40),(5,2,36,21,8.80,929.40),(6,3,21,20,15.00,1229.40),(7,4,21,20,15.00,327.60),(8,4,28,23,1.20,327.60);
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal do produto.',
  `DESCRICAO` varchar(100) DEFAULT NULL COMMENT 'Descrição detalhada do produto.',
  `PRECO` decimal(10,2) DEFAULT NULL COMMENT 'Preço do produto, armazenado com duas casas decimais.',
  PRIMARY KEY (`CODIGO`),
  KEY `IDX_PRECO` (`PRECO`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para armazenar informações dos produtos, incluindo descrição e preço.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Caderno Universitário',12.50),(2,'Bloco de Desenho',8.00),(3,'Canetinha',4.00),(4,'Marcador Permanente',5.50),(5,'Estojo',15.00),(6,'Borracha Branca',1.00),(7,'Apontador com Depósito',2.50),(8,'Pasta A4',3.00),(9,'Grampeador de Mesa',20.00),(10,'Fita Corretiva',6.00),(11,'Caneta Esferográfica',2.00),(12,'Caderno de Notas',10.00),(13,'Lápis Preto',1.50),(14,'Tesoura Escolar',7.50),(15,'Regua Plástica',2.80),(16,'Caderno de Desenho',14.00),(17,'Fita Adesiva',4.50),(18,'Carimbo Personalizado',8.50),(19,'Post-it',5.00),(20,'Agulha de Costura',0.80),(21,'Papel Sulfite',15.00),(22,'Tinta para Carimbo',3.50),(23,'Caneta Marca Texto',3.00),(24,'Envelope Para Documentos',2.20),(25,'Carpete para Escritório',35.00),(26,'Papel Vegetal',6.00),(27,'Etiquetas Adesivas',7.00),(28,'Borracha Colorida',1.20),(29,'Pasta de Arquivo',9.00),(30,'Papel Cartão',5.80),(31,'Clips para Papel',1.30),(32,'Caixa Organizadora',13.50),(33,'Porta Lápis',4.00),(34,'Bloco de Notas Personalizado',10.50),(35,'Calendário de Mesa',7.20),(36,'Saca Rolhas',8.80),(37,'Fita Métrica',9.90),(38,'Caneta Roller',2.40),(39,'Papel Crepom',3.60),(40,'Pasta Suspensa',11.00),(41,'Caderno Espiral',6.70),(42,'Calendário Perpétuo',6.90),(43,'Carpete de Borracha',25.00),(44,'Caixa de Papelão',2.30),(45,'Papel Vegetal A4',12.00),(46,'Tinta Acrílica',9.50),(47,'Bolsa de Couro',75.00),(48,'Agenda de Couro',20.00),(49,'Papel Reciclado',7.50),(50,'Marcador de Quadro Branco',4.20),(51,'Borracha em Pó',1.80),(52,'Bloco de Anotações',3.40),(53,'Luminária LED',18.00),(54,'Régua de Acrílico',4.80);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wktechnology'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12  0:18:53
