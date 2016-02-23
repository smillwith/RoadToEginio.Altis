mymod_fnc_MainInit = {
  {_x unassignItem "NVGoggles"; _x removeItem "NVGoggles"; _x unassignItem "NVGoggles_OPFOR"; _x removeItem "NVGoggles_OPFOR"; _x removePrimaryWeaponItem "acc_pointer_IR"; }
  forEach allUnits;

  b_hunter2 call mymod_fnc_HunterInit;
};

mymod_fnc_HunterInit = {
  params ["_veh"];

  //Adds an option for the player driver of a Marshall APC to turn the rear lights on or off
  _veh setVariable ["rearLightOn", 0, true]; _veh addAction ["Rear Lights Off", {deleteVehicle leftrearlight; deleteVehicle rightrearlight; _veh setVariable ["rearLightOn", 0, true];},[],1.5,false,true,"","_veh getVariable ""rearLightOn"" == 1 AND Alive(_target) AND driver _target == _this"];  _veh addAction ["Rear Lights On", {leftrearlight = "#lightpoint" createVehicleLocal getPos _veh; leftrearlight setLightBrightness 0.15;  leftrearlight setLightAmbient [1, 1, 0.5];  leftrearlight setLightColor [1, 1, 0.5]; leftrearlight setLightUseFlare true; leftrearlight setLightFlareSize 0.5; leftrearlight setLightFlareMaxDistance 500; leftrearlight attachTo [_veh, [-0.8,-4.85, -0.31]]; rightrearlight = "#lightpoint" createVehicleLocal getPos _veh; rightrearlight setLightBrightness 0.15;  rightrearlight setLightAmbient [1, 1, 0.5];  rightrearlight setLightColor [1, 1, 0.5]; rightrearlight setLightUseFlare true; rightrearlight setLightFlareSize 0.5; rightrearlight setLightFlareMaxDistance 500; rightrearlight attachTo [_veh, [0.8,-4.85, -0.31]]; _veh setVariable ["rearLightOn", 1, true];},[], 1.5, false, true, "", "_veh getVariable ""rearLightOn"" == 0 AND Alive(_target) AND driver _target == _this"];

  //Adds an action for the player driver of a Hunter to turn the dome light on or off
  _veh setVariable ["domeLightOn", 0, true]; _veh addAction ["Dome Light Off", {deleteVehicle domelight; _veh setVariable ["domeLightOn", 0, true];},[],1.5,false,true,"","_veh getVariable ""domeLightOn"" == 1 AND Alive(_target) AND driver _target == _this"];  _veh addAction ["Dome Light On", {  deleteVehicle domelight; domelight = "#lightpoint" createVehicleLocal getPos _veh; domelight setLightBrightness 0.08;  domelight setLightAmbient [0.0, 0.0, 0.0];  domelight setLightColor [1.0, 1.0, 0.8]; domelight attachTo [_veh, [-0.1, -0.9, 0.22]]; _veh setVariable ["domeLightOn", 1, true];},[], 1.5, false, true, "", "_veh getVariable ""domeLightOn"" == 0 AND Alive(_target) AND driver _target == _this"];

  //Adds some shit to cargo
  _veh addItemCargo ["arifle_MXGL_F", 1];
  _veh addItemCargo ["acc_pointer_IR", 1];
  _veh addItemCargo ["Binocular", 1];
  _veh addItemCargo ["V_PlateCarrierSpec_rgr", 1];
  _veh addItemCargo ["H_HelmetB_desert", 1];
  _veh addItemCargo ["H_HelmetCrew_B", 1];
  _veh addItemCargo ["H_MilCap_ocamo", 1];
  _veh addItemCargo ["U_B_CombatUniform_mcam", 1];
  _veh addItemCargo ["U_B_PilotCoveralls", 1];
  _veh addItemCargo ["Chemlight_red", 5];
  _veh addItemCargo ["Chemlight_yellow", 5];
  _veh addItemCargo ["Chemlight_blue", 5];
  _veh addItemCargo ["acc_Flashlight", 6];
};

