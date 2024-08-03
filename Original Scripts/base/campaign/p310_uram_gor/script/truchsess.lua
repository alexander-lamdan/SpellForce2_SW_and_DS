

State
{
	StateName = "TruchsessStart",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_TruchsessSpawn"},
		},
		Actions = 
		{
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
};
