import { NextApiRequest, NextApiResponse } from "next";
import { Pool } from "pg";

const databaseHost = process.platform === "win32" ? "localhost" : "postgres-db-service";

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

        const sql = `SELECT current_database();`;
        const user = await pool.query(sql);
        client.release();
        return user.rows.at(0).current_database;

        // const sql = `SELECT id, email FROM public."user" WHERE id='ccd7601b-1cae-4d07-8fa3-fc84ebbddcf8'::uuid;`;
        // const user = await pool.query(sql);
        // // console.log(user.rows.at(0).email);
        // client.release();
        // return user.rows.at(0).email;
    } catch (error) {
        console.error("Ошибка подключения к PostgreSQL:", error);
        return undefined;
    }
}

// GET /api/database
const handler = async (req: NextApiRequest, res: NextApiResponse) => {
    if (req.method === "GET") {
        const msg = await checkPostgresConnection().then((connected) => connected || "bad query (");
        res.status(200).send(msg);
    } else {
        res.status(405).send({ message: "Method not allowed" });
    }
};

export default handler;

// http://localhost:3006/api/database

// http://192.168.1.84/api/database

// http://192.168.1.84
