-- AlterTable
ALTER TABLE `users` ADD COLUMN `created_by` INTEGER NULL,
    ADD COLUMN `created_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updated_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- CreateTable
CREATE TABLE `paper_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `gsm` INTEGER NULL,
    `size` VARCHAR(255) NULL,
    `price` INTEGER NOT NULL DEFAULT 0,
    `created_by` INTEGER NULL,
    `updated_by` INTEGER NULL,
    `created_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` TINYINT NOT NULL,
    `contact_info` VARCHAR(255) NULL,
    `created_by` INTEGER NULL,
    `updated_by` INTEGER NULL,
    `created_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_datetime` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `inventory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `paper_type_id` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `updated_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deliveries` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NULL,
    `paper_type_id` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    `delivery_date` DATETIME(3) NOT NULL,
    `memo` TEXT NULL,
    `created_by` INTEGER NULL,
    `updated_by` INTEGER NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Withdrawal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NULL,
    `paper_type_id` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    `withdrawal_date` DATETIME(3) NOT NULL,
    `price` INTEGER NOT NULL DEFAULT 0,
    `memo` TEXT NULL,
    `created_by` INTEGER NULL,
    `updated_by` INTEGER NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `inventory` ADD CONSTRAINT `inventory_paper_type_id_fkey` FOREIGN KEY (`paper_type_id`) REFERENCES `paper_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `deliveries` ADD CONSTRAINT `deliveries_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `deliveries` ADD CONSTRAINT `deliveries_paper_type_id_fkey` FOREIGN KEY (`paper_type_id`) REFERENCES `paper_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Withdrawal` ADD CONSTRAINT `Withdrawal_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Withdrawal` ADD CONSTRAINT `Withdrawal_paper_type_id_fkey` FOREIGN KEY (`paper_type_id`) REFERENCES `paper_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
