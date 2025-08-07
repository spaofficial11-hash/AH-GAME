import React, { useState } from 'react';
import api from '../services/api';

const GameResultForm = () => {
  const [color, setColor] = useState('');
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');

  const submitResult = async () => {
    if (!color) {
      setMessage('Please select a color');
      return;
    }
    setLoading(true);
    setMessage('');
    try {
      const response = await api.post('/game/result', { color });
      setMessage(response.data.message || 'Result declared successfully');
    } catch (err) {
      setMessage('Error declaring result');
    }
    setLoading(false);
  };

  return (
    <div style={styles.container}>
      <h3>Declare Color Trading Result</h3>
      <select
        value={color}
        onChange={(e) => setColor(e.target.value)}
        style={styles.select}
      >
        <option value="">Select Color</option>
        <option value="red">Red</option>
        <option value="green">Green</option>
        <option value="blue">Blue</option>
      </select>
      <button onClick={submitResult} style={styles.button} disabled={loading}>
        {loading ? 'Submitting...' : 'Submit Result'}
      </button>
      {message && <p style={styles.message}>{message}</p>}
    </div>
  );
};

const styles = {
  container: {
    margin: '20px',
    padding: '20px',
    background: '#f5f5f5',
    borderRadius: '8px',
  },
  select: {
    padding: '10px',
    marginRight: '10px',
  },
  button: {
    padding: '10px 15px',
    background: '#1e1e2f',
    color: '#fff',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
  },
  message: {
    marginTop: '10px',
    color: 'green',
  },
};

export default GameResultForm;