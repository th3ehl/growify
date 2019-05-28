import React from 'react';
import './App.css';
import { Router, Route } from 'react-router-dom';

import { history } from './_helpers';
import { RegistrationContainer } from './_components'
import { GrowPlantContainer } from './_components'

function App() {
  return (
  	<Router history={history}>
	    <div className="App">
          	<Route path="/" component={RegistrationContainer} />
          	<Route path="/" component={GrowPlantContainer} />      			
	    </div>
    </Router>
  );
}

export default App;
