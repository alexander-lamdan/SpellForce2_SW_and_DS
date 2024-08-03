--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***					Observer	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "Irion"},
			FogOfWarReveal	{X = 345, Y = 359, Range = 10, Height = 120},
    	   	FogOfWarReveal	{X = 404, Y = 359, Range = 15, Height = 120},
		},
		
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			FigureIsInEntityRange	{TargetTag = "Irion", Range = 3},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_ObserverWait1"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			EntityTimerIsElapsed	{Name = "et_ObserverWait1", Seconds = 3},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "TrebuchetWest"},
			EntityTimerStop	{Name = "et_ObserverWait1"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			FigureIsInEntityRange	{TargetTag = "TrebuchetWest", Range = 6},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_ObserverWait2"},
			FogOfWarReveal	{X = 341, Y = 302, Range = 15, Height = 120},
			MapFlagSetTrue {Name = "mf_StartOutcryTrebuchet"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			EntityTimerIsElapsed	{Name = "et_ObserverWait2", Seconds = 3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_StartTrebuchetWestCatapult1"},
			FigureTeamTransfer	{Tag = "CatapultOrc03", Team = "tm_Catapulte1"},
			FigureTeamTransfer	{Tag = "CatapultOrc04", Team = "tm_Catapulte1"},
			FigureRunToEntity	{TargetTag = "TrebuchetEast"},
			EntityTimerStop	{Name = "et_ObserverWait2"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			FigureIsInEntityRange	{TargetTag = "TrebuchetEast", Range = 6},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_ObserverWait3"},
			FogOfWarReveal	{X = 403, Y = 301, Range = 15, Height = 120},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartTrebuchetVersusCatapulte"},
			EntityTimerIsElapsed	{Name = "et_ObserverWait3", Seconds = 3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_StartTrebuchetEastCatapult2"},
			FigureTeamTransfer	{Tag = "CatapultOrc01", Team = "tm_Catapulte2"},
			FigureTeamTransfer	{Tag = "CatapultOrc02", Team = "tm_Catapulte2"},
			EntityTimerStop	{Name = "et_ObserverWait3"},
		},
		
	},
	--Figur verliert seinen Dialog und begibt sich ins Camp nachdem die Treants das Gate zerstört haben.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_ProtectTreants"},
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
			MapFlagIsFalse {Name = "mf_RecruitObserver"},
			MapFlagIsFalse {Name = "mf_StartTrebuchetVersusCatapulte"},
			
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Observer"},
			EntityTimerStart	{Name = "et_ObserverRunHome"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_ProtectTreants"},
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
			MapFlagIsFalse {Name = "mf_RecruitObserver"},
			MapFlagIsFalse {Name = "mf_StartTrebuchetVersusCatapulte"},
			EntityTimerIsElapsed	{Name = "et_ObserverRunHome", Seconds = 1},
		},
		Actions =
		{
			FigureRun	{X = 324, Y = 253},
			EntityTimerStop	{Name = "et_ObserverRunHome"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 4, X = 324, Y = 253},
		},
		Actions =
		{
			FigureTeamTransfer	{Team = "tm_Team1"},
		},
		
	},
	
	
};