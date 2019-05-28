import { combineReducers } from 'redux';
import { authentication } from './authentication.reducers.js';
import { plants } from './plant.reducers.js';

const rootReducer = combineReducers({
	authentication,
	plants,
});

export default rootReducer;