-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: formativahogwarts
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor_livro`
--

DROP TABLE IF EXISTS `autor_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_livro` (
  `idLivro_FK` bigint NOT NULL,
  `idAutor_FK` bigint NOT NULL,
  KEY `idLivro_FK` (`idLivro_FK`),
  KEY `idAutor_FK` (`idAutor_FK`),
  CONSTRAINT `autor_livro_ibfk_1` FOREIGN KEY (`idLivro_FK`) REFERENCES `livros` (`idLivro`),
  CONSTRAINT `autor_livro_ibfk_2` FOREIGN KEY (`idAutor_FK`) REFERENCES `autores` (`idAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_livro`
--

LOCK TABLES `autor_livro` WRITE;
/*!40000 ALTER TABLE `autor_livro` DISABLE KEYS */;
INSERT INTO `autor_livro` VALUES (1,2),(2,2),(3,3),(4,4),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `autor_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `idAutor` bigint NOT NULL AUTO_INCREMENT,
  `nomeAutor` varchar(150) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Claidsson Silva'),(2,'Postgree Dias'),(3,'MongoDB Alves'),(4,'MariaDB Costa');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventoFk` bigint NOT NULL,
  `usuarioFk` bigint NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eventoFk` (`eventoFk`),
  KEY `usuarioFk` (`usuarioFk`),
  CONSTRAINT `checkIn_ibfk_1` FOREIGN KEY (`eventoFk`) REFERENCES `eventos` (`id`),
  CONSTRAINT `checkIn_ibfk_2` FOREIGN KEY (`usuarioFk`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES (1,1,1,'2023-05-23 00:21:13'),(2,1,2,'2023-05-23 00:21:13'),(3,1,5,'2023-05-23 00:21:13'),(4,2,2,'2023-05-23 00:21:13'),(5,2,4,'2023-05-23 00:21:13'),(6,2,5,'2023-05-23 00:21:13'),(7,2,6,'2023-05-23 00:21:13'),(8,3,1,'2023-05-23 00:21:13'),(9,3,6,'2023-05-23 00:21:13'),(10,4,3,'2023-05-23 00:21:13'),(11,4,4,'2023-05-23 00:21:13'),(12,4,5,'2023-05-23 00:21:13'),(13,1,5,'2023-05-23 01:40:58'),(14,1,6,'2023-05-23 01:40:58');
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `localFk` bigint NOT NULL,
  `itemFk` bigint NOT NULL,
  `qtd` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  KEY `itemFk` (`itemFk`),
  CONSTRAINT `checkList_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`),
  CONSTRAINT `checkList_ibfk_2` FOREIGN KEY (`itemFk`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,1,1),(2,1,2,1),(3,1,5,1),(4,2,1,1),(5,2,5,1),(6,3,3,1),(7,3,2,1),(8,4,1,1),(9,4,2,1),(10,4,3,1),(11,4,5,1);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `idEdi` bigint NOT NULL AUTO_INCREMENT,
  `nomeEdi` varchar(150) NOT NULL,
  `UF` enum('RO','AC','AM','RR','PA','AP','TO','MA','PI','CE','RN','PB','PE','AL','SE','BA','MG','ES','RJ','SP','PR','SC','RS','MS','MT','GO','DF') NOT NULL,
  PRIMARY KEY (`idEdi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Phyton Productions','SP'),(2,'Java Evo','ES'),(3,'R Int','RJ'),(4,'SQL Live','MG');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idLivro_FK` bigint NOT NULL,
  `idUser_FK` bigint NOT NULL,
  `idResp_FK` bigint NOT NULL,
  `dataInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataPrevisao` date NOT NULL,
  `dataDevol` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idLivro_FK` (`idLivro_FK`),
  KEY `idUser_FK` (`idUser_FK`),
  CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`idLivro_FK`) REFERENCES `livros` (`idLivro`),
  CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`idUser_FK`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (7,1,2,5,'2023-06-01 21:06:11','2023-06-30',NULL),(8,1,6,5,'2023-06-12 12:06:11','2023-07-12',NULL),(9,1,3,5,'2023-06-12 12:06:11','2023-07-12',NULL),(10,2,6,5,'2023-04-12 12:06:11','2023-05-12',NULL),(11,2,4,5,'2023-03-01 12:06:11','2023-04-01',NULL),(12,2,1,5,'2023-06-01 12:06:11','2023-06-15',NULL),(13,3,2,5,'2023-01-01 21:06:11','2023-06-30','2023-03-01 21:06:11'),(14,3,6,5,'2023-06-12 12:06:11','2023-07-12','2023-07-01 21:06:11'),(15,4,3,5,'2023-06-12 12:06:11','2023-07-12','2023-06-13 21:06:11'),(16,4,6,5,'2023-04-12 12:06:11','2023-05-12','2023-06-01 21:06:11'),(17,1,4,5,'2023-03-01 12:06:11','2023-04-01','2023-06-14 21:06:11'),(18,2,1,5,'2023-06-01 12:06:11','2023-06-15','2023-06-14 21:06:11');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `localFk` bigint NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `inicioCheckIn` datetime NOT NULL,
  `fimCheckIn` datetime NOT NULL,
  `vagas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Workshop Cloud Básico',5,'2023-07-07 18:45:00','2023-07-07 23:10:00','2023-06-07 18:45:00','2023-07-07 18:45:00',32),(2,'Desenho Técnico SolidWorks',5,'2023-08-01 18:45:00','2023-08-02 23:10:00','2023-06-08 18:45:00','2023-08-01 18:45:00',32),(3,'Ensaios Mecânicos Avançados',4,'2023-12-01 18:45:00','2023-12-02 23:10:00','2023-12-08 18:45:00','2023-12-01 18:45:00',30),(4,'Conquistando o primeiro milhão',2,'2023-12-12 18:45:00','2023-12-12 23:10:00','2023-12-12 18:45:00','2023-12-12 18:45:00',100),(5,'Como fazer ovo de pascoa',1,'2023-01-01 18:45:00','2023-01-01 23:10:00','2023-01-01 18:45:00','2023-01-01 18:45:00',16);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `link` varchar(300) NOT NULL,
  `tarefaStatusFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tarefaStatusFK` (`tarefaStatusFK`),
  CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`tarefaStatusFK`) REFERENCES `tarefastatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Projetor'),(2,'Ar condicionado'),(3,'Lousa digital'),(4,'Home Theater'),(5,'Ipad'),(6,'Ferro de Solda');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `idLivro` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `dataPubli` date NOT NULL,
  `edition` varchar(50) NOT NULL,
  `editora_FK` bigint NOT NULL,
  PRIMARY KEY (`idLivro`),
  KEY `editora_FK` (`editora_FK`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`editora_FK`) REFERENCES `editora` (`idEdi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'Lógica para programação','2008-08-12','2',1),(2,'Desenvolvimento real de códigos','2020-04-12','2',2),(3,'Manuel de analise de dados','2019-10-08','1',3),(4,'Introdução a banco de dados','2015-09-08','2',4),(5,'Orgulho e Preconceito','2008-08-12','1',4),(6,'Dom Casmurro','2020-04-12','1',4),(7,'A Culpa É Das Estrelas','2019-10-08','1',4);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `bloco` enum('A','B','C','D') NOT NULL,
  `lotacao` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'Laboratório Eletrônica 01','A',16),(2,'Auditório','C',100),(3,'Laboratório Eletrônica 02','B',16),(4,'Laboratório Mecânica 01','A',30),(5,'Laboratório Informática 01','D',32);
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelacesso`
--

DROP TABLE IF EXISTS `nivelacesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelacesso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nivel` varchar(100) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelacesso`
--

LOCK TABLES `nivelacesso` WRITE;
/*!40000 ALTER TABLE `nivelacesso` DISABLE KEYS */;
INSERT INTO `nivelacesso` VALUES (1,'Admin','blablá'),(2,'Gestor','blablá'),(3,'Usuário','blablá'),(4,'Visitante','blablá');
/*!40000 ALTER TABLE `nivelacesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacao`
--

DROP TABLE IF EXISTS `ocupacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `nivelAcessoFk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nivelAcessoFk` (`nivelAcessoFk`),
  CONSTRAINT `ocupacao_ibfk_1` FOREIGN KEY (`nivelAcessoFk`) REFERENCES `nivelacesso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacao`
--

LOCK TABLES `ocupacao` WRITE;
/*!40000 ALTER TABLE `ocupacao` DISABLE KEYS */;
INSERT INTO `ocupacao` VALUES (1,'Professor',3),(2,'Secretaria',3),(3,'Coordenador',2),(4,'Orientador',2),(5,'Aluno',4),(6,'TI',1);
/*!40000 ALTER TABLE `ocupacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuarioFK` bigint NOT NULL,
  `tarefaFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioFK` (`usuarioFK`),
  KEY `tarefaFK` (`tarefaFK`),
  CONSTRAINT `responsaveis_ibfk_1` FOREIGN KEY (`usuarioFK`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `responsaveis_ibfk_2` FOREIGN KEY (`tarefaFK`) REFERENCES `tarefas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveis`
--

LOCK TABLES `responsaveis` WRITE;
/*!40000 ALTER TABLE `responsaveis` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `prazo` date NOT NULL,
  `inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fim` datetime DEFAULT NULL,
  `localFK` bigint NOT NULL,
  `solicitanteFK` bigint NOT NULL,
  `lastStatusFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFK` (`localFK`),
  KEY `solicitanteFK` (`solicitanteFK`),
  KEY `lastStatusFK` (`lastStatusFK`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`localFK`) REFERENCES `locais` (`id`),
  CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`solicitanteFK`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefas_ibfk_3` FOREIGN KEY (`lastStatusFK`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefastatus`
--

DROP TABLE IF EXISTS `tarefastatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefastatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `statusFK` bigint NOT NULL,
  `tarefaFK` bigint NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statusFK` (`statusFK`),
  KEY `tarefaFK` (`tarefaFK`),
  CONSTRAINT `tarefastatus_ibfk_1` FOREIGN KEY (`statusFK`) REFERENCES `status` (`id`),
  CONSTRAINT `tarefastatus_ibfk_2` FOREIGN KEY (`tarefaFK`) REFERENCES `tarefas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefastatus`
--

LOCK TABLES `tarefastatus` WRITE;
/*!40000 ALTER TABLE `tarefastatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefastatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `dataNascimento` date NOT NULL,
  `senha` varchar(30) NOT NULL,
  `dataCadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ocupacaoFk` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `foto` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ocupacaoFk` (`ocupacaoFk`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ocupacaoFk`) REFERENCES `ocupacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'João','joao@gmail.com','2000-01-01','55s888ff','2023-05-22 23:56:10',1,1,NULL,NULL),(2,'Mara','mara@gmail.com','1986-01-03','554333','2023-05-22 23:56:10',2,1,NULL,NULL),(3,'Clarice','clarice@gmail.com','1999-03-01','54455s888ff','2023-05-22 23:56:10',3,1,NULL,NULL),(4,'Roberto','roberto@gmail.com','2001-01-21','6666444','2023-05-22 23:56:10',4,1,NULL,NULL),(5,'Miguel','miguel@gmail.com','1995-03-03','3354','2023-05-22 23:56:10',1,1,NULL,NULL),(6,'Lúcia','lucia@gmail.com','1970-05-25','abbbcdd','2023-05-22 23:56:10',2,1,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 21:20:46
