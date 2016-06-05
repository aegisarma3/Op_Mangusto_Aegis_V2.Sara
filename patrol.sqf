_group=(_this select 0);
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

_waypoints=4;
_distance=30;
_leader=leader _group;


// Create waypoints
for "_i" from 1 to _waypoints do {

_pos =  [(getpos _leader select 0)-_distance*sin(random 359),(getPos _leader select 1)-_distance*cos(random 359)];


   _wp = _group addWaypoint [_pos, 0,_i];
   _wp setWaypointType "MOVE";
    [_group,_i] setWaypointTimeout [0,2,4];
	
};


// Add cycle waypoint
	_pos =  [(getpos _leader select 0)-_distance*sin(random 359),(getPos _leader select 1)-_distance*cos(random 359)];
		_wp1 = _group addWaypoint [_pos, 0,(_waypoints+1)];
		_wp1 setWaypointType "CYCLE";
		

// Add fired at event handler			
_EHkilledIdx = _leader addEventHandler ["FiredNear", 
		{
	_unit=(_this select 0);
	_group=group _unit;
	
	_group setBehaviour "Combat";
	_group setSpeedMode "Normal";
	
		_index = currentWaypoint _group;
		deleteWaypoint [_group, _index];
		
			_unit removeAllEventHandlers "FiredNear";
		}];