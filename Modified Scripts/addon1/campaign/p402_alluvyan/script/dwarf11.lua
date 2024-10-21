--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***					Dwarf11  	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--Dwarf11 begibt sich nach der 1 Cutszene ins Zwergenlager
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			FigureForcedWalk	{X = 415, Y = 266},
		},
		
	},
	--Zwerge11-20 verschwinden in der Burg2 
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 4, X = 415, Y = 266},
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
	
	OnFigureRespawnEvent	
	{
		WaitTime = 1,
		X = 373,
		Y = 453,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndcutszeneCS"},
			MapValueIsLessOrEqual	{Name = "mv_DwarfRespawn", Value = 20},
		},
		Actions = 
		{
			FigurePlayerTransfer	{Player = "pl_Human"},
			MapValueAdd	{Name = "mv_DwarfRespawn", Value = 1},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
};
