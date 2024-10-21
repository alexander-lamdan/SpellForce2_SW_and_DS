State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		-- gleich zu Beginn der Karte wird die 1. Cutscene gestartet
		Conditions =
		{
		},
		Actions =
		{
			-- Hero-Dialog-Dummy-Figuren löschen, die sind nur da damit die Tags bei UI "angemeldet" werden
			FigureVanish	{Tag = "HeroCaine"},
			FigureVanish	{Tag = "HeroYasha"},
			
			MapFlagSetTrue {Name = "mf_CS01Start"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Urgi", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWind", TargetTag = "Urgi", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWisper", TargetTag = "Urgi", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroCaine", TargetTag = "Urgi", Range = 10},
			},
		},
		Actions =
		{
			FigureOutcry{TextTag = "DiscoveredUrgi", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue{Name = "mf_UrgiDiscovered"},
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "Urgi", Range = 10, Height = default},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiToldThatHesFrozen"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureOutcry{TextTag = "WindsHint", Tag = "pl_HumanHeroWind"},
		},
	},
	
	-- Krypterius-Outcry
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_CryptosAppeared", Value = 10},
		},
		Actions =
		{
			FigureOutcry{TextTag = "UnholyAppetite01", Tag = "Crypto09"},
		},
	},
	
	
	
	
	---------------------------------------- TEIL 2 ----------------------------------------------
	
	OnOneTimeEvent
	{
		-- Begrüßungsoutcries, wenn der Spieler von der Zitadelle Pt. 1 wieder
		-- auf die City Ship zurückkehrt
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SecondArrival"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "FirstReturn01", Tag = "Urgi"},
			FigureOutcry{TextTag = "FirstReturn02", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FirstReturn03", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FirstReturn04", Tag = "Urgi"},
			FigureOutcry{TextTag = "FirstReturn05", Tag = "Urgi"},
			FigureOutcry{TextTag = "FirstReturn06", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FirstReturn07", Tag = "Urgi"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "LibraryQuestmarker", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroCaine", TargetTag = "LibraryQuestmarker", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWhisper", TargetTag = "LibraryQuestmarker", Range = 10},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWind", TargetTag = "LibraryQuestmarker", Range = 10},
				
			},
			AvatarIsNotTalking{},
			GameInterfaceIsVisible{},
		},
		Actions =
		{	
			MapFlagSetTrue {Name = "mf_CS02Start"},
			MapFlagSetTrue {Name = "mf_TraumaghostAppeared"},
			--MapTimerStart{Name = "mt_EvilThoughtsAppear"},
			GateSetOpen	{Tag = "Door04" },
		},
	},
	
	-- Warningsoutcry, wenn man sich dem Gedankensturm zu weit nähert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
			FigureIsAlive{Tag = "MindEntity"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MindEntity", Range = 25},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MindEntity", Range = 25},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MindEntity", Range = 25},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MindEntity", Range = 25},
			},
		},
		Actions =
		{
			FigureOutcryImmediate	{TextTag = "UrgisWarning", Tag = "Urgi"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual {Name = "mv_GhostsReachedMindEntity", Value = 15},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_EvilThoughtsGoneAndUrgiInfo"},
			FigureOutcry{TextTag = "MindEntityInfo01", Tag = "Urgi"},
		},
	},
	
	
	---------------------------------------- TEIL 3 ----------------------------------------------
	
	OnOneTimeEvent
	{
		-- Begrüßungsoutcries, wenn der Spieler von der Zitadelle Pt. 2 wieder
		-- auf die City Ship zurückkehrt und zur Refugium fährt
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ThirdArrival"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "SecondReturn01", Tag = "Urgi"},
			FigureOutcry{TextTag = "SecondReturn02", Tag = "pl_HumanHeroWind"},
		},
	},
	
	
	---------------------------------------- TEIL 4 ----------------------------------------------
	
	OnOneTimeEvent
	{
		-- Cutscene startet beim vierten Betreten der City Ship
		-- alte Geister werden despawnt
		-- Geweihte & Beasts & Sadok erscheinen
		
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_FourthArrival"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS03Start"},
			MapFlagSetTrue{Name = "mf_KillAllCreeps"},
			MapFlagSetTrue{Name = "mf_SpawnBlessed"},
			GateSetOpen	{Tag = "Door07"},
			GateSetOpen	{Tag = "Gate07"},
			
			-- zur Sicherheit startet ein Timer, um sicherzustellen
			-- dass die Kill-Abfrage im folgenden Event schon true wird, bevor die
			-- Einheiten überhaupt gespawnt sind
			MapTimerStart{Name = "mt_SpawnSecurityTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SpawnBlessed"},
			MapTimerIsElapsed{Name = "mt_SpawnSecurityTimer", Seconds = 5},
			FigureIsDead	{Tag = "Sadok"},
			FigureIsDead	{Tag = "Blessed01"},
			FigureIsDead	{Tag = "Blessed02"},
			FigureIsDead	{Tag = "Blessed03"},
			FigureIsDead	{Tag = "Blessed04"},
			FigureIsDead	{Tag = "Blessed05"},
			FigureIsDead	{Tag = "Blessed06"},
			FigureIsDead	{Tag = "Blessed07"},
			FigureIsDead	{Tag = "Blessed08"},
			FigureIsDead	{Tag = "Blessed09"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_UrgiFree"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SpawnBlessed"},
			MapTimerIsElapsed{Name = "mt_SpawnSecurityTimer", Seconds = 5},
			FigureIsDead	{Tag = "Blessed11"},
			FigureIsDead	{Tag = "Blessed12"},
			FigureIsDead	{Tag = "Blessed13"},
			FigureIsDead	{Tag = "Blessed14"},
			FigureIsDead	{Tag = "Blessed15"},
			FigureIsDead	{Tag = "Blessed16"},
			FigureIsDead	{Tag = "Blessed17"},
			FigureIsDead	{Tag = "Blessed18"},
			FigureIsDead	{Tag = "Blessed19"},
			FigureIsDead	{Tag = "Blessed20"},
			FigureIsDead	{Tag = "Blessed21"},
			FigureIsDead	{Tag = "Blessed22"},
			FigureIsDead	{Tag = "Blessed23"},
			FigureIsDead	{Tag = "Blessed24"},
			FigureIsDead	{Tag = "Blessed25"},
			FigureIsDead	{Tag = "Blessed26"},
			FigureIsDead	{Tag = "Blessed27"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_BlessedKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanHeroWind", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanHeroWhisper", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanHeroCaine", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanNightsong", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanHeroYasha", X = 374.813, Y = 254.527},
			FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 374.813, Y = 254.527},
			 
			-- Spinnen
			FigureTeleport	{Tag = "MechSpider01", X = 432.203, Y = 368.538},
			FigureTeleport	{Tag = "MechSpider02", X = 442.984, Y = 370.025},
			FigureTeleport	{Tag = "MechSpider03", X = 439.694, Y = 374.043},
			FigureTeleport	{Tag = "MechSpider04", X = 436.171, Y = 377.12},
			FigureTeleport	{Tag = "MechSpider05", X = 443.625, Y = 382.041},
		},
	},

	----------------------------------------------------------------------------------------
	---- XP für Boss-Kills Pt. 1 -----------------------------------------------------------
	----------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		-- Goldspinne
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CrafterSpiderAppeared"},
			FigureIsDead{Tag = "CrafterSpider"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledGoldSpider"},
		},
	},
	
	OnOneTimeEvent
	{
		-- LibraryGhost
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_LibraryGhostAppeared", Value = 6},
			FigureIsDead{Tag = "LibraryGhost06"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledLibraryGhost"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Krypterius
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_CryptosAppeared", Value = 10},
			FigureIsDead{Tag = "Crypto09"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledKrypterius"},
		},
	},
	
	
	
	OnOneTimeEvent
	{
		-- wenn Puzzlekiste zerstört wurde, XP vergeben
		Conditions =
		{
			EntityIsNotExisting	{Tag = "PuzzleChest"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_TrickyChestOpened"},
		},
	},
	
	
	----------------------------------------------------------------------------------------
	---- XP für Boss-Kills Pt. 4 -----------------------------------------------------------
	----------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		-- Folterork Sadok
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SpawnedSadok"},
			FigureIsDead{Tag = "Sadok"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledSadok"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Blessed01
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_BlessedCounting", Value = 25},
			FigureIsDead{Tag = "Blessed26"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessedA"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Blessed02
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_BlessedCounting", Value = 25},
			FigureIsDead{Tag = "Blessed14"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessedB"},
		},
	},
	
	
	
}
