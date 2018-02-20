-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 20/02/2018 às 15:02
-- Versão do servidor: 5.7.21-0ubuntu0.16.04.1
-- Versão do PHP: 5.6.31-4+ubuntu16.04.1+deb.sury.org+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `comentario` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_pessoa`, `status`, `telefone`, `nome`, `email`, `comentario`, `created_at`) VALUES
(2, 46, 1, '(11) 3592-4781', 'Alef Felix de Farias', 'alef.developerweb@gmail.com', 'Teste de comentário', '2018-02-19 11:00:13'),
(3, 46, 0, '(11) 3592-4781', 'Alef Felix de Farias', 'alef.developerweb@gmail.com', 'Teste de comentário', '2018-02-19 11:01:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `found` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `found`, `foto`, `nome`, `descricao`, `created_at`) VALUES
(1, 1, 'f676990789bfee54f79d4cd4ba56f5ae.jpg', 'Monique Alves da S. Souza', 'Nascimento: 06/03/1998', '2018-01-25 13:55:48'),
(2, 1, 'f74affc033885e6445a8b1f8a77ba450.jpg', 'Stephany Souza do Carmo Lopes', 'No dia 17 de agosto de 2002, Stephany Souza do Carmo Lopes, 6 anos, foi brincar na casa de uma vizinha, em SÃ£o Paulo. Segundo testemunhas, ela teria sido levada por uma mulher loira.A polÃ­cia investigou o caso, chegou a prender alguns suspeitos, mas nunca conseguiu encontrar quem seqÃ¼estrou a menina.â€œEu estava trabalhando, mas sentia uma agonia enorme. Era uma sensaÃ§Ã£o estranha e liguei vÃ¡rias vezes para casa durante a manhÃ£, para ver se estava tudo bemâ€, disse Zeni Souza do Carmo Lopes, mÃ£e da crianÃ§a. â€œStephany saiu para brincar na casa da vizinha. Depois, eles me ligaram no serviÃ§o e disseram que tinha sumidoâ€.\nZeni conta que visitou vÃ¡rias cidades do estado atrÃ¡s de pistas, mas nunca conseguiu achar Stephany. â€œEu tenho esperanÃ§as de que vou achÃ¡-la. Sofro muito e mantenho o quarto de minha filha intacto. Sempre que tenho pistas vou atrÃ¡s e procuro ir Ã  delegacia pelo menos uma vez por semana para saber a polÃ­cia tem alguma novidadeâ€. Quaisquer informacoes notificar a policia e Sergio Carneiro, no tel12.91304323, ou p/ Email faleconosco@sosbuscas.com.br.', '2018-01-25 13:57:38'),
(3, 0, '02ebbb97635b676cabbad37c71054262.jpg', 'Paulo Henrique Pereira de Oliveira', '', '2018-01-25 14:03:11'),
(4, 0, 'a440404b8174cb1f30ad8a7c3de94b4a.jpg', 'Leandro Bossi', 'desapareceu em Guaratuba, litoral do Paraná, com 7 anos. hoje teria 28 anos.Loiro, olhos azuis saiu para encontrar mÃ£e no trabalho no Hotel Vila Rica e desapareceu.Sabemos da dificuldades devido o passar do tempo. A familia atÃ© hoje o procura e em seguida o desabafo do pai, pescador JoÃ£o Bossi \'No dia que Leandro desapareceu, aos 7 anos de idade, ele saiu de casa e foi atÃ© o trabalho da mÃ£e. Ela pediu para que o filho voltasse para casa e trocasse de roupa. Depois disso nunca mais foi visto.Eu quero uma resposta. NÃ£o veio nenhuma. NÃ£o veio ninguÃ©m, nem assistente social passou aqui. SÃ³ quero uma resposta do governo do Estado. Se estÃ¡ morto, onde! Se estÃ¡ vivo, onde, e por que desapareceu? O governo estÃ¡ mais preocupado em transferir presos de Matinhos e Guaratuba para Curitiba, NÃ³s nÃ£o temos ajuda de nada.\' , desabafa o pai.', '2018-01-25 14:05:44'),
(5, 0, '1f216b3bdafc4f923ab6ee6c76770da4.jpg', 'Josecleide Martins Pereira', 'Nascimento: 03/03/1966', '2018-01-25 14:11:58'),
(6, 0, '7b64d80b935eb7fe753952638137e7ad.jpg', 'Claudinei Rodrigues Souto', 'idade:32 anos', '2018-01-25 14:18:07'),
(7, 0, '9f66037671edf044ec420c0af341b4a9.jpg', 'Vitor Pereira de Paula', 'Nascimento:04/01/1997', '2018-01-25 14:28:52'),
(8, 0, 'f2d19cc57f6693a11f8abdb3bd716de3.jpg', 'Sem nome', 'Mãe: Geruza Aparecida Silva Soares, Pai: Sebastiao Renildo Schimtz, Nascimento: 20/07/1999, Local do desaparecimento: Caxias do Sul - RS - Brasil', '2018-01-25 14:32:49'),
(9, 0, '51eac4d3aee130d7f10536d6b804c053.jpg', 'Herbet Medeiros Gambary', 'ESTAVA EM CARAGUATATUBA-SP NA CASA DE UM AMIGO,E SAIU PARA IR A CAMPINAS-SP,QUANDO SUMIU E NUNCA MAIS DEU NOTICIAS E NUNCA MAIS FOI VISTO PELA FAMILIA E AMIGOS.', '2018-01-25 14:38:06'),
(10, 0, 'f0c7c577895548727b55594720cf9a9e.jpg', 'Linaldo Eduardo Abilio de Souza', 'Data de Nascimento: 29/05/1985 Origem: São Sebastião, SP, Nome da Mãe: Josepha Abilio de Souza, Cor dos Olhos: Castanho-escuro, Cor do Cabelo: Castanho-escuro, Altura 1,72', '2018-01-25 14:39:24'),
(11, 0, '17d109da848e465f481a59abfa469f59.jpg', 'RENATO DOS SANTOS', 'Data Nascimento: 08/09/1996', '2018-01-25 14:40:42'),
(12, 0, '2b4cda509d5c5b27c7d5088a485687b6.jpg', 'THAMIRES NEVES DE SOUZA', 'Data Nascimento: 28/07/1994', '2018-01-25 14:42:07'),
(13, 0, '747eeb2501979f28e43a47a13b102197.jpg', 'JULIANA SILVA VENTURA', 'Data Nascimento: 15/09/1994', '2018-01-25 14:43:33'),
(14, 0, 'ffb935884f105d8eb6b2c4fd661cea95.jpg', 'ROSEMEIRE CRISTINA NASCIMENTO BAHIANO', 'Data Nascimento: 25/10/1993', '2018-01-25 14:45:40'),
(15, 0, 'b4e5156d20189826dbb3344a1b60d199.jpg', 'EMILY MARINA DOS SANTOS', 'Data Nascimento: 09/02/1993', '2018-01-25 14:47:10'),
(16, 0, '4215544af06c160cc82de9dcbe95735a.jpg', 'EMILY KATHELLEN DA SILVA GOMES', 'Data Nascimento: 02/10/1993', '2018-01-25 14:48:36'),
(17, 0, '7cf7de8581768602af72f5bc4181ab92.jpg', 'NICOLLAS GODINHO DOS SANTOS', 'Data Nascimento: 25/11/2004 Circunstâncias do Desaparecimento: A criança foi levada por seu pai Irenildo Vieira dos Santos por ocasião de um passeio. Foi feito um registro de ocorrência pela mãe da criança, a qual tem a guarda. Irenildo pode estar no Estado de São Paulo, pelo fato de ter parentes na Capital e na cidade de Aparecida do Norte-SP.', '2018-01-25 14:49:41'),
(18, 0, '6dbc9b40c4f9f08a3b1ae182264ff8c0.jpg', 'GESSICA DA SILVA LIMA', 'Data Nascimento: 12/12/1995', '2018-01-25 14:51:10'),
(19, 0, '78377b92d4c17960ebe1d6dbbff26710.jpg', 'CAROLINA DOS SANTOS OLIVEIRA', 'Data Nascimento: 21/04/1996', '2018-01-26 13:21:56'),
(20, 0, 'c78a2804927f7f31fbba3668b114b1a5.jpg', 'LUIS CARLOS PEREIRA DE ARAUJO', 'Data Nascimento: 29/07/1993', '2018-01-26 13:26:38'),
(21, 0, 'a8a8dd6cffd19cbeeb89cec699a2e421.jpg', 'THIAGO DOS SANTOS PINHEIRO', 'Data Nascimento: 20/05/1996', '2018-01-26 13:28:04'),
(22, 0, 'bb849b3a4a739786dda5aab6894db0ec.jpg', 'JORGE ARMANDO GONZALEZ', 'Data Nascimento: 16/08/1991 Circunstâncias do Desaparecimento: Informa o declarante que apos seu filho ter sido repreendido saiu de casa e nÃ£o mais retornou ao lar.', '2018-01-26 13:30:52'),
(23, 0, 'e592319dc120a4220f467c5320f6941b.jpg', 'EDILENE DE OLIVEIRA SANTOS', 'Data Nascimento: 04/04/1998', '2018-01-26 13:32:36'),
(24, 0, '9cc71860a64cc2b4362a58fe8a2e1ffa.jpg', 'CAMILA APARECIDA LISBOA DOS SANTOS', 'Data Nascimento: 19/03/1995, Circunstâncias do Desaparecimento: Informa a declarante que seu ex-marido levou sua filha sem o seu consentimento.', '2018-01-26 13:34:26'),
(25, 0, '3a257c55a5504ce4d46f570d7bde38f8.jpg', 'AMANDA DE OLIVEIRA MENDES', 'Data Nascimento:03/03/1998', '2018-01-26 13:35:50'),
(26, 0, 'ca93ae66c5ac5cf099ef25655c6a5a6b.jpg', 'Lucineide Santos', 'Data Nascimento: 16/06/1993', '2018-01-26 13:36:50'),
(27, 0, 'c230ca9b6f6f90c7ada3e39afa153435.jpg', 'Viviane Cantalice Pêgo', 'Data Nascimento: 08/09/1992 Circunstâncias do Desaparecimento: Viviane saiu de casa por volta de 18:00 para rezar um terÃ§o na vizinha que fica na rua atrÃ¡s de sua casa, ao sair do terÃ§o por volta das 20:00, acompanhada de 3 crianÃ§as (Arlene, Lucas e Everton), onde se deslocaram para uma festa de casamento que ocorria na ChÃ¡cara Morada do Sol, porÃ©m, por ser uma festa restrita, nÃ£o foi permitido a entrada, com isso, a sua amiga Arlene a convidou para ir embora e a mesma disse que ficaria ali aguardando, sendo assim, Arlene foi para sua residÃªncia e Viviane', '2018-01-26 13:38:54'),
(28, 0, 'e89fdfcdfec8644a7fb05abbeeeb5def.jpg', 'BARBARA KOCH FLORENTINO', 'Data Nascimento: 30/05/1993', '2018-01-26 13:40:22'),
(29, 0, 'cf4c31eb6af13d5e4b9a3dad65c2298e.jpg', 'MARCIA ALVES DA ROCHA', 'Data Nascimento: 29/03/1992, Circunstâncias do Desaparecimento:Saiu do lar sem informar o destino e não mais retornou.', '2018-01-26 13:42:41'),
(30, 0, '6550b216e64ec7600da010a5c2af84c5.jpg', 'JONHATHAN WILLIANS RODRIGUES LIMA', 'Data Nascimento: 05/08/1994', '2018-01-26 13:43:49'),
(31, 0, '564ad07ee78e778709c03d80f4965613.jpg', 'EDUARDO ALVES DE CASTRO', 'Data Nascimento: 05/04/2005, Circunstâncias do Desaparecimento: O DESAPARECIDO SOFRE DAS FACULDADES MENTAIS', '2018-01-26 13:45:20'),
(32, 0, 'f026cb053ebf77f5c6ccdc842cb30548.jpg', 'PAMELA KIMBERLY DA SILVA', 'Data Nascimento: 04/11/1995', '2018-01-26 13:46:53'),
(33, 0, '15dd072947389ecd9d41f6c6c0b41264.jpg', 'ADRIANA DOS SANTOS OLIVEIRA', 'Data Nascimento: 12/04/1990, Circunstâncias do Desaparecimento: Informa a declarante que sua filha costuma dormir na rua nas imediaÃ§Ãµes da PÃ§a da SÃ©, ou no Vale do AnhangabaÃº. Que a menina estÃ¡ grÃ¡vida de 8 meses.', '2018-01-26 13:50:53'),
(34, 0, '6f109416ed85206051f67539210efda5.jpg', 'VIVIANE DE ARAUJO ALVES', 'Data Nascimento: 09/08/1992, Circunstâncias do Desaparecimento: Informa a declarante que sua filha saiu de casa sem motivo aparente e nÃ£o mais retornou . Segundo a declarante uma colega de sua filha afirma que ele comentou que estaria pensando em ir embora de casa.', '2018-01-26 13:52:49'),
(35, 0, '41fdb024811565026adc9b57ab4d7b62.jpg', 'DANIEL DAVID GREGORIO SOUZA', 'Data Nascimento:  14/07/1986, Circunstâncias do Desaparecimento:  desapareceu após ser perseguido.', '2018-01-26 13:56:36'),
(36, 0, '2acfa956cd807038351d288e2c3c3d9b.jpg', 'Willian Delfino Ferreira', 'Data Nascimento: 14/06/1991, Circunstâncias do Desaparecimento:  O adolescente ficou de visitar um amigo para brincar perto da represa de Guarapiranga e até a presente data não retornou, a família procurou o corpo de bombeiros que fizeram uma busca na represa e não foi encontrado.', '2018-01-26 14:00:22'),
(37, 0, '7cbc55b0df5243bcf7e60633f7a36a70.jpg', 'ELIZANE DA SILVA OLIVEIRA', 'Tipo de caso:  Desaparecido em Perigo, Idade:  17, Cidade do desaparecimento:  ESTRUTURAL, Estado do desaparecimento:   DF, País do desaparecimento:  Brasil, Número do caso:  BRBR0044, Progressão de idade, Data de nascimento:  05/02/1992, Sexo:  Feminino, Altura:   Desconhecido, Peso:   Desconhecido, Cor dos cabelos:  Castanhos, Cor dos olhos:  Castanhos, Circunstâncias:  SEGUNDO INFORMACÕES DE SEUS PAIS, ELIZANE ESTAVA BRINCANDO COM COLEGAS EM FRENTE A SUA RESIDÊNCIA E DESAPARECEU.', '2018-01-26 14:02:55'),
(38, 0, '78536712d2cc4c2c62911416b388c086.jpg', 'THALITA DOS SANTOS VUILLAR', 'Data de Nascimento:  17/12/2007', '2018-01-26 14:17:25'),
(39, 0, '42e45a48b964c74e5b234e81fb82c7b1.jpg', 'Rainério Herbert Façanha Filho', 'Uma criança 4, e sua babá 19 anos, da cidade de Morada Nova foram seqüestrados e a família pede ajuda da imprensa para que o caso chegue ao fim. O pai do garoto Rainério Herbert Façanha Filho, autorizou a publicação das fotos do filho, assim como da babá. A família está muito angustiada. Os pais estão constantemente sendo sedados. Por isso, a família está fazendo um apelo de público para que, se alguém tiver alguma informação que possa ajudar na localização dos reféns, que comunique à família, ou mesmo à Imprensa e à Polícia, afirma um amigo do comerciante, que recebeu a incumbência de representar os pais do menino e autorizar a publicação das fotografias.', '2018-01-26 14:39:56'),
(40, 0, 'aea4e256f0dadc6fc3d62e1d280de644.jpg', 'Albert Souza Santos', 'Data Nascimento:  27/05/2002, Circunstâncias do Desaparecimento: O CASAL MORAVA ESTADOS UNIDOS, CIDADE DE FALL RIVER, ESTADO DE MASSACHUSETTS; O pai pegou o menino no dia 6 de novembro de 2004 , para passar o fim de semana com ele, então não apareceu mais, já foram acionadas as policias americanas e federais no Brasil e a Interpol.', '2018-01-26 14:44:47'),
(41, 0, '178381dd22bfb96f260cba865ab40254.jpg', 'DAVID ANTUNES ALVES', 'Data Nascimento: 04/03/1990,Circunstâncias do Desaparecimento: SAIU DE CASA SEM INFORMAR O DESTINO E NÃO MAIS RETORNOU.', '2018-02-19 10:39:54'),
(42, 0, 'cd579d2f945fd1aa777ddff04ec95f0d.jpg', 'Moises Barbosa dos Santos', 'Local de Desaparecimento: Topovaradouro, São Sebastião, SP', '2018-02-19 10:40:58'),
(43, 0, 'd17a54c792c9348774270a683909c2ae.jpg', 'José  Deilson de Oliveira', '60 anos - Desapareceu de sua residência na Serra de Caraguatatuba. Sofre de Alzheimer ( doença que compromete a memória) vestindo blusa branca  social, calça preta e portando duas porchetes c/ óculos \nBO 550960/2010. Quaisquer informações avisar a policia ou pelo E mail faleconosco@sosbuscas, ou com Sergio Carneiro no tel. 12 9130 4324 ou no SOS Samaritabnos em S.Sebastião no fone 0800 770 0641 (valido apenas para o LNorte e Vale Paraíba)', '2018-02-19 10:42:29'),
(44, 0, 'e39593ea116fc7335df9f5692d4b77a1.jpg', 'Lucas Pereira', '3 anos quando desapareceu, quando saiu para brincar com o irmão de 8 anos, em S. Carlos, Jardim Beatriz.\nPai: Antônio Carlos Ratto ( 57 anos). Quaisquer informações avisar a policia ou pelo E mail faleconosco@sosbuscas, ou com Sergio Carneiro no tel. 12 9130 4324 ou no SOS Samaritabnos em S.Sebastião no fone 0800 770 0641 (valido apenas para o LNorte e Vale Paraíba)', '2018-02-19 10:43:53'),
(45, 0, 'ea56adc0c1a7fad6d3c826e02a614ece.jpg', 'Sulamita Scaquetti Pinto', '36 anos ,COR DA PELE:  Branca, ESTADO:  São Paulo, CIDADE:  São Bernardo do Campo, MUNICÍPIO:  São Bernardo do Campo, LOCAL DO DESAPARECIMENTO:  São Paulo,CIRCUNSTÂNCIAS DO DESAPARECIMENTO:  Foi trabalhar, deixou o filho na escola e no final do dia não foi buscá-lo. É dependente de remédios antidepressivos e por conta da falta de uso pode estar em surto psicológico, inconsciente e aminesia.Filiação Materna:  Elvira Suely Scaquetti.Possui tatuagem tribal a altura do rim,Cabelo loiro pintado - BO nº 10363/2010. Quaisquer informações avisar a policia ou pelo E mail faleconosco@sosbuscas, ou com Sergio Carneiro no tel. 12 9130 4324 ou no SOS Samaritabnos em S.Sebastião no fone 0800 770 0641 (valido apenas para o LNorte e Vale Paraíba)', '2018-02-19 10:50:32'),
(46, 0, '0ad2a92be38cc159f3a4fa1b68a9402f.jpg', 'Janaína Lúcia Machi', 'A menina Janaína Lúcia Machi, 10 anos, saiu de casa com sua bicicleta azul para comprar pão e não mais voltou pra casa, em Alto Paraíso do Oeste (RO). A informação nos chegou por Elizabeth Misciasei. Quaisquer informações avisar a policia ou pelo E mail faleconosco@sosbuscas, ou com Sergio Carneiro no tel. 12 9130 4324 ou no SOS Samaritabnos em S.Sebastião no fone 0800 770 0641 (valido apenas para o LNorte e Vale Paraíba)', '2018-02-19 10:52:19'),
(47, 0, 'e1dd17f2db943fb23e28fbfd9df00b74.jpg', 'Willyan Ferreira Vital', 'idade:  3 anos, Características:  Pele Branca, olhos e cabelos negros. Origem da informação:  Publicação de pedido de ajuda da Prefeitura de Santos/SP. Quaisquer informações avisar a policia ou pelo E mail faleconosco@sosbuscas, ou com Sergio Carneiro no tel. 12 9130 4324 ou no SOS Samaritabnos em S.Sebastião no fone 0800 770 0641 (valido apenas para o LNorte e Vale Paraíba)', '2018-02-19 10:53:31'),
(48, 1, '86baec69a6c73a056f06221531516fdc.jpg', 'Olimpio Gonçalves Pereira Filho', '49 anos - Natural de Montes Claros-MG. Encontrado pela familia num abrigo em Taguatinga - Cidade Satélite de Brasilia-DF', '2018-02-19 11:14:51'),
(49, 0, '442b336b9e563d72bb45da8c5008173f.jpg', 'Mauro Nelson de Almeida', 'Visto pela ultima vez ao sair do seu trabalho na Petrobrás, na Av. Chile no Rip de Janeiro. A informação é que é uma pessoa equilibrada e não tinha vícios e antecedentes policiais ou de turbulências em sua vida.  Informações com Sergio Carneiro para recados no SOS Samaritano 08007700641 ou no direto 12 91304324', '2018-02-19 11:18:59'),
(50, 0, 'd9bedebe99d4162ba9afb98ed272f3e3.jpg', 'Ana Catharina Nascimento Ferrer', 'Olhos pretos, cabelo castanho escuro, cor parda, nasceu em 28/8/1984. Estava com 5 anos quando desapareceu na praia quando em companhia de uma vizinha em um dia de domingo quando a praia estava cheia de turistas. Pode ter sido levada por um casal de Goiás que se encontrava em excursão no local e mostrou muito interesse pela menina. Desde essa data os pais em desespero param de viver. É preciso a ajuda de todos. Qualquer informação com Sergio Carneiro, do SOS Samaritanos ou pelo fone 12.91304324, ou pelo E mail faleconosco@sosbuscas.com.br', '2018-02-19 11:20:53'),
(51, 0, '9936f0fb403a7b6fec96546ab78ae6fc.jpg', 'AMARO DOS SANTOS', 'Meu nome é Monica dos Santos Vaz. Sou da cidade de Itatiba ,interior de SP. Estou à procura do meu pai que está desaparecido. O nome dele é AMARO DOS SANTOS \ntem 72 anos, viúvo e diabético tem uma amputação de um dedo do pé devido a seqüelas da diabete, cabelo parcialmente grisalho, pele de cor parda. Também conhecido pelo apelido de CRUZEIRINHO ou IUCA. Ele saiu de casa no dia 07-05-2011 e não retornou mais.\nHoje após muita procura em casa de parentes, amigos, hospitais e cidades vizinhas.Venho através deste e mail pedir ajuda. Caso possam me ajudar divulgando a foto, ficaria muito grata, pois; procuro-o todos os dias desesperadamente na esperança de ainda poder encontrá-lo bem. PENSO QUE ELE ESTEJA COM ASPECTO DEBILITADO, CABELO E BARBA POR FAZER. QUAISQUER INFORMAÇÕES: \nSergio Carneiro fone 91304324 ou pelo E mail faleconosco@sosbuscas.com.br , recados no SOS Samaritanos 0800-7700641 ', '2018-02-19 11:22:16'),
(52, 0, '8a25d983799520788ec4965b9ad63dec.jpg', 'Adriana Santos Gomes', 'Adriana Santos Gomes, na foto ao lado, nascida em 16/01/1980, procura conhecer a identidade dos seus pais biológicos, pois foi entregue aos cuidados do casal Adelino Gomes e Terezinha Vieira dos Santos, quando tinha apenas 2 meses de vida.Com a morte deste casal, por volta de 1989, a Adriana acabou acolhida num orfanato e a identidade dos seus pais biológicos permaneceu um mistério para ela. Atualmente - maio de 2010 -, a Adriana está procurando identificar os seus pais biológicos, e até mesmo contatar a família dos seus falecidos pais adotivos.Sobre os seus pais adotivos, conseguiu saber que o Sr. Adelino Gomes era filho de uma senhora chamada Marcelina Gomes e que Terezinha Vieira dos Santos era filha do casal, Moacyr Vieira Santos e Maria Sebastiana Rodrigues de Oliveira. Informações não confirmadas, e que teriam sido prestadas por um juiz de menores, dão conta de que a Adriana teria ainda 7 irmãos. Quaisquer informações com Sergio Carneiro pelo fone  12.91304324, ou pelo E mail falconosco@sosbuscas.com.br', '2018-02-19 11:23:43'),
(53, 0, '331e608b0ce898a1d5040973507f09ed.jpg', 'Larissa Izabel Heymer', 'FAMILIA PROCURA DESESPERADAMENTE POR ESTA CRIANÇA: Larissa Izabel Heymer, 11 anos, desapareceu na porta da escola onde estuda.\nSe você viu essa criança entre em contato com os telefones:  Sergio Carneiro no SOS Samaritanos, ou no tel91304324  ou pelo E mail faleconosco@sosbuscas.com.br Ou ainda através da Polícia Militar (190) ou faça sua denuncia ao disque denúncia (181)  ', '2018-02-19 11:25:09'),
(54, 0, 'a5366848b7e19ae2e976a27bca3fe2d3.jpg', 'Tayse Emaneelly Silva de Sousa', '33 anos, desapareceu em S. Sebastião ao sair de casa para encontrar uma amiga e nã mais voltou, deixando para tras uma filha,hoje com 7 anos que pergunta por ela todos os dias e a mãe que não sabe a que atribuir e pensa até no pior.Foi vista na Ilhabela a pouco mais de um  mes andando por uma rua da Barra Velha.Filiação Tadeu Gonçalves de Souza e Vera Lucia Silva de Souza. Segundo a mãe não ha informação se usa toxico ou tem envolvimento com prostituição. Quaisquer informções com Sergio Carneiro fone 91304324 ou pelo E mail faleconosco@sosbuscas.com.br ou recado no SOS Samaritanos pelo fone 08007700641', '2018-02-19 11:26:30'),
(55, 0, '0dee19cb491906c78342947df813b3a2.jpg', 'Karla Victória Alves Ferreira', 'Karla Victória Alves Ferreira – 4 anos, brincava com outras crianças em frente da casa de uma vizinha, em Manaus. As outras crianças entraram na residência e Karla ficou para trás. Depois de algumas horas, a mãe Francinete Alves Ferreira notou que a menina havia sumido.Fizemos muitas buscas na região, interrogamos os vizinhos e parentes, mas não encontramos nada, afirma o investigador Gaspar do Vale, responsável pelo caso. Ela morava na periferia da cidade, em um lugar onde passavam poucos carros. Até hoje, não temos nenhum suspeito, diz. Qualquer informação sobre essa criança, disque 100 ou para Sergio Carneiro no SOS Samaritanos, ou no fone 12.91304324 ou pelo E mai faleconosco@sosbuscas.com.br', '2018-02-19 11:28:29'),
(56, 0, 'd2b8064b66b9fea533027c3010fa537d.jpg', 'Ranara Lorrane Alves de Melo', 'Com 10 anos de idade, quando voltava para casa do responsável, em Taguatinga/DF, depois de ter ido visitar a mãe no Recanto das Emas/DF. Informações com Sergio Carneiro 91304324, ou faleconosco@sosbuscas.com.br no SOS Samaritanos 0800-7700641', '2018-02-19 11:30:38'),
(57, 0, '58b6acd449f181af57fa88b2f82a4849.jpg', 'ADRIELLY LOUISE DE SOUZA', 'QX.: 16092/2007. NATURAL:  SÃO PAULO. DATA DE NASIMENTO:  14/10/1990. PAI:  ELIEL DE SOUZA FRANCO. MÃE:  ELIZABETE DE FÁTIMA SOUZA FRANCO. CARACTERÍSTICAS:  OLHOS CASTANHOS - PELE PARDA - CABELOS CASTANHOS. OUTROS DADOS:  COMPLEIÇÃO FISICA FORTE, 1M70CM DE ALTURA. PIERCING NA LINGUA. Qualquer informação sobre esta pessoa, ligue para a Delegacia de Pessoas Desaparecidas: 3311-3544 / 3311-3545 / 3311-3547 informando o número da queixa Nº 16092/2007 ou através do e-mail:  pessoasdesaparecidas@ssp.sp.gov.br. Informações com Sergio Carneiro 91304324, ou faleconosco@sosbuscas.com.br no SOS Samaritanos 0800-7700641', '2018-02-19 11:33:04'),
(58, 0, '333d88559a5c631b895ce2223b4b172a.jpg', 'JONATHAN FELLIPE PEREIRA DA SILVA', 'QX.: 17985/2007. NATURAL:  SÃO PAULO. DATA DE NASIMENTO:  27/12/1997. DESAPARECEU EM:  24/11/2007. MÃE:  PATRICIA TATIANE DA SILVA. CARACTERÍSTICAS:  OLHOS CASTANHOS - PELE BRANCA - CABELOS CASTANHOS. Qualquer informação sobre esta pessoa, ligue para a Delegacia de Pessoas Desaparecidas: 3311-3544 / 3311-3545 / 3311-3547 informando o número da queixa Nº 17985/2007 ou através do e-mail:  pessoasdesaparecidas@ssp.sp.gov.br , ou faleconosco@sosbuscas.com.br , Para Sergio Carneiro fone 91304324   Informações com Sergio Carneiro 91304324, ou faleconosco@sosbuscas.com.br no SOS Samaritanos 0800-7700641', '2018-02-19 11:34:15'),
(59, 0, 'f1d6f4d75586eb6a5e1927e8417173ad.jpg', 'Ricardo Rodrigues Monção', 'Desapareceu após conflito familiar devido ao uso de drogas,magro, alto, 180, cabelos  e olhos castanhos, , cicatriz na testa, usa aparelhop nos dentes, tem tatuagem no braço direito uma carpa e nas costas nome feminino Marlene. Filho de Marlene de Oliveira Monção e Ricardo Rodrigues Monção, idade 25 anos, cor parda. Quaisquer inmformações no E mail faleconosco@sosbuscas.com.br ou com Sergio Carneiro no fone 012 91304324. ', '2018-02-19 11:35:13'),
(60, 0, '99d9f1121adb1503bf53f7caf74a557f.jpg', 'Ellen Ferreira', 'Rg 10.784.475, 53 anos.Desapareceu no domingo 16/11. Foi vista saindo de casa para o Metro Patriarca pela manhã na Vila Ré onde mora.É uma pessoa equilibrada, não tem inimigos epelo que consta goza de suas faculdades mentais , não em vicios e nem ligações estranhas em sua vida. Não é uma pessoa de recurso que possa ter sido vitima de sequestro.A familia pede para divulgação em todo Estado de SP. Se alguem tiver alguma informação contacta com Sergio Carneiro no fone 12-9130432 ou pelo E mail faleconosco@sosbuscas.com.br . ', '2018-02-19 11:37:24'),
(61, 0, 'd8ba57acdb715a01dcbdec3beed4e340.jpg', 'VIVIAN FLORÊNCIO', '3 anos, desapareceu junto com a mãe no centro de Curitiba.O corpo da mãe Maria Emilia Florêncio foi encontrado numa mata a 30 km. de Curitiba, em Campina Grande do Sul. Da criança porém não há qualquer noticia.  Existe um suspeito que presos nega o crime apesardos inidicios. Obteve habes-corpus, porém irá a julgamento este ano.A VIVIAN pode  estar em qualquer lugar do Brasil em mãos de terceiros a quem a avó apela para se apresentar e diminuir estar dor que não acaba.Qualquer informação, indicio  ou pista disque para 100 e avise a policia. Também para Sergio Carneiro no telefone 2.91304324 ou pelo E mail faleconosco@sosbuscas.com.br. ', '2018-02-19 11:38:29'),
(62, 0, '771960e1a43f7b7d90e54a3b5fbd9181.jpg', 'THAMIRIS MIRELY', '3 ANOS - OLHOS PRETOS - CABELO PRETO - PARDA. EMBORA TENHA SUMIDO EM PAUS DOS FERROS NO RIO GRANDE DO NORTE PODE ESTAR EM SP COM ALGUÉM DSCONHECIDO DA FAMILIA. A mãe mora em Minas Gerais e não está com a criança que estava sob a guarda do pai. Desapareceu da escola quando a diretora recebeu uma ligação de uma pessoa que se identificou como a vó paterna e informou que um mulher estava autorizada a pegar a menina para trazer para casa.Qualquer informação avisar a policia, ligar para Disque Denuncia no 181 ou 190.  avisar Sergio Carneiro no fone 91304324, pelo Email faleconosco@sosbuscas ou criançadesaparecida@gmail.com. ', '2018-02-19 11:44:47'),
(63, 0, '200e41aa6e86d45e5adb3d89706d694e.jpg', 'Jean Paulo da Silva Costa', 'Atualmente com 13 anos de idade.Filiação:  Paulo Elique de Oliveira Costa e Giselle da Silva. Local do desaparecimento:  Vila Velha/ES.Características do desaparecimento: A criança foi fruto de uma relação de adolescente.A avó, que já faleceu, o entregou para uma desconhecida e nunca mais a criança foi localizada.Atualmente a mãe da criança mora no Rio de Janeiro, e a avó quando estava viva, mesmo sentindo remorso, jamais deu pistas que pudessem facilitar a localização do neto. Desde essa época praticamente pararam de viver. Informações com Sergio Carneiro tel. 12.91304324 ou pelo Email faleconosco@sosbuscas.com.br ', '2018-02-19 11:45:47'),
(64, 0, '213b7e70f518759def40a6641a715b94.jpg', 'Marcelo de Jesus Silva', 'Atualmente deve ser adolescente  Gostava de sair de casa para jogar futebol e tinha muitos amigos na rua que morava. Teve problemas na escola e com medo da reação do pai supõe-se que fugiu. Estão todos desesperados e pedem ajuda. Quaisquer inmformações no E mail faleconosco@sosbuscas.com.br ou com Sergio Carneiro no fone 012 91304324. ', '2018-02-19 11:52:57'),
(65, 0, 'a8dbbdb260748dc078b340df44d191cd.jpg', 'Michele de Jesus da Conceicao', 'Michele de Jesus da Conceição, 10 anos, saiu para ir à casa de uma colega. O pai, Gercino Bernardo da Conceição, estava no trabalho e à noite foi à polícia desesperado, porque a menina não havia retornado e diz que ela saiu apenas com a roupa do corpo e os óculos:  Fui procurá-la na Bahia, onde temos parentes, mas ela não estava lá, diz Conceição. A gente tem aquela esperança de encontrar, mas sabe que é muito difícil. Eu durmo, levanto e não sei onde ela está. Penso nisso o tempo todo.Por causa do desaparecimento da filha, Conceição entrou em depressão profunda e afirma que tem de tomar remédios controlados. O quarto dela está igual, não mexemos em nada. Todas as coisas estão do jeito que deixou, diz. Se eu pudesse falar com ela só diria uma palavra:  volte. Comunidade de Michele no orkut: http: //www.orkut.com/Community.aspx?cmm=24559293 Qualquer informação sobre Michele, disque 100 ou ligue para Sergio Carneiro, fone 91304324 ou pelo E mail faleconoosco@sosbuscas.com.br ou recados no SOS Samaritanos 08007700641 Sua informação pode trazer de volta uma criança desaparecida', '2018-02-19 11:58:41'),
(66, 0, '22c59661ffeae7d8385f015206b66525.jpg', 'ALEXANDRE FELISBERTO DE ALMEIDA', 'Estava brincando com outras crianças na frente de casa quando um desconhecido ofereceu \nbalas e o atraiu para um carro. O relato é das crianças que estavam com ele na ocasião. Segundo descrição obtida e divulgada pela policia, o suspeito tinha cor da pele parda ou mulata, usava chinelas, faltava os dois dentes frontais nas duas arcadas dentárias, cabelos grisalhos, barba preto, vestido de preto.  Quaisquer informações com Cassio Bortoli no fone 48.281400, ou pelos E mail desaparecidos@ssp.sc.gov.br ou com Sergio Carneiro pelo fone 12.91304324 ou pelo mail faleconosco@sosbuscas.com.br', '2018-02-19 11:59:54'),
(67, 0, 'b1236df3f97f9be1e4d3e6ec96f9b60b.jpg', 'Marcelo Ribeiro Kuczmarski', 'Marcelo Ribeiro Kuczmarski, 37 anos, 1,90,75 Kg.,Branco,olhos castanhos,cabelo curto ondulado, usa óculos.Saiu de casa no dia 30/07/2012, pela manha de seu lar no Jardim Celeste, próximo ao Jardim Zoológico de SP, e não mais foi visto. Se carro foi encontrado na estrada  velha  de Santos.Na ocasião levava seus documentos. Não há informação de vícios,desequilíbrio mental e inimigos.\nA familia precisa de informações para poder continuar a tocar a ida.Quaisquer informações ligar para o Disque denuncia  181, ou para Sergio Carneiro, no telefone 12.91304324 ou para E mail faleconosco@sosbuscas', '2018-02-19 12:01:14'),
(68, 0, '6bf9585b6cbae1cd1395f1e7c96a8f8e.jpg', 'Lukas Wesley Barbosa', 'Lukas Wesley Barbosa - 3 anos - Desapareceu da porta de casa quando brincava com um primo de 2 anos,na Av. Aguiar da Beira, no Jardim Trancoso, na Zona Leste de SP as 19: 50 h.. Um vizinho chegou a vê-lo com outro menino de 12 anos c/ traços orientais. Ao questionar o menino disse que  esta indo com ele numa festa de Cosme &amp; Damiao para pegar uns doces.A familia está em desespero e o que doí muito é a infinidade de trotes que recebem que os deixam desorientados.Quaisquer informacoes comunicar a policia, ou avisar Sergio Carneiro\nno fone 012-9130-4324 ou pelo E mail faleconosco@sosbuscas.com.br ou recedos no SOS Samaritanos 12.3893-2595.', '2018-02-19 12:03:04'),
(69, 0, '057c22a5eb9202e151123936c982bef6.jpg', 'Ana Paula Germano', 'Ana Paula Germano com 20 anos.Saiu de casa as 5: 30 para trabalhar e desapareceu entre a casa e a parada do ônibus.Pesquisas em câmeras de rua,câmeras do trabalho e controle de cartões de passagem de ônibus e nada foi encontrado. Isso desespera a familia. A casa fica em Carapicuiba e o local de trabalho em Alphaville, mas pode estar em qualquer lugar com grandes possibilidades no Litoral Norte de SP ou Vale do Paraíba. O desespero da familia, especialmente a mãe é muito grande. Veja bem a foto e ajude no que for possível e impossível. BO 6317 da delegacia de Carapicuiba/SP- 2009. Qualquer  indicio avisar a policia ou sergio Carneiro no tel, 12.91304324ou pelo E mail faleconosco@sosbuscas.com.br ou mesmo por recados no SOS Samaritanos 08007700641.', '2018-02-19 12:04:29'),
(70, 0, '90bc6a4012c068c04094203600c00c7b.jpg', 'Beatriz Joanna Von Hohendorff', 'Beatriz Joanna Von Hohendorff - 77 anos. Foi vista a ultima vez nos arredores da Capela da Velas no Santuário de Aparecida. Há a possibilidade de estar com um surto a Alzheimer. Deve estar com dificuldades de se localizar e se identificar. A familia pede ajuda de todos que puderem fazer alguma coisa. Qualquer informação liga para  sergio Carneiro 012 91304324, ou recados no SOS Samaritanos 08007700641 ou pelo E mail faleconosco@sosbuscas.com.br.', '2018-02-19 12:08:03'),
(71, 0, '1498bda0029608ea4b19b2fcd81d9421.jpg', 'Cecília São José Faria', 'Cecília São José Faria - Um sofrimento terrível que já dura 36 anos. mãe Maria Francisca São José. Desapareceu da porta de sua casa quando brincava com um irmão quando tinha pouco mais de um ano na cidade de Guarapari no Espírito Santo em um acampamento evangélico de ferias. Tudo indica que foi seqüestrada pois foi visto no local uma Kombi branca. Segundo a delegada que cuida do caso possibilidade de encontrarmos a Cecília com vida é muito grande. Não encontraram corpo até hoje e existe essa história da Kombi, o que indica um possível seqüestro. A dificuldade é que se, de fato, ela foi seqüestrada,ela não sabe e precisa se reconhecer na imagem.', '2018-02-19 12:09:25'),
(72, 0, 'bf5fc82256ad1d41212f79eea552e116.jpg', 'Lucilene Silveira da Silva', 'Desapareceu no Paraná quando tinha 5 anos e o pai e a mae a prpocuram até hoje.Ja usaram todos os rcursos que possuiam. Cor branca com cabelos e olhos castanhos. Ha uma suposicao que esteja no Litoral Norte de SP, Na epoca havia pessoas dai. Qualquer informacao avisar Sergio Carneiro 12 9130 4324, ou recados no SOS Samaritanos, fone 0800 770 0641( Em Sebastiao), ou pelo E mail faleconosco@sosbuscas.com.br. É importante avisar a policia, mesmo em caso dee duvida.', '2018-02-19 12:10:36'),
(73, 0, '5ba1553826034460685a7a9bfac42363.jpg', 'Ariele Botelho', 'Hoje com 7 anos, desapareceu  tinha dois anos e seis meses. Estava brincando no quintal de casa no bairro da Água Branca. A vida parou ai para mãe Neuza de Aassis e o pai Carlos Botelho em Lidianópolis/PR de onde são os pais.Tem olhos e cabelos castanhos, Na ocasião vestia uma blusa rosa, calsa marrom e sandalhinhas brancas. Se tiver alguma informação, ou indicio avise a policia e a Sergio Carneiro pelo fone 012.91304324 ou pelo site faleconosoco@sosbuscas.com.br.', '2018-02-19 12:12:02'),
(74, 0, '0301916c9660971f9c5b165246094f2a.jpg', 'João Rafael Kovalski', 'Ele foi visto pela ultima vez no bairro Capelinha em Adrianópolis/PR.A Polícia trabalha com 3 hipóteses:  pode ter sido sequestrado, pode ter se perdido pois estava em área rural ou pode ter caído no rio nas proximidades.Nome:  João Rafael Kovalski. Idade:  Aproximadamente 2 anos.Se alguém tiver alguma informação, por favor entre em contato: (41) 8850 0273,(41) 3678 6050 / (41) 3659 1208 ou com Sergio Carneiro pelo telefone 12.991304324, ou pelo E mail faleconosco@sosbuscas.com.br.', '2018-02-19 12:14:30'),
(75, 0, 'f534d16aaba83d4aaa407847db0048b9.jpg', 'Paulo Ricardo de Araujo Barros', 'A família está até hoje atônita e esperançosa. Não ha a menor ideia de como e porque.Ele tem cabelos loiros e branco e de olhos castanhos miúdo. Imagina-se que esteja em com os sequestradores em alguma cidade do Sudeste do BR. Verifiquem os casos de filhos que apareceram em alguma família sem explicação plausível. Qualquer informação ligue para 100, avise a policia ou comuniquem a Sergio Carneiro no telefone 12.991304324, ou pelo site faleconosco@sosbuscas.com.br.', '2018-02-19 12:16:05'),
(76, 0, '32b8481c2e7860b80fecd2ba1a79b5a1.jpg', 'Márcia Cristine Barros', '33 anos, depressiva. Saiu de casa em S.José dos campos muito descontrolada.O carros Voyage cinza esverdeado, chapa  ETI 2424, foi achado nas proximidades da praia de Tamanduca em Ubatuba, onde constava reserva em seu noma na pousada Vida e Vila. A família pede ajuda de todos. Qualquer informação com SERGIO CARNEIRO, fone 12 991304324 ou para o site faleconosco@sosbuscas.com br.', '2018-02-19 12:17:40'),
(77, 0, '3994d8f6fa7d5530d9787de12109df85.jpg', 'Thaís de Lima Barros', 'APELIDO:  Tata, DATA DE NASCIMENTO:  06/10/1993, NOME DA MÃE:  Elisabete Martins de Lima Barros, NOME DO PAI:  Francisco José Barros,SINAIS PARTICULARES:  Cicatriz no pulso esquerdo, em um dos joelhos, dente frontal separados.COR DOS OLHOS:  Castanho escuro, COR DO CABELO:  Preto, COR DA PELE:  Parda,ESTADO:  Rio de Janeiro,CIDADE:  Rio de Janeiro, MUNICÍPIO:  Rio de Janeiro, TIPO DE DESAPARECIMENTO:  Sequestro, LOCAL DO DESAPARECIMENTO:  Rio de Janeiro, CIRCUNSTÂNCIAS DO DESAPARECIMENTO:  Foi sequestrada por um desconhecido numa feira livre em Vila Kennedy-Bangu, quando foi comprar um sorvete com um menor de 5 anos. Só o menino retornou era + ou - 6 metros de distância da barraca onde estavam com a minha cunhada na época. E-MAIL:  faleconosco@sosbuscas.com.br ou fone: 1512991304324 c/ Sergio Carneiro – NÚMERO DO BOLETIM DE OCORRÊNCIA:  034-09160/2002.', '2018-02-19 12:19:08'),
(78, 0, '55b5c35f4b59a19a7e2066da541da6eb.jpg', 'Ana Paula Nascimento dos Anjos', 'Ana Paula Nascimento dos Anjos, Desapareceu no município de Rio de Janeiro/RJ Aparentemente, o desaparecimento com  MOTIVAÇÃO DESCONHECIDA. Foi feito boletim de ocorrência no Rio de Janeiro. Branca, Tinha 16 anos  na data do  desaparecimento. ’Hoje estaria com 29 anos. Tem 1,67 de altura e na ocasião estava com 60 kg, Olhos grandes e castanhos muito expressivos. Cabelos Loiros e liso/ Tipo físico forte. Não há informação de vícios ou distúrbios mentais. Caso registrado no sistema da policia em 30/08/2013.- A família não desiste e pede divulgação nacional pois ela pode estar em algum abrigo, hospital ou qualquer lugar.ATENÇÃO:  Se você tem informações que ajudem na busca e localização de ANA PAULA NASCIMENTO DOS ANJOS, entre em contado com a Delegacia de Polícia ou Conselho Tutelar de sua Cidade. Ou Disque 100, a ligação é gratuita e sigilosa.  Ou ligue para Sergio Carneiro 12.991304324 ou pelo E mail faleconosco@sosbuscas.com.br', '2018-02-19 12:20:24'),
(79, 0, '34ac2d640b0f3d15abe271e9ed6f3fdf.jpg', 'Fernanda Muniz  de Oliveira', 'Apelido :  Lara – Idade atual 32 anos, 1,68 m.,pele negra, 55 Kl. Desapareceu sem motivo aparente. Ficou de voltar para o lar e não voltou e nem deu qualquer noticia Deixou um filho menor que esta doente e pede por ela. A família  esta em desespero e imagina que não esteja mais  na região d Areado –SP, onde morava. Boletim de Ocorrência 233062/2011 – Precisa voltar  ou informações para tranqüilidade de todos. .Não há informação sobre antecedente de tóxicos, desequilíbrio ou envolvimento com outras pessoas. Qualquer informação avisar a policia ou Sergio Carneiro 12.991304324,ou pelo Email faleconosco@sosbuscas.com.br', '2018-02-19 12:21:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `fullname`, `created_at`) VALUES
(1, 'admin', 'Admin00', 'Admin', '2018-01-08 00:00:00');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
