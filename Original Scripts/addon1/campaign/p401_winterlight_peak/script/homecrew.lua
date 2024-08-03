State
{
	StateName = "INIT",
	OnFigureRespawnEvent
	{
		WaitTime = 60,
		X = myHomeX,
		Y = myHomeY,
		Conditions =
		{
			QuestIsNotSolved {Quest = "WinterlightPeak_LastStand"},
		},
		Actions =
		{
		},
		
	},
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY() ,
		Conditions =
		{
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureLookAtDirection {}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "WinterlightPeak_LastStand"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
}