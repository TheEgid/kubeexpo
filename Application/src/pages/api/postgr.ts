import { NextApiRequest, NextApiResponse } from "next";
import { Pool } from "pg";

const databaseHost = process.platform === "win32" ? "localhost" : "postgres-db-lb";

const dbConfig = {
    user: process.env.NEXT_PUBLIC_DB_USER_DEV,
    password: process.env.NEXT_PUBLIC_DB_PASSWORD_DEV,
    host: databaseHost,
    database: process.env.NEXT_PUBLIC_DB_NAME_DEV,
    port: 5432,
};

const pool = new Pool(dbConfig);

async function checkPostgresConnection() {
    try {
        const client = await pool.connect();
        console.log("Успешное подключение к PostgreSQL");
        client.release();
        return true;
    } catch (error) {
        console.error("Ошибка подключения к PostgreSQL:", error);
        return false;
    }
}

// GET /api/postgr
const handler = async (req: NextApiRequest, res: NextApiResponse) => {
    if (req.method === "GET") {
        const msg = await checkPostgresConnection().then((connected) => {
            if (connected) {
                return "GOOD";
            } else {
                return "BAD";
            }
        });

        res.status(200).send(msg);
    } else {
        res.status(405).send({ message: "Method not allowed" });
    }
};

export default handler;

//http://localhost:3006/api/postgr
