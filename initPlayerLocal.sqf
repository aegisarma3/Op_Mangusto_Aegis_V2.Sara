["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	["SOBRE A COSTA DE SAHRANI",0,0.5,20,2] spawn BIS_fnc_dynamicText;;
	titleFadeOut 9;
	sleep 28;

	[str ("DIAS ATUAIS")] spawn BIS_fnc_infoText;
	titleFadeOut 9;
	sleep 9;

	[str ("02:45h")] spawn BIS_fnc_infoText;
	titleFadeOut 9;
	sleep 20;

	// Info text
	[str ("AEGIS"), str("Operação Mangusto"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;

};
