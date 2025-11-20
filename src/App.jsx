import { useEffect, useState } from "react";

function App() {
  const [msg, setMsg] = useState("");

  useEffect(() => {
    fetch("http://3.108.221.211//api/message")
      .then(res => res.json())
      .then(data => setMsg(data.message));
  }, []);

  return (
    <div>
      <h1>Frontend running abhiramkaleru</h1>
      <p>Backend says: {msg}</p>
    </div>
  );
}

export default App;
