------------------------------------------------------------------------
--
--	Wie früher N 0, Handling von Vars, die für mehrere Entities gelten etc
--
--	Steel Shore
--
----------------------------------------------------------------------------

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		GotoState = "ToTheFortress",
		Conditions =
		{
		},
		Actions =
		{
			-- "Richtige" Solver, die auch in der Campagne drin bleiben
			QuestSetSolved {Quest = "TravelThroughtPortalToSteelShore"},
			QuestSetSolved {Quest = "CrystalForestPart2TheLab"},
			QuestSetSolved {Quest = "1_5_KapitelAkt3"},
			
			QuestSetActive {Quest = "2_KapitelAkt3"},
			QuestSetActive {Quest = "SteelShorePart1MalacaysFortress"},
			
			
			--FogOfWarRevealAtEntity {Tag = "Fortress", Range = 10, Height = 130},
			PlayerTravelDisable {},
		},
	},
}

--Festungspart
State
{
	StateName = "ToTheFortress",
	
	OnOneTimeEvent
    {
    	GotoState = "InTheFortress",
    	Conditions =
    	{
    	
    		QuestIsActive {Quest = "SteelShorePart1MalacaysFortress"},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "SteelShorePart1MalacaysFortress"},
    		QuestSetActive {Quest = "SteelShorePart2Endgame"},
    		QuestSetActive {Quest = "FollowMalacayToSwamp"},
    	},
    },
   
}

-- Im der Festung
State
{
	StateName = "InTheFortress",
	-- Spieler öffnet das erste Tor
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Watcher"},
			FigureIsDead {Tag = "PatrolMalar1"},
			FigureIsDead {Tag = "PatrolMalar2"},
		},
		Actions =
		{
			GateSetOpen {Tag = "Gate1"},
			MapFlagSetTrue {Name = "mf_P320_FirstFortressBossIsDead"},
		}
	},
	-- Spieler kommt zum Pentagramm
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsInRange	{Range = 5, X = 561, Y = 36,  Tag = "pl_HumanAvatar"},
    	},
    	
    	Actions =
    	{
    		FigureOutcry {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
    		FigureOutcry {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "FollowMalacayToSwamp"},
    		MapFlagIsTrue {Name = "mf_P319_SorvinaInSecondPentagram"},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "FollowMalacayToSwamp"},
    		QuestSetActive {Quest = "DefeatMalacay"},
    		QuestSetActive {Quest = "DeactivateFirewalls"},
    	}
    },
    -- Spieler& Helden wird in den ENdkampf teleportiert
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanAvatar", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanAvatar", X = 177, Y = 613},
    		MapFlagSetTrue {Name = "mf_P319_AvatarInEndFightArena"},
    		QuestSetSolved {Quest = "DeactivateFirewalls"},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanHeroShae", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanHeroShae", X = 177, Y = 611},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanHeroJared", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanHeroJared", X = 179, Y = 611},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanHeroMordecay", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanHeroMOrdecay", X = 179, Y = 613},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanHeroLya", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanHeroLya", X = 175, Y = 611},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanHeroBor", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanHeroBor", X = 177, Y = 609},
    	}
    },
    OnOneTimeEvent 
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
    		FigureIsInRange {Tag = "pl_HumanNightSong", X = 177, Y = 518, Range = 3},
    	},
    	Actions =
    	{
    		FigureTeleport {Tag = "pl_HumanNightSong", X = 175, Y = 609},
    	}
    },
    -- Game Over Nachricht
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P320_ItsDone"}
    	},
    	Actions =
    	{
    		TutorialInfoTextShow {TextTag = "GameOver1"},
    		TutorialInfoTextShow {TextTag = "GameOver2"},
    	},
    },
}
