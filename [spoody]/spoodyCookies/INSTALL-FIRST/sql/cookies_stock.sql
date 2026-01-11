CREATE TABLE IF NOT EXISTS `cookies_stock` (
  `Product` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Item` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cookies_stock` (`Product`, `Price`, `Image`, `Stock`, `Item`) VALUES
	('Cereal Milk Vape', 5000, 'https://tinyurl.com/4hxb4jhd', 5, 'cmv'),
	('Cake Mix Vape', 5000, 'https://tinyurl.com/78sayb32', 5, 'cakemix'),
	('London Pound Vape', 5000, 'https://tinyurl.com/bdrzycbm', 5, 'london '),
	('Gary Payton Vape', 5000, 'https://tinyurl.com/5668pfvb', 5, 'gary'),
	('Collins Ave Vape', 5000, 'https://tinyurl.com/5n97x748', 5, 'collins'),
	('Ooh La La Vape', 5000, 'https://tinyurl.com/49f352xt', 5, 'lala'),
	('Apples & Bananas', 5000, 'https://tinyurl.com/2a6k2efh', 5, 'app'),
	('Melted Sherb Vape', 5000, 'https://tinyurl.com/fzta3kxf', 5, 'sherb'),
	('Sticky Buns Vape', 5000, 'https://tinyurl.com/3xberz79', 5, 'backwoods_russian_cream'),
	('Backwoods Grape', 5000, 'https://tinyurl.com/2um7a9he', 5, 'backwoods_grape'),
	('Backwoods Honey', 5000, 'https://tinyurl.com/d8d2p3d3', 5, 'backwoods_honey'),
	('White Cherry Gelato', 5000, 'https://tinyurl.com/2592bfhy', 5, 'whitecherry_gelato'),
	('Gelatti', 5000, 'https://tinyurl.com/4nw764sa', 5, 'gelatti'),
	('Grabba Leaf', 5000, 'https://tinyurl.com/2p9x5a2m', 5, 'grabba_leaf');
