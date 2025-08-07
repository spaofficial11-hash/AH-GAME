import React from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import GameResultForm from '../components/GameResultForm';

const ColorTrading = () => {
  return (
    <div>
      <Sidebar />
      <div style={styles.main}>
        <Header title="Color Trading" />
        <div style={styles.content}>
          <GameResultForm />
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
};

export default ColorTrading;