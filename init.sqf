//execVM = "funcs.sqf";

{_x unassignItem "NVGoggles"; _x removeItem "NVGoggles"; _x unassignItem "NVGoggles_OPFOR"; _x removeItem "NVGoggles_OPFOR"; _x removePrimaryWeaponItem "acc_pointer_IR"; }
forEach allUnits;

//Adds an option for the player driver of a Marshall APC to turn the rear lights on or off
b_hunter2 setVariable ["rearLightOn", 0, true]; b_hunter2 addAction ["Rear Lights Off", {deleteVehicle leftrearlight; deleteVehicle rightrearlight; b_hunter2 setVariable ["rearLightOn", 0, true];},[],1.5,false,true,"","b_hunter2 getVariable ""rearLightOn"" == 1 AND Alive(_target) AND driver _target == _this"];  b_hunter2 addAction ["Rear Lights On", {leftrearlight = "#lightpoint" createVehicleLocal getPos b_hunter2; leftrearlight setLightBrightness 0.15;  leftrearlight setLightAmbient [1, 1, 0.5];  leftrearlight setLightColor [1, 1, 0.5]; leftrearlight setLightUseFlare true; leftrearlight setLightFlareSize 0.5; leftrearlight setLightFlareMaxDistance 500; leftrearlight attachTo [b_hunter2, [-0.8,-4.85, -0.31]]; rightrearlight = "#lightpoint" createVehicleLocal getPos b_hunter2; rightrearlight setLightBrightness 0.15;  rightrearlight setLightAmbient [1, 1, 0.5];  rightrearlight setLightColor [1, 1, 0.5]; rightrearlight setLightUseFlare true; rightrearlight setLightFlareSize 0.5; rightrearlight setLightFlareMaxDistance 500; rightrearlight attachTo [b_hunter2, [0.8,-4.85, -0.31]]; b_hunter2 setVariable ["rearLightOn", 1, true];},[], 1.5, false, true, "", "b_hunter2 getVariable ""rearLightOn"" == 0 AND Alive(_target) AND driver _target == _this"];

//Adds an action for the player driver of a Hunter to turn the dome light on or off
b_hunter2 setVariable ["domeLightOn", 0, true]; b_hunter2 addAction ["Dome Light Off", {deleteVehicle domelight; b_hunter2 setVariable ["domeLightOn", 0, true];},[],1.5,false,true,"","b_hunter2 getVariable ""domeLightOn"" == 1 AND Alive(_target) AND driver _target == _this"];  b_hunter2 addAction ["Dome Light On", {  deleteVehicle domelight; domelight = "#lightpoint" createVehicleLocal getPos b_hunter2; domelight setLightBrightness 0.08;  domelight setLightAmbient [0.0, 0.0, 0.0];  domelight setLightColor [1.0, 1.0, 0.8]; domelight attachTo [b_hunter2, [-0.1, -0.9, 0.22]]; b_hunter2 setVariable ["domeLightOn", 1, true];},[], 1.5, false, true, "", "b_hunter2 getVariable ""domeLightOn"" == 0 AND Alive(_target) AND driver _target == _this"];

//Adds some shit to cargo
b_hunter2 addItemCargo ["arifle_MXGL_F", 1];
b_hunter2 addItemCargo ["acc_pointer_IR", 1];
b_hunter2 addItemCargo ["Binocular", 1];
b_hunter2 addItemCargo ["V_PlateCarrierSpec_rgr", 1];
b_hunter2 addItemCargo ["H_HelmetB_desert", 1];
b_hunter2 addItemCargo ["H_HelmetCrew_B", 1];
b_hunter2 addItemCargo ["H_MilCap_ocamo", 1];
b_hunter2 addItemCargo ["U_B_CombatUniform_mcam", 1];
b_hunter2 addItemCargo ["U_B_PilotCoveralls", 1];
b_hunter2 addItemCargo ["Chemlight_red", 5];
b_hunter2 addItemCargo ["Chemlight_yellow", 5];
b_hunter2 addItemCargo ["Chemlight_blue", 5];
b_hunter2 addItemCargo ["acc_Flashlight", 6];


// TcB AIS Wounding System --------------------------------------------------------------------------
if (!isDedicated) then {
	TCB_AIS_PATH = "ais_injury\";
	//{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});		// execute for every playable unit
	
  //Using this but disabled for now
	//{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (units assaultgroup);													// only own group - you cant help strange group members
	
	//{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach [p1,p2,p3,p4,p5];														// only some defined units
};
// --------------------------------------------------------------------------------------------------------------

