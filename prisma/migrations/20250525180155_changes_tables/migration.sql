/*
  Warnings:

  - You are about to drop the column `NameResponsible` on the `orgs` table. All the data in the column will be lost.
  - Added the required column `nameResponsible` to the `orgs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orgEmail` to the `pets` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pets" DROP CONSTRAINT "pets_organizationEmail_fkey";

-- AlterTable
ALTER TABLE "orgs" DROP COLUMN "NameResponsible",
ADD COLUMN     "nameResponsible" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "pets" ADD COLUMN     "orgEmail" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "pets" ADD CONSTRAINT "pets_orgEmail_fkey" FOREIGN KEY ("orgEmail") REFERENCES "orgs"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
