State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_GhostChain"},
			AvatarIsNotTalking {},
			GameInterfaceIsNotVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_FirstWave"}		
		},
	},
	
}