/*
  Warnings:

  - You are about to drop the column `author` on the `video` table. All the data in the column will be lost.
  - Added the required column `user_author` to the `video` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `video` DROP COLUMN `author`,
    ADD COLUMN `user_author` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `interaction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `videoId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coment_from_coment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comentarioId` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `fecha` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `comment` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `video` ADD CONSTRAINT `video_user_author_fkey` FOREIGN KEY (`user_author`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interaction` ADD CONSTRAINT `interaction_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `interaction` ADD CONSTRAINT `interaction_videoId_fkey` FOREIGN KEY (`videoId`) REFERENCES `video`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `coment_from_coment` ADD CONSTRAINT `coment_from_coment_comentarioId_fkey` FOREIGN KEY (`comentarioId`) REFERENCES `user_comentario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `coment_from_coment` ADD CONSTRAINT `coment_from_coment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
