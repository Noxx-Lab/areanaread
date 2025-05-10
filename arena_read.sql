-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Maio-2025 às 22:36
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `arena_read`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `capitulos`
--

CREATE TABLE `capitulos` (
  `id_capitulos` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `num_capitulo` int(11) NOT NULL,
  `data_lancamento` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `generos`
--

CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL,
  `nome_genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `generos`
--

INSERT INTO `generos` (`id_genero`, `nome_genero`) VALUES
(1, 'Ação'),
(27, 'Animais'),
(56, 'Anti-herói'),
(28, 'Apocalipse'),
(2, 'Artes Marciais'),
(3, 'Aventura'),
(29, 'Bullying'),
(4, 'Comédia'),
(30, 'Crime'),
(5, 'Cultivação'),
(50, 'Drama'),
(6, 'Dungeons'),
(31, 'Ecchi'),
(32, 'Escolar'),
(33, 'Esporte'),
(7, 'Fantasia'),
(34, 'Fazenda'),
(35, 'Ficção Científica'),
(36, 'Guerra'),
(8, 'Histórico'),
(38, 'Horror'),
(9, 'Isekai'),
(37, 'Jogo'),
(39, 'Luta'),
(40, 'Mafia'),
(10, 'Magia'),
(11, 'MC Genius'),
(58, 'Militar'),
(12, 'Mistério'),
(55, 'Murim'),
(41, 'Musculação'),
(13, 'Necromante'),
(14, 'Overpower'),
(15, 'Psicológico'),
(42, 'Reality Virtual'),
(16, 'Reencarnação'),
(17, 'Regresso'),
(51, 'Retorno'),
(18, 'Romance'),
(43, 'Sci-fi'),
(19, 'Seinen'),
(45, 'Shojo'),
(52, 'Shounen'),
(20, 'Sistema'),
(44, 'Slice of Life'),
(21, 'Sobrenatural'),
(53, 'Sobrevivência'),
(46, 'Super Poderes'),
(47, 'Suspense'),
(48, 'Tela de Sistema'),
(22, 'Torre'),
(54, 'Tragédia'),
(23, 'Transmigração'),
(57, 'Vida cotidiana'),
(24, 'Vida Escolar'),
(25, 'Vingança'),
(49, 'Volta no Tempo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mangas`
--

CREATE TABLE `mangas` (
  `id_manga` int(11) NOT NULL COMMENT 'id do manga',
  `titulo` varchar(255) NOT NULL COMMENT 'titulo do manga',
  `link` varchar(255) NOT NULL COMMENT 'Nome para os links',
  `tipo` enum('Manga','Manhua','Manhwa','Comic','Novel') NOT NULL COMMENT 'tipo de manga',
  `status` enum('Ongoing','Hiatus','Finalizado','Dropado','Lançamento') NOT NULL COMMENT 'status do manga',
  `sinopse` text DEFAULT NULL COMMENT 'Um breve resumo da obra',
  `autor` varchar(255) DEFAULT NULL COMMENT 'Autor da obra',
  `artista` varchar(255) DEFAULT NULL COMMENT 'Artista ou studio que desenhou a obra',
  `ano_lancado` int(11) DEFAULT NULL COMMENT 'Ano de lançamento',
  `capa` varchar(255) NOT NULL COMMENT 'caminho para o ficheiro com a capa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='tabela dos mangas/manhua que vai ter as informações basicas';

--
-- Extraindo dados da tabela `mangas`
--

INSERT INTO `mangas` (`id_manga`, `titulo`, `link`, `tipo`, `status`, `sinopse`, `autor`, `artista`, `ano_lancado`, `capa`) VALUES
(43, 'Second Life Ranker', 'second-life-ranker', 'Manhua', 'Ongoing', 'Yeon-woo tinha um irmão gêmeo que desapareceu há cinco anos. Um dia, um relógio de bolso deixado por seu irmão retornou para sua posse. Dentro dele, ele encontrou um diário escondido no qual estava registrado: “No momento em que você ouvir isso, eu acredito que já estarei morto…”. Obelisco, a Torre do Deus Sol, um mundo onde vários universos e dimensões se cruzam. Neste mundo, seu irmão foi vítima de traição enquanto subia a torre. Depois de descobrir a verdade, Yeon-woo decidiu subir a torre junto com o diário de seu irmão. Yeon-woo então passa pelos mesmos testes e lutas que seu irmão mais novo enfrentou como um jogador anônimo. Seu objetivo? Derrotar a Torre Obelisco e se vingar por seu irmão.', 'Sa Do-Yeon', 'DREAMTOON STUDIO', 2019, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1745310104/capas/phpFCFF.jpg'),
(45, 'Nano Machine', 'nano-machine', 'Manhwa', 'Ongoing', 'Depois de ser desprezado e ter sua vida posta em perigo, um órfão do Culto Demoníaco, Cheon Yeo-Woon, recebe a visita inesperada de seu descendente do futuro, que insere uma nano máquina no corpo de Cheon Yeo-Woon, que muda drasticamente Vida de Cheon Yeo-Woon após sua ativação. A história da jornada de Cheon Yeo-Woon de contornar o Culto Demoníaco e se tornar o melhor artista marcial apenas começou.', 'Hanjoong Wolya', 'Geum Chel / Redice Studio', 2020, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1745310333/capas/php7976.jpg'),
(46, 'I Am the Fated Villain', 'i-am-the-fated-villain', 'Manhua', 'Ongoing', 'Após Gu Changge observar que havia transmigrado para um mundo de fantasia, o protagonista do mundo, e o escolhido da fortuna, jurou se vingar dele. Invejado por todos, ele não tem apenas uma liderança feminina de ponta-cabeça por ele, mas também é tratado como um convidado distinto onde quer que vá. Felizmente, a prestígio e o poder de Gu Changge são superiores a todos os outros, então não deveria ser fácil pisar em uma mera escolha da fortuna? Espere… Existe um sistema dedicado à ordem e colheita do protagonista? Gu Changge foi encontrado. “Parece que até o destino quer que eu cumpra meu destino como o vilão deste mundo!”', 'Fang Mu', 'Desconhecido', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1745310475/capas/phpAE48.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `manga_generos`
--

CREATE TABLE `manga_generos` (
  `id_manga_generos` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `manga_generos`
--

INSERT INTO `manga_generos` (`id_manga_generos`, `id_manga`, `id_genero`) VALUES
(178, 43, 1),
(179, 43, 3),
(180, 43, 7),
(181, 43, 20),
(182, 43, 22),
(189, 45, 1),
(190, 45, 2),
(191, 45, 3),
(192, 45, 7),
(194, 45, 20),
(193, 45, 55),
(195, 46, 1),
(197, 46, 2),
(198, 46, 3),
(199, 46, 5),
(200, 46, 20),
(196, 46, 56);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paginas`
--

CREATE TABLE `paginas` (
  `id_pagina` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `id_capitulos` int(11) NOT NULL,
  `caminho_pagina` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL COMMENT 'ID único do utilizador\r\n',
  `username` varchar(50) NOT NULL COMMENT 'Nome de utilizador',
  `email` varchar(100) NOT NULL COMMENT 'Email do utilizador',
  `senha` varchar(255) NOT NULL COMMENT 'Hash da palavra-passe encriptada',
  `rank` enum('user','admin','editor') DEFAULT 'user' COMMENT 'Define se é utilizador, editor ou administrador (padrão: user)\r\n',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data e hora de criação do registo',
  `token_esqueceu` varchar(255) DEFAULT NULL COMMENT 'Para resetar a password',
  `token_tempo` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`iduser`, `username`, `email`, `senha`, `rank`, `created_at`, `token_esqueceu`, `token_tempo`) VALUES
(1, 'Florin', 'florin123@gmail.com', '$2y$10$dMKdSA18VDhfNUhCOy65h.XYmKD1oZe/w2GWAXi8syllfo9pfjRu6', 'admin', '2024-12-11 14:53:24', NULL, NULL),
(26, 'gaules', 'gaules@mailinator.com', '$2y$10$3MbVMYQ.mP.//arzeW8aEe1ikHXCVhXA7W.hqMKvy6FnuCFozzo02', 'user', '2025-04-22 08:36:50', NULL, NULL),
(27, 'k9', 'floringlobast49@gmail.com', '$2y$10$iRDLUbcpVDO8mOnB58e8oedIansLYpRFomYVmnnyM/OowbuMyy/by', 'user', '2025-04-22 08:38:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_progresso`
--

CREATE TABLE `user_progresso` (
  `id_user_progresso` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `ultimo_capitulo_lido` int(11) NOT NULL,
  `ultimo_capitulo_timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `capitulos`
--
ALTER TABLE `capitulos`
  ADD PRIMARY KEY (`id_capitulos`),
  ADD KEY `id_manga` (`id_manga`);

--
-- Índices para tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_genero`),
  ADD UNIQUE KEY `nome_genero` (`nome_genero`);

--
-- Índices para tabela `mangas`
--
ALTER TABLE `mangas`
  ADD PRIMARY KEY (`id_manga`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Índices para tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  ADD PRIMARY KEY (`id_manga_generos`),
  ADD UNIQUE KEY `id_manga` (`id_manga`,`id_genero`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Índices para tabela `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`id_pagina`),
  ADD KEY `id_manga` (`id_manga`),
  ADD KEY `id_capitulos` (`id_capitulos`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `user_progresso`
--
ALTER TABLE `user_progresso`
  ADD PRIMARY KEY (`id_user_progresso`),
  ADD UNIQUE KEY `iduser` (`iduser`,`id_manga`),
  ADD KEY `id_manga` (`id_manga`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `capitulos`
--
ALTER TABLE `capitulos`
  MODIFY `id_capitulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id do manga', AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  MODIFY `id_manga_generos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1125;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único do utilizador\r\n', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `user_progresso`
--
ALTER TABLE `user_progresso`
  MODIFY `id_user_progresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `capitulos`
--
ALTER TABLE `capitulos`
  ADD CONSTRAINT `capitulos_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  ADD CONSTRAINT `manga_generos_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`) ON DELETE CASCADE,
  ADD CONSTRAINT `manga_generos_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `paginas`
--
ALTER TABLE `paginas`
  ADD CONSTRAINT `paginas_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`) ON DELETE CASCADE,
  ADD CONSTRAINT `paginas_ibfk_2` FOREIGN KEY (`id_capitulos`) REFERENCES `capitulos` (`id_capitulos`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `user_progresso`
--
ALTER TABLE `user_progresso`
  ADD CONSTRAINT `user_progresso_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_progresso_ibfk_2` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
