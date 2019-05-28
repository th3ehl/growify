import React from 'react';
import { connect } from 'react-redux';
import { authActions } from '../_actions';
import { plantActions } from '../_actions';

class GrowPlantContainer extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			sunlamp_hrs: 0,
			water_inches: 0.0,
		}
	}

	componentDidMount() {
		const { dispatch } = this.props;
		dispatch(authActions.currentUser());

		this.handleChange = this.handleChange.bind(this);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	componentWillReceiveProps(nextProps) {
		if (nextProps.plants && nextProps.plants.updatedPlant) {
			const { currentUser } = this.props.authentication;

			currentUser.plants.forEach((plant, index) => {

				if (plant.id === nextProps.plants.updatedPlant.id) {
					currentUser.plants[index] = nextProps.plants.updatedPlant;
					
					this.setState({
						sunlamp_hrs: 0,
						water_inches: 0
					})
				}
			});
		}
	}


	handleChange(event) {
		this.setState({ [event.target.name]: event.target.value });
	}

	handleSubmit(e, plant) {
    	e.preventDefault();	
    	e.stopPropagation();

		const { dispatch } = this.props;

		const growLogData = {
			plant_id: plant.id,
			sunlamp_hrs: parseFloat(this.state.sunlamp_hrs),
			water_inches: parseFloat(this.state.water_inches),
			plant_age_in_days: Number(plant.days_old)
		}

		dispatch(plantActions.recordGrowLog(growLogData));
	}


	render() {
		const { currentUser } = this.props.authentication;

		return(
			<div>
				
				<div>
					<h3>
						Plant Age - { currentUser && currentUser.plants ? currentUser.plants[0].days_old : 'NA' } (Days)
					</h3>
					
					<h3>
						Plant Height - { (currentUser && currentUser.plants) ? currentUser.plants[0].height : 'NA' } (inches)
					</h3>
				</div>

				{currentUser &&

					<form className="form-standard form-session"
						onSubmit={(e) => this.handleSubmit(e, currentUser.plants[0]) }>
					     
					    <label>
					    	Sunlamp Hours (Current Day)
						    <input type="number"
						    	name="sunlamp_hrs"
								placeholder="Hours of sunlamp" 
								value={this.state.sunlamp_hrs} 
								onChange={this.handleChange} 
								/>
						</label>

						<label>
							Water (inches)
				        	<input type="number"
				          		name="water_inches"
				          		placeholder="Water provided (in inches)"
				          		value={this.state.water_inches}
				          		onChange={this.handleChange} 
				          		step="0.25"
				          		/>
				        </label>

				        <input type="submit"
				        	className="form-standard__submit width__100"
				        	value="Submit" 
				        	/>	

					</form>
				}
				
			</div>
		)
  	}
}

function mapStateToProps(state) {
	const { authentication, plants } = state;

	return {
		authentication,
		plants
	}
}

const connectedGrowPlantContainer = connect(mapStateToProps)(GrowPlantContainer);
export { connectedGrowPlantContainer as GrowPlantContainer };






