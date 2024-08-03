------------------------------------------------------------------------
--
--	Plattformscript P313 Crater
--
----------------------------------------------------------------------------

EntryX = 170.552
EntryY = 154.82
-- Die Koordinaten der Mitte des Eingangs zum inneren Krater


State
{
	StateName = "Main",
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		-- gleich zu Beginn wird 1. Cutscene gestartet
    		AvatarFlagSetTrue{Name = "af_P313_Cutscene01Begin"},	
	    	-- gleich zu Beginn wird ein großer Bereich rund um den Krater aufgedeckt
    		FogOfWarReveal	{X = 167.959, Y = 274.096, Range = 55, Height = default},
    	},
    },

    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead{Tag = "Naugron"},
    	},
    	Actions =
    	{
    		EntityTimerStart {Name = "et_NaugronDeadTimer"},
    		MapFlagSetTrue{Name = "mf_NaugronStopSpawningServants"},
			FigureKill{Tag = "NaugronsServant01"},
			FigureKill{Tag = "NaugronsServant02"},
			FigureKill{Tag = "NaugronsServant03"},
			FigureKill{Tag = "NaugronsServant04"},
			FigureKill{Tag = "NaugronsServant05"},
			DialogSetEnabled	{Tag = "MindstoneCR"},
			DialogTypeSetSideQuest	{Tag = "MindstoneCR"},
    	}, -- Sobald Naugron tot ist, wird 3. Cutscene gestartet
    	-- Seine Servants sterben und respawnen danach nicht mehr
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed {Name = "et_NaugronDeadTimer", Seconds = 2.5},
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "BlackMirror", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanHeroBor", TargetTag = "BlackMirror", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanHeroLya", TargetTag = "BlackMirror", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanHeroJared", TargetTag = "BlackMirror", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanHeroShae", TargetTag = "BlackMirror", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "BlackMirror", Range = 5},
    		},
    	},
    	Actions =
    	{
    		EntityTimerStop {Name = "et_NaugronDeadTimer"},
    		AvatarFlagSetTrue{Name = "af_P313_Cutscene03Begin"},	
    	}, -- Sobald Naugron tot ist, wird 3. Cutscene gestartet
    },
    
 
 	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{  
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 12, X = EntryX, Y = EntryY},
				FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 12, X = EntryX, Y = EntryY},
				FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 12, X = EntryX, Y = EntryY},
				FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 12, X = EntryX, Y = EntryY},
				FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 12, X = EntryX, Y = EntryY},
				FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 12, X = EntryX, Y = EntryY},
			},
		},
		Actions = 
		{
			AvatarFlagSetTrue{Name = "af_P313_InsideCraterCenter"},
			MapTimerStart {Name = "mt_InfoOutcryTimer"},
			AvatarFlagSetTrue{Name = "af_P313_Cutscene02Begin"},
		}, -- sobald Spieler oder einer seiner Helden
		-- in den Range läuft, startet die Cutscene
		-- sobald der Spieler eine Zeitlang keinen Turm beschädigen konnte, kommen
		-- Malacays Outcries
		-- außerdem beginnen ab jetzt Naugrons Knochenregen-Angriffe
	},
 
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name ="mf_AnyTowerDamaged"},
    	},
    	Actions =
    	{
    		FigureOutcry{TextTag = "KeepDamaged", Tag = "Naugron"},
    	},
    },
    
    
    
    --------------------------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills  ---------------------------------
	--------------------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Naugron"},
			-- Naugron
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_NaugronKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Grozira"},
			-- Grozira
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_GroziraKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "MadWizard01"},
			MapFlagIsTrue{Name = "mf_MadWizard01Spawned"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MadWizard01Killed"},
			-- XP
			AvatarFlagSetFalse {Name = "af_P313_CraterPlattformChange"},
			-- wichtig, damit beim nächsten Plattformbetreten der nächste Wizard spawnt
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "MadWizard02"},
			MapFlagIsTrue{Name = "mf_MadWizard02Spawned"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MadWizard02Killed"},
			-- XP
			AvatarFlagSetFalse {Name = "af_P313_CraterPlattformChange"},
			-- wichtig, damit beim nächsten Plattformbetreten der nächste Wizard spawnt
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "MadWizard03"},
			MapFlagIsTrue{Name = "mf_MadWizard03Spawned"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MadWizard03Killed"},
			-- XP
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "DerEwige"},
			-- Der Ewige, auf dem kleinen Weg nördlich des Kraters
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MiniBoss02Killed"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Balthasar"},
			-- Balthasar, Nekromant
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_BalthasarKilled"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadCampK"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_UndeadCampKKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadCampJ"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_UndeadCampJKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadCampL"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_UndeadCampLKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadCampM"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_UndeadCampMKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalE"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalEKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalB"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalBKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalA"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalAKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalG"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalGKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalC"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalCKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalF"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalFKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "DemonPortalD"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_DemonPortalDKilled"},
		},
	},
	
	
	
	-----------------------------------------------------------------
	-- Rachequest
    OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillShar"},
			FigureIsDead {Tag = "Shar"},
			FigureIsDead {Tag = "Shar1"},
			FigureIsDead {Tag = "Shar2"},
			AvatarHasItemMisc {ItemId = 221, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RevengeKillShar"},
		},
	},
	-- Nur mit beiden Köpfen wird gesolved
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "RevengeKillItza"},
			QuestIsSolved {Quest = "RevengeKillShar"},
			QuestIsNotKnown {Quest = "RevengeBringHeadItza"},
			QuestIsNotKnown {Quest = "RevengeBringHeadShar"}
		},
		Actions =
		{
			QuestSetActive {Quest = "RevengeBringHeadItza"},
			QuestSetActive {Quest = "RevengeBringHeadShar"}
		}
	},
}

