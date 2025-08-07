import React, { useEffect, useState } from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import api from '../services/api';

const WithdrawRequests = () => {
  const [requests, setRequests] = useState([]);

  useEffect(() => {
    fetchRequests();
  }, []);

  const fetchRequests = async () => {
    try {
      const response = await api.get('/admin/withdraw-requests');
      setRequests(response.data);
    } catch (error) {
      console.error('Error fetching withdraw requests', error);
    }
  };

  const approveRequest = async (id) => {
    try {
      await api.post(`/admin/withdraw-requests/${id}/approve`);
      fetchRequests();
    } catch (error) {
      console.error('Error approving request', error);
    }
  };

  return (
    <div>
      <Sidebar />
      <div style={styles.main}>
        <Header title="Withdraw Requests" />
        <div style={styles.content}>
          <table style={styles.table}>
            <thead>
              <tr>
                <th>User</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {requests.map((req) => (
                <tr key={req._id}>
                  <td>{req.user?.username || 'N/A'}</td>
                  <td>{req.amount}</td>
                  <td>{req.status}</td>
                  <td>
                    {req.status === 'pending' && (
                      <button
                        onClick={() => approveRequest(req._id)}
                        style={styles.button}
                      >
                        Approve
                      </button>
                    )}
                  </td>
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
  button: {
    padding: '5px 10px',
    background: '#28a745',
    color: '#fff',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
  },
};

export default WithdrawRequests;