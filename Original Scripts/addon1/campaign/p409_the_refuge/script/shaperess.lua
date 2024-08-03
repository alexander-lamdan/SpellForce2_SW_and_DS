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
			CutsceneFigureTeleport {Tag = "default", X = 392.8, Y = 463.28, },
			FigureLookAtDirection {Tag = "default", Direction = 230},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Shaperess",
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
	
	OnFollowEvent
	{
		Tag = "Shae",
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

