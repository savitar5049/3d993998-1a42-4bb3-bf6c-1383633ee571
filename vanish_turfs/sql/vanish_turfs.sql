-- MariaDB schema for vanish_turfs leaderboard

CREATE TABLE IF NOT EXISTS `vt_gangs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `logo_url` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_vt_gangs_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vt_gang_stats` (
  `gang_id` INT UNSIGNED NOT NULL,
  `total_wins` INT UNSIGNED NOT NULL DEFAULT 0,
  `total_battles` INT UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gang_id`),
  CONSTRAINT `fk_vt_gang_stats_gang` FOREIGN KEY (`gang_id`) REFERENCES `vt_gangs`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vt_total_turfs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `winner_gang_id` INT UNSIGNED NULL,
  `loser_gang_id` INT UNSIGNED DEFAULT NULL,
  `turf_label` VARCHAR(64) NOT NULL,
  `result_type` VARCHAR(8) NOT NULL DEFAULT 'win',
  `ended_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_vt_total_turfs_winner` (`winner_gang_id`),
  KEY `ix_vt_total_turfs_loser` (`loser_gang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;