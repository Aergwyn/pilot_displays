/*
* This function will calculate a heading of the player towards given waypoint.
* The passed vector is a direction/movement from which we can determine our own relevant heading.
*/
if (!hasInterface) exitWith {};

params [["_waypoint", nil, [[0, 0], [0, 0, 0]]], ["_vector", nil, [[0, 0], [0, 0, 0]]]];

// Calculate the "vector" relative from the player to the waypoint
private _playerPos = getPos player;
private _relPosX = (_waypoint select 0) - (_playerPos select 0);
private _relPosY = (_waypoint select 1) - (_playerPos select 1);
private _relativeToWaypoint = [_relPosX, _relPosY, 0];

private _vectorHeading = [_vector] call APD_fnc_vectorToHeading;
private _waypointHeading = [_relativeToWaypoint] call APD_fnc_vectorToHeading;

private _relativeHeading = _waypointHeading - _vectorHeading;

if (_relativeHeading < 0) then
{
	_relativeHeading = _relativeHeading + 360;
};

_relativeHeading;
