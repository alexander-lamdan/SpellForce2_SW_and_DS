
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWind_SpawnCenwen"},
		},
		NoSpawnEffect = true,
	};
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWind_TalkedToCenwen"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			FigureVanish	{},
		},
		GotoState = "END",
	},
};

State	{StateName = "END"};
