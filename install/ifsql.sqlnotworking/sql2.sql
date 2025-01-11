DROP TABLE IF EXISTS `illama_bills`;
CREATE TABLE `illama_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(60) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `receiver` varchar(60) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` text,
  `type` enum('society','personal') DEFAULT NULL,
  `society` varchar(60) DEFAULT NULL,
  `status` enum('pending','paid','deleted') DEFAULT 'pending',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin CHECK (json_valid(`tags`)),
  `allow_installments` tinyint(1) NOT NULL DEFAULT 0,
  `signature` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `illama_society_history`;
CREATE TABLE `illama_society_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('deposit','withdraw') NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender_name` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `society_date` (`society`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `illama_recurring_payments`;
CREATE TABLE `illama_recurring_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurring_bill_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `payments_count` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `recurring_bill_id` (`recurring_bill_id`),
  CONSTRAINT `fk_recurring_bill` FOREIGN KEY (`recurring_bill_id`) REFERENCES `illama_recurring_bills` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `illama_recurring_bills`;
CREATE TABLE `illama_recurring_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society` varchar(60) DEFAULT NULL,
  `society_label` varchar(255) DEFAULT NULL,
  `receiver` varchar(60) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` text,
  `interval_days` int(11) DEFAULT NULL,
  `next_billing_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `illama_installment_payments`;
CREATE TABLE `illama_installment_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `player_identifier` varchar(60) NOT NULL,
  `amount_per_payment` int(11) NOT NULL,
  `remaining_payments` int(11) NOT NULL,
  `next_payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_payments` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `fk_bill` FOREIGN KEY (`bill_id`) REFERENCES `illama_bills` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;