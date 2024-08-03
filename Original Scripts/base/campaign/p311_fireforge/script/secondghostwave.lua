State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_SecondWave"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_SecondWaveSpawned"},
		},
	},
	
}