import { User } from "./user.ts";

export interface UserRepository {
  getUsers: () => Promise<User[]>
}