/*
  Warnings:

  - You are about to drop the `organizations` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "pets" DROP CONSTRAINT "pets_organizationEmail_fkey";

-- DropTable
DROP TABLE "organizations";

-- CreateTable
CREATE TABLE "orgs" (
    "id" TEXT NOT NULL,
    "NameResponsible" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "zip" INTEGER NOT NULL,
    "phone" INTEGER NOT NULL,
    "city" "City" NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "orgs_email_key" ON "orgs"("email");

-- AddForeignKey
ALTER TABLE "pets" ADD CONSTRAINT "pets_organizationEmail_fkey" FOREIGN KEY ("organizationEmail") REFERENCES "orgs"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
