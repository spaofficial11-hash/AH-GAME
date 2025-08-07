import React, { useState } from 'react';
import api from '../services/api';

const Login = ({ onLogin }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');

  const handleLogin = async () => {
    if (!username || !password) {
      setMessage('Please enter username and password');
      return;
    }
    try {
      const response = await api.post('/auth/admin-login', { username, password });
      if (response.data.token) {
        localStorage.setItem('adminToken', response.data.token);
        onLogin();
      } else {
        setMessage('Invalid credentials');
      }
    } catch (error) {
      setMessage('Login failed. Please try again.');
    }
  };

  return (
    <div style={styles.container}>
      <h2>Admin Login</h2>
      <input
        type="text"
        placeholder="Username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        style={styles.input}
      />
      <input
        type="password"
        placeholder="Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        style={styles.input}
      />
      <button onClick={handleLogin} style={styles.button}>
        Login
      </button>
      {message && <p style={styles.message}>{message}</p>}
    </div>
  );
};

const styles = {
  container: {
    maxWidth: '400px',
    margin: '100px auto',
    padding: '20px',
    textAlign: 'center',
    border: '1px solid #ddd',
    borderRadius: '8px',
    background: '#fff',
  },
  input: {
    display: 'block',
    width: '100%',
    margin: '10px 0',
    padding: '10px',
    fontSize: '16px',
  },
  button: {
    padding: '10px',
    width: '100%',
    background: '#1e1e2f',
    color: '#fff',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
  },
  message: {
    marginTop: '10px',
    color: 'red',
  },
};

export default Login;