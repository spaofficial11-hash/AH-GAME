import React, { useState } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import Users from './pages/Users';
import Wallet from './pages/Wallet';
import ColorTrading from './pages/ColorTrading';
import WithdrawRequests from './pages/WithdrawRequests';

const App = () => {
  const [isAuthenticated, setIsAuthenticated] = useState(
    !!localStorage.getItem('adminToken')
  );

  const handleLogin = () => {
    setIsAuthenticated(true);
  };

  return (
    <Routes>
      {!isAuthenticated ? (
        <Route path="/*" element={<Login onLogin={handleLogin} />} />
      ) : (
        <>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/users" element={<Users />} />
          <Route path="/wallet" element={<Wallet />} />
          <Route path="/color-trading" element={<ColorTrading />} />
          <Route path="/withdraw-requests" element={<WithdrawRequests />} />
          <Route path="/*" element={<Navigate to="/dashboard" />} />
        </>
      )}
    </Routes>
  );
};

export default App;