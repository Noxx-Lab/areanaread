-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Jun-2025 às 12:24
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
(14, 4, 1, '2025-06-25 15:56:17'),
(15, 4, 2, '2025-06-25 15:56:18'),
(16, 4, 3, '2025-06-25 15:56:19'),
(18, 3, 1, '2025-06-25 15:56:23'),
(19, 3, 2, '2025-06-25 15:56:24'),
(20, 3, 3, '2025-06-25 15:56:25'),
(22, 3, 4, '2025-06-26 09:51:34'),
(23, 3, 5, '2025-06-26 09:52:44'),
(24, 3, 6, '2025-06-26 09:52:45'),
(25, 3, 7, '2025-06-26 09:52:46'),
(26, 3, 8, '2025-06-26 09:52:49'),
(27, 3, 9, '2025-06-26 09:52:50'),
(28, 3, 10, '2025-06-26 09:52:53'),
(29, 3, 11, '2025-06-26 09:52:54'),
(34, 4, 4, '2025-06-26 10:00:41'),
(35, 4, 5, '2025-06-26 10:00:42'),
(36, 4, 6, '2025-06-26 10:00:44'),
(37, 4, 7, '2025-06-26 10:00:45'),
(41, 3, 12, '2025-06-26 10:05:29'),
(42, 3, 13, '2025-06-26 10:05:32'),
(43, 3, 14, '2025-06-26 10:05:34'),
(44, 3, 15, '2025-06-26 10:05:39'),
(45, 6, 1, '2025-06-26 10:23:21'),
(46, 6, 2, '2025-06-26 10:23:22'),
(47, 6, 3, '2025-06-26 10:23:23'),
(48, 5, 1, '2025-06-26 10:57:07'),
(49, 5, 2, '2025-06-26 10:57:08'),
(50, 5, 3, '2025-06-26 10:57:09'),
(51, 5, 4, '2025-06-26 10:57:10'),
(52, 10, 1, '2025-06-26 11:09:57'),
(53, 10, 2, '2025-06-26 11:09:58'),
(54, 10, 3, '2025-06-26 11:09:59'),
(55, 10, 4, '2025-06-26 11:09:59'),
(56, 11, 1, '2025-06-26 11:10:03'),
(57, 11, 2, '2025-06-26 11:10:04'),
(58, 11, 3, '2025-06-26 11:10:05'),
(59, 11, 4, '2025-06-26 11:10:06'),
(60, 8, 0, '2025-06-26 11:10:12'),
(61, 8, 1, '2025-06-26 11:10:13'),
(62, 8, 2, '2025-06-26 11:10:14'),
(63, 8, 3, '2025-06-26 11:10:15'),
(64, 9, 0, '2025-06-26 11:10:20'),
(65, 9, 1, '2025-06-26 11:10:21'),
(66, 9, 2, '2025-06-26 11:10:21'),
(67, 9, 3, '2025-06-26 11:10:22'),
(68, 7, 1, '2025-06-26 11:10:29'),
(69, 7, 2, '2025-06-26 11:10:30'),
(70, 7, 3, '2025-06-26 11:10:31'),
(71, 7, 4, '2025-06-26 11:10:31');

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
(3, 'Warrior High School – Dungeon Raid Department', 'warrior-high-school-dungeon-raid-department', 'Manhwa', 'Ongoing', 'Num mundo onde os calabouços surgem misteriosamente, a humanidade precisa de caçadores para proteger a paz. No Warrior High School, os alunos treinam para se tornarem caçadores de elite. Entre eles, surge um jovem com um passado misterioso e um talento extraordinário para o combate. Quando monstros atacam, o Departamento de Dungeon Raid é a primeira linha de defesa, e a sobrevivência da humanidade depende do trabalho desta equipa.', 'Park Minseo (박민서)', 'Jo Hyunhwan (조현환)', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863281/capas/phpDFB4_lzx0c9.jpg'),
(4, 'Superhuman Battlefield', 'superhuman-battlefield', 'Manhwa', 'Ongoing', 'O mundo foi abalado por uma guerra onde super-humanos enfrentaram monstros vindos de outras dimensões. Entre eles, Seo MoonYeop, o herói lendário, foi o responsável por salvar a humanidade.\r\nMas, após o fim da guerra, Seo MoonYeop foi injustamente esquecido e tornou-se apenas mais um rosto anónimo na multidão. Agora, com o ressurgimento das batalhas e o perigo a aumentar, ele decide regressar à arena para mostrar novamente o seu poder e provar que é, de facto, o herói mais forte do mundo.\r\nPreparem-se para uma história épica onde o combate entre super-humanos e monstros define o destino da Terra!', 'Niccolo', 'Plan A', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863346/capas/phpDD6E_ql1c8g.png'),
(5, 'Terminally-Ill Genius Dark Knight', 'terminally-ill-genius-dark-knight', 'Manhwa', 'Ongoing', 'O protagonista é diagnosticado com uma doença terminal e tem apenas seis meses de vida. Mas, antes de morrer, ele é transportado para um jogo de realidade virtual onde assume o papel de um Cavaleiro Negro, uma das classes mais poderosas e temidas.\r\nAgora, com o tempo contado tanto na vida real como no jogo, ele decide viver sem arrependimentos, desafiando chefes, monstros e até o próprio sistema do jogo, usando a sua inteligência superior para contornar obstáculos impossíveis.\r\nCom o poder do Dark Knight e a sua mente genial, ele pretende mudar o destino, custe o que custar!', 'Jung Seon Yul', 'Nagi', 2023, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750929104/capas/php8268_gzipum.jpg'),
(6, 'Reincarnation of the Suicidal Battle God', 'reincarnation-of-the-suicidal-battle-god', 'Manhwa', 'Hiatus', 'O mundo foi devastado por seres demoníacos, e apenas um homem conseguiu enfrentá-los até ao fim – Zephyr, o último herói da humanidade. Contudo, depois de perder tudo, ele acaba por tirar a própria vida... só para acordar 10 anos no passado. Agora com o conhecimento do futuro e sede de vingança, Zephyr promete mudar o destino da humanidade e vingar-se dos deuses que o abandonaram.', 'Cheong Dam', 'Studio 8', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750929718/capas/phpDF23_mk3ad1.gif'),
(7, 'Versatile Mage', 'versatile-mage', 'Manhua', 'Finalizado', 'Mo Fan é um estudante comum, até que um dia, misteriosamente, o mundo à sua volta muda. Na nova realidade, a magia substituiu a ciência, e os magos são a elite da sociedade. Apesar de vir de uma família pobre, Mo Fan descobre que possui um talento raro: consegue controlar vários elementos mágicos, ao contrário dos outros magos que só conseguem controlar um!\r\nAgora, com a ajuda dos seus amigos, incluindo Mu Ningxue (magia de gelo) e Xu Zhaoting (magia de relâmpago), Mo Fan enfrenta monstros, inimigos poderosos e tenta sobreviver num mundo repleto de perigos mágicos, tudo enquanto luta para proteger a sua família e os seus amigos.', 'Luan (乱)', 'Domingo (哆啦)', 2016, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932102/capas/php48DE_utyute.jpg'),
(8, 'Solo Leveling', 'solo-leveling', 'Manhwa', 'Finalizado', 'Num mundo onde portais misteriosos ligam a Terra a dimensões repletas de monstros, apenas caçadores com habilidades especiais conseguem entrar e lutar.\r\nSung Jin-Woo, conhecido como o \"Caçador Mais Fraco do Mundo\", luta para sobreviver como um E-rank. No entanto, tudo muda quando ele enfrenta uma dungeon secreta e recebe uma oportunidade única: tornar-se um Jogador com a habilidade de \"subir de nível\" — algo que ninguém mais consegue fazer.\r\nCom o seu novo poder, Sung Jin-Woo começa a desafiar monstros, chefes e até outros caçadores, evoluindo de um fraco a uma lenda inigualável.', 'Chugong', 'Jang Sung-rak (REDICE Studio)', 2018, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932588/capas/phpAAA8_bxrzom.jpg'),
(9, 'Solo Max-Level Newbie', 'solo-max-level-newbie', 'Manhwa', 'Ongoing', 'Jinhyuk é um streamer conhecido por jogar o jogo Tower of Trials, mas quando o jogo perde popularidade e ele se prepara para encerrar a carreira... a torre misteriosamente aparece no mundo real.\r\nO que para muitos é um apocalipse, para Jinhyuk é uma oportunidade: ele é o único jogador que conhece os segredos e estratégias de cada andar, cada boss e cada puzzle, pois foi o único a terminar o jogo no nível máximo.\r\nCom o seu conhecimento avançado e inteligência estratégica, Jinhyuk sobe a torre enquanto outros tentam apenas sobreviver — e rapidamente deixa de ser apenas um streamer para se tornar uma lenda.', 'Jang Sung-Lak', 'Bat, Redice Studio', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932255/capas/php9715_y07nvf.png'),
(10, 'Martial God Regressed to Level 2', 'martial-god-regressed-to-level-2', 'Manhwa', 'Ongoing', 'O lendário Deus Marcial salvou o mundo da destruição ao derrotar a ameaça final. No entanto, após a vitória, percebe que tudo o que resta é solidão... até que algo inesperado acontece: ele regressa misteriosamente no tempo ao seu nível 2, quando ainda era um guerreiro iniciante.\r\nAgora, com todo o conhecimento e habilidades da sua vida passada, ele tem uma nova chance para corrigir erros, proteger os que ama e subir novamente ao topo — mas desta vez, de forma ainda mais brutal e eficiente.\r\nUma segunda oportunidade para dominar tudo... desde o início!', 'Yeombi', 'Ah Yoongu', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932401/capas/phpD3E7_egeskp.jpg'),
(11, 'Nano Machine', 'nano-machine', 'Manhwa', 'Ongoing', 'Cheon Yeo-Woon, um bastardo esquecido da Ordem Demoníaca, vive uma vida marcada por traições e desprezo. Mas tudo muda quando um misterioso descendente do futuro aparece e lhe injeta uma nanomáquina avançada.\r\nCom esta tecnologia que aumenta drasticamente as suas habilidades físicas, mentais e de combate, Yeo-Woon começa a trilhar o caminho rumo ao trono da seita demoníaca — enfrentando clãs, rivais, mestres de artes marciais e inimigos políticos, enquanto evolui mais rápido do que qualquer cultivador da sua era.\r\nEle deixará de ser um peão para se tornar o rei de todos.', 'Hanjoong Wolya', 'Indestructible', 2020, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932514/capas/php88EB_zky7nv.jpg');

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
(17, 3, 1),
(18, 3, 2),
(19, 3, 3),
(20, 3, 6),
(21, 3, 7),
(22, 3, 10),
(23, 3, 14),
(24, 3, 20),
(25, 4, 1),
(26, 4, 2),
(27, 4, 3),
(28, 4, 4),
(29, 4, 6),
(30, 4, 7),
(31, 4, 10),
(32, 4, 14),
(34, 4, 20),
(33, 4, 51),
(35, 5, 1),
(36, 5, 2),
(37, 5, 3),
(38, 5, 7),
(39, 5, 10),
(40, 5, 11),
(41, 5, 14),
(42, 5, 20),
(43, 5, 23),
(44, 6, 1),
(45, 6, 3),
(46, 6, 6),
(47, 6, 7),
(48, 6, 10),
(49, 6, 16),
(50, 6, 20),
(51, 7, 1),
(52, 7, 3),
(53, 7, 5),
(54, 7, 7),
(55, 7, 10),
(56, 7, 14),
(57, 7, 18),
(58, 7, 23),
(59, 7, 24),
(96, 8, 1),
(97, 8, 3),
(98, 8, 6),
(99, 8, 10),
(100, 8, 13),
(101, 8, 14),
(102, 8, 20),
(67, 9, 1),
(68, 9, 3),
(69, 9, 4),
(70, 9, 7),
(71, 9, 10),
(72, 9, 11),
(73, 9, 14),
(74, 9, 20),
(75, 9, 22),
(76, 10, 1),
(77, 10, 2),
(78, 10, 3),
(80, 10, 10),
(81, 10, 11),
(82, 10, 14),
(83, 10, 17),
(84, 10, 20),
(86, 10, 22),
(87, 10, 25),
(79, 10, 37),
(85, 10, 46),
(88, 11, 1),
(89, 11, 2),
(90, 11, 3),
(91, 11, 4),
(93, 11, 14),
(94, 11, 20),
(95, 11, 25),
(92, 11, 35);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paginas`
--

CREATE TABLE `paginas` (
  `id_pagina` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `id_capitulos` int(11) NOT NULL,
  `caminho_pagina` varchar(255) NOT NULL,
  `data_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `paginas`
--

INSERT INTO `paginas` (`id_pagina`, `id_manga`, `id_capitulos`, `caminho_pagina`, `data_update`) VALUES
(151, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863409/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/sjtfpia62joxzgyunieq.webp', '2025-06-25 14:56:49'),
(152, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863410/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/gvmvudog60bz6zny5jlq.webp', '2025-06-25 14:56:50'),
(153, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863412/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/bb9hogu3talmai4ricge.webp', '2025-06-25 14:56:51'),
(154, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863413/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/m9ux5tu31wxczfunwl8k.webp', '2025-06-25 14:56:53'),
(155, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863414/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/d3i2o3x8qpsheeb2ypdv.webp', '2025-06-25 14:56:54'),
(156, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863415/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/eashpkitluq91tazmucj.webp', '2025-06-25 14:56:55'),
(157, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863416/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/ogtzy5e049faps4gitad.webp', '2025-06-25 14:56:57'),
(158, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863419/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/uysiw25ftooqz3mjw2ed.webp', '2025-06-25 14:56:58'),
(159, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863420/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/uanx0zltbdromhcw1tsp.webp', '2025-06-25 14:56:59'),
(160, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863421/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/whweuyzefuxsaidnprsu.webp', '2025-06-25 14:57:00'),
(161, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863422/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/wbarsy3eoswzsbkt5hgy.webp', '2025-06-25 14:57:01'),
(162, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863423/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/gx3rhkd51difku9evlry.webp', '2025-06-25 14:57:02'),
(163, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863424/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/x7ntoafw9rezrmoy7yrl.webp', '2025-06-25 14:57:03'),
(164, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863425/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/pahojf3nbkwa9epg9gkm.webp', '2025-06-25 14:57:04'),
(165, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863426/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/orevjfcs6qrsh1kwmuv8.webp', '2025-06-25 14:57:05'),
(166, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863426/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/hyjme9es1imjw86mszzp.webp', '2025-06-25 14:57:06'),
(167, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863427/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/qp2plczgkfe25m5mitut.webp', '2025-06-25 14:57:07'),
(168, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863428/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/xg0nwwwy18h9kwfz1xay.webp', '2025-06-25 14:57:08'),
(169, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863429/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/boosarppupxvlv72r5f1.webp', '2025-06-25 14:57:09'),
(170, 3, 18, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863430/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/bbtx779pzqkm9fnb6bgq.webp', '2025-06-25 14:57:10'),
(171, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863449/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/omkalnf0wu59vwasddcy.webp', '2025-06-25 14:57:29'),
(172, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863451/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/gwehmxkn9zr5eahwm4jg.webp', '2025-06-25 14:57:31'),
(173, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863452/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/vrplz5pqvkyfmlwjl5nu.webp', '2025-06-25 14:57:32'),
(174, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863453/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/veliqjmv3on7puh7kund.webp', '2025-06-25 14:57:33'),
(175, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863455/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/r9fnklt24r2sfojr4ozj.webp', '2025-06-25 14:57:35'),
(176, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863456/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/pmjj6qht8mwymsavw3lv.webp', '2025-06-25 14:57:36'),
(177, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863457/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/j8qgzplipadjrkxvzdve.webp', '2025-06-25 14:57:37'),
(178, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863459/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/a7cttrsglyqtwab74hod.webp', '2025-06-25 14:57:38'),
(179, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863460/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/k0pjif8behidq7yqbdrp.webp', '2025-06-25 14:57:39'),
(180, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863461/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/zjufl3bu3lcy3z3pjlmd.webp', '2025-06-25 14:57:40'),
(181, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863462/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/vss49y5u7wq8oqpm7pux.webp', '2025-06-25 14:57:41'),
(182, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863463/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/xzzzndywovdnq5q5mdvg.webp', '2025-06-25 14:57:43'),
(183, 3, 19, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863464/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/txls5vech1g46dqgk8sx.webp', '2025-06-25 14:57:44'),
(184, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863482/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/m1xata39si44lcrtbkqq.webp', '2025-06-25 14:58:01'),
(185, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863483/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/i0tko3si55ddvpqilrqw.webp', '2025-06-25 14:58:03'),
(186, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863484/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/dy4qdeg8ulm8strjb1p7.webp', '2025-06-25 14:58:04'),
(187, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863486/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/i5fopqcugyfmbxcli9u1.webp', '2025-06-25 14:58:05'),
(188, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863487/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/mswnkruoob2mkwq4mehk.webp', '2025-06-25 14:58:06'),
(189, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863488/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/iiwqiwrsjwvhig2tkcxy.webp', '2025-06-25 14:58:07'),
(190, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863489/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/eiztux3vnxqxeany96mq.webp', '2025-06-25 14:58:08'),
(191, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863490/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/vxyq6b6kmwww8epjnvvf.webp', '2025-06-25 14:58:10'),
(192, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863492/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/yk9lmkdkjmczepppgpfv.webp', '2025-06-25 14:58:11'),
(193, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863493/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/uzicus90wc5lvnvgsusl.webp', '2025-06-25 14:58:12'),
(194, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863494/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/wcrdsljpnqkqclt9stxj.webp', '2025-06-25 14:58:13'),
(195, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863495/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/uzwujmitsiywfgeeaeto.webp', '2025-06-25 14:58:14'),
(196, 3, 20, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863495/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/re8thhmesshvsdd21q7s.webp', '2025-06-25 14:58:15'),
(197, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863518/mangas/superhuman-battlefield/capitulo-1/qqtqjcvogsq7is9hnt7n.webp', '2025-06-25 14:58:38'),
(198, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863519/mangas/superhuman-battlefield/capitulo-1/wybdaxyxjlo0ghv6me0d.webp', '2025-06-25 14:58:39'),
(199, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863520/mangas/superhuman-battlefield/capitulo-1/xay1kql8tn8x1vubafnx.webp', '2025-06-25 14:58:40'),
(200, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863521/mangas/superhuman-battlefield/capitulo-1/xwmf8bqyrztuqntii3jq.webp', '2025-06-25 14:58:41'),
(201, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863522/mangas/superhuman-battlefield/capitulo-1/dqzhsvi5iiycdgcl7uub.webp', '2025-06-25 14:58:41'),
(202, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863523/mangas/superhuman-battlefield/capitulo-1/muk4ipncafvzlqnzqzhl.webp', '2025-06-25 14:58:42'),
(203, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863524/mangas/superhuman-battlefield/capitulo-1/v2jmxwobl64ha5u5tkxs.webp', '2025-06-25 14:58:43'),
(204, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863524/mangas/superhuman-battlefield/capitulo-1/num9gzrfyorndumlgzj5.webp', '2025-06-25 14:58:44'),
(205, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863525/mangas/superhuman-battlefield/capitulo-1/olb3dpsuuez6hlozov0w.webp', '2025-06-25 14:58:45'),
(206, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863526/mangas/superhuman-battlefield/capitulo-1/tlurqmkfuelso00bvx6u.webp', '2025-06-25 14:58:45'),
(207, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863527/mangas/superhuman-battlefield/capitulo-1/c64qp81yspac319pt1ar.webp', '2025-06-25 14:58:47'),
(208, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863528/mangas/superhuman-battlefield/capitulo-1/x2fqbc3ytewwsjoqogu4.webp', '2025-06-25 14:58:47'),
(209, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863528/mangas/superhuman-battlefield/capitulo-1/hx16sk4lt3qeailnzh45.webp', '2025-06-25 14:58:48'),
(210, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863530/mangas/superhuman-battlefield/capitulo-1/xs7rwkil0ofue1gveakq.webp', '2025-06-25 14:58:49'),
(211, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863531/mangas/superhuman-battlefield/capitulo-1/t1vvyrnweieaef0usxfd.webp', '2025-06-25 14:58:50'),
(212, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863532/mangas/superhuman-battlefield/capitulo-1/trcl4xhyucxfu3q1rtem.webp', '2025-06-25 14:58:51'),
(213, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863533/mangas/superhuman-battlefield/capitulo-1/l1zmsbyyd1mrrvqdgomx.webp', '2025-06-25 14:58:52'),
(214, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863534/mangas/superhuman-battlefield/capitulo-1/zcrmhici6vjv7mwrxfyo.webp', '2025-06-25 14:58:54'),
(215, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863535/mangas/superhuman-battlefield/capitulo-1/wehdagbt2nv3ufnsbfyj.webp', '2025-06-25 14:58:55'),
(216, 4, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863536/mangas/superhuman-battlefield/capitulo-1/s6b8jocj4cpo6s636uif.webp', '2025-06-25 14:58:56'),
(217, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863561/mangas/superhuman-battlefield/capitulo-2/f5xnvtl1jhrq6iwzbkfs.webp', '2025-06-25 14:59:21'),
(218, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863562/mangas/superhuman-battlefield/capitulo-2/izgxoypxvpaq7acto1s7.webp', '2025-06-25 14:59:22'),
(219, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863563/mangas/superhuman-battlefield/capitulo-2/cdwxxac4xtdn7xnfvvjf.webp', '2025-06-25 14:59:23'),
(220, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863564/mangas/superhuman-battlefield/capitulo-2/ztiaxlbeeeczon4xchho.webp', '2025-06-25 14:59:24'),
(221, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863565/mangas/superhuman-battlefield/capitulo-2/xrs5pq1cy41vo40y8vp6.webp', '2025-06-25 14:59:25'),
(222, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863566/mangas/superhuman-battlefield/capitulo-2/qymjzpio4xsj1svfimxg.webp', '2025-06-25 14:59:26'),
(223, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863567/mangas/superhuman-battlefield/capitulo-2/pobtrwsawpyr1mohbneq.webp', '2025-06-25 14:59:26'),
(224, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863568/mangas/superhuman-battlefield/capitulo-2/p84bc5v5rvtvi2sfpbzp.webp', '2025-06-25 14:59:27'),
(225, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863569/mangas/superhuman-battlefield/capitulo-2/bhmwef395xdtfsw6rqqh.webp', '2025-06-25 14:59:28'),
(226, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863570/mangas/superhuman-battlefield/capitulo-2/bb6011rjqtrblmb8y2dc.webp', '2025-06-25 14:59:29'),
(227, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863571/mangas/superhuman-battlefield/capitulo-2/vx8xnfvmjpvxkez9eq8l.webp', '2025-06-25 14:59:31'),
(228, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863572/mangas/superhuman-battlefield/capitulo-2/rposjdkzq2l4qpbwemxe.webp', '2025-06-25 14:59:32'),
(229, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863573/mangas/superhuman-battlefield/capitulo-2/aecugob150q0lqkul818.webp', '2025-06-25 14:59:33'),
(230, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863574/mangas/superhuman-battlefield/capitulo-2/crybuusyee18tq1uqozd.webp', '2025-06-25 14:59:34'),
(231, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863576/mangas/superhuman-battlefield/capitulo-2/ik1kw91inrwqsob9etmb.webp', '2025-06-25 14:59:35'),
(232, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863576/mangas/superhuman-battlefield/capitulo-2/fsvbqqo7qbumsvafynjr.webp', '2025-06-25 14:59:36'),
(233, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863577/mangas/superhuman-battlefield/capitulo-2/nx0j65jfin0j84juuy8g.webp', '2025-06-25 14:59:37'),
(234, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863578/mangas/superhuman-battlefield/capitulo-2/tchmyirbrtbgixsd2ysj.webp', '2025-06-25 14:59:38'),
(235, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863579/mangas/superhuman-battlefield/capitulo-2/jfr3qd1asjo176bpvk7e.webp', '2025-06-25 14:59:39'),
(236, 4, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863580/mangas/superhuman-battlefield/capitulo-2/i5qdqpv9yotqkee5enku.webp', '2025-06-25 14:59:39'),
(237, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863597/mangas/superhuman-battlefield/capitulo-3/nxx38pcy7ugxa7bfbqi6.webp', '2025-06-25 14:59:57'),
(238, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863598/mangas/superhuman-battlefield/capitulo-3/eb6wose4mpxbe5wlxrls.webp', '2025-06-25 14:59:58'),
(239, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863599/mangas/superhuman-battlefield/capitulo-3/dv3xq34264k0trfmqfow.webp', '2025-06-25 14:59:58'),
(240, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863600/mangas/superhuman-battlefield/capitulo-3/fh2ru0dmoh0wcmnmwfwj.webp', '2025-06-25 14:59:59'),
(241, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863601/mangas/superhuman-battlefield/capitulo-3/eu3zrkfja3ygh8c7vp89.webp', '2025-06-25 15:00:01'),
(242, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863602/mangas/superhuman-battlefield/capitulo-3/y6gq5fqqaamnyjrv496w.webp', '2025-06-25 15:00:02'),
(243, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863603/mangas/superhuman-battlefield/capitulo-3/gw87lo4jq5vdbmmmseh7.webp', '2025-06-25 15:00:02'),
(244, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863604/mangas/superhuman-battlefield/capitulo-3/jsq7jeroz1tjp1udalz4.webp', '2025-06-25 15:00:03'),
(245, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863605/mangas/superhuman-battlefield/capitulo-3/fqiamsjzwqlqaggtowbo.webp', '2025-06-25 15:00:05'),
(246, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863606/mangas/superhuman-battlefield/capitulo-3/qbswwby5yubqzpxyvisz.webp', '2025-06-25 15:00:05'),
(247, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863607/mangas/superhuman-battlefield/capitulo-3/cff5onx5sqaripkvqow7.webp', '2025-06-25 15:00:07'),
(248, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863608/mangas/superhuman-battlefield/capitulo-3/ikbt0pgf4egmoep2ahlm.webp', '2025-06-25 15:00:07'),
(249, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863609/mangas/superhuman-battlefield/capitulo-3/qga7hhgqpwfsbyutbk8h.webp', '2025-06-25 15:00:08'),
(250, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863610/mangas/superhuman-battlefield/capitulo-3/khbeoonhwkw8abup5l1u.webp', '2025-06-25 15:00:10'),
(251, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863611/mangas/superhuman-battlefield/capitulo-3/mqk4ckgqf1yfaqhairgt.webp', '2025-06-25 15:00:11'),
(252, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863613/mangas/superhuman-battlefield/capitulo-3/dvqxii9tg0yldccs8gdp.webp', '2025-06-25 15:00:13'),
(253, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863614/mangas/superhuman-battlefield/capitulo-3/geygxwwxemyjmyoj3uud.webp', '2025-06-25 15:00:14'),
(254, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863615/mangas/superhuman-battlefield/capitulo-3/lenjoovarwgnmmg0kwr2.webp', '2025-06-25 15:00:15'),
(255, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863616/mangas/superhuman-battlefield/capitulo-3/brcujp790p9id1sckuzt.webp', '2025-06-25 15:00:16'),
(256, 4, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750863617/mangas/superhuman-battlefield/capitulo-3/xddyd72vaiwu079q0qln.webp', '2025-06-25 15:00:17'),
(288, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928003/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/jqs9jhtlbd4irccb0unf.webp', '2025-06-26 08:53:23'),
(289, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928004/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/hir0zlozfnaqbfakbsob.webp', '2025-06-26 08:53:25'),
(290, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928006/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/z4dd1im3pjr9ifehrdkz.webp', '2025-06-26 08:53:26'),
(291, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928007/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/idhyoyfhbuu2btksjbkd.webp', '2025-06-26 08:53:27'),
(292, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928008/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/j2mmd8wlwshjgeauncoc.webp', '2025-06-26 08:53:28'),
(293, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928009/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/iehn9uw2k7ebuf6qhcua.webp', '2025-06-26 08:53:29'),
(294, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928010/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/xm6chutfciwvnjngxu8i.webp', '2025-06-26 08:53:30'),
(295, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928011/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/m8xkg6ewcqd3zfdka3sl.webp', '2025-06-26 08:53:31'),
(296, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928013/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/uvnorfzp8jmnzfhdbjsv.webp', '2025-06-26 08:53:33'),
(297, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928014/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/zfisxfi5st1izrfphyuc.webp', '2025-06-26 08:53:34'),
(298, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928015/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/wwijerjbxjybngxubjgs.webp', '2025-06-26 08:53:35'),
(299, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928017/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/mt63unq2zvglixgql2ve.webp', '2025-06-26 08:53:37'),
(300, 3, 22, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928018/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/p4jgk0gzaaseolfjyo5z.webp', '2025-06-26 08:53:38'),
(301, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928043/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/jxaziqqkrxveoqlxlypz.webp', '2025-06-26 08:54:03'),
(302, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928045/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/aqhsvmxqyyisco3lgfzq.webp', '2025-06-26 08:54:05'),
(303, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928046/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/txdysbjasdncbhqlgqm2.webp', '2025-06-26 08:54:06'),
(304, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928047/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/j8b0pvv547tfjvkdzgww.webp', '2025-06-26 08:54:07'),
(305, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928048/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/ynuex8aj5uxb4xovawol.webp', '2025-06-26 08:54:08'),
(306, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928049/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/mdsbps3ztnqqxuuubuoq.webp', '2025-06-26 08:54:09'),
(307, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928050/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/k669lgcoufkkxnrq3cbe.webp', '2025-06-26 08:54:11'),
(308, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928052/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/oo68ksjgm2orcqhzgdh7.webp', '2025-06-26 08:54:12'),
(309, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928053/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/eae33zfkymuzwcvrgatk.webp', '2025-06-26 08:54:14'),
(310, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928055/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/fqeplsj7qhhqze2yx7mr.webp', '2025-06-26 08:54:15'),
(311, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928056/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/rd4owr0eixzrgsp2e0w3.webp', '2025-06-26 08:54:16'),
(312, 3, 23, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928057/mangas/warrior-high-school-dungeon-raid-department/capitulo-5/cjh67inbo3a2bzcngeyq.webp', '2025-06-26 08:54:17'),
(313, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928079/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/wgv948l5dbdqj7jdl5tu.webp', '2025-06-26 08:54:40'),
(314, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928081/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/azxbaamtbxiez0x1rxmf.webp', '2025-06-26 08:54:41'),
(315, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928082/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/ustdno6sqwzrbzqifouo.webp', '2025-06-26 08:54:42'),
(316, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928083/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/pnofdhrbeev2m2s8akjy.webp', '2025-06-26 08:54:43'),
(317, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928083/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/yfnmzxjxowdypxixn7yo.webp', '2025-06-26 08:54:43'),
(318, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928084/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/auqnndfxcgywlyg0gkav.webp', '2025-06-26 08:54:44'),
(319, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928085/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/fftft4bqil69nkpitdlz.webp', '2025-06-26 08:54:45'),
(320, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928086/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/jqp4djknypyannkx5z5i.webp', '2025-06-26 08:54:46'),
(321, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928087/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/xekzxwfwxzce91pnlycy.webp', '2025-06-26 08:54:47'),
(322, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928088/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/i264ew51pfts94zaug6t.webp', '2025-06-26 08:54:48'),
(323, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928088/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/qmbtjhpdpsk8qaz77xcv.webp', '2025-06-26 08:54:49'),
(324, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928089/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/s29fft2fpxjyr1s0215g.webp', '2025-06-26 08:54:49'),
(325, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928090/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/o5m5siarltzf4exz3dxj.webp', '2025-06-26 08:54:50'),
(326, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928091/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/whqeouwoldubz6pzfomn.webp', '2025-06-26 08:54:51'),
(327, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928092/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/arhnoy2pcbfaugupzbcs.webp', '2025-06-26 08:54:51'),
(328, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928092/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/qj2vvq3ooxcxph0uikay.webp', '2025-06-26 08:54:52'),
(329, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928093/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/romjgfa5ytvymgas6nfv.webp', '2025-06-26 08:54:53'),
(330, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928094/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/uez2ikhvrfp4ksl0mtxe.webp', '2025-06-26 08:54:54'),
(331, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928094/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/qz7obnpdhygalmgdn9km.webp', '2025-06-26 08:54:55'),
(332, 3, 24, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928095/mangas/warrior-high-school-dungeon-raid-department/capitulo-6/mqageeaaymqqs0xya1ie.webp', '2025-06-26 08:54:55'),
(333, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928118/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/xh86gghn12makkcbie7o.webp', '2025-06-26 08:55:18'),
(334, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928119/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/lvsul7yvfmhnqnpfx8yr.webp', '2025-06-26 08:55:19'),
(335, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928120/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/nvtlqez5zvnlaknqgq4q.webp', '2025-06-26 08:55:20'),
(336, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928121/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/ab0fis3xicsiwhmdtsb9.webp', '2025-06-26 08:55:21'),
(337, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928122/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/tsosvpvk09dpxjiitg7j.webp', '2025-06-26 08:55:21'),
(338, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928122/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/hbtwntmuzbvayyxmismo.webp', '2025-06-26 08:55:23'),
(339, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928123/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/njb35y85gyjsi7h0xcqn.webp', '2025-06-26 08:55:23'),
(340, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928124/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/xtyppuiasye3zwtk7blu.webp', '2025-06-26 08:55:24'),
(341, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928125/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/yvj0uk7ibaej0fwr1l8s.webp', '2025-06-26 08:55:25'),
(342, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928126/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/mqaxtiafizf3pclbkydh.webp', '2025-06-26 08:55:26'),
(343, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928126/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/rznbo2f1fgvj2fcyyo15.webp', '2025-06-26 08:55:26'),
(344, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928127/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/ss5ormm8gsh3kq6mjosk.webp', '2025-06-26 08:55:27'),
(345, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928128/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/v76wlag3tdp1tcnjnklo.webp', '2025-06-26 08:55:28'),
(346, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928129/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/t58qxzgvfaaltkufonzi.webp', '2025-06-26 08:55:29'),
(347, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928130/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/hwlxhil80y2zgckktv3o.webp', '2025-06-26 08:55:30'),
(348, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928131/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/fkvtxvpk0wtpnzxgdexz.webp', '2025-06-26 08:55:31'),
(349, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928132/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/uefjws0rmnhkehkgapux.webp', '2025-06-26 08:55:32'),
(350, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928133/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/aofzz83wc0guxfagmp1j.webp', '2025-06-26 08:55:33'),
(351, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928134/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/zp1l7gkq47zcqvhisrbv.webp', '2025-06-26 08:55:34'),
(352, 3, 25, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928135/mangas/warrior-high-school-dungeon-raid-department/capitulo-7/sdwu3xqddd2kllopsn8o.webp', '2025-06-26 08:55:34'),
(353, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928157/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/jv4z0mcuaqfgbxe7tyhq.webp', '2025-06-26 08:55:57'),
(354, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928158/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/zv0n7fiu96wwpkjn9lff.webp', '2025-06-26 08:55:58'),
(355, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928159/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/xtn2iaoyg5as3nrfcgtv.webp', '2025-06-26 08:55:59'),
(356, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928160/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/t1uwutuhlt8iyxrbksc5.webp', '2025-06-26 08:56:00'),
(357, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928161/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/fwfribddyusnaebkfi2q.webp', '2025-06-26 08:56:01'),
(358, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928162/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/oukr7qqyg10zaosjl117.webp', '2025-06-26 08:56:02'),
(359, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928163/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/wlc1qqajb9odp3w42hbz.webp', '2025-06-26 08:56:03'),
(360, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928164/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/b7hlzl1n62scuqlxy5qu.webp', '2025-06-26 08:56:04'),
(361, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928165/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/ressizbjjgscpctppqdo.webp', '2025-06-26 08:56:05'),
(362, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928166/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/wthrsqxokphdqbx30z0c.webp', '2025-06-26 08:56:06'),
(363, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928167/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/sg6yxquyrjlonjtec5fe.webp', '2025-06-26 08:56:07'),
(364, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928167/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/vcy3ncxyyadwmwgv5xdn.webp', '2025-06-26 08:56:07'),
(365, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928168/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/ocrdgu2cdskvyu5fufk8.webp', '2025-06-26 08:56:08'),
(366, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928169/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/us9igpktwlacdsxkuoe9.webp', '2025-06-26 08:56:09'),
(367, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928171/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/lze1hzvatir8ugjr2yr2.webp', '2025-06-26 08:56:11'),
(368, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928172/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/rud4ztydbbqv80ycylfz.webp', '2025-06-26 08:56:12'),
(369, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928172/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/hzoelgbf2zui4oaerjvk.webp', '2025-06-26 08:56:12'),
(370, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928173/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/ayx6z25mpqgrr8ujectc.webp', '2025-06-26 08:56:13'),
(371, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928174/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/zeebq1n8lzasxpc0f27g.webp', '2025-06-26 08:56:14'),
(372, 3, 26, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928175/mangas/warrior-high-school-dungeon-raid-department/capitulo-8/erzxufcghjr23m83qou4.webp', '2025-06-26 08:56:15'),
(373, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928192/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/fkm4rnk4z7tryx5pnx2d.webp', '2025-06-26 08:56:32'),
(374, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928193/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/gbnwyy0cumxwbu662upr.webp', '2025-06-26 08:56:33'),
(375, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928194/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/fpryjw1t6snrau1mg98s.webp', '2025-06-26 08:56:34'),
(376, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928195/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/rwha8cgljgfqfrzp78c6.webp', '2025-06-26 08:56:35'),
(377, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928196/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/fhma1xxxsl0pvinuhds9.webp', '2025-06-26 08:56:36'),
(378, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928197/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/fpkmjgbaqzorx4ylxozo.webp', '2025-06-26 08:56:37'),
(379, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928197/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/iyqcrp56k0jniyqpwvpp.webp', '2025-06-26 08:56:37'),
(380, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928198/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/kajkueyskaqzytiavxo6.webp', '2025-06-26 08:56:38'),
(381, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928199/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/ktj44dgpziopkpljwjvq.webp', '2025-06-26 08:56:39'),
(382, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928200/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/n1j38jlnknlyahq5j4qj.webp', '2025-06-26 08:56:40'),
(383, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928201/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/d48ln72q7ikvaitwla9o.webp', '2025-06-26 08:56:41'),
(384, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928202/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/c6ip7wwplekbzycv0vgf.webp', '2025-06-26 08:56:42'),
(385, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928203/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/rumqqz2wkurqav48c7ad.webp', '2025-06-26 08:56:42'),
(386, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928203/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/ro9dndkkkw3vdckaowar.webp', '2025-06-26 08:56:43'),
(387, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928204/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/scl1yfhrm9wmydgrt5r1.webp', '2025-06-26 08:56:44'),
(388, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928205/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/gc9ghtrf3pjeqrgr2a6u.webp', '2025-06-26 08:56:45'),
(389, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928205/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/dijskybhkngpul1ow4kj.webp', '2025-06-26 08:56:45'),
(390, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928206/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/evqqvr6gsf1qmogximyr.webp', '2025-06-26 08:56:46'),
(391, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928207/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/qkaz1l0dsl3ffbwikbos.webp', '2025-06-26 08:56:47'),
(392, 3, 27, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928208/mangas/warrior-high-school-dungeon-raid-department/capitulo-9/z473ys7ktnrqf5oz1r9v.webp', '2025-06-26 08:56:48'),
(393, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928233/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/njpxlsyplrfk4qu38icm.webp', '2025-06-26 08:57:13'),
(394, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928234/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/tofpbaqsje4vsj2xavcj.webp', '2025-06-26 08:57:14'),
(395, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928235/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/vqscowzfrduv4dwsadvm.webp', '2025-06-26 08:57:15'),
(396, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928236/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/trnyievkw4n3oli8sash.webp', '2025-06-26 08:57:16'),
(397, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928237/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/ccnznbxvhult0sddg7um.webp', '2025-06-26 08:57:17'),
(398, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928238/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/nmssrluogxso3sgjulip.webp', '2025-06-26 08:57:18'),
(399, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928238/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/hgvucki74o5spjgmauk1.webp', '2025-06-26 08:57:18'),
(400, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928239/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/dybrebhtwgt6e0u1puhc.webp', '2025-06-26 08:57:19'),
(401, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928241/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/lvqtwtyirqlnfjuox4d1.webp', '2025-06-26 08:57:20'),
(402, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928241/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/bkuwvcaiyiyvee3ci7rz.webp', '2025-06-26 08:57:21'),
(403, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928242/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/fiitgfserclysvhyloq7.webp', '2025-06-26 08:57:22'),
(404, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928243/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/bzncrnrf2eafmq8wstjv.webp', '2025-06-26 08:57:23'),
(405, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928244/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/wrwp9nymj1uwdiz797rj.webp', '2025-06-26 08:57:24'),
(406, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928245/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/ol4yo2nyfyxixedbh6jh.webp', '2025-06-26 08:57:25'),
(407, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928246/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/vfsdrxvo5woh9tim1msq.webp', '2025-06-26 08:57:26'),
(408, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928246/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/sircx5lndbtusq1l2rc1.webp', '2025-06-26 08:57:26'),
(409, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928247/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/wuqt13qn9h8tq1loqqei.webp', '2025-06-26 08:57:27'),
(410, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928248/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/tiq4kyqhdmhifm0o6zvz.webp', '2025-06-26 08:57:28'),
(411, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928249/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/n3g8om6n0qv3umr3sge5.webp', '2025-06-26 08:57:28'),
(412, 3, 28, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928249/mangas/warrior-high-school-dungeon-raid-department/capitulo-10/urlpolravnu0p5usrdwi.webp', '2025-06-26 08:57:29'),
(413, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928275/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/ahy5zxdzzbdyfvwuozji.webp', '2025-06-26 08:57:55'),
(414, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928276/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/sehmxoporm3mifjcj1cf.webp', '2025-06-26 08:57:56'),
(415, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928277/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/rom6y6moyuhrcu9ibr1j.webp', '2025-06-26 08:57:57'),
(416, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928278/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/iqggric4axcme9edo4gz.webp', '2025-06-26 08:57:58'),
(417, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928279/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/v154tfptwiggmgcldox9.webp', '2025-06-26 08:57:59'),
(418, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928280/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/ivvhirodpahxfxbjr31y.webp', '2025-06-26 08:58:00'),
(419, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928281/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/a1sjqpkndvd3g5eycnah.webp', '2025-06-26 08:58:01'),
(420, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928282/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/admieylnmnvwdfqd9mta.webp', '2025-06-26 08:58:02'),
(421, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928283/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/omoxnfywbqxqvgdbc74b.webp', '2025-06-26 08:58:03'),
(422, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928284/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/dzsjvijv4ynlocebnhtw.webp', '2025-06-26 08:58:04'),
(423, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928285/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/qxsook1lstjuqtome01k.webp', '2025-06-26 08:58:05'),
(424, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928286/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/sxcgpwcfh4sz4k8qu5uw.webp', '2025-06-26 08:58:06'),
(425, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928287/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/ytv1x2iov95uuwze4gk4.webp', '2025-06-26 08:58:08'),
(426, 3, 29, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928288/mangas/warrior-high-school-dungeon-raid-department/capitulo-11/tpszqxozkx7ortdc8jst.webp', '2025-06-26 08:58:08'),
(480, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928504/mangas/superhuman-battlefield/capitulo-4/hqxxmszgdecffsn52xhv.webp', '2025-06-26 09:01:44'),
(481, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928505/mangas/superhuman-battlefield/capitulo-4/ruov8ze2xvrlnvs5de53.webp', '2025-06-26 09:01:45'),
(482, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928506/mangas/superhuman-battlefield/capitulo-4/vubsckunjoisyddx2wot.webp', '2025-06-26 09:01:47'),
(483, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928507/mangas/superhuman-battlefield/capitulo-4/vohr0khkahnlxoshhwsl.webp', '2025-06-26 09:01:47'),
(484, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928509/mangas/superhuman-battlefield/capitulo-4/kqwunya1lyabtrc2547t.webp', '2025-06-26 09:01:49'),
(485, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928510/mangas/superhuman-battlefield/capitulo-4/zsqv3fbuhm5woijgp7ep.webp', '2025-06-26 09:01:51'),
(486, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928512/mangas/superhuman-battlefield/capitulo-4/bdzpzcr0hi1l7pzwv61y.webp', '2025-06-26 09:01:51'),
(487, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928512/mangas/superhuman-battlefield/capitulo-4/blwmrnhh6ni7p10zrn7v.webp', '2025-06-26 09:01:53'),
(488, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928514/mangas/superhuman-battlefield/capitulo-4/vhrq1bnlwknqfsa1mzan.webp', '2025-06-26 09:01:54'),
(489, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928515/mangas/superhuman-battlefield/capitulo-4/ent9ulculr8umtw5cob5.webp', '2025-06-26 09:01:55'),
(490, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928516/mangas/superhuman-battlefield/capitulo-4/ampjuq53nt2dndvmohyv.webp', '2025-06-26 09:01:56'),
(491, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928517/mangas/superhuman-battlefield/capitulo-4/kmepqugbsrq9nkdytjrz.webp', '2025-06-26 09:01:57'),
(492, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928518/mangas/superhuman-battlefield/capitulo-4/jb9gq1m60npoqaoxj0js.webp', '2025-06-26 09:01:58'),
(493, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928519/mangas/superhuman-battlefield/capitulo-4/p7dyrx8ixz22pyobnryb.webp', '2025-06-26 09:01:59'),
(494, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928519/mangas/superhuman-battlefield/capitulo-4/k8fkkqv1fpvvrnwgucel.webp', '2025-06-26 09:02:00'),
(495, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928520/mangas/superhuman-battlefield/capitulo-4/ck9s3bonc3wgehkf2rnl.webp', '2025-06-26 09:02:00'),
(496, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928521/mangas/superhuman-battlefield/capitulo-4/rvb1013g0k5atyrvx884.webp', '2025-06-26 09:02:01'),
(497, 4, 34, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928522/mangas/superhuman-battlefield/capitulo-4/xto4ztvcwjxtqksis6mm.webp', '2025-06-26 09:02:02'),
(498, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928544/mangas/superhuman-battlefield/capitulo-5/rsphkziiloo5lkjr5wtp.webp', '2025-06-26 09:02:24'),
(499, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928545/mangas/superhuman-battlefield/capitulo-5/frizrmzd1syfg6dy9378.webp', '2025-06-26 09:02:25'),
(500, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928546/mangas/superhuman-battlefield/capitulo-5/d7knoyyllbyl7cesgsjr.webp', '2025-06-26 09:02:26'),
(501, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928547/mangas/superhuman-battlefield/capitulo-5/pdgdyujao20uopchn47e.webp', '2025-06-26 09:02:27'),
(502, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928548/mangas/superhuman-battlefield/capitulo-5/u414jfqs6wc5e0akrei8.webp', '2025-06-26 09:02:28'),
(503, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928549/mangas/superhuman-battlefield/capitulo-5/qcvoj6h8tyoyg83yqimq.webp', '2025-06-26 09:02:29'),
(504, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928550/mangas/superhuman-battlefield/capitulo-5/nrrdwb6cgvf6qtmrfey1.webp', '2025-06-26 09:02:30'),
(505, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928551/mangas/superhuman-battlefield/capitulo-5/nozsrvrlngkddkjd8lck.webp', '2025-06-26 09:02:31'),
(506, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928552/mangas/superhuman-battlefield/capitulo-5/sexzmnawhg3ymebadfmh.webp', '2025-06-26 09:02:32'),
(507, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928553/mangas/superhuman-battlefield/capitulo-5/uewijmvan3gmehpqsoyf.webp', '2025-06-26 09:02:33'),
(508, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928553/mangas/superhuman-battlefield/capitulo-5/xafaku1ld0f7a7porgnb.webp', '2025-06-26 09:02:33'),
(509, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928554/mangas/superhuman-battlefield/capitulo-5/m7uuvpt5jym6go4hfzwv.webp', '2025-06-26 09:02:34');
INSERT INTO `paginas` (`id_pagina`, `id_manga`, `id_capitulos`, `caminho_pagina`, `data_update`) VALUES
(510, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928555/mangas/superhuman-battlefield/capitulo-5/waoatgroiokc74tlzky6.webp', '2025-06-26 09:02:35'),
(511, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928556/mangas/superhuman-battlefield/capitulo-5/j6y55qkptfmp9pybpjnn.webp', '2025-06-26 09:02:36'),
(512, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928557/mangas/superhuman-battlefield/capitulo-5/bosis4prrsdoxw1cneyn.webp', '2025-06-26 09:02:37'),
(513, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928558/mangas/superhuman-battlefield/capitulo-5/vv7fw2nhgouebqxhnndx.webp', '2025-06-26 09:02:38'),
(514, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928559/mangas/superhuman-battlefield/capitulo-5/o5ucljjydtg1ncjohuzd.webp', '2025-06-26 09:02:39'),
(515, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928560/mangas/superhuman-battlefield/capitulo-5/crnygmhnkhxa4noatswo.webp', '2025-06-26 09:02:40'),
(516, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928561/mangas/superhuman-battlefield/capitulo-5/js9b9tyktehispnw2llz.webp', '2025-06-26 09:02:42'),
(517, 4, 35, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928562/mangas/superhuman-battlefield/capitulo-5/tfqcl5w50wi6ojhmmvbw.webp', '2025-06-26 09:02:43'),
(518, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928585/mangas/superhuman-battlefield/capitulo-6/ezs0ylmuoirtwztdgfmr.webp', '2025-06-26 09:03:05'),
(519, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928586/mangas/superhuman-battlefield/capitulo-6/tjehyefbqsmkm4yzubph.webp', '2025-06-26 09:03:06'),
(520, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928587/mangas/superhuman-battlefield/capitulo-6/d03yt7yhgqiegmc8ublx.webp', '2025-06-26 09:03:07'),
(521, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928588/mangas/superhuman-battlefield/capitulo-6/aq9ewwovhdib1sodfwml.webp', '2025-06-26 09:03:08'),
(522, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928589/mangas/superhuman-battlefield/capitulo-6/xg0xtyqld9jpunxwdfya.webp', '2025-06-26 09:03:09'),
(523, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928590/mangas/superhuman-battlefield/capitulo-6/mz1wbyskidazos9u0vgo.webp', '2025-06-26 09:03:11'),
(524, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928592/mangas/superhuman-battlefield/capitulo-6/hhpqlynxv3mc1h6hlzwi.webp', '2025-06-26 09:03:12'),
(525, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928593/mangas/superhuman-battlefield/capitulo-6/di15w7eoits7d1op9j9a.webp', '2025-06-26 09:03:13'),
(526, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928594/mangas/superhuman-battlefield/capitulo-6/lvzwg0kgg6mhrm345ent.webp', '2025-06-26 09:03:14'),
(527, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928595/mangas/superhuman-battlefield/capitulo-6/noumvtxtxlho1zqxuhc0.webp', '2025-06-26 09:03:15'),
(528, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928596/mangas/superhuman-battlefield/capitulo-6/a1dh5x6ivwqqj34nzwjo.webp', '2025-06-26 09:03:16'),
(529, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928597/mangas/superhuman-battlefield/capitulo-6/ghgcgtwnbobythtv6lbx.webp', '2025-06-26 09:03:17'),
(530, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928598/mangas/superhuman-battlefield/capitulo-6/ftvei0evcsbzx9q0dkdg.webp', '2025-06-26 09:03:18'),
(531, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928599/mangas/superhuman-battlefield/capitulo-6/cdyzw1qjcqwykua1bgmp.webp', '2025-06-26 09:03:19'),
(532, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928600/mangas/superhuman-battlefield/capitulo-6/n5vl80ow2tn8bcyfsm4u.webp', '2025-06-26 09:03:20'),
(533, 4, 36, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928601/mangas/superhuman-battlefield/capitulo-6/xdiuofxqh2y7iyxwf2bm.webp', '2025-06-26 09:03:21'),
(534, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928621/mangas/superhuman-battlefield/capitulo-7/oitnz6q1krtj8kxarhwn.webp', '2025-06-26 09:03:42'),
(535, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928623/mangas/superhuman-battlefield/capitulo-7/ze2prqhxolc9gvhiygbi.webp', '2025-06-26 09:03:43'),
(536, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928624/mangas/superhuman-battlefield/capitulo-7/al930gtq7tenpgl6mbbg.webp', '2025-06-26 09:03:44'),
(537, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928625/mangas/superhuman-battlefield/capitulo-7/pnfgiovczardfue8hbd6.webp', '2025-06-26 09:03:45'),
(538, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928626/mangas/superhuman-battlefield/capitulo-7/b1wrdfdgckz8xb2indtr.webp', '2025-06-26 09:03:46'),
(539, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928627/mangas/superhuman-battlefield/capitulo-7/qdpfy7wkflvbdhovvi7c.webp', '2025-06-26 09:03:47'),
(540, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928628/mangas/superhuman-battlefield/capitulo-7/bpspbjaa9s21cilthuqi.webp', '2025-06-26 09:03:49'),
(541, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928630/mangas/superhuman-battlefield/capitulo-7/bwotioc8sscniah6nc6x.webp', '2025-06-26 09:03:50'),
(542, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928631/mangas/superhuman-battlefield/capitulo-7/celmyril6wfvswkvpqof.webp', '2025-06-26 09:03:51'),
(543, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928632/mangas/superhuman-battlefield/capitulo-7/bmap0ofrueo3peds8adr.webp', '2025-06-26 09:03:52'),
(544, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928632/mangas/superhuman-battlefield/capitulo-7/clmikdelnu5ph7qwhpnl.webp', '2025-06-26 09:03:53'),
(545, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928634/mangas/superhuman-battlefield/capitulo-7/sti7ou20ne0htf7yacjo.webp', '2025-06-26 09:03:54'),
(546, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928635/mangas/superhuman-battlefield/capitulo-7/fjzqyqpvjgwcd58jxwnu.webp', '2025-06-26 09:03:55'),
(547, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928636/mangas/superhuman-battlefield/capitulo-7/xsejfgjc27ly41cxq4v9.webp', '2025-06-26 09:03:56'),
(548, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928637/mangas/superhuman-battlefield/capitulo-7/b5ti4spiheia5cuqqwqs.webp', '2025-06-26 09:03:57'),
(549, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928639/mangas/superhuman-battlefield/capitulo-7/euixy8crsmo2kfu76aa7.webp', '2025-06-26 09:03:59'),
(550, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928640/mangas/superhuman-battlefield/capitulo-7/setezmnu1pjc5qpjaoqr.webp', '2025-06-26 09:04:00'),
(551, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928641/mangas/superhuman-battlefield/capitulo-7/k3jlwfudusaklfqx7vgj.webp', '2025-06-26 09:04:01'),
(552, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928642/mangas/superhuman-battlefield/capitulo-7/okhgmta5v4zxm1ajh0kp.webp', '2025-06-26 09:04:02'),
(553, 4, 37, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928643/mangas/superhuman-battlefield/capitulo-7/uhf1n0no7ysswinv0kkv.webp', '2025-06-26 09:04:03'),
(554, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928764/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/xvm92twcnp7h7om8uzig.webp', '2025-06-26 09:06:04'),
(555, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928765/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/prfvj6k8mdsfvcwywwhe.webp', '2025-06-26 09:06:06'),
(556, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928767/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/exvwmqwvukfudqqct9xp.webp', '2025-06-26 09:06:07'),
(557, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928768/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/be0gxem0nglpw6dqdtak.webp', '2025-06-26 09:06:09'),
(558, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928770/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/ea3x9ocequhmampd0oqa.webp', '2025-06-26 09:06:10'),
(559, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928771/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/qbqzos8p2mmjd4mscnbv.webp', '2025-06-26 09:06:11'),
(560, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928772/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/r7uicnqm4i58l7rlf23r.webp', '2025-06-26 09:06:12'),
(561, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928773/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/yki0flmhrovfn943emty.webp', '2025-06-26 09:06:13'),
(562, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928774/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/tpwb96hblp5dgsbhowaf.webp', '2025-06-26 09:06:14'),
(563, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928775/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/c7q2ztf4xxhvwttwn8z4.webp', '2025-06-26 09:06:15'),
(564, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928776/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/mwqxro3w9d2hzz3dpgzo.webp', '2025-06-26 09:06:16'),
(565, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928777/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/wrgsea5re9a6akvlcybn.webp', '2025-06-26 09:06:18'),
(566, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928779/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/gbvnq69lnblndsdhkx8f.webp', '2025-06-26 09:06:19'),
(567, 3, 41, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928780/mangas/warrior-high-school-dungeon-raid-department/capitulo-12/eoh2qo1empfednxiurk0.webp', '2025-06-26 09:06:20'),
(568, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928815/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/ttx14z68urdbufcult3r.webp', '2025-06-26 09:06:55'),
(569, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928816/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/tc8dnludevwnjlfqvd3g.webp', '2025-06-26 09:06:57'),
(570, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928818/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/l6yjiiakzs2ru5hh5bwb.webp', '2025-06-26 09:06:58'),
(571, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928819/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/fy6ap0e3yjazrqbf2vtd.webp', '2025-06-26 09:06:59'),
(572, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928820/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/ck990tndlbtz1gbcvlth.webp', '2025-06-26 09:07:00'),
(573, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928821/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/is6fsslnrtw7ealtbsya.webp', '2025-06-26 09:07:01'),
(574, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928822/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/izr7sc0axag5bxwmvuyj.webp', '2025-06-26 09:07:02'),
(575, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928823/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/d9ntddrkwvcrzdmxenow.webp', '2025-06-26 09:07:03'),
(576, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928824/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/guo3sxsuef6zyougdxzm.webp', '2025-06-26 09:07:04'),
(577, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928825/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/sivzxfioe7i6xu9d3plr.webp', '2025-06-26 09:07:05'),
(578, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928826/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/k2gv5mdqinyla2xuebrt.webp', '2025-06-26 09:07:06'),
(579, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928827/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/bnbvapjjyxl87ecu5nq9.webp', '2025-06-26 09:07:07'),
(580, 3, 42, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928828/mangas/warrior-high-school-dungeon-raid-department/capitulo-13/ifxdthckj6evjnuggl1i.webp', '2025-06-26 09:07:08'),
(581, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928847/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/upylamn7w6g7dv1r1fxj.webp', '2025-06-26 09:07:27'),
(582, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928849/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/ku1xmrbeyhfxjqvn6npg.webp', '2025-06-26 09:07:29'),
(583, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928850/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/lyoafia6zbixvocxk03r.webp', '2025-06-26 09:07:30'),
(584, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928851/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/ehb01wg9hzln8uo5qv2x.webp', '2025-06-26 09:07:31'),
(585, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928852/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/wxtxiebs8khrv9tg4r0j.webp', '2025-06-26 09:07:32'),
(586, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928853/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/isfd7e2zddftyh8gprg7.webp', '2025-06-26 09:07:33'),
(587, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928855/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/v63e90jljeez2rxslrwn.webp', '2025-06-26 09:07:35'),
(588, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928855/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/dhhtxzoccpwwxgr9y9ap.webp', '2025-06-26 09:07:36'),
(589, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928857/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/qqj0fch6w12vffdtvygy.webp', '2025-06-26 09:07:37'),
(590, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928858/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/i0nke9xafvcqhu0od3id.webp', '2025-06-26 09:07:38'),
(591, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928858/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/ldyxi32gywti4cpxgubu.webp', '2025-06-26 09:07:38'),
(592, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928859/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/gmbdmwdhbo5dbm3yj7u9.webp', '2025-06-26 09:07:39'),
(593, 3, 43, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928860/mangas/warrior-high-school-dungeon-raid-department/capitulo-14/be02cm8ozw3ormi07lqw.webp', '2025-06-26 09:07:40'),
(594, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928879/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/eylsqofjl8sb26brs9jp.webp', '2025-06-26 09:07:59'),
(595, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928880/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/qvzpfobmmvp3w8evy9iq.webp', '2025-06-26 09:08:01'),
(596, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928882/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/u1ljcwfnvyhsz0bwizq1.webp', '2025-06-26 09:08:02'),
(597, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928883/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/atn3rhhuh22mqu7h341i.webp', '2025-06-26 09:08:03'),
(598, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928884/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/kffifdmvqv3w5kpcbuxm.webp', '2025-06-26 09:08:04'),
(599, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928885/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/xvn2c7f3o3zfqvoysxyy.webp', '2025-06-26 09:08:05'),
(600, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928886/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/vninmus6g5ivhkjr3mtm.webp', '2025-06-26 09:08:06'),
(601, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928888/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/uvqznu22rahjaqicfrqa.webp', '2025-06-26 09:08:08'),
(602, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928889/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/cpxs2sfbasfvx3ksqzzi.webp', '2025-06-26 09:08:09'),
(603, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928890/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/whmwhro4efjaguyv2plv.webp', '2025-06-26 09:08:10'),
(604, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928891/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/lflsbkkc3gspfuebtkf9.webp', '2025-06-26 09:08:11'),
(605, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928892/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/nf0v63pez1jdljzaxycu.webp', '2025-06-26 09:08:13'),
(606, 3, 44, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750928893/mangas/warrior-high-school-dungeon-raid-department/capitulo-15/ccu0sihhebizzfmjcjf5.webp', '2025-06-26 09:08:13'),
(607, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930184/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/nwdbxfaxwdbzprzjx4fb.webp', '2025-06-26 09:29:44'),
(608, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930185/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/ldiiqyqvvbhjhpkj5r3o.webp', '2025-06-26 09:29:45'),
(609, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930186/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/lxdm3sviwjrfqxaa1gvf.webp', '2025-06-26 09:29:46'),
(610, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930187/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/fpijpky4h6vitj7m9kpc.webp', '2025-06-26 09:29:47'),
(611, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930188/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/o2caaxzzm5jfshtxktq5.webp', '2025-06-26 09:29:48'),
(612, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930189/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/vsrbnqevoorum9mdbxgm.webp', '2025-06-26 09:29:48'),
(613, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930189/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/trymokzckrgysil2ks9r.webp', '2025-06-26 09:29:49'),
(614, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930191/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/huwifd7fgf3mgvsuaubp.webp', '2025-06-26 09:29:51'),
(615, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930192/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/lnrjamw9qbctdierdmax.webp', '2025-06-26 09:29:52'),
(616, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930193/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/vls76gsfmfsjuurlvcga.webp', '2025-06-26 09:29:53'),
(617, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930194/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/vsetpj75jpgq1uax69vh.webp', '2025-06-26 09:29:54'),
(618, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930195/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/xgnd1fctp72bxalfhm5y.webp', '2025-06-26 09:29:54'),
(619, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930195/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/xnipscjfsnhd6modbkh1.webp', '2025-06-26 09:29:56'),
(620, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930196/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/ieyijzj8llydakjaiqu3.webp', '2025-06-26 09:29:56'),
(621, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930197/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/honhoqps1c6ss6gxgyc7.webp', '2025-06-26 09:29:57'),
(622, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930198/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/pwqjpfam1yhfamwqpio3.webp', '2025-06-26 09:29:58'),
(623, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930199/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/zkiqn2zhz0wpbgcem4y0.webp', '2025-06-26 09:29:59'),
(624, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930200/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/qm4jhubsa6sxe2fryrxf.webp', '2025-06-26 09:30:00'),
(625, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930201/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/nlmrjpv75uaapjv2en7a.webp', '2025-06-26 09:30:01'),
(626, 6, 45, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930201/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-1/x6qmjcudnuh6zxh5wnbp.webp', '2025-06-26 09:30:02'),
(627, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930236/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/mryhyupcrouvncn4igm5.webp', '2025-06-26 09:30:36'),
(628, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930238/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/zxtj8ktcqbntotkgctnx.webp', '2025-06-26 09:30:38'),
(629, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930239/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/aejaps4qx4rqx0lrkstj.webp', '2025-06-26 09:30:39'),
(630, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930240/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/pt1kvub3uyyqheqe9edj.webp', '2025-06-26 09:30:40'),
(631, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930241/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/krgi2nfo3e61chs44lrs.webp', '2025-06-26 09:30:41'),
(632, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930242/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/swazlt2mvpxslsnmupch.webp', '2025-06-26 09:30:42'),
(633, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930243/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/ddyalna7txdjwxlpdfmv.webp', '2025-06-26 09:30:43'),
(634, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930244/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/xainkmskwtncqn7ryprr.webp', '2025-06-26 09:30:44'),
(635, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930245/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/jshn6ym0dkuehnolvcsg.webp', '2025-06-26 09:30:45'),
(636, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930246/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/q34l06dmywgb23qyglvq.webp', '2025-06-26 09:30:46'),
(637, 6, 46, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930247/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-2/bvaarki3j8mwpv4y7sx4.webp', '2025-06-26 09:30:46'),
(638, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930262/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/btkcfio8xxj8xa78ohrs.webp', '2025-06-26 09:31:02'),
(639, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930264/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/cxov2p0vyd7qlgl7ag4c.webp', '2025-06-26 09:31:04'),
(640, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930265/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/jkyfsb6zspz2izbfmruz.webp', '2025-06-26 09:31:05'),
(641, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930266/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/yxndfdtvilzhfijntcce.webp', '2025-06-26 09:31:06'),
(642, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930267/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/kcro8cdjajl2kobjz5k7.webp', '2025-06-26 09:31:07'),
(643, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930268/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/to6aaxwwgki4uehftbzu.webp', '2025-06-26 09:31:08'),
(644, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930269/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/icxrowsztxz3ywunv9mr.webp', '2025-06-26 09:31:09'),
(645, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930270/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/gvbodpncdtd2vpie8kef.webp', '2025-06-26 09:31:11'),
(646, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930272/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/mzivblltkmzq9tpfmp8l.webp', '2025-06-26 09:31:12'),
(647, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930272/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/tbduwwzxf8s2sm9pimg5.webp', '2025-06-26 09:31:12'),
(648, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930273/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/psflwpsqcphbcyb3twti.webp', '2025-06-26 09:31:13'),
(649, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930274/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/ox51ndfgb8gdbx6mpwd1.webp', '2025-06-26 09:31:14'),
(650, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930275/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/v3eiizzk0l2ta7glv1da.webp', '2025-06-26 09:31:16'),
(651, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930276/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/kg4k3wgpfwxittrnq9ng.webp', '2025-06-26 09:31:17'),
(652, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930277/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/bcg4ooxgqdgngonqi44n.webp', '2025-06-26 09:31:17'),
(653, 6, 47, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750930278/mangas/reincarnation-of-the-suicidal-battle-god/capitulo-3/jgq2ip68z3pah8cl63bv.webp', '2025-06-26 09:31:18'),
(654, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931852/mangas/terminally-ill-genius-dark-knight/capitulo-1/jyl7bc9njfuav2ja02sg.webp', '2025-06-26 09:57:32'),
(655, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931854/mangas/terminally-ill-genius-dark-knight/capitulo-1/gwqigcuynmgfdkfrvgcl.webp', '2025-06-26 09:57:34'),
(656, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931855/mangas/terminally-ill-genius-dark-knight/capitulo-1/kvwmwdtyjakwly5mfkem.webp', '2025-06-26 09:57:35'),
(657, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931856/mangas/terminally-ill-genius-dark-knight/capitulo-1/laylso0vuuwzaud2jlw5.webp', '2025-06-26 09:57:35'),
(658, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931857/mangas/terminally-ill-genius-dark-knight/capitulo-1/bfizu31ltwdldh694hxe.webp', '2025-06-26 09:57:36'),
(659, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931857/mangas/terminally-ill-genius-dark-knight/capitulo-1/lx6qrfehewxs8uyxadm2.webp', '2025-06-26 09:57:38'),
(660, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931859/mangas/terminally-ill-genius-dark-knight/capitulo-1/tpg5wkfs2y6peh8jltcg.webp', '2025-06-26 09:57:39'),
(661, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931860/mangas/terminally-ill-genius-dark-knight/capitulo-1/oxdn29lixeboe6onnw9s.webp', '2025-06-26 09:57:40'),
(662, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931861/mangas/terminally-ill-genius-dark-knight/capitulo-1/tgf4sgdzx0sbnttpbwck.webp', '2025-06-26 09:57:41'),
(663, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931862/mangas/terminally-ill-genius-dark-knight/capitulo-1/euw2vlwrfimk1r9pau5e.webp', '2025-06-26 09:57:41'),
(664, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931862/mangas/terminally-ill-genius-dark-knight/capitulo-1/bb1gqktgcp9x9phrnfyp.webp', '2025-06-26 09:57:42'),
(665, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931863/mangas/terminally-ill-genius-dark-knight/capitulo-1/xozlt6uf9vubxietb2gm.webp', '2025-06-26 09:57:43'),
(666, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931864/mangas/terminally-ill-genius-dark-knight/capitulo-1/d0yvl499fsdhghlwbvor.webp', '2025-06-26 09:57:44'),
(667, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931865/mangas/terminally-ill-genius-dark-knight/capitulo-1/otkzfuvdiyebv2b41t9p.webp', '2025-06-26 09:57:45'),
(668, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931866/mangas/terminally-ill-genius-dark-knight/capitulo-1/q4qjpennbiqsrm3bhcu7.webp', '2025-06-26 09:57:45'),
(669, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931866/mangas/terminally-ill-genius-dark-knight/capitulo-1/yersaafcpflus0msfzxr.webp', '2025-06-26 09:57:46'),
(670, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931867/mangas/terminally-ill-genius-dark-knight/capitulo-1/slpw2onrzsquolkut2nd.webp', '2025-06-26 09:57:47'),
(671, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931868/mangas/terminally-ill-genius-dark-knight/capitulo-1/fveblgabxvatigfgnkj1.webp', '2025-06-26 09:57:48'),
(672, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931869/mangas/terminally-ill-genius-dark-knight/capitulo-1/unmwovzlfr1s3zaivvbf.webp', '2025-06-26 09:57:49'),
(673, 5, 48, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931870/mangas/terminally-ill-genius-dark-knight/capitulo-1/xgnvtg8ux0vareanjlpk.webp', '2025-06-26 09:57:49'),
(674, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931889/mangas/terminally-ill-genius-dark-knight/capitulo-2/lnvtaqz5zgiadpdbhqvc.webp', '2025-06-26 09:58:09'),
(675, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931890/mangas/terminally-ill-genius-dark-knight/capitulo-2/q39dg8pikd5nafki9num.webp', '2025-06-26 09:58:10'),
(676, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931891/mangas/terminally-ill-genius-dark-knight/capitulo-2/ardhiifulcju6sdhulkv.webp', '2025-06-26 09:58:11'),
(677, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931892/mangas/terminally-ill-genius-dark-knight/capitulo-2/hnyhk083h8opcgrtkvyx.webp', '2025-06-26 09:58:11'),
(678, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931892/mangas/terminally-ill-genius-dark-knight/capitulo-2/ngnwahiralhhlrexbd5p.webp', '2025-06-26 09:58:12'),
(679, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931893/mangas/terminally-ill-genius-dark-knight/capitulo-2/taf469whbovj61oaeh8p.webp', '2025-06-26 09:58:13'),
(680, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931893/mangas/terminally-ill-genius-dark-knight/capitulo-2/fs1zljfzqzszeiukktq7.webp', '2025-06-26 09:58:13'),
(681, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931894/mangas/terminally-ill-genius-dark-knight/capitulo-2/rcwylxvtzmqoswxodnmu.webp', '2025-06-26 09:58:14'),
(682, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931895/mangas/terminally-ill-genius-dark-knight/capitulo-2/i5fewjte5ktoawrtvz38.webp', '2025-06-26 09:58:15'),
(683, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931896/mangas/terminally-ill-genius-dark-knight/capitulo-2/ciqyr8b5u18ljjlumplw.webp', '2025-06-26 09:58:16'),
(684, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931897/mangas/terminally-ill-genius-dark-knight/capitulo-2/awfsetgffxd4uivv88mz.webp', '2025-06-26 09:58:17'),
(685, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931898/mangas/terminally-ill-genius-dark-knight/capitulo-2/pgrs8sfpqii3yqew0zwr.webp', '2025-06-26 09:58:18'),
(686, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931899/mangas/terminally-ill-genius-dark-knight/capitulo-2/z7upckizlzqjobgu5k09.webp', '2025-06-26 09:58:19'),
(687, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931900/mangas/terminally-ill-genius-dark-knight/capitulo-2/nikvibllqlwfhq2j7mn2.webp', '2025-06-26 09:58:20'),
(688, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931900/mangas/terminally-ill-genius-dark-knight/capitulo-2/infaggzlsbaoradlgxut.webp', '2025-06-26 09:58:20'),
(689, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931901/mangas/terminally-ill-genius-dark-knight/capitulo-2/ccgjnluevlivw24d8xsj.webp', '2025-06-26 09:58:21'),
(690, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931902/mangas/terminally-ill-genius-dark-knight/capitulo-2/bhreec2xcmoivpkrckfa.webp', '2025-06-26 09:58:22'),
(691, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931903/mangas/terminally-ill-genius-dark-knight/capitulo-2/f5wzpjplke7v4yqxvac6.webp', '2025-06-26 09:58:23'),
(692, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931904/mangas/terminally-ill-genius-dark-knight/capitulo-2/xfpfpicqpnea5vz7p5j5.webp', '2025-06-26 09:58:24'),
(693, 5, 49, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931905/mangas/terminally-ill-genius-dark-knight/capitulo-2/fkh2ztpkojwvekebs8lh.webp', '2025-06-26 09:58:25'),
(694, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931927/mangas/terminally-ill-genius-dark-knight/capitulo-3/sipcgcmxzzibdrytlep5.webp', '2025-06-26 09:58:47'),
(695, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931928/mangas/terminally-ill-genius-dark-knight/capitulo-3/suvoudpzlylu2ey0l8a5.webp', '2025-06-26 09:58:48'),
(696, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931929/mangas/terminally-ill-genius-dark-knight/capitulo-3/kpenvqgt5ruqsnqleqhi.webp', '2025-06-26 09:58:49'),
(697, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931930/mangas/terminally-ill-genius-dark-knight/capitulo-3/ea6adodwl80ng1jvsldk.webp', '2025-06-26 09:58:50'),
(698, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931931/mangas/terminally-ill-genius-dark-knight/capitulo-3/rvehnu06sd6jqrnvyplu.webp', '2025-06-26 09:58:51'),
(699, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931932/mangas/terminally-ill-genius-dark-knight/capitulo-3/omhab4tzfqz4fvxq7m5d.webp', '2025-06-26 09:58:52'),
(700, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931933/mangas/terminally-ill-genius-dark-knight/capitulo-3/ahsae2ohgubtfpfaerkr.webp', '2025-06-26 09:58:52'),
(701, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931933/mangas/terminally-ill-genius-dark-knight/capitulo-3/snhbj9qejublfcxzy0aj.webp', '2025-06-26 09:58:53'),
(702, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931935/mangas/terminally-ill-genius-dark-knight/capitulo-3/wpxoa0qdzsyqetpbudza.webp', '2025-06-26 09:58:55'),
(703, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931936/mangas/terminally-ill-genius-dark-knight/capitulo-3/m8lj31nanryrhjhwzek6.webp', '2025-06-26 09:58:56'),
(704, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931937/mangas/terminally-ill-genius-dark-knight/capitulo-3/l9v7etssgkdxnrkqmonh.webp', '2025-06-26 09:58:57'),
(705, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931938/mangas/terminally-ill-genius-dark-knight/capitulo-3/jzecvhcbivsmr3tjtcbs.webp', '2025-06-26 09:58:58'),
(706, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931938/mangas/terminally-ill-genius-dark-knight/capitulo-3/zit36eixyfwvwkzqvdjo.webp', '2025-06-26 09:58:58'),
(707, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931939/mangas/terminally-ill-genius-dark-knight/capitulo-3/wcfm8l1z4xseixs4qjd1.webp', '2025-06-26 09:58:59'),
(708, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931940/mangas/terminally-ill-genius-dark-knight/capitulo-3/wl7ometxosyw8qx6ve41.webp', '2025-06-26 09:59:00'),
(709, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931941/mangas/terminally-ill-genius-dark-knight/capitulo-3/bz2vjm2easw13sdost8m.webp', '2025-06-26 09:59:01'),
(710, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931942/mangas/terminally-ill-genius-dark-knight/capitulo-3/eluasmfksepr6rtdk7f4.webp', '2025-06-26 09:59:02'),
(711, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931942/mangas/terminally-ill-genius-dark-knight/capitulo-3/nznbxohltxclydzpudpz.webp', '2025-06-26 09:59:02'),
(712, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931943/mangas/terminally-ill-genius-dark-knight/capitulo-3/uaxjhe77ho8wyhk65q7t.webp', '2025-06-26 09:59:03'),
(713, 5, 50, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931944/mangas/terminally-ill-genius-dark-knight/capitulo-3/vjuz5rgqlhhosvirr6fs.webp', '2025-06-26 09:59:04'),
(714, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931975/mangas/terminally-ill-genius-dark-knight/capitulo-4/rlnrujfn5fptupvcllp3.webp', '2025-06-26 09:59:35'),
(715, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931976/mangas/terminally-ill-genius-dark-knight/capitulo-4/w1i2yhwssuovsp8py2oe.webp', '2025-06-26 09:59:36'),
(716, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931977/mangas/terminally-ill-genius-dark-knight/capitulo-4/yqzrikqpqpmfc9rkwnha.webp', '2025-06-26 09:59:36'),
(717, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931977/mangas/terminally-ill-genius-dark-knight/capitulo-4/t86j02jxmtx5ihnqrwk3.webp', '2025-06-26 09:59:37'),
(718, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931979/mangas/terminally-ill-genius-dark-knight/capitulo-4/kmlgnfrcvudy64rk2lb9.webp', '2025-06-26 09:59:39'),
(719, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931980/mangas/terminally-ill-genius-dark-knight/capitulo-4/rp6e30wy5gedwwnbkw2t.webp', '2025-06-26 09:59:40'),
(720, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931980/mangas/terminally-ill-genius-dark-knight/capitulo-4/gp0jf6zvss0abv6ofjeu.webp', '2025-06-26 09:59:40'),
(721, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931981/mangas/terminally-ill-genius-dark-knight/capitulo-4/po0smzlaym2w54fda35a.webp', '2025-06-26 09:59:41'),
(722, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931982/mangas/terminally-ill-genius-dark-knight/capitulo-4/zprzs9qutgsseytweq1q.webp', '2025-06-26 09:59:42'),
(723, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931983/mangas/terminally-ill-genius-dark-knight/capitulo-4/tz3c9rpnznwzdz7vt8bx.webp', '2025-06-26 09:59:43'),
(724, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931984/mangas/terminally-ill-genius-dark-knight/capitulo-4/qbfsmwh4yfrnilfp7xjj.webp', '2025-06-26 09:59:44'),
(725, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931985/mangas/terminally-ill-genius-dark-knight/capitulo-4/vcsz1l3ckdgrlnxkigoo.webp', '2025-06-26 09:59:45'),
(726, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931986/mangas/terminally-ill-genius-dark-knight/capitulo-4/epuvyo5oaf5j5sb0fuay.webp', '2025-06-26 09:59:46'),
(727, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931987/mangas/terminally-ill-genius-dark-knight/capitulo-4/xeht2jrqyarmkmyxloyh.webp', '2025-06-26 09:59:47'),
(728, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931988/mangas/terminally-ill-genius-dark-knight/capitulo-4/ynhtmxhe935wfe7hgoij.webp', '2025-06-26 09:59:47'),
(729, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931988/mangas/terminally-ill-genius-dark-knight/capitulo-4/tsgm0nm7h7d0ujsxssse.webp', '2025-06-26 09:59:48'),
(730, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931989/mangas/terminally-ill-genius-dark-knight/capitulo-4/butw6legi9ykifi3pbp8.webp', '2025-06-26 09:59:49'),
(731, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931990/mangas/terminally-ill-genius-dark-knight/capitulo-4/jyhr0a50ym76hqh3pxjc.webp', '2025-06-26 09:59:50'),
(732, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931991/mangas/terminally-ill-genius-dark-knight/capitulo-4/aoribzoew6rxw8amt5vh.webp', '2025-06-26 09:59:51'),
(733, 5, 51, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750931992/mangas/terminally-ill-genius-dark-knight/capitulo-4/pjeadqj9l7ilcwkwb58l.webp', '2025-06-26 09:59:52'),
(734, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932669/mangas/martial-god-regressed-to-level-2/capitulo-1/gscxjlhs5umn0nwtjs7a.webp', '2025-06-26 10:11:09'),
(735, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932671/mangas/martial-god-regressed-to-level-2/capitulo-1/khnodjcwr56fyowr8a3m.webp', '2025-06-26 10:11:11'),
(736, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932672/mangas/martial-god-regressed-to-level-2/capitulo-1/mk0vx0erfm5behzh4mn9.webp', '2025-06-26 10:11:12'),
(737, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932673/mangas/martial-god-regressed-to-level-2/capitulo-1/mbiha4yeevwjugzc0bwj.webp', '2025-06-26 10:11:13'),
(738, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932674/mangas/martial-god-regressed-to-level-2/capitulo-1/e9t43m7sofip7xs9yn1r.webp', '2025-06-26 10:11:14'),
(739, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932676/mangas/martial-god-regressed-to-level-2/capitulo-1/tdujdzpestpqcraezgod.webp', '2025-06-26 10:11:16'),
(740, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932677/mangas/martial-god-regressed-to-level-2/capitulo-1/wasew1rutikydfnn9rmr.webp', '2025-06-26 10:11:18'),
(741, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932679/mangas/martial-god-regressed-to-level-2/capitulo-1/rth7reym2dpwbdm2f5km.webp', '2025-06-26 10:11:19'),
(742, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932679/mangas/martial-god-regressed-to-level-2/capitulo-1/yufrsjdhvnrnjelpstaj.webp', '2025-06-26 10:11:19'),
(743, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932680/mangas/martial-god-regressed-to-level-2/capitulo-1/uqcvevrpjqwtm55rejay.webp', '2025-06-26 10:11:21'),
(744, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932682/mangas/martial-god-regressed-to-level-2/capitulo-1/qmsofww0dvdjhdds4ktm.webp', '2025-06-26 10:11:22'),
(745, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932683/mangas/martial-god-regressed-to-level-2/capitulo-1/zjaipvwc8qkulkhppkgz.webp', '2025-06-26 10:11:23'),
(746, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932684/mangas/martial-god-regressed-to-level-2/capitulo-1/hffo3icvesh0uiozt2ah.webp', '2025-06-26 10:11:24'),
(747, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932685/mangas/martial-god-regressed-to-level-2/capitulo-1/rlqcj3d8rgpxzgzm41dd.webp', '2025-06-26 10:11:25'),
(748, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932686/mangas/martial-god-regressed-to-level-2/capitulo-1/xsc1k4aezo6hgu9fj0nf.webp', '2025-06-26 10:11:26'),
(749, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932687/mangas/martial-god-regressed-to-level-2/capitulo-1/lfrgc6thvd4f1usdnkgz.webp', '2025-06-26 10:11:27'),
(750, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932688/mangas/martial-god-regressed-to-level-2/capitulo-1/stzoabhuyud4dfnnpowh.webp', '2025-06-26 10:11:28'),
(751, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932689/mangas/martial-god-regressed-to-level-2/capitulo-1/cvuyj4z5kxbn04oswbys.webp', '2025-06-26 10:11:29'),
(752, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932690/mangas/martial-god-regressed-to-level-2/capitulo-1/b3a4mykm4ihk9gt4ppyx.webp', '2025-06-26 10:11:30'),
(753, 10, 52, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932691/mangas/martial-god-regressed-to-level-2/capitulo-1/mgjrm77nrm7y8edwlycg.webp', '2025-06-26 10:11:31'),
(754, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932710/mangas/martial-god-regressed-to-level-2/capitulo-2/jcbqbjxripy0qokfuoom.webp', '2025-06-26 10:11:50'),
(755, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932711/mangas/martial-god-regressed-to-level-2/capitulo-2/avokvjhkwgiulw6zeevu.webp', '2025-06-26 10:11:51'),
(756, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932712/mangas/martial-god-regressed-to-level-2/capitulo-2/ryzdlqtjntsmw7ultjmf.webp', '2025-06-26 10:11:52'),
(757, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932714/mangas/martial-god-regressed-to-level-2/capitulo-2/f7dzipy18taxeav3j1kq.webp', '2025-06-26 10:11:54'),
(758, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932715/mangas/martial-god-regressed-to-level-2/capitulo-2/czqa2vh7axjumhhhhqw8.webp', '2025-06-26 10:11:55'),
(759, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932716/mangas/martial-god-regressed-to-level-2/capitulo-2/gmzyxtcymlemhfxwcszc.webp', '2025-06-26 10:11:56'),
(760, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932717/mangas/martial-god-regressed-to-level-2/capitulo-2/bullsw0nwqjy7mk3oudt.webp', '2025-06-26 10:11:57'),
(761, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932718/mangas/martial-god-regressed-to-level-2/capitulo-2/aqcj1cm6fgycxdypkekd.webp', '2025-06-26 10:11:58'),
(762, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932719/mangas/martial-god-regressed-to-level-2/capitulo-2/e9aikaz3prbaulrbtkfi.webp', '2025-06-26 10:11:59'),
(763, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932720/mangas/martial-god-regressed-to-level-2/capitulo-2/y5siijvozsxazpdjrkg8.webp', '2025-06-26 10:12:00'),
(764, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932721/mangas/martial-god-regressed-to-level-2/capitulo-2/zbz0qaprukxsyp9yzrdg.webp', '2025-06-26 10:12:01'),
(765, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932722/mangas/martial-god-regressed-to-level-2/capitulo-2/d3hsrlfrb6gtjvkqmv1x.webp', '2025-06-26 10:12:01'),
(766, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932722/mangas/martial-god-regressed-to-level-2/capitulo-2/n2qed6vylsbqiz1q97bg.webp', '2025-06-26 10:12:02'),
(767, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932723/mangas/martial-god-regressed-to-level-2/capitulo-2/l0lvcs7x9jlkrvooxixk.webp', '2025-06-26 10:12:03'),
(768, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932724/mangas/martial-god-regressed-to-level-2/capitulo-2/man06jj3qfnbwmzumihp.webp', '2025-06-26 10:12:04'),
(769, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932725/mangas/martial-god-regressed-to-level-2/capitulo-2/z6t3f9u4qpxk0d12izs5.webp', '2025-06-26 10:12:06'),
(770, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932727/mangas/martial-god-regressed-to-level-2/capitulo-2/l5kek7nrgc9otxjnkryw.webp', '2025-06-26 10:12:06'),
(771, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932727/mangas/martial-god-regressed-to-level-2/capitulo-2/wv3jhkhrlzim4jyj4krj.webp', '2025-06-26 10:12:07'),
(772, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932728/mangas/martial-god-regressed-to-level-2/capitulo-2/gwu45epxzhxmbe7uunuj.webp', '2025-06-26 10:12:08'),
(773, 10, 53, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932729/mangas/martial-god-regressed-to-level-2/capitulo-2/kw1i9beocdabeeog9x9q.webp', '2025-06-26 10:12:09'),
(774, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932748/mangas/martial-god-regressed-to-level-2/capitulo-3/ueddemylliopnjxe2c4x.webp', '2025-06-26 10:12:28'),
(775, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932750/mangas/martial-god-regressed-to-level-2/capitulo-3/wzrwm2pzdafbl23jfrm4.webp', '2025-06-26 10:12:30'),
(776, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932751/mangas/martial-god-regressed-to-level-2/capitulo-3/tqgi5bunt5zkdusgrins.webp', '2025-06-26 10:12:31'),
(777, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932752/mangas/martial-god-regressed-to-level-2/capitulo-3/uydgkuydszss54hdiqno.webp', '2025-06-26 10:12:32'),
(778, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932753/mangas/martial-god-regressed-to-level-2/capitulo-3/q4gu2gnpuru09g25vfq8.webp', '2025-06-26 10:12:33'),
(779, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932754/mangas/martial-god-regressed-to-level-2/capitulo-3/xg1r0aju02ifs7wwd8gj.webp', '2025-06-26 10:12:34'),
(780, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932756/mangas/martial-god-regressed-to-level-2/capitulo-3/lytciiepy9fpltwn08am.webp', '2025-06-26 10:12:36'),
(781, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932757/mangas/martial-god-regressed-to-level-2/capitulo-3/awrkdsius8vrvl9g7v4w.webp', '2025-06-26 10:12:37'),
(782, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932758/mangas/martial-god-regressed-to-level-2/capitulo-3/okugtixfbe4rki7zhjod.webp', '2025-06-26 10:12:38'),
(783, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932759/mangas/martial-god-regressed-to-level-2/capitulo-3/khxeopetjaemtsrt1ksb.webp', '2025-06-26 10:12:39'),
(784, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932760/mangas/martial-god-regressed-to-level-2/capitulo-3/hof4jp3bwjaalxnbl3zt.webp', '2025-06-26 10:12:40'),
(785, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932761/mangas/martial-god-regressed-to-level-2/capitulo-3/tmna90vzcdqiluqyzlqn.webp', '2025-06-26 10:12:41'),
(786, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932762/mangas/martial-god-regressed-to-level-2/capitulo-3/o5bblkjl5uawxaljy58d.webp', '2025-06-26 10:12:42');
INSERT INTO `paginas` (`id_pagina`, `id_manga`, `id_capitulos`, `caminho_pagina`, `data_update`) VALUES
(787, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932763/mangas/martial-god-regressed-to-level-2/capitulo-3/yas5nnvv9aizwwfc0wfa.webp', '2025-06-26 10:12:43'),
(788, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932764/mangas/martial-god-regressed-to-level-2/capitulo-3/xqay2sclxovomujlah2o.webp', '2025-06-26 10:12:44'),
(789, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932765/mangas/martial-god-regressed-to-level-2/capitulo-3/krpjrtwvv2if1i40bthr.webp', '2025-06-26 10:12:45'),
(790, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932766/mangas/martial-god-regressed-to-level-2/capitulo-3/wjzo0sexyim4uyes8an3.webp', '2025-06-26 10:12:46'),
(791, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932767/mangas/martial-god-regressed-to-level-2/capitulo-3/rzegsi9lul9lc25fk12e.webp', '2025-06-26 10:12:47'),
(792, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932768/mangas/martial-god-regressed-to-level-2/capitulo-3/ss1skvfjy77vwjv9mrk8.webp', '2025-06-26 10:12:48'),
(793, 10, 54, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932769/mangas/martial-god-regressed-to-level-2/capitulo-3/odeuhesxmwagbbsqwnys.webp', '2025-06-26 10:12:49'),
(794, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932791/mangas/martial-god-regressed-to-level-2/capitulo-4/frvw5kfpp2p0yiu8gbxb.webp', '2025-06-26 10:13:11'),
(795, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932792/mangas/martial-god-regressed-to-level-2/capitulo-4/ublkdaoxs4zfi7jiiosu.webp', '2025-06-26 10:13:12'),
(796, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932793/mangas/martial-god-regressed-to-level-2/capitulo-4/rinarpkzq2u7flr2qlkv.webp', '2025-06-26 10:13:13'),
(797, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932794/mangas/martial-god-regressed-to-level-2/capitulo-4/xnp4arvgywijils0a3zg.webp', '2025-06-26 10:13:14'),
(798, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932795/mangas/martial-god-regressed-to-level-2/capitulo-4/akblmhka3wivwi6fujuo.webp', '2025-06-26 10:13:15'),
(799, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932796/mangas/martial-god-regressed-to-level-2/capitulo-4/eniug5zmwognnl5juogb.webp', '2025-06-26 10:13:16'),
(800, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932797/mangas/martial-god-regressed-to-level-2/capitulo-4/o0drh4xjc3qag6uq7muu.webp', '2025-06-26 10:13:17'),
(801, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932798/mangas/martial-god-regressed-to-level-2/capitulo-4/p2zhdovwv4gfrtdybwuz.webp', '2025-06-26 10:13:18'),
(802, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932799/mangas/martial-god-regressed-to-level-2/capitulo-4/dg2bxovckobqfdnockou.webp', '2025-06-26 10:13:19'),
(803, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932800/mangas/martial-god-regressed-to-level-2/capitulo-4/qyjxmpcugbtahy795rzo.webp', '2025-06-26 10:13:20'),
(804, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932801/mangas/martial-god-regressed-to-level-2/capitulo-4/kgnjaxueibxv4uli0dhl.webp', '2025-06-26 10:13:21'),
(805, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932802/mangas/martial-god-regressed-to-level-2/capitulo-4/ub5dsldh0etavchm06oe.webp', '2025-06-26 10:13:22'),
(806, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932803/mangas/martial-god-regressed-to-level-2/capitulo-4/ke6rg3kvu9fpqcd9wkc3.webp', '2025-06-26 10:13:23'),
(807, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932804/mangas/martial-god-regressed-to-level-2/capitulo-4/zs3dnhh6kaukkvwws0vw.webp', '2025-06-26 10:13:23'),
(808, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932804/mangas/martial-god-regressed-to-level-2/capitulo-4/z5dsihz32pem7unijpzn.webp', '2025-06-26 10:13:24'),
(809, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932805/mangas/martial-god-regressed-to-level-2/capitulo-4/o9jphqrnwg36fnpg8t4z.webp', '2025-06-26 10:13:25'),
(810, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932806/mangas/martial-god-regressed-to-level-2/capitulo-4/xkbxymkfj2tfed7spd8k.webp', '2025-06-26 10:13:26'),
(811, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932807/mangas/martial-god-regressed-to-level-2/capitulo-4/pet3zecbmilc2yqep2cc.webp', '2025-06-26 10:13:27'),
(812, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932808/mangas/martial-god-regressed-to-level-2/capitulo-4/xqtq6t41h76vo6vabyxk.webp', '2025-06-26 10:13:28'),
(813, 10, 55, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932809/mangas/martial-god-regressed-to-level-2/capitulo-4/r4qmdphgq68slgakpx4p.webp', '2025-06-26 10:13:29'),
(814, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932825/mangas/nano-machine/capitulo-1/fo8e013dlrcckbt0vtnp.webp', '2025-06-26 10:13:44'),
(815, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932826/mangas/nano-machine/capitulo-1/elhja3i2swdlfstbzuo4.webp', '2025-06-26 10:13:46'),
(816, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932827/mangas/nano-machine/capitulo-1/gjfuj5gopyeoxi8j11l1.webp', '2025-06-26 10:13:47'),
(817, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932828/mangas/nano-machine/capitulo-1/cxcoxwax644iqljj4mn1.webp', '2025-06-26 10:13:48'),
(818, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932829/mangas/nano-machine/capitulo-1/cgmbrvoj39veprh0uya4.webp', '2025-06-26 10:13:49'),
(819, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932830/mangas/nano-machine/capitulo-1/ok3jmsqdeeylngmhqqcg.webp', '2025-06-26 10:13:50'),
(820, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932831/mangas/nano-machine/capitulo-1/wpvzulztefthvqj3cybk.webp', '2025-06-26 10:13:51'),
(821, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932832/mangas/nano-machine/capitulo-1/zceymdysfzfqeyar2bub.webp', '2025-06-26 10:13:52'),
(822, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932833/mangas/nano-machine/capitulo-1/ttikaqqoscszhumdbmue.webp', '2025-06-26 10:13:53'),
(823, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932834/mangas/nano-machine/capitulo-1/uxfnwnet6eavb2xuchpr.webp', '2025-06-26 10:13:54'),
(824, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932836/mangas/nano-machine/capitulo-1/i1qkwuzvmysgyazq9err.webp', '2025-06-26 10:13:56'),
(825, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932837/mangas/nano-machine/capitulo-1/v2jrajgebirj1mdvfhgv.webp', '2025-06-26 10:13:57'),
(826, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932838/mangas/nano-machine/capitulo-1/dmns5pzizqlevhrdvst4.webp', '2025-06-26 10:13:58'),
(827, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932839/mangas/nano-machine/capitulo-1/xci6w6sa2j8pkq6cyz77.webp', '2025-06-26 10:13:59'),
(828, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932843/mangas/nano-machine/capitulo-1/omvf31jwny26zsxvaxb3.webp', '2025-06-26 10:14:03'),
(829, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932844/mangas/nano-machine/capitulo-1/f2dmo18mcd64ze3txooj.webp', '2025-06-26 10:14:04'),
(830, 11, 56, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932845/mangas/nano-machine/capitulo-1/abfbxb5vuachqby7jjnp.webp', '2025-06-26 10:14:05'),
(831, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932862/mangas/nano-machine/capitulo-2/kldx4lvve4inxbh8jojj.webp', '2025-06-26 10:14:22'),
(832, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932863/mangas/nano-machine/capitulo-2/g57bgqfwmcdo07rzebg1.webp', '2025-06-26 10:14:23'),
(833, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932864/mangas/nano-machine/capitulo-2/f74vwdrk6e8rtjyfuban.webp', '2025-06-26 10:14:24'),
(834, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932865/mangas/nano-machine/capitulo-2/tiiyuajuyndxwudmgz1m.webp', '2025-06-26 10:14:25'),
(835, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932866/mangas/nano-machine/capitulo-2/t8djdnirlzycknualyfn.webp', '2025-06-26 10:14:26'),
(836, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932867/mangas/nano-machine/capitulo-2/xf4hwaulvskrwezwheg6.webp', '2025-06-26 10:14:27'),
(837, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932868/mangas/nano-machine/capitulo-2/kxxsixkcsw8bgdtsnthi.webp', '2025-06-26 10:14:28'),
(838, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932870/mangas/nano-machine/capitulo-2/i2nmjz8f60hbncv0sgcx.webp', '2025-06-26 10:14:30'),
(839, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932871/mangas/nano-machine/capitulo-2/ob6ympt0kpqh2nqh15no.webp', '2025-06-26 10:14:31'),
(840, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932872/mangas/nano-machine/capitulo-2/zkxzkfy1u9mqxnytwn8m.webp', '2025-06-26 10:14:32'),
(841, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932873/mangas/nano-machine/capitulo-2/dbb1xkodk2exz0ci0a06.webp', '2025-06-26 10:14:33'),
(842, 11, 57, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932874/mangas/nano-machine/capitulo-2/jrpv0oxknq2qxelfwgti.webp', '2025-06-26 10:14:33'),
(843, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932890/mangas/nano-machine/capitulo-3/aig0vjlwfyolgzywah6e.webp', '2025-06-26 10:14:50'),
(844, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932891/mangas/nano-machine/capitulo-3/ze78pejpysnl5xpg5fz7.webp', '2025-06-26 10:14:51'),
(845, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932892/mangas/nano-machine/capitulo-3/gwj0kkppdgqftycdsvef.webp', '2025-06-26 10:14:52'),
(846, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932893/mangas/nano-machine/capitulo-3/t1jl5rxfaabok1e09tdu.webp', '2025-06-26 10:14:53'),
(847, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932894/mangas/nano-machine/capitulo-3/hpjp74balo9bhsifiqbn.webp', '2025-06-26 10:14:54'),
(848, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932895/mangas/nano-machine/capitulo-3/spw8x3ejgcftvcqz6srm.webp', '2025-06-26 10:14:55'),
(849, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932896/mangas/nano-machine/capitulo-3/wwiwdhwbdpl49unpqrfl.webp', '2025-06-26 10:14:56'),
(850, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932897/mangas/nano-machine/capitulo-3/uaag5dbvwsrl8efi1cwl.webp', '2025-06-26 10:14:57'),
(851, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932898/mangas/nano-machine/capitulo-3/nt47dcb9szqbeorzeup2.webp', '2025-06-26 10:14:58'),
(852, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932899/mangas/nano-machine/capitulo-3/juvso6ya6fcdygv85smw.webp', '2025-06-26 10:14:58'),
(853, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932900/mangas/nano-machine/capitulo-3/h2nbeshb2nbu0edsqmdz.webp', '2025-06-26 10:15:00'),
(854, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932901/mangas/nano-machine/capitulo-3/mrmg5stifeiyuvl0qezq.webp', '2025-06-26 10:15:01'),
(855, 11, 58, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932901/mangas/nano-machine/capitulo-3/jelvg7r0cqqzz5qsguxf.webp', '2025-06-26 10:15:01'),
(856, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932914/mangas/nano-machine/capitulo-4/dpqwqp4rgvgkhev0jc7m.webp', '2025-06-26 10:15:14'),
(857, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932915/mangas/nano-machine/capitulo-4/ff6ba5cgdxqqtnl0vlse.webp', '2025-06-26 10:15:15'),
(858, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932917/mangas/nano-machine/capitulo-4/gzmipzyhlgglzrpzkomi.webp', '2025-06-26 10:15:17'),
(859, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932918/mangas/nano-machine/capitulo-4/nrtilkvc7g1bx9t5wwbw.webp', '2025-06-26 10:15:18'),
(860, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932919/mangas/nano-machine/capitulo-4/knge8g4vkkdqmngftyf0.webp', '2025-06-26 10:15:19'),
(861, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932920/mangas/nano-machine/capitulo-4/ocjmitood48nifdukgea.webp', '2025-06-26 10:15:20'),
(862, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932921/mangas/nano-machine/capitulo-4/s7o7tylbwmim2drsebog.webp', '2025-06-26 10:15:21'),
(863, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932922/mangas/nano-machine/capitulo-4/muihqwgu4aiutum2itoc.webp', '2025-06-26 10:15:22'),
(864, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932923/mangas/nano-machine/capitulo-4/pepgohov0dsdrb3bi86i.webp', '2025-06-26 10:15:23'),
(865, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932924/mangas/nano-machine/capitulo-4/ikbdvbzuprvltcmnte6s.webp', '2025-06-26 10:15:24'),
(866, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932925/mangas/nano-machine/capitulo-4/wlyfjsn5i936vyyimq6e.webp', '2025-06-26 10:15:25'),
(867, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932926/mangas/nano-machine/capitulo-4/vna0brzxubzfotkhurly.webp', '2025-06-26 10:15:26'),
(868, 11, 59, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932927/mangas/nano-machine/capitulo-4/brxbabqyonyknxx8rcwt.webp', '2025-06-26 10:15:27'),
(869, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932960/mangas/solo-leveling/capitulo-0/o29whmzoma0ge3zzrydv.webp', '2025-06-26 10:15:59'),
(870, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932961/mangas/solo-leveling/capitulo-0/t1ecicidisyyhcdwaqvl.webp', '2025-06-26 10:16:01'),
(871, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932961/mangas/solo-leveling/capitulo-0/wnjlnjv3rtrdpm4m18t4.webp', '2025-06-26 10:16:02'),
(872, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932963/mangas/solo-leveling/capitulo-0/l0crfleqxoxqkzsswps0.webp', '2025-06-26 10:16:02'),
(873, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932963/mangas/solo-leveling/capitulo-0/zwijoquzb9ajhvyqktcv.webp', '2025-06-26 10:16:03'),
(874, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932964/mangas/solo-leveling/capitulo-0/afhrsfcv5ualypyunzn0.webp', '2025-06-26 10:16:04'),
(875, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932965/mangas/solo-leveling/capitulo-0/bmn4mgpqhzyinnaxdlao.webp', '2025-06-26 10:16:05'),
(876, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932965/mangas/solo-leveling/capitulo-0/eolkfzkjppsybhg60xt4.webp', '2025-06-26 10:16:05'),
(877, 8, 60, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932966/mangas/solo-leveling/capitulo-0/w8q3lw5laxcw9yd4hxqb.webp', '2025-06-26 10:16:06'),
(878, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932986/mangas/solo-leveling/capitulo-1/hmkcroezrwc4o7kby9lq.webp', '2025-06-26 10:16:26'),
(879, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932987/mangas/solo-leveling/capitulo-1/kdoquu7yr2kcxuhftiei.webp', '2025-06-26 10:16:27'),
(880, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932988/mangas/solo-leveling/capitulo-1/o8mxm7qr7rehs9ewkua7.webp', '2025-06-26 10:16:28'),
(881, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932989/mangas/solo-leveling/capitulo-1/czecklcbdcvcpqlvqdcc.webp', '2025-06-26 10:16:29'),
(882, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932990/mangas/solo-leveling/capitulo-1/k8gxh79izktpsc32uq7g.webp', '2025-06-26 10:16:30'),
(883, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932991/mangas/solo-leveling/capitulo-1/cppmghlipn2mezu8sfqr.webp', '2025-06-26 10:16:31'),
(884, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932991/mangas/solo-leveling/capitulo-1/nzfnclkwswurea60h9nu.webp', '2025-06-26 10:16:32'),
(885, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932993/mangas/solo-leveling/capitulo-1/ba18hklssai3x519dpgt.webp', '2025-06-26 10:16:33'),
(886, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932994/mangas/solo-leveling/capitulo-1/mw6frjrzmbwpe6wzfuep.webp', '2025-06-26 10:16:34'),
(887, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932995/mangas/solo-leveling/capitulo-1/aia16h0ooaigq1htluhw.webp', '2025-06-26 10:16:35'),
(888, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932996/mangas/solo-leveling/capitulo-1/ql5k7a7ooxvoab8gyy1z.webp', '2025-06-26 10:16:36'),
(889, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932997/mangas/solo-leveling/capitulo-1/dudzvc24ustzltbuefqu.webp', '2025-06-26 10:16:36'),
(890, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932997/mangas/solo-leveling/capitulo-1/dah807kxxyonwrcqaj0e.webp', '2025-06-26 10:16:37'),
(891, 8, 61, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750932998/mangas/solo-leveling/capitulo-1/yfkolszyldveretyeplp.webp', '2025-06-26 10:16:38'),
(892, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933015/mangas/solo-leveling/capitulo-2/rovufig35c0pkiqrigjw.webp', '2025-06-26 10:16:55'),
(893, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933016/mangas/solo-leveling/capitulo-2/rrgkviwdk0hpokqjjddh.webp', '2025-06-26 10:16:56'),
(894, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933017/mangas/solo-leveling/capitulo-2/wrctpcjai0h7rhtlqqrv.webp', '2025-06-26 10:16:56'),
(895, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933017/mangas/solo-leveling/capitulo-2/ibfljaaebrgm9r6ljlia.webp', '2025-06-26 10:16:57'),
(896, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933018/mangas/solo-leveling/capitulo-2/eausl3k5culoozn2ijh5.webp', '2025-06-26 10:16:58'),
(897, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933019/mangas/solo-leveling/capitulo-2/erhpcscqfqfzz8chjlse.webp', '2025-06-26 10:16:59'),
(898, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933019/mangas/solo-leveling/capitulo-2/m6dg6sj2yzezloszhgau.webp', '2025-06-26 10:16:59'),
(899, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933020/mangas/solo-leveling/capitulo-2/ouoipdjbhk5qplo005av.webp', '2025-06-26 10:17:00'),
(900, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933021/mangas/solo-leveling/capitulo-2/agg22x2wqqylzkuggwgq.webp', '2025-06-26 10:17:01'),
(901, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933021/mangas/solo-leveling/capitulo-2/mr0zwxvabeiptb9gbetr.webp', '2025-06-26 10:17:01'),
(902, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933022/mangas/solo-leveling/capitulo-2/hvkwucmb7qylbsdxnde8.webp', '2025-06-26 10:17:02'),
(903, 8, 62, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933023/mangas/solo-leveling/capitulo-2/qxlavfpvb9m4ermttdy3.webp', '2025-06-26 10:17:03'),
(904, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933040/mangas/solo-leveling/capitulo-3/qyk0lkiwyfz4ghltocco.webp', '2025-06-26 10:17:19'),
(905, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933040/mangas/solo-leveling/capitulo-3/bxjtbbuqrgurwk89pew7.webp', '2025-06-26 10:17:20'),
(906, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933041/mangas/solo-leveling/capitulo-3/lsdr7z12z7fum6oadgsx.webp', '2025-06-26 10:17:21'),
(907, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933042/mangas/solo-leveling/capitulo-3/fqqajvwlkdauax1zjmil.webp', '2025-06-26 10:17:22'),
(908, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933043/mangas/solo-leveling/capitulo-3/uus0opmg6jwvjb99wqux.webp', '2025-06-26 10:17:22'),
(909, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933043/mangas/solo-leveling/capitulo-3/dxkcrpmf37z4jyzua35y.webp', '2025-06-26 10:17:23'),
(910, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933044/mangas/solo-leveling/capitulo-3/yohebq9r98sulaewmyrw.webp', '2025-06-26 10:17:24'),
(911, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933045/mangas/solo-leveling/capitulo-3/gthl8dagdj3anb60kqws.webp', '2025-06-26 10:17:25'),
(912, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933046/mangas/solo-leveling/capitulo-3/zqfaugpcigihoetpqyvy.webp', '2025-06-26 10:17:26'),
(913, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933047/mangas/solo-leveling/capitulo-3/ihaatxtmjlinuj528k1w.webp', '2025-06-26 10:17:27'),
(914, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933048/mangas/solo-leveling/capitulo-3/zms9qtpnlw2n72orsunx.webp', '2025-06-26 10:17:28'),
(915, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933049/mangas/solo-leveling/capitulo-3/ksrhen2di3fy3c3ddguq.webp', '2025-06-26 10:17:29'),
(916, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933049/mangas/solo-leveling/capitulo-3/nvjpauqtgr3kvdobz1lv.webp', '2025-06-26 10:17:29'),
(917, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933050/mangas/solo-leveling/capitulo-3/bl0dtiv15jdcnduzoo4n.webp', '2025-06-26 10:17:30'),
(918, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933051/mangas/solo-leveling/capitulo-3/sve6l4kpukovhwvn7fpj.webp', '2025-06-26 10:17:31'),
(919, 8, 63, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933052/mangas/solo-leveling/capitulo-3/lobij9lufgu1alpmgby1.webp', '2025-06-26 10:17:32'),
(920, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933070/mangas/solo-max-level-newbie/capitulo-0/jhqzingrqcgzkelb9mdr.webp', '2025-06-26 10:17:50'),
(921, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933071/mangas/solo-max-level-newbie/capitulo-0/yukdknjl4loa6w7flvyc.webp', '2025-06-26 10:17:51'),
(922, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933072/mangas/solo-max-level-newbie/capitulo-0/of61tvzyhuks3adthdar.webp', '2025-06-26 10:17:52'),
(923, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933073/mangas/solo-max-level-newbie/capitulo-0/m0ykiul3tvkv2crwiszm.webp', '2025-06-26 10:17:53'),
(924, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933074/mangas/solo-max-level-newbie/capitulo-0/v89oc5necnx0ncjkqxq8.webp', '2025-06-26 10:17:53'),
(925, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933074/mangas/solo-max-level-newbie/capitulo-0/yfrsmccrdglq84el8sai.webp', '2025-06-26 10:17:54'),
(926, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933075/mangas/solo-max-level-newbie/capitulo-0/pefblokiaxstrgzqxmp1.webp', '2025-06-26 10:17:55'),
(927, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933076/mangas/solo-max-level-newbie/capitulo-0/bfs4jjsvwkzmw1scmh74.webp', '2025-06-26 10:17:56'),
(928, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933077/mangas/solo-max-level-newbie/capitulo-0/viu6wjipiv4xmctxe2ky.webp', '2025-06-26 10:17:57'),
(929, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933077/mangas/solo-max-level-newbie/capitulo-0/ifynphri8ormbabjndrr.webp', '2025-06-26 10:17:57'),
(930, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933078/mangas/solo-max-level-newbie/capitulo-0/uhvppl5ij92weomucwa7.webp', '2025-06-26 10:17:58'),
(931, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933079/mangas/solo-max-level-newbie/capitulo-0/bu1ogqcl9kgnbqphwkkz.webp', '2025-06-26 10:17:59'),
(932, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933080/mangas/solo-max-level-newbie/capitulo-0/m6wumbqpvwrr2ug2l6wk.webp', '2025-06-26 10:18:00'),
(933, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933081/mangas/solo-max-level-newbie/capitulo-0/pwmkprpiyxqbcloum7th.webp', '2025-06-26 10:18:00'),
(934, 9, 64, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933081/mangas/solo-max-level-newbie/capitulo-0/tkbiwdfuejxc7qd6jywf.webp', '2025-06-26 10:18:01'),
(935, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933100/mangas/solo-max-level-newbie/capitulo-1/sj9or9vvnrttr9lsi1en.webp', '2025-06-26 10:18:19'),
(936, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933101/mangas/solo-max-level-newbie/capitulo-1/jidoem8ltc7djttbxxd6.webp', '2025-06-26 10:18:21'),
(937, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933102/mangas/solo-max-level-newbie/capitulo-1/hwj5dedjwm5yjm0was9g.webp', '2025-06-26 10:18:22'),
(938, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933103/mangas/solo-max-level-newbie/capitulo-1/ntglf65u3dwmhfybzyah.webp', '2025-06-26 10:18:23'),
(939, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933103/mangas/solo-max-level-newbie/capitulo-1/knvby3iw8ji90onl8qsd.webp', '2025-06-26 10:18:23'),
(940, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933104/mangas/solo-max-level-newbie/capitulo-1/klp6opbdoq5kfqelmh6g.webp', '2025-06-26 10:18:24'),
(941, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933105/mangas/solo-max-level-newbie/capitulo-1/r9ld67zjytr9zkyoafcd.webp', '2025-06-26 10:18:25'),
(942, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933106/mangas/solo-max-level-newbie/capitulo-1/qr4kb9j2eea4tj1ueccj.webp', '2025-06-26 10:18:25'),
(943, 9, 65, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933106/mangas/solo-max-level-newbie/capitulo-1/ctflaubb2adzbzyvkuod.webp', '2025-06-26 10:18:26'),
(944, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933122/mangas/solo-max-level-newbie/capitulo-2/ymnm0e8yqgc46effz124.webp', '2025-06-26 10:18:42'),
(945, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933124/mangas/solo-max-level-newbie/capitulo-2/vmoaqloighbtumxye8nc.webp', '2025-06-26 10:18:44'),
(946, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933125/mangas/solo-max-level-newbie/capitulo-2/mm5quz4tng8lputyxbxm.webp', '2025-06-26 10:18:45'),
(947, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933126/mangas/solo-max-level-newbie/capitulo-2/znkajnvabzgko325dyto.webp', '2025-06-26 10:18:46'),
(948, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933127/mangas/solo-max-level-newbie/capitulo-2/cae12urr0mi38igqrnqj.webp', '2025-06-26 10:18:47'),
(949, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933128/mangas/solo-max-level-newbie/capitulo-2/gvlix777ekyvxwch47iq.webp', '2025-06-26 10:18:48'),
(950, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933129/mangas/solo-max-level-newbie/capitulo-2/hbcc9w4jumhou0atczai.webp', '2025-06-26 10:18:49'),
(951, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933130/mangas/solo-max-level-newbie/capitulo-2/mgqmhwsddnmptrmlpnvi.webp', '2025-06-26 10:18:49'),
(952, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933130/mangas/solo-max-level-newbie/capitulo-2/yo9vidwhkg03sw7jyznw.webp', '2025-06-26 10:18:50'),
(953, 9, 66, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933131/mangas/solo-max-level-newbie/capitulo-2/pzgxpgmyh5coudvgc2k6.webp', '2025-06-26 10:18:51'),
(954, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933143/mangas/solo-max-level-newbie/capitulo-3/ive6orb65wzlkg75opvf.webp', '2025-06-26 10:19:03'),
(955, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933145/mangas/solo-max-level-newbie/capitulo-3/eiyxymthykyoy3ey9nx0.webp', '2025-06-26 10:19:05'),
(956, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933146/mangas/solo-max-level-newbie/capitulo-3/bhxxwo2cvvykkz2zglex.webp', '2025-06-26 10:19:06'),
(957, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933147/mangas/solo-max-level-newbie/capitulo-3/st5evypwsrmppfmgxvyx.webp', '2025-06-26 10:19:07'),
(958, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933147/mangas/solo-max-level-newbie/capitulo-3/klekdafhhmjtcrmxicwn.webp', '2025-06-26 10:19:07'),
(959, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933148/mangas/solo-max-level-newbie/capitulo-3/d82o68hyhykaaev278er.webp', '2025-06-26 10:19:08'),
(960, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933149/mangas/solo-max-level-newbie/capitulo-3/sbsxojcu4g8chnxbqupp.webp', '2025-06-26 10:19:09'),
(961, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933150/mangas/solo-max-level-newbie/capitulo-3/uqlabwn4bu6atdgbmqni.webp', '2025-06-26 10:19:10'),
(962, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933151/mangas/solo-max-level-newbie/capitulo-3/oophbd9yatoeyus7smh1.webp', '2025-06-26 10:19:11'),
(963, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933152/mangas/solo-max-level-newbie/capitulo-3/trrccrlctlu0dbqpzuzg.webp', '2025-06-26 10:19:12'),
(964, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933153/mangas/solo-max-level-newbie/capitulo-3/bh2mkpge4zyosxv3cfyg.webp', '2025-06-26 10:19:13'),
(965, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933154/mangas/solo-max-level-newbie/capitulo-3/i4h1bawelp0birn2slii.webp', '2025-06-26 10:19:14'),
(966, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933155/mangas/solo-max-level-newbie/capitulo-3/klx4ntj2bpyrf69nlzbw.webp', '2025-06-26 10:19:15'),
(967, 9, 67, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933156/mangas/solo-max-level-newbie/capitulo-3/g2y70fnv3mlpviffdxfd.webp', '2025-06-26 10:19:15'),
(968, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933200/mangas/versatile-mage/capitulo-1/yv8ne85uhqqgxopcwbmw.webp', '2025-06-26 10:20:00'),
(969, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933201/mangas/versatile-mage/capitulo-1/xjrjjfprfrgoct0bi8me.webp', '2025-06-26 10:20:00'),
(970, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933201/mangas/versatile-mage/capitulo-1/hq2uove2dqrwsnu1q2yw.webp', '2025-06-26 10:20:01'),
(971, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933202/mangas/versatile-mage/capitulo-1/duca9td1esgmdb9jq3ah.webp', '2025-06-26 10:20:02'),
(972, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933203/mangas/versatile-mage/capitulo-1/k3fnnw8c7nomhgtjb2di.webp', '2025-06-26 10:20:03'),
(973, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933203/mangas/versatile-mage/capitulo-1/pxtwnquycsodlflzxgqq.webp', '2025-06-26 10:20:03'),
(974, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933204/mangas/versatile-mage/capitulo-1/u8bi9pvnpejdijvsattx.webp', '2025-06-26 10:20:04'),
(975, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933205/mangas/versatile-mage/capitulo-1/ernzbfcxaoely6xxbxu8.webp', '2025-06-26 10:20:05'),
(976, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933206/mangas/versatile-mage/capitulo-1/p1ro23d7wyu2kdyleoyu.webp', '2025-06-26 10:20:06'),
(977, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933206/mangas/versatile-mage/capitulo-1/anrunmtr3aownsaxxetr.webp', '2025-06-26 10:20:06'),
(978, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933207/mangas/versatile-mage/capitulo-1/deh9kurxutlr0manfhzt.webp', '2025-06-26 10:20:07'),
(979, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933208/mangas/versatile-mage/capitulo-1/i4thjilrmaqjlesw2svb.webp', '2025-06-26 10:20:08'),
(980, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933209/mangas/versatile-mage/capitulo-1/x1yyjdtgtgklir3ucpog.webp', '2025-06-26 10:20:09'),
(981, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933209/mangas/versatile-mage/capitulo-1/h6hngf6cugawac55fuoo.webp', '2025-06-26 10:20:09'),
(982, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933210/mangas/versatile-mage/capitulo-1/ds9t2gdk6ew8ksdedp5o.webp', '2025-06-26 10:20:10'),
(983, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933211/mangas/versatile-mage/capitulo-1/ctlar8nhzektz2vfq8io.webp', '2025-06-26 10:20:11'),
(984, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933211/mangas/versatile-mage/capitulo-1/s42dcgfqsg06bqb0tx5h.webp', '2025-06-26 10:20:11'),
(985, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933212/mangas/versatile-mage/capitulo-1/f2dw1uqf6iz4mcgxehc2.webp', '2025-06-26 10:20:12'),
(986, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933213/mangas/versatile-mage/capitulo-1/lbmwcugrddhdprha38f6.webp', '2025-06-26 10:20:12'),
(987, 7, 68, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933213/mangas/versatile-mage/capitulo-1/uw89l0kbgq8dywavccg9.webp', '2025-06-26 10:20:13'),
(988, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933228/mangas/versatile-mage/capitulo-2/fv8eygzk676dhiw0gbji.webp', '2025-06-26 10:20:28'),
(989, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933229/mangas/versatile-mage/capitulo-2/xmokilq06xzgdqwkgeoj.webp', '2025-06-26 10:20:29'),
(990, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933230/mangas/versatile-mage/capitulo-2/v84ffj19jpzlrekgrdnv.webp', '2025-06-26 10:20:30'),
(991, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933230/mangas/versatile-mage/capitulo-2/v9c3ezhx8if50b4fc4ie.webp', '2025-06-26 10:20:30'),
(992, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933231/mangas/versatile-mage/capitulo-2/skw7asju5flnxlae8df5.webp', '2025-06-26 10:20:31'),
(993, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933232/mangas/versatile-mage/capitulo-2/llsqwl4aj5ah0u9yskk7.webp', '2025-06-26 10:20:31'),
(994, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933232/mangas/versatile-mage/capitulo-2/ufhnuj5xfzoqrslygyef.webp', '2025-06-26 10:20:32'),
(995, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933233/mangas/versatile-mage/capitulo-2/rmdy5pe3vdo4trmmypa7.webp', '2025-06-26 10:20:33'),
(996, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933234/mangas/versatile-mage/capitulo-2/xxqjvs3xjtocdjiwdfvn.webp', '2025-06-26 10:20:34'),
(997, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933235/mangas/versatile-mage/capitulo-2/ewgeigao8jltnktnobyq.webp', '2025-06-26 10:20:34'),
(998, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933235/mangas/versatile-mage/capitulo-2/y7ftu7ppogv5kabiozhi.webp', '2025-06-26 10:20:35'),
(999, 7, 69, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933236/mangas/versatile-mage/capitulo-2/ye5erc50amcbxrcx7rjq.webp', '2025-06-26 10:20:36'),
(1000, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933253/mangas/versatile-mage/capitulo-3/nlghfjuyqdaar6shsyte.webp', '2025-06-26 10:20:53'),
(1001, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933254/mangas/versatile-mage/capitulo-3/go7hfpn508mdorzdc8wv.webp', '2025-06-26 10:20:54'),
(1002, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933254/mangas/versatile-mage/capitulo-3/rvdawtttwof6nz7jyaw5.webp', '2025-06-26 10:20:54'),
(1003, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933255/mangas/versatile-mage/capitulo-3/vc8e7muvmiidhlj6xmnl.webp', '2025-06-26 10:20:55'),
(1004, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933256/mangas/versatile-mage/capitulo-3/qq0kvqydf9g4onln2zac.webp', '2025-06-26 10:20:56'),
(1005, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933259/mangas/versatile-mage/capitulo-3/rlx8t5j24b6inxroxjin.webp', '2025-06-26 10:20:59'),
(1006, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933260/mangas/versatile-mage/capitulo-3/ykonngfq0m0qacztnzby.webp', '2025-06-26 10:21:00'),
(1007, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933260/mangas/versatile-mage/capitulo-3/b214xhpa0fkofafxdt9g.webp', '2025-06-26 10:21:00'),
(1008, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933261/mangas/versatile-mage/capitulo-3/mxuxkx6t03xbpadza2nf.webp', '2025-06-26 10:21:01'),
(1009, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933262/mangas/versatile-mage/capitulo-3/hqom4vpywlfw04l4nytv.webp', '2025-06-26 10:21:02'),
(1010, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933263/mangas/versatile-mage/capitulo-3/o6mwiyytpvte2lqkdbqq.webp', '2025-06-26 10:21:03'),
(1011, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933263/mangas/versatile-mage/capitulo-3/oja4drbft1gvktt1nu01.webp', '2025-06-26 10:21:03'),
(1012, 7, 70, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933264/mangas/versatile-mage/capitulo-3/ys1gbynxj6tfaku08oab.webp', '2025-06-26 10:21:04'),
(1013, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933298/mangas/versatile-mage/capitulo-4/a7uo3mpwocfencltdajo.webp', '2025-06-26 10:21:38'),
(1014, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933299/mangas/versatile-mage/capitulo-4/jt9wqrlytqsmk3dkqtqo.webp', '2025-06-26 10:21:39'),
(1015, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933300/mangas/versatile-mage/capitulo-4/b7mibrkr4x4oq6jytsfu.webp', '2025-06-26 10:21:39'),
(1016, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933300/mangas/versatile-mage/capitulo-4/goa4izwvvf7tsat7zywf.webp', '2025-06-26 10:21:40'),
(1017, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933301/mangas/versatile-mage/capitulo-4/ifruwefalbmtfgtdwcox.webp', '2025-06-26 10:21:41'),
(1018, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933302/mangas/versatile-mage/capitulo-4/hveigygfumkkypeuofpt.webp', '2025-06-26 10:21:42'),
(1019, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933303/mangas/versatile-mage/capitulo-4/anfsquynqfokzj2qmhxl.webp', '2025-06-26 10:21:43'),
(1020, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933303/mangas/versatile-mage/capitulo-4/wtedkd9avxyjyey4ms0t.webp', '2025-06-26 10:21:43'),
(1021, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933304/mangas/versatile-mage/capitulo-4/lyaqdr9vvqxw2zlexgot.webp', '2025-06-26 10:21:44'),
(1022, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933305/mangas/versatile-mage/capitulo-4/uca25blhaa4ukyegw69d.webp', '2025-06-26 10:21:45'),
(1023, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933306/mangas/versatile-mage/capitulo-4/gkc99mnklifqjhphiphg.webp', '2025-06-26 10:21:45'),
(1024, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933306/mangas/versatile-mage/capitulo-4/uto0vzhy3qpb7tzdqjvi.webp', '2025-06-26 10:21:46'),
(1025, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933307/mangas/versatile-mage/capitulo-4/zcyhv467n0y5b16yakvb.webp', '2025-06-26 10:21:47'),
(1026, 7, 71, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1750933308/mangas/versatile-mage/capitulo-4/usjsdapobtejvklu4i4u.webp', '2025-06-26 10:21:48');

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
(2, 'editor.test', 'areanaread.editor@mailinator.com', '$2y$10$ipYVu5P98zU6e4zvLv3pGeh4Pf8MTfIehpISK4xMNUPNgIR30MNWu', 'editor', '2025-06-25 14:29:12', NULL, NULL),
(3, 'admin.test', 'areanaread.admin@mailinator.com', '$2y$10$09pt1.3bW8V3BgvmvTmb1uJLG2eSRavs96Bnd2U9v86rMgY2u543C', 'admin', '2025-06-25 14:32:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_progress`
--

CREATE TABLE `user_progress` (
  `iduser` int(11) NOT NULL,
  `link_manga` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capitulos_lidos` text NOT NULL,
  `data_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `user_progress`
--

INSERT INTO `user_progress` (`iduser`, `link_manga`, `capitulos_lidos`, `data_update`) VALUES
(1, 'martial-god-regressed-to-level-2', '[1,2,3,4]', '2025-06-26 11:22:46'),
(1, 'nano-machine', '[1,2,3,4]', '2025-06-26 11:22:26'),
(1, 'reincarnation-of-the-suicidal-battle-god', '[1,2,3]', '2025-06-26 11:23:03'),
(1, 'solo-leveling', '[0,1,2,3]', '2025-06-26 11:22:19'),
(1, 'solo-max-level-newbie', '[0,1,2,3]', '2025-06-26 11:22:10'),
(1, 'superhuman-battlefield', '[1,2,3]', '2025-06-26 09:33:58'),
(1, 'terminally-ill-genius-dark-knight', '[1,2,3,4]', '2025-06-26 11:22:56'),
(1, 'versatile-mage', '[1,2,3,4]', '2025-06-26 11:22:02'),
(1, 'warrior-high-school-dungeon-raid-department', '[1,2,3,4]', '2025-06-26 11:23:12');

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
  ADD PRIMARY KEY (`iduser`,`link_manga`),
  ADD KEY `link_manga` (`link_manga`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `capitulos`
--
ALTER TABLE `capitulos`
  MODIFY `id_capitulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id do manga', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  MODIFY `id_manga_generos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1027;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único do utilizador\r\n', AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`link_manga`) REFERENCES `mangas` (`link`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
