--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***					Skjaldir	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--Skjaldir begibt sich nach der 1 Cutszene ins Zwergenlager
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			FigureForcedWalk	{X = 322, Y = 246},
		},
		
	},
	--Zwerge1-10 verschwinden in der Burg1 
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 4, X = 322, Y = 246},
		},
		Actions =
		{
			FigureVanish	{},
		},
		
	},
	

	--Zwerge verschwinden durchs Portal
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 4, X = 378, Y = 586},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_DwarfCounter", Value = 1},
			FigureVanish	{},
		},
		
	},
	
	--Skjaldir verschwindet durchs Portal wenn 1 seiner Zwerge durchgegangen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_DwarfCounter", Value = 1},
		},
		Actions =
		{
			FigureForcedRun	{X = 378, Y = 586},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 1,
		X = 378,
		Y = 455,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndcutszeneCS"},
			MapValueIsLessOrEqual	{Name = "mv_DwarfRespawn", Value = 20},
		},
		Actions = 
		{
			MapValueAdd	{Name = "mv_DwarfRespawn", Value = 1},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = true,
		IsSpawnOnlyWhen = false,
	},
	
};