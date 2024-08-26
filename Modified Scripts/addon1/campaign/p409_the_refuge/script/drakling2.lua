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
			CutsceneFigureTeleport {Tag = "default", X = 339.06, Y = 490.13, },
			FigureLookAtDirection {Tag = "default", Direction = 63},
		},
	
	},
	
	OnFollowEvent
	{
		Tag = "Drakling2",
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