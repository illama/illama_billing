CREATE TABLE `illama_bills` (
  `id` int(11) NOT NULL,
  `sender` varchar(60) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `receiver` varchar(60) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `type` enum('society','personal') DEFAULT NULL,
  `society` varchar(60) DEFAULT NULL,
  `status` enum('pending','paid','deleted') DEFAULT 'pending',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `illama_bills`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `illama_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

CREATE TABLE `illama_recurring_payments` (
  `id` int(11) NOT NULL,
  `recurring_bill_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `payments_count` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `illama_recurring_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_bill_id` (`recurring_bill_id`);

ALTER TABLE `illama_recurring_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `illama_recurring_payments`
  ADD CONSTRAINT `illama_recurring_payments_ibfk_1` FOREIGN KEY (`recurring_bill_id`) REFERENCES `illama_recurring_bills` (`id`);
COMMIT;

CREATE TABLE `illama_recurring_bills` (
  `id` int(11) NOT NULL,
  `society` varchar(60) DEFAULT NULL,
  `society_label` varchar(255) DEFAULT NULL,
  `receiver` varchar(60) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `interval_days` int(11) DEFAULT NULL,
  `next_billing_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `illama_recurring_bills`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `illama_recurring_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;