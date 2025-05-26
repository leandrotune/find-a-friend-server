import { prisma } from "@/lib/prisma";
import type { FastifyRequest, FastifyReply } from "fastify";
import { hash } from "bcryptjs";
import z from "zod";

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
		city: z.enum(["São_Paulo", "Ceará"]),
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

	const password_hash = await hash(password, 6);

	const orgWithSameEmail = await prisma.org.findUnique({
		where: {
			email,
		},
	});

	if (orgWithSameEmail) {
		return reply.status(409).send();
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

	reply.status(201).send();
}
