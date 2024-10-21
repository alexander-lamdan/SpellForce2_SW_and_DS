State
{	
	StateName = "INIT",
	

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_CS_02_Actors_Spawn"},
		},
		Actions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 338.98, Y = 493.6, },
			FigureLookAtDirection {Tag = "default", Direction = 63},
		},
	
	},
	
	OnFollowEvent
	{
		Tag = "default",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			AND
			{
				MapFlagIsTrue {Name = "mf_CS02Ended"},
				MapFlagIsFalse{Name = "mf_TalkedWithSoulCarrier"},
			},
		},
		Actions = 
		{
		},
	};
};

