-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/08/2023 às 16:59
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--
CREATE DATABASE IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vendas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricantes`
--

CREATE TABLE `fabricantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fabricantes`
--

INSERT INTO `fabricantes` (`id`, `nome`) VALUES
(1, 'Asus'),
(2, 'Apple'),
(3, 'Motorola'),
(4, 'LG'),
(5, 'Samsung'),
(6, 'Lenovo'),
(7, 'Positivo'),
(8, 'Xiaomi');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(6,2) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `fabricante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `quantidade`, `fabricante_id`) VALUES
(1, 'UltraBook', 'Equipamento de última geração chei de recursos, com processador Intel Core i9 do balacobaco', 3500.00, 7, 2),
(2, 'Tablet Android', 'Tablet com a versão 14 do sistema operacional Android, \r\n    possui tela de 10 polegadas, armazenamento de 128 GB e 64 de RAM.', 1500.99, 5, 5),
(3, 'Geladeira', 'Geladeira branca de 3 portas', 5000.00, 12, 1),
(4, 'Micro-ondas', 'Pessimo micro-ondas', 7000.00, 15, 7),
(5, 'Freezer', 'Gela até a porta', 8005.66, 3, 3),
(6, 'Máquina de cortar cabelo', 'corta cabelo de carecas', 3000.00, 20, 4),
(7, 'Carregador de automovel', 'Só carrega carros a combustivel', 2000.00, 14, 6),
(8, 'Oculos sem lente', 'Serve para os que não enxergam', 1005.65, 3, 8);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_fabricantes` (`fabricante_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_fabricantes` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
