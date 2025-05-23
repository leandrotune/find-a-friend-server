-- CreateEnum
CREATE TYPE "Bearing" AS ENUM ('small', 'medium', 'big');

-- CreateEnum
CREATE TYPE "EnergyLevel" AS ENUM ('low', 'average', 'high');

-- CreateEnum
CREATE TYPE "City" AS ENUM ('Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará', 'Distrito_Federal', 'Espírito_Santo', 'Goiás', 'Maranhão', 'Mato_Grosso', 'Mato_Grosso_do_Sul', 'Minas_Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio_de_Janeiro', 'Rio_Grande_do_Norte', 'Rio_Grande_do_Sul', 'Rondônia', 'Roraima', 'Santa_Catarina', 'São_Paulo', 'Sergipe', 'Tocantins');

-- CreateTable
CREATE TABLE "organizations" (
    "id" TEXT NOT NULL,
    "responsibleName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "zip" DOUBLE PRECISION NOT NULL,
    "phone" INTEGER NOT NULL,
    "city" "City" NOT NULL
);

-- CreateTable
CREATE TABLE "pets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "about" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "city" "City" NOT NULL,
    "bearing" "Bearing" NOT NULL,
    "energyLevel" "EnergyLevel" NOT NULL,
    "requirement" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "organizations_email_key" ON "organizations"("email");

-- CreateIndex
CREATE UNIQUE INDEX "pets_id_key" ON "pets"("id");
