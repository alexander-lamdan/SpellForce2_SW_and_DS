State
{

	StateName = "IoAwake",
	

	OnFigureDeadOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P306_IoWaitingForRespawn"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IoHasDied"},
--			FigureOutcry	{TextTag = "GameOver01", Tag = "Sansha"},--TEST OC solange GameOver nicht implementiert
--			PlayerGameOver	{Player = "pl_HumanAvatar"},
		},
	},
	
	
		OnIdleGoHomeFake
	{
		
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 2,
		UpdateInterval = 30,
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P306_IoNoIdleGoHome"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureHoldPosition	{Tag = "default"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	
	
	-- Io geht nach CS durchs Portal Hilfe holen
	-- Flag wird in CS Io gesetzt
	OnOneTimeEvent
	{
		
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_IoGo"},
		},
		Actions =
		{
			FigureForcedRun	{Tag = "Io", X = 420, Y = 418},
			MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"},
		},
	},
	
	
	--Portaleffekt an, kurz bevor Io despawnt
	OnOneTimeEvent
	{
		
		Conditions =
		{
			FigureIsInRange	{Range = 4, X = 420, Y = 418},
		},
		Actions =
		{
			EffectStart {Tag = "Portal_Start", File = "Effect_Spawn_Gate"},	
		},
	},
		
	
	--despawnt am Portal
	OnOneTimeEvent
	{
		GotoState = "OnJourney", --solange Io nicht da ist
		Conditions =
		{
			FigureIsInRange	{Range = 2, X = 420, Y = 418},
		},
		Actions =
		{
			
			FigureVanish	{Tag = "Io"},
			MapFlagSetTrue {Name = "mf_IoGone"},
			MapTimerStart	{Name = "mt_IoGone"},
			
		},
	},
	
	-------------------------------------------------------------------------------------------
	--Portaleffekt aus, kurz nachdem Io despawnt: in DunMora.lua, weil Io despawned (tot) ist
	-------------------------------------------------------------------------------------------
	
	
	
	--nach Rueckehr:
	--wenn Daemonen-Camp zerstoert, Dialog Part2 an
	OnOneTimeEvent
	{
		GotoState = "AfterAttackII",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_DemonCampDestroyed"},
		},
		Actions =
		{
			
		},
	},
	
}

State
{
	StateName = "OnJourney",
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 420.695,
		Y = 418.339,
		
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_CutsceneSanshaDone"},
			MapFlagIsFalse	{Name = "mf_IoHasDied"},
			MapFlagIsTrue	{Name = "mf_IoIntoCutscene"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Io"},
			MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"}, --IdlegoHome aus für Cutscene
			MapFlagSetTrue {Name = "mf_P306_IoChangeState01"},
			FigureLookAtDirection {Tag = "default", Direction = 270},			
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "IoAwake",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P306_IoChangeState01"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P306_IoChangeState01"},
		},
	},
	
}
	
	
State
{
	StateName = "AfterAttackII",
	
		OnIdleGoHomeFake
	{
		
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 2,
		UpdateInterval = 30,
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P306_IoNoIdleGoHome"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			
		},
		OneTimeHomeActions = 
		{
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions =
		{
			
		},
		Actions =
		{
			FigureHoldPosition	{Tag = "default"},
			DialogSetEnabled	{Tag = "Io"},
			DialogTypeSetMainQuest	{Tag = "Io"},
			MapFlagSetTrue	{Name = "mf_IoDialogPart2On"},
		},
	},


	OnFigureDeadOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P306_IoWaitingForRespawn"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IoHasDied"},
--			FigureOutcry	{TextTag = "GameOver01", Tag = "Sansha"}, --TEST OC solange GameOver nicht implementiert
--			PlayerGameOver	{Player = "pl_HumanAvatar"},
		},
	},
	
}

	