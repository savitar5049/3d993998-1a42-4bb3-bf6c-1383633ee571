CREATE TABLE IF NOT EXISTS `cookies_data` (
  `revenue` int(50) DEFAULT 0,
  `balance` int(50) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `cookies_data` (`revenue`, `balance`) VALUES
	(0, 0);