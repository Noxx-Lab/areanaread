-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jun-2025 às 10:50
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
(1, 3, 0, '2025-06-30 09:37:52'),
(2, 3, 1, '2025-06-30 09:37:54'),
(3, 3, 2, '2025-06-30 09:37:55'),
(4, 3, 3, '2025-06-30 09:37:55'),
(5, 4, 0, '2025-06-30 09:38:00'),
(6, 4, 1, '2025-06-30 09:38:01'),
(7, 4, 2, '2025-06-30 09:38:02'),
(8, 4, 3, '2025-06-30 09:38:02'),
(9, 2, 1, '2025-06-30 09:38:06'),
(10, 2, 2, '2025-06-30 09:38:07'),
(11, 2, 3, '2025-06-30 09:38:08'),
(12, 2, 4, '2025-06-30 09:38:11'),
(13, 1, 1, '2025-06-30 09:38:15'),
(14, 1, 2, '2025-06-30 09:38:16'),
(15, 1, 3, '2025-06-30 09:38:18'),
(16, 1, 4, '2025-06-30 09:38:19');

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
(1, 'Warrior High School – Dungeon Raid Department', 'warrior-high-school-dungeon-raid-department', 'Manhwa', 'Ongoing', 'Num mundo onde os calabouços surgem misteriosamente, a humanidade precisa de caçadores para proteger a paz. No Warrior High School, os alunos treinam para se tornarem caçadores de elite. Entre eles, surge um jovem com um passado misterioso e um talento extraordinário para o combate. Quando monstros atacam, o Departamento de Dungeon Raid é a primeira linha de defesa, e a sobrevivência da humanidade depende do trabalho desta equipa.', 'Park Minseo (박민서)', 'Jo Hyunhwan (조현환)', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272270/capas/php3BE5_bdsqds.jpg'),
(2, 'Superhuman Battlefield', 'superhuman-battlefield', 'Manhwa', 'Ongoing', 'O mundo foi abalado por uma guerra onde super-humanos enfrentaram monstros vindos de outras dimensões. Entre eles, Seo MoonYeop, o herói lendário, foi o responsável por salvar a humanidade.\r\nMas, após o fim da guerra, Seo MoonYeop foi injustamente esquecido e tornou-se apenas mais um rosto anónimo na multidão. Agora, com o ressurgimento das batalhas e o perigo a aumentar, ele decide regressar à arena para mostrar novamente o seu poder e provar que é, de facto, o herói mais forte do mundo.\r\nPreparem-se para uma história épica onde o combate entre super-humanos e monstros define o destino da Terra!', 'Niccolo', 'Plan A', 2022, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272384/capas/php116_pp8vdi.png'),
(3, 'Solo Leveling', 'solo-leveling', 'Manhwa', 'Finalizado', 'Num mundo onde portais misteriosos ligam a Terra a dimensões repletas de monstros, apenas caçadores com habilidades especiais conseguem entrar e lutar.\r\nSung Jin-Woo, conhecido como o \"Caçador Mais Fraco do Mundo\", luta para sobreviver como um E-rank. No entanto, tudo muda quando ele enfrenta uma dungeon secreta e recebe uma oportunidade única: tornar-se um Jogador com a habilidade de \"subir de nível\" — algo que ninguém mais consegue fazer.\r\nCom o seu novo poder, Sung Jin-Woo começa a desafiar monstros, chefes e até outros caçadores, evoluindo de um fraco a uma lenda inigualável.', 'Chugong', 'Jang Sung-rak (REDICE Studio)', 2018, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272502/capas/phpCFFB_rzv2h3.jpg'),
(4, 'Solo Max-Level Newbie', 'solo-max-level-newbie', 'Manhwa', 'Ongoing', 'Jinhyuk é um streamer conhecido por jogar o jogo Tower of Trials, mas quando o jogo perde popularidade e ele se prepara para encerrar a carreira... a torre misteriosamente aparece no mundo real.\r\nO que para muitos é um apocalipse, para Jinhyuk é uma oportunidade: ele é o único jogador que conhece os segredos e estratégias de cada andar, cada boss e cada puzzle, pois foi o único a terminar o jogo no nível máximo.\r\nCom o seu conhecimento avançado e inteligência estratégica, Jinhyuk sobe a torre enquanto outros tentam apenas sobreviver — e rapidamente deixa de ser apenas um streamer para se tornar uma lenda.', 'Jang Sung-Lak', 'Swing Bat, Redice Studio', 2021, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272637/capas/phpDAFE_sdhjvl.png');

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
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 6),
(5, 1, 7),
(7, 1, 10),
(8, 1, 14),
(10, 1, 24),
(6, 1, 35),
(9, 1, 48),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(14, 2, 4),
(15, 2, 7),
(18, 2, 10),
(19, 2, 11),
(20, 2, 14),
(21, 2, 20),
(16, 2, 35),
(17, 2, 37),
(22, 2, 46),
(64, 3, 1),
(65, 3, 3),
(66, 3, 6),
(67, 3, 10),
(68, 3, 11),
(69, 3, 13),
(70, 3, 14),
(71, 3, 20),
(31, 4, 1),
(32, 4, 3),
(33, 4, 4),
(34, 4, 7),
(35, 4, 10),
(36, 4, 11),
(37, 4, 14),
(39, 4, 22),
(38, 4, 48);

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
(1, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272760/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/bt6rwkxy1lel6wud6tsx.webp', '2025-06-30 08:39:21'),
(2, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272761/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/f3j1l0q0tmzptdh47lvr.webp', '2025-06-30 08:39:22'),
(3, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272762/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/vs2bzdhvrzz4f1xj7ksz.webp', '2025-06-30 08:39:23'),
(4, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272763/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/hbvllb3eubfj69yktawu.webp', '2025-06-30 08:39:24'),
(5, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272764/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/pwmymvghx0nwjexzsg5f.webp', '2025-06-30 08:39:25'),
(6, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272765/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/uwdk94qawfziyxxxyej0.webp', '2025-06-30 08:39:25'),
(7, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272766/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/l7bdzn06zxkdumb3nyph.webp', '2025-06-30 08:39:27'),
(8, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272767/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/kucsiyr6q9gr4vpylmew.webp', '2025-06-30 08:39:27'),
(9, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272768/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/thi9mozd7jrrm7amjc5x.webp', '2025-06-30 08:39:28'),
(10, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272768/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/y2gkgwpcarb4gsbgavw6.webp', '2025-06-30 08:39:29'),
(11, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272769/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/rnx4h42bjwgmepslnjud.webp', '2025-06-30 08:39:30'),
(12, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272771/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/ywotwoibgzzjefqr6rgs.webp', '2025-06-30 08:39:31'),
(13, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272772/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/rmztejpxug0eq7dla7gg.webp', '2025-06-30 08:39:33'),
(14, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272774/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/zzbkdrcgxjelfldmfgho.webp', '2025-06-30 08:39:34'),
(15, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272774/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/nm2xkouddu7j2rqswdi0.webp', '2025-06-30 08:39:35'),
(16, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272775/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/k3afpawddyso8dlbdxlu.webp', '2025-06-30 08:39:36'),
(17, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272776/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/fe8x43ghbhq1qagz1lp2.webp', '2025-06-30 08:39:36'),
(18, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272777/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/oghj2nc8vkuce4fjc5hj.webp', '2025-06-30 08:39:37'),
(19, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272778/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/vckderqsfhcuc0wjnnpm.webp', '2025-06-30 08:39:38'),
(20, 1, 13, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272778/mangas/warrior-high-school-dungeon-raid-department/capitulo-1/ritwltmzhgxxcrmxgzgx.webp', '2025-06-30 08:39:39'),
(21, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272800/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/jvjbfebzpqi6aacgailk.webp', '2025-06-30 08:40:00'),
(22, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272801/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/ndh9eckw7wxygknzqkgt.webp', '2025-06-30 08:40:01'),
(23, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272802/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/cazx0ykwwtstnfes9tjn.webp', '2025-06-30 08:40:02'),
(24, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272803/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/xliof7wnaikh1os7irnw.webp', '2025-06-30 08:40:04'),
(25, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272804/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/srcjfe1sbyhi9i2spo4w.webp', '2025-06-30 08:40:05'),
(26, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272806/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/exrb99ktqkbhpiupqtuy.webp', '2025-06-30 08:40:07'),
(27, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272807/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/na00bgp9iximwyrwqjay.webp', '2025-06-30 08:40:08'),
(28, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272808/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/zlntyfsaokxduzwwywkx.webp', '2025-06-30 08:40:09'),
(29, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272810/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/zuliqyyhdiby4yfyfo7j.webp', '2025-06-30 08:40:10'),
(30, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272811/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/vjxxvbti1d47szyecrtd.webp', '2025-06-30 08:40:11'),
(31, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272811/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/brmfrnnmqgekhkraelvc.webp', '2025-06-30 08:40:12'),
(32, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272813/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/pa4taajvlmprk52tlh9s.webp', '2025-06-30 08:40:14'),
(33, 1, 14, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272814/mangas/warrior-high-school-dungeon-raid-department/capitulo-2/hjs5s7izqmmyogi02n9e.webp', '2025-06-30 08:40:14'),
(34, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272828/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/d6n5n0wajwz13sdadknc.webp', '2025-06-30 08:40:28'),
(35, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272829/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/xf3iahijfh2amfwsy49j.webp', '2025-06-30 08:40:30'),
(36, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272830/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/okug07drvfjxnazmuc8c.webp', '2025-06-30 08:40:31'),
(37, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272831/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/mpbnm6085j3mfwkmohvw.webp', '2025-06-30 08:40:32'),
(38, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272832/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/mkqxcsawowddyop3f1jl.webp', '2025-06-30 08:40:32'),
(39, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272833/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/je7kpaelx567lzrrzjpu.webp', '2025-06-30 08:40:33'),
(40, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272834/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/xslhtbodmz8l9z1vo5xw.webp', '2025-06-30 08:40:34'),
(41, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272835/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/kc01n9tftf3lsrk7hurb.webp', '2025-06-30 08:40:35'),
(42, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272835/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/vfjcj53dhw3viecvguor.webp', '2025-06-30 08:40:36'),
(43, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272836/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/d9hd92mrep1emuzfu3oj.webp', '2025-06-30 08:40:37'),
(44, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272837/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/lcprrqxud5m88avimvcl.webp', '2025-06-30 08:40:38'),
(45, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272838/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/dwfyubufkzkk1iwq8adz.webp', '2025-06-30 08:40:38'),
(46, 1, 15, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272839/mangas/warrior-high-school-dungeon-raid-department/capitulo-3/hhdsu2pn4w4zelrkpetg.webp', '2025-06-30 08:40:39'),
(47, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272857/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/kwdfswgcca1gsuqnb9hm.webp', '2025-06-30 08:40:57'),
(48, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272858/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/rtktywaisaqrgjbc9vvz.webp', '2025-06-30 08:40:59'),
(49, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272859/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/l4fsowneyit5pzedgakr.webp', '2025-06-30 08:40:59'),
(50, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272860/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/ehxknllcra2qjjssvgvt.webp', '2025-06-30 08:41:01'),
(51, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272861/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/hbiz4lc5c63kj8nhwvji.webp', '2025-06-30 08:41:02'),
(52, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272863/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/indp3w3kvgi3gofic7xh.webp', '2025-06-30 08:41:03'),
(53, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272864/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/xj8cvgpc0cq8zrw7uy2l.webp', '2025-06-30 08:41:04'),
(54, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272865/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/l9zawriizyficsuznj1o.webp', '2025-06-30 08:41:05'),
(55, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272866/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/e1kxdtxt5uzvn6uwsjux.webp', '2025-06-30 08:41:06'),
(56, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272867/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/mnq9kjppalmlnfibmeiu.webp', '2025-06-30 08:41:08'),
(57, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272868/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/h7hlfibj4roucbgqtksm.webp', '2025-06-30 08:41:09'),
(58, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272869/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/fhfz5tff7iccgj4tpbtu.webp', '2025-06-30 08:41:10'),
(59, 1, 16, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272870/mangas/warrior-high-school-dungeon-raid-department/capitulo-4/h7lnlrgs2wth5uiruecc.webp', '2025-06-30 08:41:10'),
(60, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272972/mangas/superhuman-battlefield/capitulo-1/adcv1oag8g7egizjw9z9.webp', '2025-06-30 08:42:53'),
(61, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272973/mangas/superhuman-battlefield/capitulo-1/bm0tv9hj1swxnfn3guvo.webp', '2025-06-30 08:42:54'),
(62, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272974/mangas/superhuman-battlefield/capitulo-1/trywfk0sxyui4vqydttj.webp', '2025-06-30 08:42:55'),
(63, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272975/mangas/superhuman-battlefield/capitulo-1/mrxelp49rig46joxouvy.webp', '2025-06-30 08:42:56'),
(64, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272976/mangas/superhuman-battlefield/capitulo-1/bbrqwic8fgfbgp5iqfo2.webp', '2025-06-30 08:42:56'),
(65, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272977/mangas/superhuman-battlefield/capitulo-1/ajbgdibypevhtjd2gzgz.webp', '2025-06-30 08:42:57'),
(66, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272977/mangas/superhuman-battlefield/capitulo-1/lkjxindo7se6v3xqxkrk.webp', '2025-06-30 08:42:58'),
(67, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272978/mangas/superhuman-battlefield/capitulo-1/tqfqhqnjb5db3k3kwv82.webp', '2025-06-30 08:42:59'),
(68, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272979/mangas/superhuman-battlefield/capitulo-1/rdoa4jv6w2a3fy1lfkdc.webp', '2025-06-30 08:42:59'),
(69, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272980/mangas/superhuman-battlefield/capitulo-1/lmq3ulkkfg4ogbj6qxfn.webp', '2025-06-30 08:43:00'),
(70, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272981/mangas/superhuman-battlefield/capitulo-1/nzligdiqf3ygpsks8gz6.webp', '2025-06-30 08:43:01'),
(71, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272981/mangas/superhuman-battlefield/capitulo-1/kuzftzpmjpdss8bhjojb.webp', '2025-06-30 08:43:02'),
(72, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272982/mangas/superhuman-battlefield/capitulo-1/yxuqpjyprep5vhvcdukn.webp', '2025-06-30 08:43:03'),
(73, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272983/mangas/superhuman-battlefield/capitulo-1/cpspmulerc4spnojwasa.webp', '2025-06-30 08:43:04'),
(74, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272984/mangas/superhuman-battlefield/capitulo-1/wghfccamijhqcnjzvy2z.webp', '2025-06-30 08:43:05'),
(75, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272985/mangas/superhuman-battlefield/capitulo-1/rzuaa8jhggifm6jej6sj.webp', '2025-06-30 08:43:06'),
(76, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272986/mangas/superhuman-battlefield/capitulo-1/wvgemotjl9z5d58egqpq.webp', '2025-06-30 08:43:07'),
(77, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272987/mangas/superhuman-battlefield/capitulo-1/neqcqw4y46y4o7fpjzm5.webp', '2025-06-30 08:43:07'),
(78, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272988/mangas/superhuman-battlefield/capitulo-1/ryu3v4kcd6edotlxhepc.webp', '2025-06-30 08:43:08'),
(79, 2, 9, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751272988/mangas/superhuman-battlefield/capitulo-1/hkpqbgs0ctdouqypkiop.webp', '2025-06-30 08:43:09'),
(80, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273006/mangas/superhuman-battlefield/capitulo-2/pk7qstni4lv2twwdd3km.webp', '2025-06-30 08:43:27'),
(81, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273007/mangas/superhuman-battlefield/capitulo-2/pnhlw4r0zc0x4qfjsfs6.webp', '2025-06-30 08:43:28'),
(82, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273008/mangas/superhuman-battlefield/capitulo-2/bbyautvkbyojbjgwtvoh.webp', '2025-06-30 08:43:29'),
(83, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273009/mangas/superhuman-battlefield/capitulo-2/nl69yw2v7dlplgi1nmly.webp', '2025-06-30 08:43:30'),
(84, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273010/mangas/superhuman-battlefield/capitulo-2/rhrc2xlin5pyzz5vmhkl.webp', '2025-06-30 08:43:31'),
(85, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273011/mangas/superhuman-battlefield/capitulo-2/fgwcooqtemsd2defmjds.webp', '2025-06-30 08:43:31'),
(86, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273012/mangas/superhuman-battlefield/capitulo-2/yqfehnicukeijjhtcffg.webp', '2025-06-30 08:43:32'),
(87, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273012/mangas/superhuman-battlefield/capitulo-2/hwy7vqncqxi0agzyujos.webp', '2025-06-30 08:43:33'),
(88, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273014/mangas/superhuman-battlefield/capitulo-2/eblkxzrnr05ulgckbxr0.webp', '2025-06-30 08:43:34'),
(89, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273015/mangas/superhuman-battlefield/capitulo-2/nvhbz9vwmdmwyu8oagjv.webp', '2025-06-30 08:43:35'),
(90, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273016/mangas/superhuman-battlefield/capitulo-2/eeydoxvyud35bciggiuv.webp', '2025-06-30 08:43:36'),
(91, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273017/mangas/superhuman-battlefield/capitulo-2/vzntanonkb9m6ok5xck0.webp', '2025-06-30 08:43:37'),
(92, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273017/mangas/superhuman-battlefield/capitulo-2/hezgsuaw5afw0kof0hc5.webp', '2025-06-30 08:43:38'),
(93, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273018/mangas/superhuman-battlefield/capitulo-2/uxfuvlzkxmy3i7vu8kz7.webp', '2025-06-30 08:43:38'),
(94, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273019/mangas/superhuman-battlefield/capitulo-2/sh4yxlqsd1betveqmv4p.webp', '2025-06-30 08:43:39'),
(95, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273020/mangas/superhuman-battlefield/capitulo-2/sjxs4hrpoykgh1q5s2qu.webp', '2025-06-30 08:43:40'),
(96, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273020/mangas/superhuman-battlefield/capitulo-2/robkquy3g6dmrzzyeafl.webp', '2025-06-30 08:43:41'),
(97, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273021/mangas/superhuman-battlefield/capitulo-2/ghp9fg5vgucq4cxfi7eq.webp', '2025-06-30 08:43:41'),
(98, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273022/mangas/superhuman-battlefield/capitulo-2/vp2c3hc13spsv9xly8bu.webp', '2025-06-30 08:43:42'),
(99, 2, 10, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273022/mangas/superhuman-battlefield/capitulo-2/l14yuijlhz2fp0robipz.webp', '2025-06-30 08:43:43'),
(100, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273038/mangas/superhuman-battlefield/capitulo-3/zbkcw8kgu7amdfnyu8rg.webp', '2025-06-30 08:43:59'),
(101, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273039/mangas/superhuman-battlefield/capitulo-3/cbftkrargafa3qhzagm4.webp', '2025-06-30 08:44:00'),
(102, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273040/mangas/superhuman-battlefield/capitulo-3/zkfyo0hcpyoijcyabtic.webp', '2025-06-30 08:44:01'),
(103, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273041/mangas/superhuman-battlefield/capitulo-3/nljuynkswfr896qirmf3.webp', '2025-06-30 08:44:01'),
(104, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273042/mangas/superhuman-battlefield/capitulo-3/vo6kk3zljlaeptxxmdxh.webp', '2025-06-30 08:44:02'),
(105, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273043/mangas/superhuman-battlefield/capitulo-3/akdj9hmhjsgconuevkm6.webp', '2025-06-30 08:44:03'),
(106, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273043/mangas/superhuman-battlefield/capitulo-3/dbr4rlyy7hlclpwz0hta.webp', '2025-06-30 08:44:04'),
(107, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273044/mangas/superhuman-battlefield/capitulo-3/airx3qnjfdrz6kzzfpuu.webp', '2025-06-30 08:44:05'),
(108, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273045/mangas/superhuman-battlefield/capitulo-3/yjemtl0cwbf3ayvbxaiw.webp', '2025-06-30 08:44:05'),
(109, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273046/mangas/superhuman-battlefield/capitulo-3/uepcvioniawqo7kfy1zu.webp', '2025-06-30 08:44:06'),
(110, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273046/mangas/superhuman-battlefield/capitulo-3/zxkzk7lxy5l87rpkjaus.webp', '2025-06-30 08:44:07'),
(111, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273047/mangas/superhuman-battlefield/capitulo-3/swbc75drppdoqmhy4p2z.webp', '2025-06-30 08:44:07'),
(112, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273048/mangas/superhuman-battlefield/capitulo-3/ain1p2odqwhyslqibt9u.webp', '2025-06-30 08:44:08'),
(113, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273048/mangas/superhuman-battlefield/capitulo-3/yvbo2z1evxjwfjeyoycf.webp', '2025-06-30 08:44:09'),
(114, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273049/mangas/superhuman-battlefield/capitulo-3/xfdttidqnx1vb6mdsihv.webp', '2025-06-30 08:44:10'),
(115, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273050/mangas/superhuman-battlefield/capitulo-3/vvjc4rplon7z8mtg9m7m.webp', '2025-06-30 08:44:10'),
(116, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273051/mangas/superhuman-battlefield/capitulo-3/kpmpv0uangbsr9qyeqmu.webp', '2025-06-30 08:44:11'),
(117, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273052/mangas/superhuman-battlefield/capitulo-3/mfhpns2tobhqxabistqx.webp', '2025-06-30 08:44:12'),
(118, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273052/mangas/superhuman-battlefield/capitulo-3/tayfgelhttj7a1i2fvws.webp', '2025-06-30 08:44:13'),
(119, 2, 11, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273053/mangas/superhuman-battlefield/capitulo-3/ptsxjokcrkwcyridhiez.webp', '2025-06-30 08:44:14'),
(120, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273092/mangas/superhuman-battlefield/capitulo-4/vcr8hswmcwxsmzjafodc.webp', '2025-06-30 08:44:53'),
(121, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273093/mangas/superhuman-battlefield/capitulo-4/c439eor11ss8zzdkny2m.webp', '2025-06-30 08:44:54'),
(122, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273094/mangas/superhuman-battlefield/capitulo-4/uxeuhgf6939mkpysyyu9.webp', '2025-06-30 08:44:55'),
(123, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273095/mangas/superhuman-battlefield/capitulo-4/uoluqgdjajcoit1zzzgv.webp', '2025-06-30 08:44:56'),
(124, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273096/mangas/superhuman-battlefield/capitulo-4/cdlah80zffm9wwzdw8wh.webp', '2025-06-30 08:44:57'),
(125, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273097/mangas/superhuman-battlefield/capitulo-4/t2yuqi91oasexkpfk4z0.webp', '2025-06-30 08:44:58'),
(126, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273098/mangas/superhuman-battlefield/capitulo-4/di3uikm6jau6g4x6rytq.webp', '2025-06-30 08:44:59'),
(127, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273099/mangas/superhuman-battlefield/capitulo-4/vfyspboabcr7cbadnnur.webp', '2025-06-30 08:44:59'),
(128, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273100/mangas/superhuman-battlefield/capitulo-4/yyuxs6kkosvyq8rt62vy.webp', '2025-06-30 08:45:00'),
(129, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273101/mangas/superhuman-battlefield/capitulo-4/xeni2f6dmwofpqti4z03.webp', '2025-06-30 08:45:01'),
(130, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273101/mangas/superhuman-battlefield/capitulo-4/xyaegjcdsuy7chrx7rfs.webp', '2025-06-30 08:45:02'),
(131, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273102/mangas/superhuman-battlefield/capitulo-4/stvchadlae6wurrmo2ju.webp', '2025-06-30 08:45:03'),
(132, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273103/mangas/superhuman-battlefield/capitulo-4/ldxiahedikhsmcnkwyxc.webp', '2025-06-30 08:45:03'),
(133, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273104/mangas/superhuman-battlefield/capitulo-4/wj6jp3ayvvmicmexocpu.webp', '2025-06-30 08:45:04'),
(134, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273105/mangas/superhuman-battlefield/capitulo-4/bn9nixhpeagmrrfgxws0.webp', '2025-06-30 08:45:05'),
(135, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273105/mangas/superhuman-battlefield/capitulo-4/wrvy3b5emyrw9qfywgrn.webp', '2025-06-30 08:45:06'),
(136, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273106/mangas/superhuman-battlefield/capitulo-4/cxa3ofoqllat4wicgcbc.webp', '2025-06-30 08:45:07'),
(137, 2, 12, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273107/mangas/superhuman-battlefield/capitulo-4/rylbaidcrh9kitcinrqm.webp', '2025-06-30 08:45:07'),
(138, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273136/mangas/solo-max-level-newbie/capitulo-0/chhwtmzgzkjr5yy9emia.webp', '2025-06-30 08:45:36'),
(139, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273137/mangas/solo-max-level-newbie/capitulo-0/ksc2oor1lkycxpuopgd6.webp', '2025-06-30 08:45:37'),
(140, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273138/mangas/solo-max-level-newbie/capitulo-0/javkrdlq87jb28szhvmp.webp', '2025-06-30 08:45:38'),
(141, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273139/mangas/solo-max-level-newbie/capitulo-0/mmer0xngh7qrs9zkyimq.webp', '2025-06-30 08:45:39'),
(142, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273139/mangas/solo-max-level-newbie/capitulo-0/q49r6gvo6geohxsvj3ds.webp', '2025-06-30 08:45:40'),
(143, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273140/mangas/solo-max-level-newbie/capitulo-0/dcqhc5ff1yaj3ukwjugo.webp', '2025-06-30 08:45:41'),
(144, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273141/mangas/solo-max-level-newbie/capitulo-0/xdprj52okof0dvkfo9cd.webp', '2025-06-30 08:45:42'),
(145, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273142/mangas/solo-max-level-newbie/capitulo-0/p5md8tzaxgwbqhuwqpyn.webp', '2025-06-30 08:45:42'),
(146, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273143/mangas/solo-max-level-newbie/capitulo-0/dr5im6zeil0ih3cr0uke.webp', '2025-06-30 08:45:43'),
(147, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273144/mangas/solo-max-level-newbie/capitulo-0/c6os4azsejvyhlt5bbts.webp', '2025-06-30 08:45:44'),
(148, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273144/mangas/solo-max-level-newbie/capitulo-0/smsp5ls6csmxkrfpb3cu.webp', '2025-06-30 08:45:45'),
(149, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273145/mangas/solo-max-level-newbie/capitulo-0/etw9fw8cgetezvxlz0eh.webp', '2025-06-30 08:45:45'),
(150, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273146/mangas/solo-max-level-newbie/capitulo-0/xigkwlmfdnetfnoky2bz.webp', '2025-06-30 08:45:46'),
(151, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273146/mangas/solo-max-level-newbie/capitulo-0/ux0hduwrd2cvkcdtucie.webp', '2025-06-30 08:45:47'),
(152, 4, 5, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273147/mangas/solo-max-level-newbie/capitulo-0/riqnc7gl8v4wcpkvco5f.webp', '2025-06-30 08:45:47'),
(153, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273159/mangas/solo-max-level-newbie/capitulo-1/tmzwmscpwmdzff0roq6l.webp', '2025-06-30 08:45:59'),
(154, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273160/mangas/solo-max-level-newbie/capitulo-1/xxwwuwcuc0uiib4aaohj.webp', '2025-06-30 08:46:00'),
(155, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273161/mangas/solo-max-level-newbie/capitulo-1/ymdfexcispjdq4nqgxty.webp', '2025-06-30 08:46:01'),
(156, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273162/mangas/solo-max-level-newbie/capitulo-1/kjxe3l5jcnfj4ka2z8uy.webp', '2025-06-30 08:46:02'),
(157, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273163/mangas/solo-max-level-newbie/capitulo-1/y4ztzwnl65fnp8vlhis7.webp', '2025-06-30 08:46:03'),
(158, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273163/mangas/solo-max-level-newbie/capitulo-1/ffvysbko6cjfacwdafol.webp', '2025-06-30 08:46:04'),
(159, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273164/mangas/solo-max-level-newbie/capitulo-1/ikfmksiiqjv1dpixah8a.webp', '2025-06-30 08:46:05'),
(160, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273165/mangas/solo-max-level-newbie/capitulo-1/uuhttrghumxopr1zgo3h.webp', '2025-06-30 08:46:05'),
(161, 4, 6, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273166/mangas/solo-max-level-newbie/capitulo-1/dxz6f7wrhdqr10l1lr4m.webp', '2025-06-30 08:46:06'),
(162, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273183/mangas/solo-max-level-newbie/capitulo-2/lp402wxq2ouzrswuu0di.webp', '2025-06-30 08:46:23'),
(163, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273184/mangas/solo-max-level-newbie/capitulo-2/nlcg5tkijkhkb9asqao5.webp', '2025-06-30 08:46:25'),
(164, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273185/mangas/solo-max-level-newbie/capitulo-2/wsyonaukcnpun75n3mgd.webp', '2025-06-30 08:46:26'),
(165, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273186/mangas/solo-max-level-newbie/capitulo-2/uulzb4hoigdypn933ecy.webp', '2025-06-30 08:46:27'),
(166, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273187/mangas/solo-max-level-newbie/capitulo-2/mbsysp9rtko2btwaa5us.webp', '2025-06-30 08:46:28'),
(167, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273188/mangas/solo-max-level-newbie/capitulo-2/v8ztm91rhjquiaozzjhx.webp', '2025-06-30 08:46:28'),
(168, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273189/mangas/solo-max-level-newbie/capitulo-2/nwkhgrr3prvxrhxiaqly.webp', '2025-06-30 08:46:29'),
(169, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273189/mangas/solo-max-level-newbie/capitulo-2/yrv291kfsjypqvcydxcd.webp', '2025-06-30 08:46:30'),
(170, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273190/mangas/solo-max-level-newbie/capitulo-2/g0ucgf31lij7tr2ptxas.webp', '2025-06-30 08:46:30'),
(171, 4, 7, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273191/mangas/solo-max-level-newbie/capitulo-2/tcleuynvtn65ydhzks6s.webp', '2025-06-30 08:46:32'),
(172, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273204/mangas/solo-max-level-newbie/capitulo-3/jffvvlgqgemgy5a3o8ns.webp', '2025-06-30 08:46:44'),
(173, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273205/mangas/solo-max-level-newbie/capitulo-3/mtm7thcpwyk2e8sqeas0.webp', '2025-06-30 08:46:46'),
(174, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273206/mangas/solo-max-level-newbie/capitulo-3/tzwdsjolflxvcshpgxie.webp', '2025-06-30 08:46:47'),
(175, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273207/mangas/solo-max-level-newbie/capitulo-3/nknvyyqtvgmmrh0yqgpp.webp', '2025-06-30 08:46:47'),
(176, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273207/mangas/solo-max-level-newbie/capitulo-3/cvsgvvg1oxxsxwabk5ym.webp', '2025-06-30 08:46:48'),
(177, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273208/mangas/solo-max-level-newbie/capitulo-3/fw8pmnnf0mnuiza2bsmh.webp', '2025-06-30 08:46:49'),
(178, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273209/mangas/solo-max-level-newbie/capitulo-3/mgaphtw4bnfihnqgrmqr.webp', '2025-06-30 08:46:50'),
(179, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273210/mangas/solo-max-level-newbie/capitulo-3/b7a5ffjimgb20i5v0owe.webp', '2025-06-30 08:46:51'),
(180, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273211/mangas/solo-max-level-newbie/capitulo-3/xr4mgxt84ktdkqlqptj6.webp', '2025-06-30 08:46:51'),
(181, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273212/mangas/solo-max-level-newbie/capitulo-3/g67dmdzr2qqkbhljmfxv.webp', '2025-06-30 08:46:52'),
(182, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273212/mangas/solo-max-level-newbie/capitulo-3/fdybflade1q93cld80zh.webp', '2025-06-30 08:46:53'),
(183, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273213/mangas/solo-max-level-newbie/capitulo-3/avtjiut1eqiyeiw0hrcy.webp', '2025-06-30 08:46:54'),
(184, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273214/mangas/solo-max-level-newbie/capitulo-3/snscglszhp35pu0yqtxn.webp', '2025-06-30 08:46:55'),
(185, 4, 8, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273215/mangas/solo-max-level-newbie/capitulo-3/wcqg9pynhey9wpcwmny2.webp', '2025-06-30 08:46:56'),
(186, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273233/mangas/solo-leveling/capitulo-0/gaqcl7c0cyhzceauowwl.webp', '2025-06-30 08:47:13'),
(187, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273234/mangas/solo-leveling/capitulo-0/k7mwtoyswitagfuivh1g.webp', '2025-06-30 08:47:14'),
(188, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273235/mangas/solo-leveling/capitulo-0/lqemad1sgf9sryu7gfbl.webp', '2025-06-30 08:47:15'),
(189, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273235/mangas/solo-leveling/capitulo-0/oahfzocg6conf6qnauxk.webp', '2025-06-30 08:47:16'),
(190, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273236/mangas/solo-leveling/capitulo-0/mkxbuatsmfmdpnxemzqa.webp', '2025-06-30 08:47:16'),
(191, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273237/mangas/solo-leveling/capitulo-0/qxsfvrk1d7w0czsagneq.webp', '2025-06-30 08:47:17'),
(192, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273237/mangas/solo-leveling/capitulo-0/s0zkmubwy0fa7m80hznh.webp', '2025-06-30 08:47:17'),
(193, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273238/mangas/solo-leveling/capitulo-0/sqc9m49txffbidrgqtdl.webp', '2025-06-30 08:47:18'),
(194, 3, 1, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273238/mangas/solo-leveling/capitulo-0/krnvf4k2cnyyaotkpvhl.webp', '2025-06-30 08:47:19'),
(195, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273250/mangas/solo-leveling/capitulo-1/zr52op9icsvqrwr48bum.webp', '2025-06-30 08:47:31'),
(196, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273251/mangas/solo-leveling/capitulo-1/s2v7g4fdqjay8qdkku36.webp', '2025-06-30 08:47:32'),
(197, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273252/mangas/solo-leveling/capitulo-1/ao9djahdw9hbjqjank5c.webp', '2025-06-30 08:47:32'),
(198, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273252/mangas/solo-leveling/capitulo-1/ecasciccbcw5skoy4ujx.webp', '2025-06-30 08:47:33'),
(199, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273253/mangas/solo-leveling/capitulo-1/vmtpxrgobomfz9bufsul.webp', '2025-06-30 08:47:34'),
(200, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273254/mangas/solo-leveling/capitulo-1/ycwjuosxasmywyvpmjme.webp', '2025-06-30 08:47:35'),
(201, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273255/mangas/solo-leveling/capitulo-1/pby8avjoirdcn4ckvvoj.webp', '2025-06-30 08:47:35'),
(202, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273255/mangas/solo-leveling/capitulo-1/licxlsswp0tvtxihogmh.webp', '2025-06-30 08:47:36'),
(203, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273256/mangas/solo-leveling/capitulo-1/x5jynwo6q7lqkc5nrb4z.webp', '2025-06-30 08:47:36'),
(204, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273257/mangas/solo-leveling/capitulo-1/qyrzwzcdltae5etewy7w.webp', '2025-06-30 08:47:37'),
(205, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273257/mangas/solo-leveling/capitulo-1/hbicgwsbyqfjaxmv6wkf.webp', '2025-06-30 08:47:38'),
(206, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273258/mangas/solo-leveling/capitulo-1/kmqtuhdqbid7n5isgn9e.webp', '2025-06-30 08:47:38'),
(207, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273258/mangas/solo-leveling/capitulo-1/si0khxq1nvowtb6qtoyg.webp', '2025-06-30 08:47:39'),
(208, 3, 2, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273259/mangas/solo-leveling/capitulo-1/ll8wh7pwy1sqvhxsrwci.webp', '2025-06-30 08:47:40'),
(209, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273271/mangas/solo-leveling/capitulo-2/foclzwhwsctt7uah1krf.webp', '2025-06-30 08:47:52'),
(210, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273272/mangas/solo-leveling/capitulo-2/iq8zrbcdsi6nlddjwmgp.webp', '2025-06-30 08:47:52'),
(211, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273273/mangas/solo-leveling/capitulo-2/xyi4x9hso7ihic45e4ld.webp', '2025-06-30 08:47:53'),
(212, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273273/mangas/solo-leveling/capitulo-2/mjkodzqcg5rdnc49x7pa.webp', '2025-06-30 08:47:54'),
(213, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273274/mangas/solo-leveling/capitulo-2/kaleopcenb3i6mlytwju.webp', '2025-06-30 08:47:54'),
(214, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273275/mangas/solo-leveling/capitulo-2/sdadev8pu8v0fljgd9p2.webp', '2025-06-30 08:47:55'),
(215, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273275/mangas/solo-leveling/capitulo-2/pbrmwklxd5ffsjvjm9mr.webp', '2025-06-30 08:47:56'),
(216, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273276/mangas/solo-leveling/capitulo-2/qt9ocwy4cpsykhf1cxgh.webp', '2025-06-30 08:47:57'),
(217, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273277/mangas/solo-leveling/capitulo-2/qoafv3iuwq7oovufor1m.webp', '2025-06-30 08:47:57'),
(218, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273278/mangas/solo-leveling/capitulo-2/z9lexps0k78qg4yuv72w.webp', '2025-06-30 08:47:58'),
(219, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273278/mangas/solo-leveling/capitulo-2/s1wluwncfoefxwxlpsof.webp', '2025-06-30 08:47:59'),
(220, 3, 3, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273279/mangas/solo-leveling/capitulo-2/h9lzwckit76rbaxxjft5.webp', '2025-06-30 08:48:00'),
(221, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273295/mangas/solo-leveling/capitulo-3/f1rehw705eezz9zykigy.webp', '2025-06-30 08:48:16'),
(222, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273296/mangas/solo-leveling/capitulo-3/ujyaypeqgx0rs3lydr1y.webp', '2025-06-30 08:48:16'),
(223, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273297/mangas/solo-leveling/capitulo-3/uxkud4jyqpa8acbxofn3.webp', '2025-06-30 08:48:17'),
(224, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273298/mangas/solo-leveling/capitulo-3/xmvmk9nmyibumjj202nm.webp', '2025-06-30 08:48:18'),
(225, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273298/mangas/solo-leveling/capitulo-3/smlrttrmwtdfv6ri5hg0.webp', '2025-06-30 08:48:19'),
(226, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273299/mangas/solo-leveling/capitulo-3/hobdczjjdixe2r3ico7a.webp', '2025-06-30 08:48:19'),
(227, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273300/mangas/solo-leveling/capitulo-3/p2u27dfhottjcml9rv9y.webp', '2025-06-30 08:48:20'),
(228, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273301/mangas/solo-leveling/capitulo-3/z4bfyyd7ktgkmctbphuk.webp', '2025-06-30 08:48:21'),
(229, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273302/mangas/solo-leveling/capitulo-3/qdhfdfsntzapccjoc9vx.webp', '2025-06-30 08:48:22'),
(230, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273302/mangas/solo-leveling/capitulo-3/opdzhcxkd3h27l4swgqh.webp', '2025-06-30 08:48:23'),
(231, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273303/mangas/solo-leveling/capitulo-3/lofurwbwojym4cfxcndv.webp', '2025-06-30 08:48:24'),
(232, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273304/mangas/solo-leveling/capitulo-3/bvjzodvcgithe2qhw0gf.webp', '2025-06-30 08:48:24'),
(233, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273305/mangas/solo-leveling/capitulo-3/tyek6jpeutkruxp6cprq.webp', '2025-06-30 08:48:25'),
(234, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273305/mangas/solo-leveling/capitulo-3/qafo4hbfjhedgajrzxqe.webp', '2025-06-30 08:48:26'),
(235, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273306/mangas/solo-leveling/capitulo-3/bcacblrghuigpfinw2hp.webp', '2025-06-30 08:48:27'),
(236, 3, 4, 'https://res.cloudinary.com/dghfkjx36/image/upload/v1751273307/mangas/solo-leveling/capitulo-3/kkkma2j5lx5eldjx1amr.webp', '2025-06-30 08:48:27');

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
(1, 'Florin', 'florin123@gmail.com', '$2y$10$dMKdSA18VDhfNUhCOy65h.XYmKD1oZe/w2GWAXi8syllfo9pfjRu6', 'admin', '2024-12-11 14:53:24', NULL, NULL);

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
(1, 'solo-leveling', '[0,1,2,3]', '2025-06-30 09:49:13'),
(1, 'solo-max-level-newbie', '[0,1,2,3]', '2025-06-30 09:49:07'),
(1, 'superhuman-battlefield', '[1,2,3,4]', '2025-06-30 09:49:00'),
(1, 'warrior-high-school-dungeon-raid-department', '[1,2,3,4]', '2025-06-30 09:48:46');

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
  MODIFY `id_capitulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id do manga', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `manga_generos`
--
ALTER TABLE `manga_generos`
  MODIFY `id_manga_generos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único do utilizador\r\n', AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`link_manga`) REFERENCES `mangas` (`link`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
