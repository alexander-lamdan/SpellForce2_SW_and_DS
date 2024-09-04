TagOwnBuilding =
{
	-- Die Namen der Gebäude

	[1] = "OwnBuildElenShrine",
	[2] = "OwnBuildCastle",
	[3] = "OwnBuildElvenFortress",
 	[4] = "OwnBuildOrderStronghold",
 	[5] = "OwnBuildWarriorGuild",
 	[6] = "OwnBuildDwarvenForge",
 	[7] = "OwnBuildBlacksmith",
 	[8] = "OwnBuildFarm",

}

RequiredBuildings =
{
	Soldier = {2,7}, -- Burg / Schmiede
	Catapult = {5,6}, -- Kriegerhalle / Meisterwerkstatt
	SecondCatapult = {8,5},  -- Farm / Kriegerhalle
	Druid = {3,1}, -- Elfenfestung / Elenschrein
	Ranger = {3,3}, -- Elfenfestung & dito
	Paladin = {2,4}, -- Burg / Ordenshaus
	Crossbowman = {7,7}, -- Schmiede & dito
}

CoordsMyBuilding =
{
	[1] = { X = 259.775, Y = 81.2434, },
	[2] = { X = 231.076, Y = 138.712, },
	[3] = { X = 267.481, Y = 82.2423, },
	[4] = { X = 247.946, Y = 149.131, },
	[5] = { X = 236.269, Y = 127.544, },
	[6] = { X = 263.562, Y = 146.125, },
	[7] = { X = 263.028, Y = 133.458, },
	[8] = { X = 272.464, Y = 88.2892, },
}

--RequiredBuildings =
--{
--	Matricus = {3,4,5},
--},
--
-- RequiredBuildings.Matricus[3] wäre die 5

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
			-- sobald Avatar mit dem Commander gesprochen hat
			MapFlagIsTrue{Name = "mf_CommanderDialogEndedTroopsGiven"},
		},
		Actions =
		{
			-- erhält er die Truppen
			EntityFlagSetTrue{Name = "ef_AtPoint"},
			FigurePlayerTransfer{Tag = "default", Player = "pl_Human"},
		},
		GotoState = "PlayerControl",
	},

};

State
{
	StateName = "PlayerControl",

	OnFigureRespawnEvent
	{
		WaitTime = 2,
		X = CoordsMyBuilding[RequiredBuildings[MyType][1]].X,
		Y = CoordsMyBuilding[RequiredBuildings[MyType][1]].Y,
		Conditions =
		{
			AND
			{
				BuildingIsAlive{Tag = TagOwnBuilding[RequiredBuildings[MyType][1]]},
				BuildingIsAlive{Tag = TagOwnBuilding[RequiredBuildings[MyType][2]]},
			},
		},
		Actions =
		{
			EntityFlagSetFalse{Name = "ef_AtPoint"},
		},
		NoSpawnEffect = false,
	};

	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 8,
		StopFigureWhenConditionsAreFalse = false,
		Conditions =
		{
			EntityFlagIsFalse{Name = "ef_AtPoint"},
		},
		HomeActions =
		{
			FigurePlayerTransfer{Tag = "default", Player = "pl_Human"},
			EntityFlagSetTrue{Name = "ef_AtPoint"},
		},
	};
};
