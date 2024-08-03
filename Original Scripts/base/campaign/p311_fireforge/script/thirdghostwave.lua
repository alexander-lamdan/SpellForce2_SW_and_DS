State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_ThirdWave"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_ThirdWaveSpawned"}
		},
	},
	
}