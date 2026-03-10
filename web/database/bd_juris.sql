-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/03/2026 às 07:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_juris`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `dataCadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`id`, `estado`, `uf`, `dataCadastro`) VALUES
(1, 'Acre', 'AC', '2025-02-24 11:46:25'),
(2, 'Alagoas', 'AL', '2025-02-24 11:46:25'),
(3, 'Amapá', 'AP', '2025-02-24 11:46:25'),
(4, 'Amazonas', 'AM', '2025-02-24 11:46:25'),
(5, 'Bahia', 'BA', '2025-02-24 11:46:25'),
(6, 'Ceará', 'CE', '2025-02-24 11:46:25'),
(7, 'Distrito Federal', 'DF', '2025-02-24 11:46:25'),
(8, 'Espírito Santo', 'ES', '2025-02-24 11:46:25'),
(9, 'Goiás', 'GO', '2025-02-24 11:46:25'),
(10, 'Maranhão', 'MA', '2025-02-24 11:46:25'),
(11, 'Mato Grosso', 'MT', '2025-02-24 11:46:25'),
(12, 'Mato Grosso do Sul', 'MS', '2025-02-24 11:46:25'),
(13, 'Minas Gerais', 'MG', '2025-02-24 11:46:25'),
(14, 'Pará', 'PA', '2025-02-24 11:46:25'),
(15, 'Paraíba', 'PB', '2025-02-24 11:46:25'),
(16, 'Paraná', 'PR', '2025-02-24 11:46:25'),
(17, 'Pernambuco', 'PE', '2025-02-24 11:46:25'),
(18, 'Piauí', 'PI', '2025-02-24 11:46:25'),
(19, 'Rio de Janeiro', 'RJ', '2025-02-24 11:46:25'),
(20, 'Rio Grande do Norte', 'RN', '2025-02-24 11:46:25'),
(21, 'Rio Grande do Sul', 'RS', '2025-02-24 11:46:25'),
(22, 'Rondônia', 'RO', '2025-02-24 11:46:25'),
(23, 'Roraima', 'RR', '2025-02-24 11:46:25'),
(24, 'Santa Catarina', 'SC', '2025-02-24 11:46:25'),
(25, 'São Paulo', 'SP', '2025-02-24 11:46:25'),
(26, 'Sergipe', 'SE', '2025-02-24 11:46:25'),
(27, 'Tocantins', 'TO', '2025-02-24 11:46:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `estadoCivil` varchar(2) DEFAULT NULL,
  `profissao` varchar(255) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `orgaoExpedidor` varchar(3) DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `estadoNatu` varchar(2) DEFAULT NULL,
  `cidadeNatu` varchar(255) DEFAULT NULL,
  `filiacao1` varchar(255) DEFAULT NULL,
  `filiacao2` varchar(255) DEFAULT NULL,
  `regimeCasamento` varchar(255) DEFAULT NULL,
  `conjuge` varchar(255) DEFAULT NULL,
  `nomeSocial` varchar(255) DEFAULT NULL,
  `pisPasep` varchar(20) DEFAULT NULL,
  `tituloEleitor` varchar(20) DEFAULT NULL,
  `zonaEleitor` varchar(10) DEFAULT NULL,
  `secaoEleitor` varchar(10) DEFAULT NULL,
  `numeroCasamento` varchar(50) DEFAULT NULL,
  `folhaCasamento` varchar(50) DEFAULT NULL,
  `termoCasamento` varchar(50) DEFAULT NULL,
  `cartorioCasamento` varchar(255) DEFAULT NULL,
  `cidadeCasamento` varchar(255) DEFAULT NULL,
  `estadoCasamento` varchar(255) DEFAULT NULL,
  `numeroNascimento` varchar(255) DEFAULT NULL,
  `folhaNascimento` varchar(255) DEFAULT NULL,
  `termoNascimento` varchar(255) DEFAULT NULL,
  `cartorioNascimento` varchar(255) DEFAULT NULL,
  `cidadeNascimento` varchar(255) DEFAULT NULL,
  `estadoNascimento` varchar(2) DEFAULT NULL,
  `outros` text DEFAULT NULL,
  `dataCadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `dataNasc` date DEFAULT NULL,
  `funcao` varchar(2) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `permissao` varchar(1) DEFAULT NULL,
  `departamento` varchar(2) DEFAULT NULL,
  `dataAdmissao` date DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `fotoPerfil` varchar(255) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `dataCadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `fone`, `cpf`, `dataNasc`, `funcao`, `senha`, `permissao`, `departamento`, `dataAdmissao`, `status`, `fotoPerfil`, `observacoes`, `dataCadastro`) VALUES
(1, 'admin', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-10 07:09:24');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
