import React from 'react';

const Header = ({ title }) => {
  return (
    <header style={styles.header}>
      <h1 style={styles.title}>{title}</h1>
    </header>
  );
};

const styles = {
  header: {
    background: '#27293d',
    color: '#fff',
    padding: '15px 20px',
    marginLeft: '220px', // Sidebar width
  },
  title: {
    margin: 0,
    fontSize: '20px',
  },
};

export default Header;