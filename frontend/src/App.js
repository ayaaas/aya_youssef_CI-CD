import React, { useEffect, useState } from 'react';
import './App.css';
// commentaire de test
function App() {
  const [message, setMessage] = useState('Loading...');

  useEffect(() => {
    fetch('/api/hello')
      .then((res) => res.json())
      .then((data) => setMessage(data.message))
      .catch((err) => setMessage('Error fetching from backend'));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <h1>CI/CD Project</h1>
        <p>Backend says: <strong>{message}</strong></p>
      </header>
    </div>
  );
}

export default App;
