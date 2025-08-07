import React from 'react';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div className="sidebar" style={styles.sidebar}>
      <h2 style={styles.title}>AH GAME Admin</h2>
      <ul style={styles.menu}>
        <li><Link to="/dashboard" style={styles.link}>Dashboard</Link></li>
        <li><Link to="/users" style={styles.link}>Users</Link></li>
        <li><Link to="/wallet" style={styles.link}>Wallet</Link></li>
        <li><Link to="/color-trading" style={styles.link}>Color Trading</Link></li>
        <li><Link to="/withdraw-requests" style={styles.link}>Withdraw Requests</Link></li>
      </ul>
    </div>
  );
};

const styles = {
  sidebar: {
    width: '220px',
    background: '#1e1e2f',
    color: '#fff',
    height: '100vh',
    padding: '20px',
    position: 'fixed'
  },
  title: {
    marginBottom: '20px',
    fontSize: '18px',
    textAlign: 'center'
  },
  menu: {
    listStyle: 'none',
    padding: 0
  },
  link: {
    display: 'block',
    padding: '10px',
    color: '#fff',
    textDecoration: 'none'
  }
};

export default Sidebar;