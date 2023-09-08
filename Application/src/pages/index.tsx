import Head from "next/head";
import { EmptyLine } from "@/EmptyLine";

export default function Home() {
    return (
        <>
            <Head>
                <title>Create Next App</title>
                <link rel="icon" href="/favicon.ico" />
            </Head>
            <main>
                <EmptyLine />
                <EmptyLine />
                <div className="hello">
                    <div className="chil">HO HO HO 🚜🚜🚜</div>
                    <EmptyLine />
                    <div className="chil">Hi privated {process.env.NEXT_PUBLIC_DB_NAME_DEV}</div>
                </div>
            </main>
        </>
    );
}
