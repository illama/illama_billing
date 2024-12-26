-- Table pour les factures standards
CREATE TABLE `illama_bills` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `sender` VARCHAR(60),
    `sender_name` VARCHAR(255),
    `receiver` VARCHAR(60) NOT NULL,
    `receiver_name` VARCHAR(255),
    `amount` INT NOT NULL,
    `reason` VARCHAR(255),
    `type` ENUM('personal', 'society') NOT NULL,
    `society` VARCHAR(60),
    `status` ENUM('pending', 'paid') NOT NULL DEFAULT 'pending',
    `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les factures récurrentes
CREATE TABLE `illama_recurring_bills` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `society` VARCHAR(60) NOT NULL,
    `society_label` VARCHAR(255) NOT NULL,
    `receiver` VARCHAR(60) NOT NULL,
    `receiver_name` VARCHAR(255) NOT NULL,
    `amount` INT NOT NULL,
    `reason` VARCHAR(255),
    `interval_days` INT NOT NULL,
    `next_billing_date` TIMESTAMP NOT NULL,
    `status` ENUM('active', 'cancelled') NOT NULL DEFAULT 'active',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour l'historique des paiements récurrents
CREATE TABLE `illama_recurring_payments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `recurring_bill_id` INT NOT NULL,
    `amount` INT NOT NULL,
    `payments_count` INT NOT NULL,
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recurring_bill_id) REFERENCES illama_recurring_bills(id) ON DELETE CASCADE
);

-- Index recommandés pour optimiser les performances
CREATE INDEX idx_bills_receiver ON illama_bills(receiver);
CREATE INDEX idx_bills_sender ON illama_bills(sender);
CREATE INDEX idx_bills_status ON illama_bills(status);
CREATE INDEX idx_recurring_bills_receiver ON illama_recurring_bills(receiver);
CREATE INDEX idx_recurring_bills_next_date ON illama_recurring_bills(next_billing_date);
CREATE INDEX idx_recurring_payments_bill_id ON illama_recurring_payments(recurring_bill_id);
