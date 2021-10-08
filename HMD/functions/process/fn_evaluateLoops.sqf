/*
* This function determines which (if any) processing loops need to be spawned or terminated.
* The latter is achieved through variables which keep those loops alive.
*/
if (!hasInterface) exitWith {};

private _vehicle = vehicle player;
private _isValidVehicle = [_vehicle] call APD_fnc_isValidHMDVehicle;

if (_isValidVehicle && (APD_HMD_VehicleAltitudeEnabled || APD_HMD_VehicleAirspeedEnabled)) then
{
	if (!APD_HMD_VehicleLoopRunning) then
	{
		APD_HMD_VehicleLoopRunning = true;
		[_vehicle] spawn APD_fnc_vehicleLoop;
	};
}
else
{
	APD_HMD_VehicleLoopRunning = false;
};

if (_isValidVehicle && APD_HMD_WaypointDetailsEnabled) then
{
	if (!APD_HMD_WaypointLoopRunning) then
	{
		APD_HMD_WaypointLoopRunning = true;
		[_vehicle] spawn APD_fnc_waypointLoop;
	};
}
else
{
	APD_HMD_WaypointLoopRunning = false;
};

[_isValidVehicle] call APD_fnc_toggleWaypointRender;
