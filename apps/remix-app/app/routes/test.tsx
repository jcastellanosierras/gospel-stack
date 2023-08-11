import { json } from "@remix-run/node"
import { useLoaderData } from "@remix-run/react"
import { useState } from "react"
import { client } from '~/utils/db.server.ts'

export async function loader() {
  const edgedbClient = client.withConfig({
    apply_access_policies: false
  })

  const users = await edgedbClient.query('select User {**};')

  let success = true
  if (!users) success = false

  return json(
    {
      success: success,
      users: users
    },
    {
      status: success ? 200 : 400
    }
  )
}

export default function() {
  const loaderData = useLoaderData<typeof loader>()
  const { users } = loaderData
  const [state, setState] = useState<boolean>(false)

  return (
    <>
      <h1>Pruebas</h1>
      <div>
        <div>
          <h2>Estado</h2>
          <p>
            {state ? 'true' : 'false'}
          </p>
          <button onClick={() => setState(!state)}>
            Cambiar estado
          </button>
        </div>
        &nbsp;
        <div>
          <h2>Database</h2>
          <div>
            <p>Users:</p>
            {users.map(user => (
              <div key={user.username}>
                <p>Username: {user.username}</p>
                <p>Email: {user.email}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  )
}