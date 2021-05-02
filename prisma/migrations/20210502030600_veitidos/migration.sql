/*
  Warnings:

  - You are about to drop the column `attentionId` on the `location` table. All the data in the column will be lost.
  - You are about to drop the column `attentionId` on the `location_attention` table. All the data in the column will be lost.
  - You are about to drop the column `locationId` on the `location_attention` table. All the data in the column will be lost.
  - Added the required column `locattion_attention_id` to the `location` table without a default value. This is not possible if the table is not empty.
  - Added the required column `attetion_id` to the `location_attention` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AttentionDay" DROP CONSTRAINT "AttentionDay_attention_id_fkey";

-- DropForeignKey
ALTER TABLE "AttentionHour" DROP CONSTRAINT "AttentionHour_attention_id_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_attentionId_fkey";

-- DropForeignKey
ALTER TABLE "location_attention" DROP CONSTRAINT "location_attention_attentionId_fkey";

-- DropForeignKey
ALTER TABLE "location_attention" DROP CONSTRAINT "location_attention_locationId_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "attentionId",
ADD COLUMN     "locattion_attention_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "location_attention" DROP COLUMN "attentionId",
DROP COLUMN "locationId",
ADD COLUMN     "attetion_id" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "_AttentionToDay" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AttentionToHour" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_AttentionToDay_AB_unique" ON "_AttentionToDay"("A", "B");

-- CreateIndex
CREATE INDEX "_AttentionToDay_B_index" ON "_AttentionToDay"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AttentionToHour_AB_unique" ON "_AttentionToHour"("A", "B");

-- CreateIndex
CREATE INDEX "_AttentionToHour_B_index" ON "_AttentionToHour"("B");

-- AddForeignKey
ALTER TABLE "_AttentionToDay" ADD FOREIGN KEY ("A") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AttentionToDay" ADD FOREIGN KEY ("B") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AttentionToHour" ADD FOREIGN KEY ("A") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AttentionToHour" ADD FOREIGN KEY ("B") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("locattion_attention_id") REFERENCES "location_attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_attention" ADD FOREIGN KEY ("attetion_id") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;
