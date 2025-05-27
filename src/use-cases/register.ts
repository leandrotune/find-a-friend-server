import { prisma } from "@/lib/prisma";
import { hash } from "bcryptjs";

enum States {
	Acre = "Acre",
	Alagoas = "Alagoas",
	Amapá = "Amapá",
	Amazonas = "Amazonas",
	Bahia = "Bahia",
	Ceará = "Ceará",
	Distrito_Federal = "Distrito_Federal",
	Espírito_Santo = "Espírito_Santo",
	Goiás = "Goiás",
	Maranhão = "Maranhão",
	Mato_Grosso = "Mato_Grosso",
	Mato_Grosso_do_Sul = "Mato_Grosso_do_Sul",
	Minas_Gerais = "Minas_Gerais",
	Pará = "Pará",
	Paraíba = "Paraíba",
	Paraná = "Paraná",
	Pernambuco = "Pernambuco",
	Piauí = "Piauí",
	Rio_de_Janeiro = "Rio_de_Janeiro",
	Rio_Grande_do_Norte = "Rio_Grande_do_Norte",
	Rio_Grande_do_Sul = "Rio_Grande_do_Sul",
	Rondônia = "Rondônia",
	Roraima = "Roraima",
	Santa_Catarina = "Santa_Catarina",
	São_Paulo = "São_Paulo",
	Sergipe = "Sergipe",
	Tocantins = "Tocantins",
}

interface RegisterUseCaseRequest {
	nameResponsible: string;
	email: string;
	password: string;
	address: string;
	number: number;
	zip: number;
	phone: number;
	city: States;
}

export async function registerUseCase({
	nameResponsible,
	email,
	password,
	address,
	number,
	zip,
	phone,
	city,
}: RegisterUseCaseRequest) {
	const password_hash = await hash(password, 6);

	const orgWithSameEmail = await prisma.org.findUnique({
		where: {
			email,
		},
	});

	if (orgWithSameEmail) {
		throw new Error("E-mail already exists.");
	}

	await prisma.org.createMany({
		data: {
			nameResponsible,
			email,
			password_hash,
			address,
			number,
			zip,
			phone,
			city,
		},
	});
}
