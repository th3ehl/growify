import { authHeader } from '../_helpers';
import { plantConstants } from '../_constants';
import { apiConstants } from '../_constants';

const axios = require('axios');

export const plantService = {
	recordGrowLog,
}

function recordGrowLog(growLogData) {
	const options = {
		method: 'POST',
		headers: authHeader(),
		url: (apiConstants.API_QUERY_PREFIX + '/grow_logs'),
		data: { grow_log: growLogData }
	}

	return axios(options).then(function(resp) {
		return resp.data;
	}).catch(function(error) {
		return { error: error.response.data }
	});
}