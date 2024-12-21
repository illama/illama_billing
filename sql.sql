CREATE TABLE IF NOT EXISTS `illama_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(60) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `receiver` varchar(60) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` text NOT NULL,
  `signature` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `society` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);