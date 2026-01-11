CREATE TABLE IF NOT EXISTS `core_coinstore` (
  `identifier` longtext DEFAULT NULL,
  `coins` int(11) DEFAULT 0,
  `time` int(11) DEFAULT 0,
  `lastMinRewarded` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;