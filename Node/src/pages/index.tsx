import Head from "next/head";
import Link from "next/link";
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
                    <div className="chil">Hi privated</div>
                    <EmptyLine />
                    <Link href="https://canister.io">https://canister.io</Link>
                </div>
            </main>
        </>
    );
}
