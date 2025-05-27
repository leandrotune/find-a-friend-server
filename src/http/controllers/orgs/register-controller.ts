import { prisma } from "@/lib/prisma";
import type { FastifyRequest, FastifyReply } from "fastify";
import { hash } from "bcryptjs";
import z from "zod";
import { registerUseCase } from "@/use-cases/register";

export const states = [
	"Acre",
	"Alagoas",
	"Amapá",
	"Amazonas",
	"Bahia",
	"Ceará",
	"Distrito_Federal",
	"Espírito_Santo",
	"Goiás",
	"Maranhão",
	"Mato_Grosso",
	"Mato_Grosso_do_Sul",
	"Minas_Gerais",
	"Pará",
	"Paraíba",
	"Paraná",
	"Pernambuco",
	"Piauí",
	"Rio_de_Janeiro",
	"Rio_Grande_do_Norte",
	"Rio_Grande_do_Sul",
	"Rondônia",
	"Roraima",
	"Santa_Catarina",
	"São_Paulo",
	"Sergipe",
	"Tocantins",
] as const;

export async function registerController(
	request: FastifyRequest,
	reply: FastifyReply,
) {
	const registerBodySchema = z.object({
		nameResponsible: z.string(),
		email: z.string().email(),
		password: z.string().min(6),
		address: z.string(),
		zip: z.number().min(8),
		number: z.number(),
		phone: z.number().min(11),
		city: z.enum(states).default("São_Paulo"),
	});

	const {
		nameResponsible,
		email,
		password,
		zip,
		address,
		number,
		phone,
		city,
	} = registerBodySchema.parse(request.body);

	try {
		await registerUseCase({
			nameResponsible,
			email,
			password,
			zip,
			address,
			number,
			phone,
			city,
		});
	} catch (error) {
		return reply.status(409).send({
			message: error.message,
		});
	}

	reply.status(201).send();
}
