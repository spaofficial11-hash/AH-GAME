import React, { useEffect, useState } from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import api from '../services/api';

const Wallet = () => {
  const [transactions, setTransactions] = useState([]);

  useEffect(() => {
    fetchTransactions();
  }, []);

  const fetchTransactions = async () => {
    try {
      const response = await api.get('/admin/transactions');
      setTransactions(response.data);
    } catch (error) {
      console.error('Error fetching transactions', error);
    }
  };

  return (
    <div>
      <Sidebar />
      <div style={styles.main}>
        <Header title="Wallet Transactions" />
        <div style={styles.content}>
          <table style={styles.table}>
            <thead>
              <tr>
                <th>User</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              {transactions.map((txn) => (
                <tr key={txn._id}>
                  <td>{txn.user?.username || 'N/A'}</td>
                  <td>{txn.type}</td>
                  <td>{txn.amount}</td>
                  <td>{new Date(txn.createdAt).toLocaleString()}</td>
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
};

export default Wallet;