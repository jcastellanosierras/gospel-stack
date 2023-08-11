import { getClientWithoutACLs } from "@remix-gospel-stack/edgedb-database";
import { UserRepository } from "../domain/user-repository.ts";
import { User } from "../domain/user.ts";

export const EdgedbUserRepository = (): UserRepository => {
  return {
    getUsers
  }
}

const edgedbClient = getClientWithoutACLs()

const getUsers = async () => {
  const users: User[] = await edgedbClient.query('select User {id, username, email};')
  return users
}