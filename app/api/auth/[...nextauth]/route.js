import NextAuth from "next-auth/next";
import CredentialsProvider from "next-auth/providers/credentials";

import bcrypt from "bcrypt"
import { PrismaAdapter } from "@auth/prisma-adapter";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const authOptions = {
    adapter: PrismaAdapter(prisma),
    providers: [
        CredentialsProvider({
            name: "credentials",
            credential: {
                username: { label: "Username", type: "text", placeholder: "jsmith" },
                password: { label: "Password", type: "password" },
                email: { label: "Email", type: "email" }
            },
            async authorize(credentials, req) {
               
                // For simplicity sake we'll just check that the username is correct and it has a length of more than 3 characters
                // Temporary solution for local development purposes only
                if (!credentials.email || credentials.password) {
                    return null;
                }
                //check if user exist
                const user = await prisma.user.findUnique({
                    where: {
                        email: credentials.email
                    }
                })
                if (!user) {
                    return null;
                }
                //check if the password match
                const passMatch = await bcrypt.compare(credentials.password, user.hashPass)
                
                if(!passMatch){
                    return null;
                }

                return user;

            }

        })
    ],
    session: {
        strategy: "jwt",
    },
    secret: process.env.NEXTAUTH_SECRET ?? "",
    debug: process.env.NODE_ENV === "development"
};

const handler = NextAuth(authOptions);
export { handler as GET, handler as POST }
