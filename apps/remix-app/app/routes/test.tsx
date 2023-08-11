import { useState } from "react";

export default function() {
  const [state, setState] = useState<boolean>(false)

  return (
    <>
      <h1>Prueba estado</h1>
      <div>
        {state ? 'true' : 'false'}
        <button onClick={() => setState(!state)}>
          Cambiar estado
        </button>
      </div>
    </>
  )
}