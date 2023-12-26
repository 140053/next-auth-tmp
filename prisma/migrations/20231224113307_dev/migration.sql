-- CreateTable
CREATE TABLE `Account` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `provider` VARCHAR(191) NOT NULL,
    `providerAccountId` VARCHAR(191) NOT NULL,
    `refresh_token` TEXT NULL,
    `access_token` TEXT NULL,
    `expires_at` INTEGER NULL,
    `token_type` VARCHAR(191) NULL,
    `scope` VARCHAR(191) NULL,
    `id_token` TEXT NULL,
    `session_state` VARCHAR(191) NULL,

    UNIQUE INDEX `Account_provider_providerAccountId_key`(`provider`, `providerAccountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Session` (
    `id` VARCHAR(191) NOT NULL,
    `sessionToken` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Session_sessionToken_key`(`sessionToken`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `emailVerified` DATETIME(3) NULL,
    `image` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auser` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `StudentID` VARCHAR(255) NOT NULL,
    `Gender` VARCHAR(255) NOT NULL,
    `Kurso` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `auth` VARCHAR(255) NULL,
    `campus` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `last_login` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `collection_mgr` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `campus` VARCHAR(255) NULL,
    `description` VARCHAR(500) NULL,
    `glink` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `community_mgr` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(100) NOT NULL,
    `campus` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `glink` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `filestorage` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `filename` VARCHAR(255) NOT NULL,
    `data` BLOB NOT NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `metadata` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(755) NOT NULL,
    `author` VARCHAR(555) NOT NULL,
    `taon` VARCHAR(255) NOT NULL,
    `call_number` VARCHAR(255) NULL,
    `barcode` VARCHAR(255) NOT NULL,
    `abstract` TEXT NULL,
    `kurso` VARCHAR(300) NOT NULL,
    `filename` VARCHAR(255) NULL,
    `subjek` VARCHAR(255) NOT NULL,
    `curator` VARCHAR(255) NULL,
    `updateby` TIMESTAMP(0) NULL,
    `col` VARCHAR(255) NULL,
    `com` VARCHAR(255) NULL,
    `campus` VARCHAR(255) NULL,
    `raw_data` TEXT NOT NULL,
    `record_status` VARCHAR(255) NULL,
    `glink` VARCHAR(255) NULL,
    `glinkP` VARCHAR(255) NULL,
    `glinkView` VARCHAR(255) NULL,
    `embargo` VARCHAR(20) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `my_request` (
    `rid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `m_barcode` VARCHAR(255) NOT NULL,
    `user_id` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `expiration` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `campus` VARCHAR(255) NULL,

    PRIMARY KEY (`rid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mydocuments` (
    `id_doc` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `metadata_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `a_right` VARCHAR(255) NOT NULL,
    `campus` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `expiration` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id_doc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `statistics_login` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `campus` VARCHAR(255) NOT NULL,
    `u_name` VARCHAR(255) NOT NULL,
    `U_group` VARCHAR(255) NULL,
    `gender` VARCHAR(255) NULL,
    `auth` VARCHAR(255) NULL,
    `bulan` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `statistics_m` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bk_ID` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NULL,
    `author` VARCHAR(255) NULL,
    `username` VARCHAR(255) NULL,
    `campus` VARCHAR(255) NULL,
    `u_name` VARCHAR(255) NULL,
    `U_group` VARCHAR(255) NULL,
    `gender` VARCHAR(255) NULL,
    `auth` VARCHAR(255) NULL,
    `bulan` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `statistics_mold` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `bk_ID` VARCHAR(255) NOT NULL,
    `u_name` VARCHAR(255) NOT NULL,
    `campus` VARCHAR(255) NULL,
    `U_group` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subcommunity_mgr` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent` VARCHAR(255) NOT NULL,
    `sibling` VARCHAR(255) NULL,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `campus` VARCHAR(255) NULL,
    `description` VARCHAR(500) NULL,
    `glink` VARCHAR(255) NULL,
    `reg_date` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Session` ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
