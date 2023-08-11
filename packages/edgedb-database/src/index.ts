import e from "../dbschema/edgeql-js/index.ts"
import { uuid } from "edgedb/dist/codecs/ifaces.js"
export * from "../dbschema/edgeql-js/index.ts"
import { createClient } from "edgedb";

const client = createClient()

export const getClientWithGlobals = (id: uuid) => {
  return client.withGlobals({
    current_user_id: id
  })
}

export const getClientWithoutACLs = () => {
  return client.withConfig({
    apply_access_policies: false
  })
}

export { client, e }
