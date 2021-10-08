-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Ago-2019 às 03:40
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fs5`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `account`
--

CREATE TABLE `account` (
  `accountid` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `accountnumber` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `account`
--

INSERT INTO `account` (`accountid`, `name`, `balance`, `accountnumber`, `description`) VALUES
(11, 'PICPAY', '0.00', '', 'ESCREVA ALGO AQUI'),
(12, 'CAIXA ECONOMICA FEDERAL', '950.00', NULL, 'ESCREVA ALGO AQUI'),
(13, 'BANCO DO BRASIL', '0.00', NULL, 'ESCREVA ALGO AQUI'),
(14, 'ITAU', '2500.00', NULL, 'ESCREVA ALGO AQUI'),
(15, 'PAGSEGURO', '725.00', NULL, 'ESCREVA ALGO AQUI'),
(16, 'PAYPAL', '0.00', NULL, 'ESCREVA ALGO AQUI'),
(17, 'BOLETO', '0.00', NULL, 'ESCREVA ALGO AQUI'),
(18, 'MERCADO PAGO', '952.00', NULL, 'ESCREVA ALGO AQUI'),
(19, 'QUALQUER OUTRA CONTA', '2500.00', '', 'ESCREVA ALGO AQUI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `budget`
--

CREATE TABLE `budget` (
  `budgetid` int(5) NOT NULL,
  `userid` int(5) NOT NULL,
  `categoryid` int(5) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `budget`
--

INSERT INTO `budget` (`budgetid`, `userid`, `categoryid`, `amount`, `fromdate`, `todate`, `description`) VALUES
(1, 1, 41, '5000.00', '2019-06-30', NULL, NULL),
(2, 1, 43, '2000.00', '2019-06-30', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `category`
--

CREATE TABLE `category` (
  `categoryid` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` int(11) NOT NULL,
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `category`
--

INSERT INTO `category` (`categoryid`, `name`, `description`, `type`, `color`) VALUES
(4, 'Loja - Pedidos', 'Pedidos realizados no site \nLojadeSkins.com.br', 1, '#48D1CC'),
(5, 'Loja - Encomendas', 'Encomendas realizadas no chat da loja, pagina do facebook ou whatsapp', 1, '#DA9351'),
(6, 'Loja - OUTROS', 'Upgrades realizados no chat da loja, pagina do facebook ou whatsapp', 1, '#4794FF'),
(7, 'Loja - Compras de Estoque', 'Compra de itens de CSGO ou de DOTA2', 2, '#FF4A4A'),
(8, 'Loja - Pagamento Funcionarios', 'Retirada mensal realizada para toda a equipe.', 2, '#FCFF47'),
(9, 'Loja de Skins - Custos da loja', 'Servidor, Design, Outros', 2, '#CCA8FF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `goals`
--

CREATE TABLE `goals` (
  `goalsid` int(5) NOT NULL,
  `userid` int(5) NOT NULL,
  `accountid` int(5) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `goals`
--

INSERT INTO `goals` (`goalsid`, `userid`, `accountid`, `name`, `balance`, `amount`, `deposit`, `deadline`) VALUES
(1, 1, NULL, 'COMPRAR X EQUIPAMENTO', '450.00', '3500.00', '4500.00', '2019-06-29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role`
--

CREATE TABLE `role` (
  `roleid` int(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `role`
--

INSERT INTO `role` (`roleid`, `name`) VALUES
(2, 'Transações'),
(3, 'Entradas'),
(4, 'Saídas'),
(5, 'Contas'),
(6, 'Orçamento'),
(7, 'Definir metas'),
(8, 'Calendário'),
(9, 'Categoria de Entradas'),
(10, 'Categoria de Saídas'),
(11, 'Relatórios de entradas'),
(12, 'Categoria de Saídas'),
(13, 'Relatório de entradas VS saídas'),
(14, 'Relatório mensal de entradas'),
(15, 'Relatório mensal de saídas'),
(16, 'Relatórios de transações de conta'),
(17, 'Função do usuário'),
(18, 'Configuração de Aplicação'),
(19, 'Upcoming Income'),
(20, 'Upcoming Expense');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roleaccess`
--

CREATE TABLE `roleaccess` (
  `roleaccessid` int(5) NOT NULL,
  `roleid` int(5) NOT NULL,
  `userid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `roleaccess`
--

INSERT INTO `roleaccess` (`roleaccessid`, `roleid`, `userid`) VALUES
(18, 2, 1),
(19, 3, 1),
(20, 4, 1),
(21, 5, 1),
(22, 6, 1),
(23, 7, 1),
(24, 8, 1),
(25, 9, 1),
(26, 10, 1),
(27, 11, 1),
(28, 12, 1),
(29, 13, 1),
(30, 14, 1),
(31, 15, 1),
(32, 16, 1),
(33, 17, 1),
(34, 18, 1),
(35, 19, 1),
(36, 20, 1),
(37, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `settingsid` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `city` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `logo` text NOT NULL,
  `currency` varchar(5) NOT NULL,
  `languages` varchar(10) NOT NULL,
  `dateformat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`settingsid`, `company`, `city`, `address`, `website`, `phone`, `logo`, `currency`, `languages`, `dateformat`) VALUES
(1, 'SUA EMPRESA AQUI', 'CIDADE', 'ENDEREÇO', 'SEU SITE AQUI', 'TELEFONE', 'test.png', 'R$', 'en', 'd/m/Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategory`
--

CREATE TABLE `subcategory` (
  `subcategoryid` int(11) NOT NULL,
  `categoryid` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `subcategory`
--

INSERT INTO `subcategory` (`subcategoryid`, `categoryid`, `name`, `type`, `description`) VALUES
(34, 4, 'PRODUTO X', 1, 'Skins de Dota 2'),
(35, 4, 'PRODUTO Y', 1, 'Skins de Counter-Strike: Global Offensive'),
(36, 5, 'Encomenda - LOJA FISICA', 1, 'Encomenda feita pelo WhatsApp'),
(37, 5, 'Encomenda - LOJA VIRTUAL', 1, 'Encomenda feita pelo Facebook/Chat da loja'),
(38, 6, 'OUTRO X', 1, 'Upgrade feito pelo Facebook/Chat da loja'),
(39, 6, 'OUTRO Y', 1, 'Upgrade feito pelo WhatsApp'),
(40, 7, 'PRODUTO X', 2, 'Skins de Counter-Strike: Global Offensive'),
(41, 7, 'PRODUTO Y', 2, 'Skins de Dota 2'),
(42, 8, 'RETIRADA FUNCIONARIO', 2, 'RETIRADA FUNCIONARIO'),
(43, 8, 'PRO LABORE', 2, 'RETIRADA SOCIOS'),
(47, 9, 'CUSTOS DA LOJA', 2, 'CUSTOS X,Y,Z'),
(48, 9, 'OUTROS CUSTOS', 2, 'Outros custos da loja.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transaction`
--

CREATE TABLE `transaction` (
  `transactionid` int(5) NOT NULL,
  `userid` int(5) NOT NULL,
  `categoryid` int(5) NOT NULL,
  `accountid` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `transactiondate` date NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `file` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `transaction`
--

INSERT INTO `transaction` (`transactionid`, `userid`, `categoryid`, `accountid`, `name`, `amount`, `reference`, `transactiondate`, `type`, `description`, `file`) VALUES
(1, 1, 34, 12, 'JOAO', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(2, 1, 40, 13, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', ''),
(3, 1, 35, 14, 'MARCOS', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(4, 1, 42, 14, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', NULL),
(5, 1, 40, 12, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', NULL),
(6, 1, 47, 16, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', ''),
(7, 1, 48, 17, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', ''),
(8, 1, 43, 18, 'JOAO', '59.90', '\"escreva alguma coisa\"', '2019-06-01', 2, 'outra caixa para anotações sobre a entrada.', ''),
(9, 1, 36, 13, 'JOAO', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(10, 1, 37, 15, 'JOAO', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(11, 1, 38, 19, 'JOAO', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(12, 1, 39, 18, 'JOAO', '149.50', '\"escreva alguma coisa\"', '2019-06-03', 1, 'outra caixa para anotações sobre a entrada.', ''),
(13, 1, 35, 17, 'Maria', '375.50', 'pedido na loja', '2019-06-04', 1, 'compra do produto y', NULL),
(14, 1, 42, 14, 'Marcos', '950.00', 'salario', '2019-06-05', 2, 'pagamento ao funcionario', NULL),
(15, 1, 40, 17, 'estoque', '150.00', 'compra de estoque', '2019-06-05', 2, 'produto x', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`userid`, `email`, `name`, `password`, `role`, `phone`, `status`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 'contato@contato.com', 'ConnectSkins', '$2y$10$W6T4gKJMEcDX3QmB0PSwlOMxF6/qBEZwuERxOQE52MBGS1MPMZpxe', 'Administrator', 'TELEFONE', 'Active', 'O6eEgt7siqAKrTGmcBrCRRadtoQjUBWisXMaQK13gIKrqhnkMHNanS9yZSiM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'test@test.com', 'TEST', '$2y$10$sdZqUzOHCv3UytIe9Riq5u/BKkMiHGasCLvl8wbjKtqW9xedmacBC', 'Staff', '21979977874', 'Active', NULL, '2019-06-14 03:00:38', '2019-06-14 03:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountid`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`budgetid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goalsid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `roleaccess`
--
ALTER TABLE `roleaccess`
  ADD PRIMARY KEY (`roleaccessid`),
  ADD KEY `deleteroleaccess` (`userid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingsid`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcategoryid`),
  ADD KEY `deletesubquery` (`categoryid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `budgetid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `goalsid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roleaccess`
--
ALTER TABLE `roleaccess`
  MODIFY `roleaccessid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settingsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcategoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `roleaccess`
--
ALTER TABLE `roleaccess`
  ADD CONSTRAINT `deleteroleaccess` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `deletesubquery` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
