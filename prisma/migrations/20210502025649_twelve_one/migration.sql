/*
  Warnings:

  - You are about to drop the column `attention_id` on the `location` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_attention_id_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "attention_id",
ADD COLUMN     "attentionId" INTEGER;

-- CreateTable
CREATE TABLE "location_attention" (
    "id" SERIAL NOT NULL,
    "attentionId" INTEGER NOT NULL,
    "locationId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "location_attention" ADD FOREIGN KEY ("attentionId") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_attention" ADD FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("attentionId") REFERENCES "attention"("id") ON DELETE SET NULL ON UPDATE CASCADE;
