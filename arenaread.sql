-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jun-2025 às 01:46
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
-- Banco de dados: `arenaread`
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

--
-- Extraindo dados da tabela `capitulos`
--

INSERT INTO `capitulos` (`id_capitulos`, `id_manga`, `num_capitulo`, `data_lancamento`) VALUES
(116, 50, 0, '2025-06-05 19:44:21'),
(117, 50, 1, '2025-06-05 19:44:23'),
(118, 50, 2, '2025-06-05 19:44:25'),
(119, 50, 3, '2025-06-05 19:44:26'),
(120, 50, 4, '2025-06-05 19:44:27'),
(121, 50, 5, '2025-06-05 19:44:29'),
(122, 49, 0, '2025-06-07 21:04:49'),
(123, 49, 1, '2025-06-07 21:04:51'),
(124, 49, 2, '2025-06-07 21:04:52'),
(128, 51, 1, '2025-06-07 21:36:57'),
(129, 51, 2, '2025-06-07 21:36:57'),
(130, 51, 3, '2025-06-07 21:36:58'),
(131, 51, 4, '2025-06-07 21:36:59'),
(132, 51, 5, '2025-06-08 00:04:08'),
(133, 51, 6, '2025-06-08 00:04:09'),
(134, 51, 7, '2025-06-08 00:04:10'),
(135, 51, 8, '2025-06-08 00:04:14'),
(136, 51, 9, '2025-06-08 00:04:17'),
(137, 49, 3, '2025-06-08 00:08:49'),
(138, 49, 4, '2025-06-08 00:08:50'),
(139, 49, 5, '2025-06-08 00:08:51'),
(140, 49, 6, '2025-06-08 00:08:52'),
(141, 49, 7, '2025-06-08 00:08:52'),
(142, 49, 8, '2025-06-08 00:08:54');

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
(47, 'Warrior High School – Dungeon Raid Department', 'warrior-high-school--dungeon-raid-department', 'Manhwa', 'Ongoing', 'Num mundo onde os calabouços surgem misteriosamente, a humanidade precisa de caçadores para proteger a paz. No Warrior High School, os alunos treinam para se tornarem caçadores de elite. Entre eles, surge um jovem com um passado misterioso e um talento extraordinário para o combate. Quando monstros atacam, o Departamento de Dungeon Raid é a primeira linha de defesa, e a sobrevivência da humanidade depende do trabalho desta equipa.', 'Park Minse', 'Jo Hyunhwan', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1748978555/capas/phpE22A.jpg'),
(48, 'Return of the Mount Hua Sect', 'return-of-the-mount-hua-sect', 'Manhwa', 'Ongoing', 'Após a sua morte numa batalha sangrenta, Chung Myung, o lendário Espadachim da Flor de Ameixa, renasce no corpo de um órfão num mundo 100 anos depois. Descobre que a sua seita, a gloriosa Seita Mount Hua, outrora uma das mais poderosas, está agora em decadência e esquecida. Com sede de justiça e desejo de restaurar a glória da sua seita, Chung Myung embarca numa jornada para reerguer a Seita Mount Hua das cinzas, enfrentando inimigos poderosos e desafiando o destino.', 'Biga', 'LICO', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1748978640/capas/php3930.jpg'),
(49, 'Solo Leveling', 'solo-leveling', 'Manhwa', 'Finalizado', 'Num mundo onde portais misteriosos ligam a Terra a dimensões repletas de monstros, apenas caçadores com habilidades especiais conseguem entrar e lutar.\r\nSung Jin-Woo, conhecido como o \"Caçador Mais Fraco do Mundo\", luta para sobreviver como um E-rank. No entanto, tudo muda quando ele enfrenta uma dungeon secreta e recebe uma oportunidade única: tornar-se um Jogador com a habilidade de \"subir de nível\" — algo que ninguém mais consegue fazer.\r\nCom o seu novo poder, Sung Jin-Woo começa a desafiar monstros, chefes e até outros caçadores, evoluindo de um fraco a uma lenda inigualável.', 'Chugong', 'Jang Sung-rak', 2018, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1748978709/capas/php4419.jpg'),
(50, 'Solo Max-Level Newbie', 'solo-max-level-newbie', 'Manhwa', 'Ongoing', 'Jinhyuk é um streamer conhecido por jogar o jogo Tower of Trials, mas quando o jogo perde popularidade e ele se prepara para encerrar a carreira... a torre misteriosamente aparece no mundo real.\r\nO que para muitos é um apocalipse, para Jinhyuk é uma oportunidade: ele é o único jogador que conhece os segredos e estratégias de cada andar, cada boss e cada puzzle, pois foi o único a terminar o jogo no nível máximo.\r\nCom o seu conhecimento avançado e inteligência estratégica, Jinhyuk sobe a torre enquanto outros tentam apenas sobreviver — e rapidamente deixa de ser apenas um streamer para se tornar uma lenda.', 'Jang Sung-Lak', 'Swing Bat, Redice Studio', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1748978875/capas/phpC7C7.png'),
(51, 'Martial God Regressed to Level 2', 'martial-god-regressed-to-level-2', 'Manhwa', 'Ongoing', 'O lendário Deus Marcial salvou o mundo da destruição ao derrotar a ameaça final. No entanto, após a vitória, percebe que tudo o que resta é solidão... até que algo inesperado acontece: ele regressa misteriosamente no tempo ao seu nível 2, quando ainda era um guerreiro iniciante.\r\nAgora, com todo o conhecimento e habilidades da sua vida passada, ele tem uma nova chance para corrigir erros, proteger os que ama e subir novamente ao topo — mas desta vez, de forma ainda mais brutal e eficiente.\r\nUma segunda oportunidade para dominar tudo... desde o início!', 'Yeombi', 'Ah Yoongu', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328056/capas/phpBC1E.jpg');

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
(201, 47, 1),
(202, 47, 2),
(203, 47, 3),
(204, 47, 6),
(205, 47, 24),
(206, 48, 1),
(207, 48, 2),
(208, 48, 3),
(209, 48, 8),
(210, 48, 16),
(211, 49, 1),
(212, 49, 3),
(213, 49, 7),
(214, 49, 14),
(215, 49, 20),
(216, 50, 1),
(217, 50, 2),
(218, 50, 3),
(219, 50, 4),
(220, 50, 7),
(221, 50, 11),
(222, 50, 14),
(223, 50, 22),
(224, 51, 1),
(225, 51, 2),
(226, 51, 3),
(227, 51, 14),
(228, 51, 17),
(229, 51, 20);

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

--
-- Extraindo dados da tabela `paginas`
--

INSERT INTO `paginas` (`id_pagina`, `id_manga`, `id_capitulos`, `caminho_pagina`) VALUES
(1173, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149080/mangas/solo-maxlevel-newbie/capitulo-0/ierbuwkijlqzq8irngho.webp'),
(1174, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149081/mangas/solo-maxlevel-newbie/capitulo-0/wpuwbutnkwyk7bdchcmb.webp'),
(1175, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149082/mangas/solo-maxlevel-newbie/capitulo-0/ttj2lp8fbiglbuxrqtel.webp'),
(1176, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149083/mangas/solo-maxlevel-newbie/capitulo-0/srvlvbstrpv6racyp6p3.webp'),
(1177, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149084/mangas/solo-maxlevel-newbie/capitulo-0/wdhtknd0f1tyfrybubgl.webp'),
(1178, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149085/mangas/solo-maxlevel-newbie/capitulo-0/x7euifz8ict8vxluybli.webp'),
(1179, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149086/mangas/solo-maxlevel-newbie/capitulo-0/hoxtgzumwhv6wkuipgf0.webp'),
(1180, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149087/mangas/solo-maxlevel-newbie/capitulo-0/ahldupz21ojbjvfgs01t.webp'),
(1181, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149088/mangas/solo-maxlevel-newbie/capitulo-0/uaggas3usrwazuerfmv0.webp'),
(1182, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149088/mangas/solo-maxlevel-newbie/capitulo-0/uyrndv4kxogz38rylm52.webp'),
(1183, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149089/mangas/solo-maxlevel-newbie/capitulo-0/lwdlzngzpozvfdwuhnm2.webp'),
(1184, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149090/mangas/solo-maxlevel-newbie/capitulo-0/t6uf3dp0loao3zuqamuj.webp'),
(1185, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149091/mangas/solo-maxlevel-newbie/capitulo-0/rlxthricwmddmgn2umdn.webp'),
(1186, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149092/mangas/solo-maxlevel-newbie/capitulo-0/mtfyjug9nmccocuyrpmi.webp'),
(1187, 50, 116, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149092/mangas/solo-maxlevel-newbie/capitulo-0/qwptaiiv8fvg0jb2dul0.webp'),
(1188, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149104/mangas/solo-maxlevel-newbie/capitulo-1/lubjpu95al7c1xlgduyg.webp'),
(1189, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149105/mangas/solo-maxlevel-newbie/capitulo-1/ve1260c7g9tq8kox2nbo.webp'),
(1190, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149106/mangas/solo-maxlevel-newbie/capitulo-1/ced1zzegrq8bnhytgd68.webp'),
(1191, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149107/mangas/solo-maxlevel-newbie/capitulo-1/cpp0snce3ru7xxnfv12t.webp'),
(1192, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149107/mangas/solo-maxlevel-newbie/capitulo-1/i9dtwamo78zlmhncy2hd.webp'),
(1193, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149108/mangas/solo-maxlevel-newbie/capitulo-1/lurbppsyufb0riroyhce.webp'),
(1194, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149109/mangas/solo-maxlevel-newbie/capitulo-1/divypj4k7firkmwsvxs9.webp'),
(1195, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149110/mangas/solo-maxlevel-newbie/capitulo-1/f7x481bybgkzhfispock.webp'),
(1196, 50, 117, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149110/mangas/solo-maxlevel-newbie/capitulo-1/w5cvlehpztdzaknfqhb1.webp'),
(1197, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149124/mangas/solo-maxlevel-newbie/capitulo-2/eesrgo5h7lddlnvttkcp.webp'),
(1198, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149126/mangas/solo-maxlevel-newbie/capitulo-2/esuajqblpqnhiklygfte.webp'),
(1199, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149127/mangas/solo-maxlevel-newbie/capitulo-2/ghdkrwvmb6h5pydymzn6.webp'),
(1200, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149128/mangas/solo-maxlevel-newbie/capitulo-2/bmqpmjslrzuip2xy9lfl.webp'),
(1201, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149129/mangas/solo-maxlevel-newbie/capitulo-2/ji91padgu0dfu5cazrgw.webp'),
(1202, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149130/mangas/solo-maxlevel-newbie/capitulo-2/gg8ivnudnyrzy1rjhj70.webp'),
(1203, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149132/mangas/solo-maxlevel-newbie/capitulo-2/xey45wbmvd22xzmnzryl.webp'),
(1204, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149134/mangas/solo-maxlevel-newbie/capitulo-2/mjlzj8hz6rlboge1oymh.webp'),
(1205, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149135/mangas/solo-maxlevel-newbie/capitulo-2/hyv5jwf9kncfuaya9ryf.webp'),
(1206, 50, 118, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149136/mangas/solo-maxlevel-newbie/capitulo-2/xsejoqy0vqyeij53vfo7.webp'),
(1207, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149167/mangas/solo-maxlevel-newbie/capitulo-3/meczubmilf0yrsijcvmm.webp'),
(1208, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149169/mangas/solo-maxlevel-newbie/capitulo-3/sja7cq9rccgqvnbbrd0i.webp'),
(1209, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149171/mangas/solo-maxlevel-newbie/capitulo-3/ddultc69khkgi6bng9xx.webp'),
(1210, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149172/mangas/solo-maxlevel-newbie/capitulo-3/vc0hwboo6xwjkay0xpdw.webp'),
(1211, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149173/mangas/solo-maxlevel-newbie/capitulo-3/iq9ijuzpeh5rvteecxfs.webp'),
(1212, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149174/mangas/solo-maxlevel-newbie/capitulo-3/iiwqxeqcuawlhsyg6qc2.webp'),
(1213, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149175/mangas/solo-maxlevel-newbie/capitulo-3/ov38pvvbznoyd8a9mbnj.webp'),
(1214, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149177/mangas/solo-maxlevel-newbie/capitulo-3/vvm5m5em3dvpl4nefwsp.webp'),
(1215, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149178/mangas/solo-maxlevel-newbie/capitulo-3/tvugxsn5wbh2ytwmuipr.webp'),
(1216, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149180/mangas/solo-maxlevel-newbie/capitulo-3/pijrip1cjugvohxgcgnw.webp'),
(1217, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149180/mangas/solo-maxlevel-newbie/capitulo-3/ldwzi9lvaqv9l22blfue.webp'),
(1218, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149182/mangas/solo-maxlevel-newbie/capitulo-3/i3wc8ugiykr34t2v6cvs.webp'),
(1219, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149183/mangas/solo-maxlevel-newbie/capitulo-3/vhv3rkjrut3kc12hpvbz.webp'),
(1220, 50, 119, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149184/mangas/solo-maxlevel-newbie/capitulo-3/mdviqovajm3sgduhkqqt.webp'),
(1221, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149200/mangas/solo-maxlevel-newbie/capitulo-4/ek6tw2rzi7iwheegfcvd.webp'),
(1222, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149201/mangas/solo-maxlevel-newbie/capitulo-4/ehqf4tllegwie9heincb.webp'),
(1223, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149202/mangas/solo-maxlevel-newbie/capitulo-4/pyxxor8iiungqmcn9m6e.webp'),
(1224, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149203/mangas/solo-maxlevel-newbie/capitulo-4/j8ujspwm2fa5hbfojmty.webp'),
(1225, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149204/mangas/solo-maxlevel-newbie/capitulo-4/picsrdhuubrtvxzvoa0d.webp'),
(1226, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149205/mangas/solo-maxlevel-newbie/capitulo-4/j5cks3qblnndxuvgix87.webp'),
(1227, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149206/mangas/solo-maxlevel-newbie/capitulo-4/yqpuxuvafwtdytwgcvrb.webp'),
(1228, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149207/mangas/solo-maxlevel-newbie/capitulo-4/ol9sbj2qrjjkc3jwwrcw.webp'),
(1229, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149208/mangas/solo-maxlevel-newbie/capitulo-4/efqubhwnhxltiqsjkle7.webp'),
(1230, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149208/mangas/solo-maxlevel-newbie/capitulo-4/m9yzaliqitnqoidzzouk.webp'),
(1231, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149209/mangas/solo-maxlevel-newbie/capitulo-4/rx2liri4bfopdqx0js92.webp'),
(1232, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149210/mangas/solo-maxlevel-newbie/capitulo-4/j2hasg4nv4klgrhw499h.webp'),
(1233, 50, 120, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149211/mangas/solo-maxlevel-newbie/capitulo-4/ghubtmnjdeqaie3mz452.webp'),
(1234, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149233/mangas/solo-maxlevel-newbie/capitulo-5/pzckeqk0msdik9iltcv5.webp'),
(1235, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149234/mangas/solo-maxlevel-newbie/capitulo-5/tcf7w8mm4qbq9om4ucbp.webp'),
(1236, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149235/mangas/solo-maxlevel-newbie/capitulo-5/om4wxkfmllqpkrl1mira.webp'),
(1237, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149236/mangas/solo-maxlevel-newbie/capitulo-5/bbv2amsy8uow1rvn8fnw.webp'),
(1238, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149237/mangas/solo-maxlevel-newbie/capitulo-5/aq2qzk4ymhz60yngz6z0.webp'),
(1239, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149238/mangas/solo-maxlevel-newbie/capitulo-5/zwvtia58k2h02kvyoswm.webp'),
(1240, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149239/mangas/solo-maxlevel-newbie/capitulo-5/vm1mecp7wef0gwhxkbtz.webp'),
(1241, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149240/mangas/solo-maxlevel-newbie/capitulo-5/osckubgbtvbcawztgwxk.webp'),
(1242, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149241/mangas/solo-maxlevel-newbie/capitulo-5/psjegbcuk6ayijwiuijo.webp'),
(1243, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149241/mangas/solo-maxlevel-newbie/capitulo-5/tdaobgjzsbrkfayecqho.webp'),
(1244, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149242/mangas/solo-maxlevel-newbie/capitulo-5/ucjh9dcnnf46cvsxoecw.webp'),
(1245, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149243/mangas/solo-maxlevel-newbie/capitulo-5/zakg2jekwoqrij6huwfp.webp'),
(1246, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149244/mangas/solo-maxlevel-newbie/capitulo-5/oaebpjpwglroztrkmtzn.webp'),
(1247, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149248/mangas/solo-maxlevel-newbie/capitulo-5/irufo9gc9gifc90uvkmf.webp'),
(1248, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149248/mangas/solo-maxlevel-newbie/capitulo-5/vd8ylml4pfn41jaqrq7t.webp'),
(1249, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149249/mangas/solo-maxlevel-newbie/capitulo-5/efoqqhbh3olzcc4qykut.webp'),
(1250, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149250/mangas/solo-maxlevel-newbie/capitulo-5/f3tkdxpbfvomcrs3hcy8.webp'),
(1251, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149251/mangas/solo-maxlevel-newbie/capitulo-5/sbyijs7yu8rr8nybstb9.webp'),
(1252, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149251/mangas/solo-maxlevel-newbie/capitulo-5/irbmutuno8fmwtewvw5o.webp'),
(1253, 50, 121, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749149252/mangas/solo-maxlevel-newbie/capitulo-5/jf7b8gsbh3vb743inqrs.webp'),
(1254, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327746/mangas/solo-leveling/capitulo-0/daofnkmjzeknpisva5z8.webp'),
(1255, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327747/mangas/solo-leveling/capitulo-0/ybfk44c6frvdak4dddpg.webp'),
(1256, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327749/mangas/solo-leveling/capitulo-0/dxwefl2b0ocxpxo1i0t1.webp'),
(1257, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327750/mangas/solo-leveling/capitulo-0/hf03vyrw8y8cpbbn5ucs.webp'),
(1258, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327752/mangas/solo-leveling/capitulo-0/ybaacbwc6stgmbtciio5.webp'),
(1259, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327754/mangas/solo-leveling/capitulo-0/xxpievjbxud8wmnkutcf.webp'),
(1260, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327755/mangas/solo-leveling/capitulo-0/h9gvxgwsbhzf0b7ev8gl.webp'),
(1261, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327757/mangas/solo-leveling/capitulo-0/lmq46zv4b7wy5utxx5qh.webp'),
(1262, 49, 122, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749327758/mangas/solo-leveling/capitulo-0/smbxpbxnyjjuhsibwfdy.webp'),
(1303, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328633/mangas/martial-god-regressed-to-level-2/capitulo-1/wvn9tliux8axlchh57un.webp'),
(1304, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328637/mangas/martial-god-regressed-to-level-2/capitulo-1/fsqg00obkezi58e8ldhg.webp'),
(1305, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328639/mangas/martial-god-regressed-to-level-2/capitulo-1/t4rwa7ph1u5zzbfqz3x3.webp'),
(1306, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328641/mangas/martial-god-regressed-to-level-2/capitulo-1/p449wgryv27chjzcdzps.webp'),
(1307, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328643/mangas/martial-god-regressed-to-level-2/capitulo-1/ov1kczvrqfviidpj1bka.webp'),
(1308, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328646/mangas/martial-god-regressed-to-level-2/capitulo-1/sdfmexr8vai50p3y6kjj.webp'),
(1309, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328648/mangas/martial-god-regressed-to-level-2/capitulo-1/azy8wcgnk6z3et8dsp2r.webp'),
(1310, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328651/mangas/martial-god-regressed-to-level-2/capitulo-1/ujhndcnjj5awnii7bisr.webp'),
(1311, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328653/mangas/martial-god-regressed-to-level-2/capitulo-1/nuvofe8tiaqfibexv8dr.webp'),
(1312, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328656/mangas/martial-god-regressed-to-level-2/capitulo-1/c9puvuidvawykyzk0m95.webp'),
(1313, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328658/mangas/martial-god-regressed-to-level-2/capitulo-1/fl4kg7pbfieksldzf66a.webp'),
(1314, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328661/mangas/martial-god-regressed-to-level-2/capitulo-1/vg8so8xt8e4pyogkoylk.webp'),
(1315, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328663/mangas/martial-god-regressed-to-level-2/capitulo-1/y9pdxp2pn4ytfkujukz8.webp'),
(1316, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328665/mangas/martial-god-regressed-to-level-2/capitulo-1/tdgam0bya1rwbdcl5iuw.webp'),
(1317, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328668/mangas/martial-god-regressed-to-level-2/capitulo-1/e1hfna0g95yo9i366mum.webp'),
(1318, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328670/mangas/martial-god-regressed-to-level-2/capitulo-1/sqcobknm00rbbwyn0hf5.webp'),
(1319, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328673/mangas/martial-god-regressed-to-level-2/capitulo-1/vo8gzpk1whh6z5xk76hn.webp'),
(1320, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328675/mangas/martial-god-regressed-to-level-2/capitulo-1/mz3y2qiyurmhf8flnegz.webp'),
(1321, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328678/mangas/martial-god-regressed-to-level-2/capitulo-1/uhdkvhc3gleae1mo32fh.webp'),
(1322, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328680/mangas/martial-god-regressed-to-level-2/capitulo-1/xxapgg0hcdxnsvyf5dr2.webp'),
(1323, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328683/mangas/martial-god-regressed-to-level-2/capitulo-1/dnyz88vo70dunedxekdg.webp'),
(1324, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328685/mangas/martial-god-regressed-to-level-2/capitulo-1/jeq3mwv96f6h8nvb0okp.webp'),
(1325, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328687/mangas/martial-god-regressed-to-level-2/capitulo-1/hd3zyvwma645r37sxi20.webp'),
(1326, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328689/mangas/martial-god-regressed-to-level-2/capitulo-1/ivlklvsyxvrxaanzgasx.webp'),
(1327, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328691/mangas/martial-god-regressed-to-level-2/capitulo-1/cmahia6yioztpjojb0ma.webp'),
(1328, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328693/mangas/martial-god-regressed-to-level-2/capitulo-1/uvn5glm9g7h9jdeghpjh.webp'),
(1329, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328695/mangas/martial-god-regressed-to-level-2/capitulo-1/zyftifddiv9bdgvhojlf.webp'),
(1330, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328698/mangas/martial-god-regressed-to-level-2/capitulo-1/nmd5xjsqujyxls4zkhni.webp'),
(1331, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328698/mangas/martial-god-regressed-to-level-2/capitulo-1/zkwlz6pdrgvfadjsecwz.webp'),
(1332, 51, 128, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749328700/mangas/martial-god-regressed-to-level-2/capitulo-1/sud6inozbjxc4xgclxji.webp'),
(1333, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337270/mangas/martial-god-regressed-to-level-2/capitulo-2/d7sqryuuwws5zdady6tt.webp'),
(1334, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337273/mangas/martial-god-regressed-to-level-2/capitulo-2/eqpghfnm9twh9xncig6f.webp'),
(1335, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337275/mangas/martial-god-regressed-to-level-2/capitulo-2/bapiivwy0kqmuyvsc6gz.webp'),
(1336, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337277/mangas/martial-god-regressed-to-level-2/capitulo-2/ntijyu4bynwjkjk1wu8a.webp'),
(1337, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337280/mangas/martial-god-regressed-to-level-2/capitulo-2/rbajsvbmvxh6qjzxgxwe.webp'),
(1338, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337282/mangas/martial-god-regressed-to-level-2/capitulo-2/vktrqkxwyd9qip86dkpe.webp'),
(1339, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337284/mangas/martial-god-regressed-to-level-2/capitulo-2/bpwhxozabfus0dqlmrux.webp'),
(1340, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337287/mangas/martial-god-regressed-to-level-2/capitulo-2/hgv9qjvsuecepmdfldmh.webp'),
(1341, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337289/mangas/martial-god-regressed-to-level-2/capitulo-2/yarti6un7pejewzvieb2.webp'),
(1342, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337291/mangas/martial-god-regressed-to-level-2/capitulo-2/e4czcmpvblyp7a3his2w.webp'),
(1343, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337293/mangas/martial-god-regressed-to-level-2/capitulo-2/u1ybywbyg4uzyzrxqxgw.webp'),
(1344, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337295/mangas/martial-god-regressed-to-level-2/capitulo-2/yztsw21ggvzhvuaxaeca.webp'),
(1345, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337297/mangas/martial-god-regressed-to-level-2/capitulo-2/lhzyzdpqeurev9dxhyin.webp'),
(1346, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337300/mangas/martial-god-regressed-to-level-2/capitulo-2/hyoas8v65ayorr94bbdm.webp'),
(1347, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337302/mangas/martial-god-regressed-to-level-2/capitulo-2/fixkiinawysjoas5ntrd.webp'),
(1348, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337305/mangas/martial-god-regressed-to-level-2/capitulo-2/mmjl8ekh2j6cv7et7tyc.webp'),
(1349, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337308/mangas/martial-god-regressed-to-level-2/capitulo-2/d2mz66aevuopmkwvg3wy.webp'),
(1350, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337310/mangas/martial-god-regressed-to-level-2/capitulo-2/bazppxt1mjb6jzcfpjgq.webp'),
(1351, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337312/mangas/martial-god-regressed-to-level-2/capitulo-2/e4et9x6edkawvuxemb80.webp'),
(1352, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337314/mangas/martial-god-regressed-to-level-2/capitulo-2/yfs07d2kj6tjtq2mtzsl.webp'),
(1353, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337315/mangas/martial-god-regressed-to-level-2/capitulo-2/xt9tgaa6xsg3nl92zmk0.webp'),
(1354, 51, 129, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337316/mangas/martial-god-regressed-to-level-2/capitulo-2/y4qfex2zitfm2qpcnsha.webp'),
(1355, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337331/mangas/martial-god-regressed-to-level-2/capitulo-3/i2btz2bk1cl2mbtoshat.webp'),
(1356, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337335/mangas/martial-god-regressed-to-level-2/capitulo-3/jtwrjifndbh3gqh81o7b.webp'),
(1357, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337339/mangas/martial-god-regressed-to-level-2/capitulo-3/qcq4xzrriywe82l8hinf.webp'),
(1358, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337341/mangas/martial-god-regressed-to-level-2/capitulo-3/vfjr1gz9y8wvmwrvkmfx.webp'),
(1359, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337343/mangas/martial-god-regressed-to-level-2/capitulo-3/dmztxrfmjoblfm88yzrd.webp'),
(1360, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337346/mangas/martial-god-regressed-to-level-2/capitulo-3/qryluvtvbdlapqfgx31b.webp'),
(1361, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337348/mangas/martial-god-regressed-to-level-2/capitulo-3/kszeo7woyhylrkf7clte.webp'),
(1362, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337350/mangas/martial-god-regressed-to-level-2/capitulo-3/ok7pu9rowaxt3fpqmo3f.webp'),
(1363, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337353/mangas/martial-god-regressed-to-level-2/capitulo-3/gajncmxnxkz5hordgtmg.webp'),
(1364, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337355/mangas/martial-god-regressed-to-level-2/capitulo-3/zkvk8vo5s6pmx0rtdgho.webp'),
(1365, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337357/mangas/martial-god-regressed-to-level-2/capitulo-3/gqmmacdbh2emnsmwfqzj.webp'),
(1366, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337359/mangas/martial-god-regressed-to-level-2/capitulo-3/sxfbqia9rddb2d0kwfkj.webp'),
(1367, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337361/mangas/martial-god-regressed-to-level-2/capitulo-3/gdomopcglpimetvw3sst.webp'),
(1368, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337364/mangas/martial-god-regressed-to-level-2/capitulo-3/tdwztflv9pnjuk1jut1t.webp'),
(1369, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337366/mangas/martial-god-regressed-to-level-2/capitulo-3/lqtgtvk3jbvttqthmzyh.webp'),
(1370, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337369/mangas/martial-god-regressed-to-level-2/capitulo-3/y5v0bem0gnvs9ieiut53.webp'),
(1371, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337371/mangas/martial-god-regressed-to-level-2/capitulo-3/sm6ygxakcy5drlbiu227.webp'),
(1372, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337374/mangas/martial-god-regressed-to-level-2/capitulo-3/p9sdde8wugp7uvyi58u5.webp'),
(1373, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337376/mangas/martial-god-regressed-to-level-2/capitulo-3/wk1horkmsqhltwdnqc1z.webp'),
(1374, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337378/mangas/martial-god-regressed-to-level-2/capitulo-3/qjtbuhgkrzrwvmx7sr2z.webp'),
(1375, 51, 130, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337379/mangas/martial-god-regressed-to-level-2/capitulo-3/tz4ja56pwe7ddwviertf.webp'),
(1376, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337394/mangas/martial-god-regressed-to-level-2/capitulo-4/ouzvwwjsqxnjqi4udxdt.webp'),
(1377, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337398/mangas/martial-god-regressed-to-level-2/capitulo-4/opkrpgzpgmjosfcbnrux.webp'),
(1378, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337401/mangas/martial-god-regressed-to-level-2/capitulo-4/yxcagfji8cdkngbkhgml.webp'),
(1379, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337404/mangas/martial-god-regressed-to-level-2/capitulo-4/iaxk32w3fjwbg7suehst.webp'),
(1380, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337406/mangas/martial-god-regressed-to-level-2/capitulo-4/kwactrbem9nyjp3bxi8u.webp'),
(1381, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337409/mangas/martial-god-regressed-to-level-2/capitulo-4/deki7hl8xrifez4uwmtd.webp'),
(1382, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337412/mangas/martial-god-regressed-to-level-2/capitulo-4/ydy8la1xnonfrl6zo0bp.webp'),
(1383, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337414/mangas/martial-god-regressed-to-level-2/capitulo-4/nmbdkwvomrx4ogecr0kc.webp'),
(1384, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337416/mangas/martial-god-regressed-to-level-2/capitulo-4/h2pubfxh2qu3q0rzs1jq.webp'),
(1385, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337418/mangas/martial-god-regressed-to-level-2/capitulo-4/qdvg9qby7qmp8b0jjdf9.webp'),
(1386, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337420/mangas/martial-god-regressed-to-level-2/capitulo-4/hhaevrdqvof5mwgp4gv9.webp'),
(1387, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337421/mangas/martial-god-regressed-to-level-2/capitulo-4/t0csxtlx3ygw8lgkrftb.webp'),
(1388, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337423/mangas/martial-god-regressed-to-level-2/capitulo-4/rkzzgj3jgjftjqefkusl.webp'),
(1389, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337425/mangas/martial-god-regressed-to-level-2/capitulo-4/n63frkhghnuvs6xpoeol.webp'),
(1390, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337427/mangas/martial-god-regressed-to-level-2/capitulo-4/gtpnlfilgrjgcllnshzk.webp'),
(1391, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337430/mangas/martial-god-regressed-to-level-2/capitulo-4/nmw09ltubftevyc16icw.webp'),
(1392, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337432/mangas/martial-god-regressed-to-level-2/capitulo-4/kow8mlaxydjmvysk2xnf.webp'),
(1393, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337434/mangas/martial-god-regressed-to-level-2/capitulo-4/mwc9hlckx2zix0a5jn92.webp'),
(1394, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337436/mangas/martial-god-regressed-to-level-2/capitulo-4/ywtjplkug2n7djyi4ex7.webp'),
(1395, 51, 131, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337437/mangas/martial-god-regressed-to-level-2/capitulo-4/zg8ityczw81sqwyzwtwd.webp'),
(1396, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337475/mangas/martial-god-regressed-to-level-2/capitulo-5/k2pag3twblfajgl8inig.webp'),
(1397, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337478/mangas/martial-god-regressed-to-level-2/capitulo-5/ldpepcimvfamlazuzdx6.webp'),
(1398, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337481/mangas/martial-god-regressed-to-level-2/capitulo-5/veg87hwi3esjgcivujpe.webp'),
(1399, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337483/mangas/martial-god-regressed-to-level-2/capitulo-5/dcbk0uij6927cqrxhhkd.webp'),
(1400, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337485/mangas/martial-god-regressed-to-level-2/capitulo-5/p02ocs5efwovt6kczbpn.webp'),
(1401, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337487/mangas/martial-god-regressed-to-level-2/capitulo-5/q6rei8k6yqxwmon9uamb.webp'),
(1402, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337489/mangas/martial-god-regressed-to-level-2/capitulo-5/fanyh3bjuldsiwecckuj.webp'),
(1403, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337492/mangas/martial-god-regressed-to-level-2/capitulo-5/e0mknhr9xechbeleffy3.webp'),
(1404, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337494/mangas/martial-god-regressed-to-level-2/capitulo-5/zgnziqi6kkoebdsbioyo.webp'),
(1405, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337496/mangas/martial-god-regressed-to-level-2/capitulo-5/b32ng2kqdq79iizne0uu.webp'),
(1406, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337498/mangas/martial-god-regressed-to-level-2/capitulo-5/spz3wdz9iaxmm6oodqc1.webp'),
(1407, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337500/mangas/martial-god-regressed-to-level-2/capitulo-5/o69e9zqiaimy0y0eyj24.webp'),
(1408, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337503/mangas/martial-god-regressed-to-level-2/capitulo-5/ucitjcpmb1wvw3yi1ita.webp'),
(1409, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337507/mangas/martial-god-regressed-to-level-2/capitulo-5/tifcigmbhjgwlj0fhv8z.webp'),
(1410, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337508/mangas/martial-god-regressed-to-level-2/capitulo-5/hgjuexqbemjcq3jc0bjl.webp'),
(1411, 51, 132, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337509/mangas/martial-god-regressed-to-level-2/capitulo-5/snk2733qsnbwndk5mati.webp'),
(1412, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337549/mangas/martial-god-regressed-to-level-2/capitulo-6/wmobkec4mhzysuvkav0v.webp'),
(1413, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337552/mangas/martial-god-regressed-to-level-2/capitulo-6/xhh3rsvky7ybwbbaltzj.webp'),
(1414, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337554/mangas/martial-god-regressed-to-level-2/capitulo-6/tagrepmi63cp9vahzuqx.webp'),
(1415, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337556/mangas/martial-god-regressed-to-level-2/capitulo-6/dshiqgo87er8afdt2rmf.webp'),
(1416, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337558/mangas/martial-god-regressed-to-level-2/capitulo-6/u8eejy7jbltq3lwpbhwy.webp'),
(1417, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337561/mangas/martial-god-regressed-to-level-2/capitulo-6/dg5a8vtk8vgehpzcxcxz.webp'),
(1418, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337564/mangas/martial-god-regressed-to-level-2/capitulo-6/ayj0hjctkhrfkfy26znn.webp'),
(1419, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337566/mangas/martial-god-regressed-to-level-2/capitulo-6/k8hsy8rrxkfg5pz5u3g5.webp'),
(1420, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337568/mangas/martial-god-regressed-to-level-2/capitulo-6/d1yhgzfi5uhc5ffyjvgu.webp'),
(1421, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337571/mangas/martial-god-regressed-to-level-2/capitulo-6/xi7paymjjl4hxjmbvnyq.webp'),
(1422, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337573/mangas/martial-god-regressed-to-level-2/capitulo-6/hb5s2ncxfjyttlufdfeu.webp'),
(1423, 51, 133, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337575/mangas/martial-god-regressed-to-level-2/capitulo-6/xf5yjzc2ator3i0mx9g8.webp'),
(1424, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337592/mangas/martial-god-regressed-to-level-2/capitulo-7/wopscvkrry8ij6u5ev7p.webp'),
(1425, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337595/mangas/martial-god-regressed-to-level-2/capitulo-7/vz0uasy5o0kzqmdrftnb.webp'),
(1426, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337597/mangas/martial-god-regressed-to-level-2/capitulo-7/rmrexkanbzhag262wbtl.webp'),
(1427, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337600/mangas/martial-god-regressed-to-level-2/capitulo-7/tyd7g1fyrcg30iu8ftbn.webp'),
(1428, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337603/mangas/martial-god-regressed-to-level-2/capitulo-7/khmxtiyzvq2qcytl9y06.webp'),
(1429, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337605/mangas/martial-god-regressed-to-level-2/capitulo-7/znf6pvjvlecesig7hy2v.webp'),
(1430, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337608/mangas/martial-god-regressed-to-level-2/capitulo-7/bdc0oondhakdhuntspbt.webp'),
(1431, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337610/mangas/martial-god-regressed-to-level-2/capitulo-7/xvufcdkndyzgu8kf4ypa.webp'),
(1432, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337612/mangas/martial-god-regressed-to-level-2/capitulo-7/gvy1jroogjo5y569qmzq.webp'),
(1433, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337614/mangas/martial-god-regressed-to-level-2/capitulo-7/iijooztbuwhmesygkarw.webp'),
(1434, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337616/mangas/martial-god-regressed-to-level-2/capitulo-7/d0zzyaamvsn1mcmupenv.webp'),
(1435, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337620/mangas/martial-god-regressed-to-level-2/capitulo-7/ouwbuyzncxo3zar5ghbf.webp'),
(1436, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337622/mangas/martial-god-regressed-to-level-2/capitulo-7/d7exsh1iadja1g7b5eek.webp'),
(1437, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337625/mangas/martial-god-regressed-to-level-2/capitulo-7/ggadcml0akjjgzs8iedj.webp'),
(1438, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337628/mangas/martial-god-regressed-to-level-2/capitulo-7/ij6gdrxupffslnjbhycv.webp'),
(1439, 51, 134, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337629/mangas/martial-god-regressed-to-level-2/capitulo-7/lry9njml0wjactiz0b76.webp'),
(1440, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337649/mangas/martial-god-regressed-to-level-2/capitulo-8/b8gwx5olc0eofot2bqh2.webp'),
(1441, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337652/mangas/martial-god-regressed-to-level-2/capitulo-8/getusrbritxf8ocp6xa5.webp'),
(1442, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337654/mangas/martial-god-regressed-to-level-2/capitulo-8/bmpnoom95d5ikiqow42i.webp'),
(1443, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337657/mangas/martial-god-regressed-to-level-2/capitulo-8/yemur7i310pi4wzyclga.webp'),
(1444, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337659/mangas/martial-god-regressed-to-level-2/capitulo-8/exn8zqv9plotlbxdv6ln.webp'),
(1445, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337661/mangas/martial-god-regressed-to-level-2/capitulo-8/yvur2w9lneirdf35ps7w.webp'),
(1446, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337663/mangas/martial-god-regressed-to-level-2/capitulo-8/dke3zzgdkqr5a63iekrh.webp'),
(1447, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337665/mangas/martial-god-regressed-to-level-2/capitulo-8/qweqg1rz6mhumubcpsel.webp'),
(1448, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337667/mangas/martial-god-regressed-to-level-2/capitulo-8/jyxr45nvpo0ttihb4vfx.webp'),
(1449, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337669/mangas/martial-god-regressed-to-level-2/capitulo-8/uvzguuotjuh0exw40t3n.webp'),
(1450, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337671/mangas/martial-god-regressed-to-level-2/capitulo-8/b2j9l6bnxs8qencbuvv8.webp'),
(1451, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337674/mangas/martial-god-regressed-to-level-2/capitulo-8/hdqmqop3sdjneypwnk5a.webp'),
(1452, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337675/mangas/martial-god-regressed-to-level-2/capitulo-8/kqex76htgx29ywsk7cq2.webp'),
(1453, 51, 135, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337676/mangas/martial-god-regressed-to-level-2/capitulo-8/wpra0lxclkukjxqnampu.webp'),
(1454, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337688/mangas/martial-god-regressed-to-level-2/capitulo-9/luwhspqlk6qnhkbgfycz.webp'),
(1455, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337691/mangas/martial-god-regressed-to-level-2/capitulo-9/o1pbd6jyzyav7gblzxif.webp'),
(1456, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337693/mangas/martial-god-regressed-to-level-2/capitulo-9/zcdnwid272ccwprdxx6g.webp'),
(1457, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337695/mangas/martial-god-regressed-to-level-2/capitulo-9/umqhtcot2g4lr5qon4fz.webp'),
(1458, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337697/mangas/martial-god-regressed-to-level-2/capitulo-9/ubxpky3u8bzy4iasu6ok.webp'),
(1459, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337699/mangas/martial-god-regressed-to-level-2/capitulo-9/pziqjyxipshdawjsuaee.webp'),
(1460, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337701/mangas/martial-god-regressed-to-level-2/capitulo-9/ed6ysfi22mwlzl3ksg62.webp'),
(1461, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337704/mangas/martial-god-regressed-to-level-2/capitulo-9/eaq8caoqzoxft47otpyx.webp'),
(1462, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337706/mangas/martial-god-regressed-to-level-2/capitulo-9/ynotnthchv3su9otwhrf.webp'),
(1463, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337708/mangas/martial-god-regressed-to-level-2/capitulo-9/hfxl7mne1u5vuwqx2tsu.webp'),
(1464, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337711/mangas/martial-god-regressed-to-level-2/capitulo-9/nleko4pou4rmfgqjzaea.webp'),
(1465, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337714/mangas/martial-god-regressed-to-level-2/capitulo-9/hxhfuwmufqrktjgdmibs.webp'),
(1466, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337717/mangas/martial-god-regressed-to-level-2/capitulo-9/ycsqmqyerzl1xhzpcq08.webp'),
(1467, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337720/mangas/martial-god-regressed-to-level-2/capitulo-9/mbhj01r1blcljzffjts9.webp'),
(1468, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337721/mangas/martial-god-regressed-to-level-2/capitulo-9/bmgessbcks9thgmisdyd.webp'),
(1469, 51, 136, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337722/mangas/martial-god-regressed-to-level-2/capitulo-9/mkahexflxbsexmaraayh.webp'),
(1470, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337765/mangas/solo-leveling/capitulo-1/qlpnwchyslvh8p3rbubp.webp'),
(1471, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337767/mangas/solo-leveling/capitulo-1/dknps3ulnwzgllii9uhe.webp'),
(1472, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337768/mangas/solo-leveling/capitulo-1/iruyvwxdnj2pzdv7qpze.webp'),
(1473, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337769/mangas/solo-leveling/capitulo-1/vwiqiurry4qlcwiu9oxx.webp'),
(1474, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337771/mangas/solo-leveling/capitulo-1/pntdjyjjttotaflowzus.webp'),
(1475, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337772/mangas/solo-leveling/capitulo-1/zjtxpk0wwvzbz1yccmuz.webp'),
(1476, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337773/mangas/solo-leveling/capitulo-1/zixq1s3tk6c9h2suohsf.webp'),
(1477, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337775/mangas/solo-leveling/capitulo-1/pqhaqpeoe70hnbalxisc.webp'),
(1478, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337776/mangas/solo-leveling/capitulo-1/j8b23xcvsvfrwxng6swj.webp'),
(1479, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337777/mangas/solo-leveling/capitulo-1/hci9dozinputzp56zbyv.webp'),
(1480, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337778/mangas/solo-leveling/capitulo-1/zfzn22f1jox3vlneuboe.webp'),
(1481, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337779/mangas/solo-leveling/capitulo-1/izkylgllasqlwkclssgr.webp'),
(1482, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337781/mangas/solo-leveling/capitulo-1/ambc5vb7l073nnboa4d4.webp'),
(1483, 49, 123, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337782/mangas/solo-leveling/capitulo-1/r9sxysvrhn9rnlpqymah.webp'),
(1484, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337794/mangas/solo-leveling/capitulo-2/w5cnqzkhbtccyxzsy7a8.webp'),
(1485, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337796/mangas/solo-leveling/capitulo-2/hsd3uhybsxhdqpc6k82r.webp'),
(1486, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337797/mangas/solo-leveling/capitulo-2/ldygkmkw5tn0idc1sui8.webp'),
(1487, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337799/mangas/solo-leveling/capitulo-2/f1fuwcz2f5f8sxjoxukq.webp'),
(1488, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337800/mangas/solo-leveling/capitulo-2/s5ez7rw6kh76me60lvrf.webp'),
(1489, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337801/mangas/solo-leveling/capitulo-2/tmnwktmzjelmdxot9bwb.webp'),
(1490, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337803/mangas/solo-leveling/capitulo-2/oy3ukiab160hsizpfxic.webp'),
(1491, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337804/mangas/solo-leveling/capitulo-2/akkytn9m6qo2bdflyysi.webp'),
(1492, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337806/mangas/solo-leveling/capitulo-2/hmrel7dejwd43h3cpk4h.webp'),
(1493, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337807/mangas/solo-leveling/capitulo-2/mhokskzjhztv6339qxfp.webp'),
(1494, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337809/mangas/solo-leveling/capitulo-2/jqis6cyxfsry5sjce81n.webp'),
(1495, 49, 124, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337810/mangas/solo-leveling/capitulo-2/kvzd5t0p1vewm2yn6tl1.webp'),
(1496, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337827/mangas/solo-leveling/capitulo-3/tsbtspnrqnn8gtrdzop3.webp'),
(1497, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337828/mangas/solo-leveling/capitulo-3/apt6d4tf3pnwvnqkdwbg.webp'),
(1498, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337829/mangas/solo-leveling/capitulo-3/nwsbkeg6u8o4gq4mm4be.webp'),
(1499, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337831/mangas/solo-leveling/capitulo-3/spuydqbiakvsokd9qsol.webp'),
(1500, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337832/mangas/solo-leveling/capitulo-3/htj6tu1w94qpm9tz8iqg.webp'),
(1501, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337833/mangas/solo-leveling/capitulo-3/auxsbgla1jqdrzuvii9i.webp'),
(1502, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337834/mangas/solo-leveling/capitulo-3/kfhdw09nyyzfc805rudi.webp'),
(1503, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337836/mangas/solo-leveling/capitulo-3/pbpgm08e5cjpygffsf9c.webp'),
(1504, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337837/mangas/solo-leveling/capitulo-3/uk2ntitx1rkgrlejyy2d.webp'),
(1505, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337839/mangas/solo-leveling/capitulo-3/s03me9zthc5rudn81ibx.webp'),
(1506, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337841/mangas/solo-leveling/capitulo-3/vpzgugmzyighzxehbbsk.webp'),
(1507, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337842/mangas/solo-leveling/capitulo-3/lkfxjwau1obmpyutvbxl.webp'),
(1508, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337843/mangas/solo-leveling/capitulo-3/kges5uoygfzjyvda6voa.webp'),
(1509, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337844/mangas/solo-leveling/capitulo-3/i3ldr57ikotmrfhxoboy.webp'),
(1510, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337846/mangas/solo-leveling/capitulo-3/ufaonvoieatdeywzfe0y.webp'),
(1511, 49, 137, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337848/mangas/solo-leveling/capitulo-3/keplejbapzyzqeyy2gc5.webp'),
(1512, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337891/mangas/solo-leveling/capitulo-4/n2pyulaaneidms2va776.webp'),
(1513, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337892/mangas/solo-leveling/capitulo-4/kb5zs9j4skd9fl6kzp5b.webp'),
(1514, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337894/mangas/solo-leveling/capitulo-4/hrtnmfdeintkqkqk2ahl.webp'),
(1515, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337895/mangas/solo-leveling/capitulo-4/ym6cxq7ffukssjv6gaei.webp'),
(1516, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337897/mangas/solo-leveling/capitulo-4/zfxkiedoclzigcq9thva.webp'),
(1517, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337899/mangas/solo-leveling/capitulo-4/wsrcy7asnylqjkqf9fyz.webp'),
(1518, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337900/mangas/solo-leveling/capitulo-4/ah72hl7sye4bx0c72dkg.webp'),
(1519, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337901/mangas/solo-leveling/capitulo-4/zaibakm1mh3knjadzn8n.webp'),
(1520, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337902/mangas/solo-leveling/capitulo-4/vuhnwmhjodrdwfxzzhw0.webp'),
(1521, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337903/mangas/solo-leveling/capitulo-4/o2obp34fph4lsnhipphs.webp'),
(1522, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337905/mangas/solo-leveling/capitulo-4/ijblagrccsms5mdeeylz.webp'),
(1523, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337906/mangas/solo-leveling/capitulo-4/cmzm7bykvlhhtgip2yki.webp'),
(1524, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337908/mangas/solo-leveling/capitulo-4/enqu1zhjqcuse5ge4hhr.webp'),
(1525, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337909/mangas/solo-leveling/capitulo-4/no75i669cypggx5hd6dv.webp'),
(1526, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337910/mangas/solo-leveling/capitulo-4/m8tmajdgij4npbc46blk.webp'),
(1527, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337912/mangas/solo-leveling/capitulo-4/gjdnl0tvq4k7iytvhgpw.webp'),
(1528, 49, 138, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337913/mangas/solo-leveling/capitulo-4/vnjsnizyb47cy3jiddpd.webp'),
(1529, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337957/mangas/solo-leveling/capitulo-5/lswb7wr05o9owshx2g9b.webp'),
(1530, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337958/mangas/solo-leveling/capitulo-5/tykdb9ijctjulesgtsrp.webp'),
(1531, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337960/mangas/solo-leveling/capitulo-5/pxiqysj8x42mm7mai3vk.webp'),
(1532, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337962/mangas/solo-leveling/capitulo-5/a9btmrluu5lna56hihxl.webp'),
(1533, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337964/mangas/solo-leveling/capitulo-5/japy6ihjvcdwrecdhmsq.webp'),
(1534, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337965/mangas/solo-leveling/capitulo-5/fctf7e1olu0bqm23ixly.webp'),
(1535, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337967/mangas/solo-leveling/capitulo-5/knn84oufesfg5ujztflw.webp'),
(1536, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337969/mangas/solo-leveling/capitulo-5/yfxrv1dfac8dthg31pty.webp'),
(1537, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337971/mangas/solo-leveling/capitulo-5/celcz58beqorehw2jx7v.webp'),
(1538, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337972/mangas/solo-leveling/capitulo-5/yur3k12toj4majvwybmp.webp'),
(1539, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337973/mangas/solo-leveling/capitulo-5/cn9xcflgglqbi9ls2370.webp'),
(1540, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337975/mangas/solo-leveling/capitulo-5/zzpsy1iy72sflucgj40b.webp'),
(1541, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337976/mangas/solo-leveling/capitulo-5/tvbt3lgk3bvnppxb4loc.webp'),
(1542, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337977/mangas/solo-leveling/capitulo-5/j2sjpuqmbepbpmldbo0x.webp'),
(1543, 49, 139, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749337979/mangas/solo-leveling/capitulo-5/ub4hv7ia998ume9c1wph.webp'),
(1544, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338006/mangas/solo-leveling/capitulo-6/s5wzfbgzys6cxaxa5wzs.webp'),
(1545, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338008/mangas/solo-leveling/capitulo-6/a3tiplgnda83d7dgfkzx.webp'),
(1546, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338009/mangas/solo-leveling/capitulo-6/doovpb0pmtnxgzzbwmez.webp');
INSERT INTO `paginas` (`id_pagina`, `id_manga`, `id_capitulos`, `caminho_pagina`) VALUES
(1547, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338011/mangas/solo-leveling/capitulo-6/jvrawm80npoqgztm4trd.webp'),
(1548, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338013/mangas/solo-leveling/capitulo-6/itjfdvgsi01e5ftsaedy.webp'),
(1549, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338014/mangas/solo-leveling/capitulo-6/fpjvyax4o4byk7fk66bl.webp'),
(1550, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338016/mangas/solo-leveling/capitulo-6/mm2hmu4wnlhxqnep8yml.webp'),
(1551, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338017/mangas/solo-leveling/capitulo-6/xrj4cp66yatyp1y4c6c0.webp'),
(1552, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338018/mangas/solo-leveling/capitulo-6/npzxpi8gacb2no0lxs5f.webp'),
(1553, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338020/mangas/solo-leveling/capitulo-6/wba2wez1j5mansjoyuzm.webp'),
(1554, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338021/mangas/solo-leveling/capitulo-6/l50mbhwwycdh8fwdiywr.webp'),
(1555, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338023/mangas/solo-leveling/capitulo-6/ei4geh0aprrvkqi7w19q.webp'),
(1556, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338025/mangas/solo-leveling/capitulo-6/le6n7pilop2wkbcndgnf.webp'),
(1557, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338026/mangas/solo-leveling/capitulo-6/qzsbuzbii5p4xiojjrx4.webp'),
(1558, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338028/mangas/solo-leveling/capitulo-6/vszvwg4o3ojdcxtbersl.webp'),
(1559, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338029/mangas/solo-leveling/capitulo-6/s8itmcgoulvuuixv4hep.webp'),
(1560, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338030/mangas/solo-leveling/capitulo-6/yr24mcttlkkop3so6awy.webp'),
(1561, 49, 140, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338031/mangas/solo-leveling/capitulo-6/oplhfsjp9qdrlkpvotqx.webp'),
(1562, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338131/mangas/solo-leveling/capitulo-7/x8h1s6mdcwvnk9rxoc8b.webp'),
(1563, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338132/mangas/solo-leveling/capitulo-7/xj8a474wjjxwa3o2wo1a.webp'),
(1564, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338134/mangas/solo-leveling/capitulo-7/hug7hy6cq4g6y4c6osev.webp'),
(1565, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338135/mangas/solo-leveling/capitulo-7/ujee2mpgajojaprb48qk.webp'),
(1566, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338137/mangas/solo-leveling/capitulo-7/ia2m6mxrafjjcwzqjjte.webp'),
(1567, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338138/mangas/solo-leveling/capitulo-7/h1ungrmzob9yzihxqy7t.webp'),
(1568, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338139/mangas/solo-leveling/capitulo-7/x26ibhz3basmwv8wqnbl.webp'),
(1569, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338141/mangas/solo-leveling/capitulo-7/djlmslahwi05wqzvnt6o.webp'),
(1570, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338142/mangas/solo-leveling/capitulo-7/ict5y0ezqhefftw0a2kl.webp'),
(1571, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338144/mangas/solo-leveling/capitulo-7/k0zkxefvljql2yl7i8id.webp'),
(1572, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338145/mangas/solo-leveling/capitulo-7/ywvrrxn0hg5mmjiuakpz.webp'),
(1573, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338147/mangas/solo-leveling/capitulo-7/ccb2efmqnpaylxs4jpje.webp'),
(1574, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338149/mangas/solo-leveling/capitulo-7/cuj0hpqhjtowqa6x8lkc.webp'),
(1575, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338150/mangas/solo-leveling/capitulo-7/lyhjtnfb54mh5t5lampq.webp'),
(1576, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338152/mangas/solo-leveling/capitulo-7/y4jjyztzipgxxeyfhj7v.webp'),
(1577, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338154/mangas/solo-leveling/capitulo-7/edag47eb0p1dkz3degxn.webp'),
(1578, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338155/mangas/solo-leveling/capitulo-7/mqyjjjhuijzkayhp3bqp.webp'),
(1579, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338157/mangas/solo-leveling/capitulo-7/eunmhnivkhr884kqzupy.webp'),
(1580, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338159/mangas/solo-leveling/capitulo-7/dvqnjgty5fjxkiuljeeu.webp'),
(1581, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338161/mangas/solo-leveling/capitulo-7/m72jgojqihha3pwb8krm.webp'),
(1582, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338163/mangas/solo-leveling/capitulo-7/dqyrtbugps2h7qtrixhr.webp'),
(1583, 49, 141, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338164/mangas/solo-leveling/capitulo-7/w4pvrt4qvmshcxxrg2mq.webp'),
(1584, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338220/mangas/solo-leveling/capitulo-8/dyockdyjzydum7tahqvt.webp'),
(1585, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338222/mangas/solo-leveling/capitulo-8/zqbtfr2d7uv7vtfsp9mo.webp'),
(1586, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338223/mangas/solo-leveling/capitulo-8/isx0brqmhb0pvgaqviue.webp'),
(1587, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338225/mangas/solo-leveling/capitulo-8/sb6shwxkldczxvxkra3h.webp'),
(1588, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338226/mangas/solo-leveling/capitulo-8/jo5avilms4fady4ktj6z.webp'),
(1589, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338228/mangas/solo-leveling/capitulo-8/e2kp4owoeyyz7gh7gns1.webp'),
(1590, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338230/mangas/solo-leveling/capitulo-8/j7mhzgbv9f8zdtvhug1x.webp'),
(1591, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338231/mangas/solo-leveling/capitulo-8/t6mveivthynjjazv94xk.webp'),
(1592, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338235/mangas/solo-leveling/capitulo-8/t6jmzo0udtsjbcgt6pru.webp'),
(1593, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338237/mangas/solo-leveling/capitulo-8/co5xyboiegvmlaqlwao6.webp'),
(1594, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338238/mangas/solo-leveling/capitulo-8/ctzcxtattaujz7ub7jeg.webp'),
(1595, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338239/mangas/solo-leveling/capitulo-8/ejr8yxdvx7ka552elspq.webp'),
(1596, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338240/mangas/solo-leveling/capitulo-8/p2m8leh9oqy9dmkvwuni.webp'),
(1597, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338241/mangas/solo-leveling/capitulo-8/uvnzbltnfjo190kfy8xi.webp'),
(1598, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338243/mangas/solo-leveling/capitulo-8/bojbgxmcba8sdy8np33f.webp'),
(1599, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338244/mangas/solo-leveling/capitulo-8/wmpgfkevnbrulmuupv8h.webp'),
(1600, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338245/mangas/solo-leveling/capitulo-8/sgf5z0gucpwexejymtrh.webp'),
(1601, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338247/mangas/solo-leveling/capitulo-8/rhcklp7brzh54jdqabjv.webp'),
(1602, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338248/mangas/solo-leveling/capitulo-8/yuimznjyiptdcp0uafej.webp'),
(1603, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338250/mangas/solo-leveling/capitulo-8/kiukvp4dbrrqxjknqt5i.webp'),
(1604, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338251/mangas/solo-leveling/capitulo-8/j5cudytrlchmwxuedala.webp'),
(1605, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338252/mangas/solo-leveling/capitulo-8/ggfdrju7lkocu2z9aoxm.webp'),
(1606, 49, 142, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1749338253/mangas/solo-leveling/capitulo-8/uxploehz5ugnjtf2vxzb.webp');

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
(28, 'mutt', 'lokanrockyou@gmail.com', '$2y$10$6I2O.TdMHdfk/3EODYZy/eDUYfpA7g1Ct3tAGA2DDeq3VMsqGNHbi', 'user', '2025-06-03 21:58:39', NULL, NULL),
(30, 'editor.test', 'areanaread.editor@mailinator.com', '$2y$10$Jb/ag/14RtF8i6eyYgvsLOqRZ3/DeHqMxVNvEV6T..cxvTqJS3ebm', 'editor', '2025-06-07 23:25:09', NULL, NULL),
(31, 'admin.test', 'areanaread.admin@mailinator.com', '$2y$10$9nKXggO3vdZqMcFaAvf3/OURDl3J8Xm4SINXhkcXfyrsPW93fRCau', 'admin', '2025-06-07 23:29:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_progress`
--

CREATE TABLE `user_progress` (
  `id_user_progress` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `id_capitulo` int(11) NOT NULL,
  `data_leitura` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `user_progress`
--

INSERT INTO `user_progress` (`id_user_progress`, `id_user`, `id_manga`, `id_capitulo`, `data_leitura`) VALUES
(49, 1, 50, 120, '2025-06-06 11:54:29'),
(50, 1, 50, 116, '2025-06-06 10:32:23'),
(54, 1, 50, 117, '2025-06-06 11:52:14'),
(61, 28, 50, 117, '2025-06-06 11:55:12'),
(62, 1, 49, 122, '2025-06-07 21:22:56'),
(71, 1, 51, 128, '2025-06-07 21:38:24');

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
-- Índices para tabela `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id_user_progress`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_manga`,`id_capitulo`),
  ADD KEY `id_manga` (`id_manga`),
  ADD KEY `id_capitulo` (`id_capitulo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `capitulos`
--
ALTER TABLE `capitulos`
  MODIFY `id_capitulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id do manga', AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  MODIFY `id_manga_generos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1607;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único do utilizador\r\n', AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id_user_progress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
-- Limitadores para a tabela `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`),
  ADD CONSTRAINT `user_progress_ibfk_3` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulos` (`id_capitulos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
