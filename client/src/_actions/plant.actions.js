import { plantConstants } from '../_constants';
import { plantService } from '../_services';

export const plantActions = {
	recordGrowLog,
}

function recordGrowLog(growLogData) {
	return dispatch => {
		plantService.recordGrowLog(growLogData).then( 
			plant => {
				dispatch({ type: plantConstants.RECORD_GROW_LOGS_SUCCESS, plant });
			},
			error => {
				dispatch({ type: plantConstants.RECORD_GROW_LOGS_FAILURE, error });
			}
		)
	};
};