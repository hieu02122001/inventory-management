/*
  Warnings:

  - You are about to drop the `Withdrawal` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Withdrawal` DROP FOREIGN KEY `Withdrawal_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `Withdrawal` DROP FOREIGN KEY `Withdrawal_paper_type_id_fkey`;

-- DropTable
DROP TABLE `Withdrawal`;

-- CreateTable
CREATE TABLE `withdrawals` (
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
ALTER TABLE `withdrawals` ADD CONSTRAINT `withdrawals_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `withdrawals` ADD CONSTRAINT `withdrawals_paper_type_id_fkey` FOREIGN KEY (`paper_type_id`) REFERENCES `paper_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
