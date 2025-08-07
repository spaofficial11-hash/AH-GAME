import React, { useEffect, useState } from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import api from '../services/api';

const Dashboard = () => {
  const [stats, setStats] = useState({
    totalUsers: 0,
    totalCoins: 0,
    totalWithdraws: 0,
  });

  useEffect(() => {
    fetchStats();
  }, []);

  const fetchStats = async () => {
    try {
      const response = await api.get('/admin/stats');
      setStats(response.data);
    } catch (error) {
      console.error('Error fetching stats', error);
    }
  };

  return (
    <div>
      <Sidebar />
      <div style={styles.main}>
        <Header title="Dashboard" />
        <div style={styles.content}>
          <div style={styles.card}>
            <h3>Total Users</h3>
            <p>{stats.totalUsers}</p>
          </div>
          <div style={styles.card}>
            <h3>Total Coins</h3>
            <p>{stats.totalCoins}</p>
          </div>
          <div style={styles.card}>
            <h3>Total Withdraw Requests</h3>
            <p>{stats.totalWithdraws}</p>
          </div>
        </div>
      </div>
    </div>
  );
};

const styles = {
  main: {
    marginLeft: '220px',
    padding: '20px',
  },
  content: {
    display: 'flex',
    gap: '20px',
    marginTop: '20px',
  },
  card: {
    background: '#fff',
    padding: '20px',
    borderRadius: '8px',
    flex: 1,
    boxShadow: '0 2px 5px rgba(0,0,0,0.1)',
    textAlign: 'center',
  },
};

export default Dashboard;