

State
{	
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_KeyOrcsSpawn"},
		},
		Actions =
		{
		},
	},
	
	
}
