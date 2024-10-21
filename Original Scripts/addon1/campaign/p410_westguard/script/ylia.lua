State
{	
	StateName = "Spawn",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Actors_CS_02_Spawn"},
		},
		Actions = 
		{
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EndDwarvesAndElvesCS"},
		},
		Actions = 
		{
			FigureRun	{X = 509, Y = 288},
		},
		GotoState = "INIT",
	};
};

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		EventName = "YliaDialogEnable",
		Conditions = 
		{
			QuestIsActive	{Quest = "MistyCoastSpeakToYliaAfterHalicos"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
	};
	
	-- Ylia jetzt auf der Misty Coast
	OnOneTimeEvent
	{
		EventName = "YliaIsOnMistyCoast",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P411_YliaHasMovedToMistyCoast"},
		},
		Actions = 
		{
			FigureVanish	{},
		},
	};

	-- Ylia ist wieder zurück auf der Westwehr
	OnFigureRespawnEvent
	{
		X = 509, Y = 288, WaitTime = 0,
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P411_YliaHasMovedToMistyCoast"},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = true,
	};


	-- Ylia hat nix mehr zu tun
	OnEvent
	{
		EventName = "YliaDone",
		Conditions = 
		{
			QuestIsSolved	{Quest = "MistyCoastTidalLords"},
		},
		Actions = 
		{
		},
		GotoState = "ENDE",
	};
};

State
{
	StateName = "ENDE",
};
