State
{
	StateName = "INIT",
	-- Wenn der Spieler die letzte Runde in der Arena gewonnen hat spawnt Tor
	OnFigureSpawnOnlyWhenEvent
	{
		X = 570,
		Y = 344, 
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_HalicosWaitForBattlemasterOutcryBeforeSpawn", Seconds = 5},
		},
		Actions =
		{
		},
	},
	
	-- erst nach outcry aggro schalten ...
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_HalicosWaitForBattlemasterOutcryBeforeSpawn", Seconds = 13},
		},
		Actions = 
		{
			FigureTeamTransfer {Tag = "default", Team = "tm_PitFighter"},
			FigureAbilityAdd {AbilityId = Ability.Immortal}
		},
	},
	
	-- Wenn Tor auf 10% Health, dann wird er wieder friedlcih und schaltet seinen Dialog an
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 15}
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P309_FightHalicosWon"},
			FigureTeamTransfer {Team = "tm_Neutral"},
			FigureHateClear	{},
			FigureStop{},
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
			
			-- weil der Avatar sonst munter weiterkämpft ...
			FigureStop	{Tag = "pl_HumanAvatar"},
			-- und die Helden?
			FigureStop	{Tag = "pl_HumanHeroBor"},
			FigureStop	{Tag = "pl_HumanHeroLya"},
			FigureStop	{Tag = "pl_HumanHeroShae"},
			FigureStop	{Tag = "pl_HumanHeroJared"},
			FigureStop	{Tag = "pl_HumanHeroMordecay"},
			FigureStop	{Tag = "pl_HumanNightSong"},
			FigureStop	{Tag = "pl_HumanKor"},		
		},
	},
	-- Hugh ich habe gesprochen, also kann der Dialog wieder aus
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarFlagIsTrue {Name = "af_P309_TorHalicosIsOnWestguard"},
				AvatarFlagIsTrue {Name = "af_P309_TorHalicosStaysOnGateOfSwords"},
			},
		},
		Actions =
		{
			DialogSetDisabled {},
			FigureWalk	{X = 555, Y = 406},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P300_TorHalicosOnWestguardArrived"}
		},
		Actions =
		{
			FigureVanish {Tag = "TorHalicos"},
		},
	},
}