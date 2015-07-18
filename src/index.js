import React from 'react'
import Main from './components/main'

window.addEventListener('load', () => {
  React.render(
      <Main />, document.getElementById("app")
  );
});
