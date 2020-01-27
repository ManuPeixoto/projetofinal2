-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Jan-2020 às 23:05
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdapp2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `codaluno` int(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(20) NOT NULL,
  `codturma` int(2) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `funcao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`codaluno`, `nome`, `contato`, `codturma`, `senha`, `funcao`) VALUES
(2019001, 'José Junior', 'jose@junior.com', 3, 'jose', 'aluno'),
(2019002, 'Sara Leite', 'sara@leite.com', 2, 'sara', 'aluno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `coddisc` int(2) NOT NULL,
  `materia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`coddisc`, `materia`) VALUES
(1, 'Manutenção'),
(2, 'Programação Web'),
(3, 'Estrutura de Dados');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `codprof` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `funcao` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`codprof`, `nome`, `email`, `senha`, `funcao`) VALUES
(11, 'Ricardo Souza', 'ricardo@souza.com', 'ricardo', 'professor'),
(12, 'Pedro Vaz', 'pedro@vaz.com', 'pedro', 'professor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `codreserva` int(5) NOT NULL,
  `codturma` int(2) NOT NULL,
  `coddisc` int(2) NOT NULL,
  `codhora` int(2) NOT NULL,
  `codprof` int(2) NOT NULL,
  `codsala` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`codreserva`, `codturma`, `coddisc`, `codhora`, `codprof`, `codsala`) VALUES
(262, 4, 1, 3, 11, 'E09'),
(644, 3, 3, 3, 12, 'E12'),
(727, 1, 1, 1, 12, 'E11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `codsala` varchar(5) NOT NULL,
  `disponivel` varchar(3) NOT NULL,
  `codhora` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`codsala`, `disponivel`, `codhora`) VALUES
('E09', 'nao', 0),
('E10', 'nao', 0),
('E11', 'ocu', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tempo`
--

CREATE TABLE `tempo` (
  `codhora` int(2) NOT NULL,
  `horario` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tempo`
--

INSERT INTO `tempo` (`codhora`, `horario`) VALUES
(1, '18:20-19:10'),
(2, '19:10-20:00'),
(3, '20:10-21:00'),
(4, '21:00-21:50'),
(5, '21:50-22:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `codturma` int(2) NOT NULL,
  `classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`codturma`, `classe`) VALUES
(1, 'Módulo 1'),
(2, 'Módulo 2'),
(3, 'Módulo 3'),
(4, 'Módulo 4');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`codaluno`),
  ADD KEY `fk_turma2` (`codturma`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`coddisc`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`codprof`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`codreserva`),
  ADD KEY `fk_disc` (`coddisc`),
  ADD KEY `fk_codhora` (`codhora`),
  ADD KEY `fk_turma` (`codturma`) USING BTREE,
  ADD KEY `fk_codprof` (`codprof`),
  ADD KEY `fk_codsala` (`codsala`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`codsala`),
  ADD KEY `fk_codhora` (`codhora`);

--
-- Índices para tabela `tempo`
--
ALTER TABLE `tempo`
  ADD PRIMARY KEY (`codhora`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`codturma`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `codaluno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2019000003;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `coddisc` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `codprof` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `codreserva` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=809;

--
-- AUTO_INCREMENT de tabela `tempo`
--
ALTER TABLE `tempo`
  MODIFY `codhora` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `codturma` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_turma` FOREIGN KEY (`codturma`) REFERENCES `turma` (`codturma`),
  ADD CONSTRAINT `fk_turma2` FOREIGN KEY (`codturma`) REFERENCES `turma` (`codturma`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_disc` FOREIGN KEY (`coddisc`) REFERENCES `disciplina` (`coddisc`),
  ADD CONSTRAINT `fk_turma_2` FOREIGN KEY (`codturma`) REFERENCES `turma` (`codturma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
