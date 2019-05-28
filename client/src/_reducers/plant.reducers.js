import { plantConstants } from '../_constants';

const initialState = {};

export function plants(state = initialState, action) {

	switch(action.type) {

		case plantConstants.RECORD_GROW_LOGS_SUCCESS:
			return {
				...state,
				updatedPlant: action.plant
			};		

		default: 
			return state;			
	}
}

