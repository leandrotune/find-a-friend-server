/*
  Warnings:

  - You are about to drop the column `bearing` on the `pets` table. All the data in the column will be lost.
  - The `requirement` column on the `pets` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `password_hash` to the `organizations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationEmail` to the `pets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `size` to the `pets` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Size" AS ENUM ('tiny', 'small', 'medium', 'big');

-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "EnergyLevel" ADD VALUE 'very_low';
ALTER TYPE "EnergyLevel" ADD VALUE 'very_high';

-- AlterTable
ALTER TABLE "organizations" ADD COLUMN     "password_hash" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "pets" DROP COLUMN "bearing",
ADD COLUMN     "organizationEmail" TEXT NOT NULL,
ADD COLUMN     "size" "Size" NOT NULL,
DROP COLUMN "requirement",
ADD COLUMN     "requirement" TEXT[];

-- DropEnum
DROP TYPE "Bearing";

-- AddForeignKey
ALTER TABLE "pets" ADD CONSTRAINT "pets_organizationEmail_fkey" FOREIGN KEY ("organizationEmail") REFERENCES "organizations"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
