import React, { useEffect, useState } from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import api from '../services/api';

const Users = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = async () => {
    try {
      const response = await api.get('/admin/users');
      setUsers(response.data);
    } catch (error) {
      console.error('Error fetching users', error);
    }
  };

  return (
    <div>
      <Sidebar />
      <div style={styles.main}>
        <Header title="Users" />
        <div style={styles.content}>
          <table style={styles.table}>
            <thead>
              <tr>
                <th>Username</th>
                <th>Coins</th>
                <th>Referral Code</th>
              </tr>
            </thead>
            <tbody>
              {users.map((user) => (
                <tr key={user._id}>
                  <td>{user.username}</td>
                  <td>{user.coins}</td>
                  <td>{user.referralCode || '-'}</td>
                </tr>
              ))}
            </tbody>
          </table>
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
    marginTop: '20px',
  },
  table: {
    width: '100%',
    borderCollapse: 'collapse',
  },
  th: {
    borderBottom: '1px solid #ddd',
    padding: '10px',
    textAlign: 'left',
  },
  td: {
    borderBottom: '1px solid #ddd',
    padding: '10px',
  },
};

export default Users;