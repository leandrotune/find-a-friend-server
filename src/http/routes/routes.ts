import { registerController } from "../controllers/orgs/register-controller";
import type { FastifyInstance } from "fastify";

export async function appRoutes(app: FastifyInstance) {
	app.post("/orgs/register", registerController);
}
