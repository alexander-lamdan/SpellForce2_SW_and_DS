Cutscene_Darkelves_Goto_X = 526
Cutscene_Darkelves_Goto_Y = 74

Cutscene_Skeletons_Goto_X = 578
Cutscene_Skeletons_Goto_Y = 129

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",
	-- hiermit wird die Intro Cutscene gestartet, Flag muss ein
	-- wegen der Schattenlied-Tante die übergeben wird
	OnOneTimeEvent 	
	{
		Conditions =
		{
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P302_Cutscene_Intro"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P301_CampaignStarted"},
		},
		Actions = 
		{
			QuestSetSolved  {Quest = "IronFieldsPart3ToNorimar"},
			QuestSetActive  {Quest = "NorimarMainPart1ToCastle"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Arrival",
		
		Actions = 
		{
			
			MapValueSet		{Name = "mv_AGWP1", Value = 0},
			
			MapFlagSetFalse {Name = "mf_FirstFlameLit"},
			MapFlagSetFalse {Name = "mf_SecondFlameLit"},
			MapFlagSetFalse {Name = "mf_ThirdFlameLit"},
			MapFlagSetFalse {Name = "mf_FourthFlameLit"},
			
			MapFlagSetFalse {Name = "mf_GotoStateLMF"},
			MapFlagSetFalse {Name = "mf_AvaAtCastle"},
			MapFlagSetFalse {Name = "mf_StartDarkElfAttack"},
			MapFlagSetFalse {Name = "mf_SpawnAdvanceGuard"},
			MapFlagSetFalse {Name = "mf_AdvanceGuardGo"},
			MapFlagSetFalse {Name = "mf_DarkElfArmyReachedWP1"},
			MapFlagSetFalse {Name = "mf_DarkElfArmyStartedMarching"},					
			
			MapFlagSetFalse {Name = "mf_UndeadCamp01Destroyed"},
			MapFlagSetFalse {Name = "mf_UndeadCamp02Destroyed"},
			MapFlagSetFalse {Name = "mf_UndeadCamp03Destroyed"},
			MapFlagSetFalse {Name = "mf_UndeadCamp04Destroyed"},

			MapFlagSetFalse	{Name = "mf_LetterQuestDeclined"},
			MapFlagSetFalse	{Name = "mf_ActivateLetterQuest"},                 

			FogOfWarReveal	{X = 488, Y = 573, Range = 25, Height = default},
			FogOfWarTeamAdd	{Team = "tm_HumanTeam"},
			
			PortalDisable	{Tag = "NorimarSued"},
			PortalDisable	{Tag = "NorimarWest"},
		},
		
		Conditions = 
		{
		},
		
	},
	
	
};



State
{
	StateName = "Arrival",
	

		
	-- FigureOutcry von pl_HumanNightSong bei erstem Untoten auf der Map
	
	
	
	OnOneTimeEvent
    {
    	
    	Conditions = 
    	{	OR
    		{
    			FigureIsInEntityRange	{Range = 25, TargetTag = "FirstUndead", Tag = "pl_HumanAvatar"},
    			FigureIsInEntityRange	{Range = 25, TargetTag = "FirstUndead", Tag = "pl_HumanNightSong"},
    			FigureIsInEntityRange	{Range = 25, TargetTag = "FirstUndead", Tag = "pl_HumanHeroBor"},
    			FigureIsInEntityRange	{Range = 25, TargetTag = "FirstUndead", Tag = "pl_HumanHeroLya"},
    		},
   			FigureIsAlive			{Tag = "pl_HumanNightSong"},
    	 },
    	Actions = 
    	{
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound1"},
    	},
    },
    
    -- FigureOutcry von pl_HumanNightSong nach töten von erstem Untoten
	
	OnOneTimeEvent
    {
    	
    	Conditions = 
    	{	
    		FigureIsDead	{Tag = "FirstUndead"},
			FigureIsAlive			{Tag = "pl_HumanNightSong"},
    	 },
    	Actions = 
    	{
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound2"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "UndeadFound3"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "UndeadFound4"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound5"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound6"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound7"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound8"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "UndeadFound9"},
			
    	},
    },
    
    -- Erste Untotenpatrouille
    
    OnOneTimeEvent
    {
    	
    	Conditions = 
    	{	OR
    		{
    			FigureIsInEntityRange	{Range = 10, TargetTag = "PatrolTrigger", Tag = "pl_HumanAvatar"},
    			FigureIsInEntityRange	{Range = 10, TargetTag = "PatrolTrigger", Tag = "pl_HumanNightSong"},
    			FigureIsInEntityRange	{Range = 10, TargetTag = "PatrolTrigger", Tag = "pl_HumanHeroBor"},
    			FigureIsInEntityRange	{Range = 10, TargetTag = "PatrolTrigger", Tag = "pl_HumanHeroLya"},
    		},
    	 },
    	Actions = 
    	{
			FigureRun	{Tag = "Patrol01Undead01", X = 438, Y = 79},
			FigureRun	{Tag = "Patrol01Undead02", X = 438, Y = 77},
			FigureRun	{Tag = "Patrol01Undead03", X = 438, Y = 76},
			FigureRun	{Tag = "Patrol01Undead04", X = 438, Y = 75},
			FigureRun	{Tag = "Patrol01Undead05", X = 438, Y = 73},
			FigureRun	{Tag = "Patrol01Undead06", X = 438, Y = 72},
    	},
    },
    

	OnOneTimeEvent
	{
		
		GotoState = "LightMyFire",
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_GotoStateLMF"},
		},
		Actions =
		{
		},
		
		
	},

   
};





State
{
	
	StateName = "LightMyFire",
	
	

	-- Weil die QA es so will:
	-- Sollte der Spieler nicht mit Rottgar sprechen und einen Adepten töten
	-- wird NorimarWachfeuerRest^automatisch aktiv gesetzt 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Quest = "NorimarWachfeuerRest"},
			OR
			{
				FigureIsDead	{Tag = "Adept2"},
				FigureIsDead	{Tag = "Adept3"},
				FigureIsDead	{Tag = "Adept4"},
				
			},
		},
		Actions =
		{
			QuestSetActive {Quest = "NorimarWachfeuerRest"},
			QuestSetActive {Quest = "NorimarWachfeuerRest2"},
			QuestSetActive {Quest = "NorimarWachfeuerRest3"},
						
			FogOfWarRevealAtEntity {Tag = "HolyFlame2", Range = 15, Height = default},
			FogOfWarRevealAtEntity {Tag = "HolyFlame3", Range = 15, Height = default},
			FogOfWarRevealAtEntity {Tag = "HolyFlame4", Range = 15, Height = default},
		},
		
	},

			



	
	-- Erster Adept ist tot - Erstes Feuer kann entzündet werden
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Adept1"},
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			-- eigentlich muss das in einem eigenen Event stehen das ausgelöst wird, sobald die Flamme entzündet wurde
			MapFlagSetTrue	 {Name = "mf_FirstFlameLit" },  
			FigureOutcry	 {Tag  = "Rottgar", TextTag = "Rottgar1"},
			MapValueAdd		 {Name = "mv_FiresLit", Value = 1},
		},
		
	},
	
	
	
	-- Die Quest "Das erste Wachfeuer" wird normalerweise gelöst, wenn der Spieler nach entzünden 
	-- des ersten Feuers zu Rottgar zurückkehrt. Es muss aber auch gelöst werden, wenn alle vier 
	-- Feuer brennen und der Spieler nicht bei Rottgar war
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual		 {Name = "mv_FiresLit", Value = 4},
			QuestIsNotSolved	 {Player = "pl_Human", Quest = "Wachfeuer1"},
		},
		Actions = 
		{
			QuestSetSolved		 {Player = "pl_Human", Quest = "Wachfeuer1"},
		},
		
	},
	
	
	
	
	
	
	
	-- Zweiter Adept ist tot - Zweites Feuer kann entzündet werden
		
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "NorimarWachfeuerRest"},
			FigureIsDead	{Tag = "Adept2"},		
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			-- eigentlich muss das in einem eigenen Event stehen das ausgelöst wird, sobald die Flamme entzündet wurde
			MapFlagSetTrue	 {Name = "mf_SecondFlameLit" },  
			MapValueAdd		 {Name = "mv_FiresLit", Value = 1},
			QuestSetSolved   {Quest = "NorimarWachfeuerRest"},
		},
		
	},
	
	
	-- Dritter Adept ist tot - Drittes Feuer kann entzündet werden
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "NorimarWachfeuerRest2"},
			FigureIsDead	{Tag = "Adept3"},		
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_ThirdFlameLit" },  
			MapValueAdd		 {Name = "mv_FiresLit", Value = 1},
			QuestSetSolved   {Quest = "NorimarWachfeuerRest2"},
		},
		
	},
	
	-- Vierter Adept ist tot - Viertes Feuer kann entzündet werden
	
	OnOneTimeEvent
	{
		Conditions =
		{	
			QuestIsActive {Quest = "NorimarWachfeuerRest3"},
			FigureIsDead	{Tag = "Adept4"},	
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_FourthFlameLit" },  
			MapValueAdd		 {Name = "mv_FiresLit", Value = 1},
			QuestSetSolved   {Quest = "NorimarWachfeuerRest3"},
		},
		
	},
	
	-- Outcries beim Entzünden des 2. und 3. Feuers
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapValueIsEqual {Name = "mv_FiresLit", Value = 2},
		},
		Actions = 
		{
			FigureOutcry {Tag = "GateGuard", TextTag = "Soldier1"}, 
		},
	};
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapValueIsEqual {Name = "mv_FiresLit", Value = 3},
		},
		Actions = 
		{
			FigureOutcry {Tag = "GateGuard", TextTag = "Soldier2"}, 
		},
	};
	-- Wenn alle 4 Feuer entzündet sind ist die LightMyFire Quest geschafft
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FirstFlameLit"},
			MapFlagIsTrue {Name = "mf_SecondFlameLit"},
			MapFlagIsTrue {Name = "mf_ThirdFlameLit"},
			MapFlagIsTrue {Name = "mf_FourthFlameLit"},		
		},
		Actions = 
		{
			QuestSetSolved {Player = "pl_Human", Quest = "Wachfeuer1"},
			QuestSetSolved {Player = "pl_Human", Quest = "NorimarWachfeuerRest"},
		},
		
	},
	
	
	
	-- Outcry der Torwachen, wenn man alle Feuer entzündet hat
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsSolved {Quest = "NorimarWachfeuerRest"},
			QuestIsSolved {Quest = "NorimarWachfeuerRest2"},
			QuestIsSolved {Quest = "NorimarWachfeuerRest3"},
		},
		Actions = 
		{
			FigureOutcry {Tag = "GateGuard", TextTag = "Soldier3"}, 
			FigureOutcry {Tag = "Ortbrand", TextTag = "Ortbrand1"}, 
			GateSetOpen	 {Tag = "FalconGateEast"},
			MapFlagSetTrue {Name = "mf_AvaAtCastle"},
		},
	};


	
	
	
	
	OnOneTimeEvent
	{
		GotoState = "AtTheCastle",
		
		Conditions = 
		{            
			MapFlagIsTrue {Name = "mf_AvaAtCastle"},
		},           
		
		Actions = 
		{	
		},
		
	},

};


State
{
	StateName = "AtTheCastle",
	
	-- NightSong und Avatar unterhalten sich über Drachenblut	

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead			{Tag = "WolfPack03Wolf01"},
			FigureIsDead			{Tag = "WolfPack03Wolf02"},
			FigureIsDead			{Tag = "WolfPack03Wolf03"},
			FigureIsDead			{Tag = "WolfPack03Wolf04"},
			FigureIsDead			{Tag = "WolfPack03Wolf05"},
			
			FigureIsAlive			{Tag = "pl_HumanAvatar"},
			FigureIsAlive			{Tag = "pl_HumanNightSong"},
		},
		Actions = 
		{	
			FigureOutcry		{Tag = "pl_HumanNightSong", TextTag = "DragonBlood1"},
			FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "DragonBlood2"},
			FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "DragonBlood3"},
			FigureOutcry		{Tag = "pl_HumanNightSong", TextTag = "DragonBlood4"},
			FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "DragonBlood5"},
		},
	};


	
	-- Ab jetzt muss der Spieler den Dunkelelfenangriff zurückschlagen, sobald er das geschafft hat
	-- kehrt er zu Ortbrandt zurück und bekommt das Kommando über einen Aussenposten und Falkmar übergeben
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnAdvanceGuard"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_AdvanceGuardDelay"},
			QuestSetSolved 	{Quest = "NorimarMainPart1ToCastle"},
			FogOfWarReveal	{FogOfWarId = default, X = 435, Y = 575, Range = 45, Height = 7},
			
			
			FigureVanish  {Tag = "RotGuy1"},
			FigureVanish  {Tag = "RotGuy2"},
			FigureVanish  {Tag = "RotGuy3"},
			FigureVanish  {Tag = "RotGuy4"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_AdvanceGuardDelay", Seconds = 20},
		},
		Actions = 
		{
			PlayerKitTransfer	{PlayerKit = "pk_PactSpawn", Player = "pl_Pact"},       
			MapFlagSetTrue {Name = "mf_AdvanceGuardGo"}	                            
		},
	},

	OnOneTimeEvent
	{
		
		Conditions = 
		{
			QuestIsActive 			{Quest = "NorimarMainPart5Escort"},
			OR
			{
				AND
				{
					FigureIsInEntityRange	{Tag = "HumanHeadquarter", TargetTag = "pl_HumanAvatar", Range = 20},
					FigureIsInEntityRange	{Tag = "HumanHeadquarter", TargetTag = "Falkmar", Range = 20},
				},
				FigureTeamIsInRange	{Team = "tm_HumanTeam", X = 350, Y = 484, Range = 7},
			},
		},
		Actions = 
		{
			PlayerKitTransfer {Player = "pl_Human", PlayerKit = "pk_HumanBase"},
	
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = 200},
			PlayerResourceStoneGive		{Player = "pl_Human", Amount = 200},
			PlayerResourceLenyaGive		{Player = "pl_Human", Amount = 1500},
			
			FigureOutcry	{Tag = "Falkmar", TextTag = "Falkmar1"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "Nightsong5"},
			FigureOutcry	{Tag = "pl_HumanNightSong", TextTag = "Nightsong6"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "Falkmar2"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar6"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar7"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "Falkmar3"},        
			QuestSetSolved  {Quest = "TakeControlRTS"},       
			QuestSetActive	{Quest = "FalkmarMustLive"},     
			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 9},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 11},
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 119},	-- Burg
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 115},	-- Schmelze
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 116},	-- Steinbruch
			
			FigureTeamTransfer  {Tag = "Horse1", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse2", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse3", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse4", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse5", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse6", Team = "tm_HumanTeam"},
			FigureTeamTransfer  {Tag = "Horse7", Team = "tm_HumanTeam"},
			
			MapTimerStart       {Name = "mt_KonvoiGoTimer"},
			
			MapFlagSetTrue		{Name = "mf_RTSPartStart"},
		
		},
	},
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureOutcry		{Tag  = "Falkmar", TextTag = "Convoy3"},
			MapFlagSetTrue		{Name = "mf_KonvoiGo"},
		},
		Conditions =
		{
				MapTimerIsElapsed	{Name = "mt_KonvoiGoTimer", Seconds = 420}
		},
	},


	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRange {Tag = "pl_HumanAvatar", X = 330, Y = 500, Range = 10},
				FigureIsInRange {Tag = "pl_HumanNightSong", X = 330, Y = 500, Range = 10},
			},
		},
		Actions = 
		{
		},
	},
	
	
	
	-- Undead Camp 1
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Adept5"},
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_FifthFlameLit" },  
			
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmount	{Player = "pl_UndeadCamp1", Amount = 1},
			BuildingIsDead				{Tag    = "Mausoleum1"},
			BuildingIsDead				{Tag    = "Camp1Tower1"},
			BuildingIsDead				{Tag    = "Camp1Tower2"},
		},
		Actions = 
		{
			MapFlagSetTrue 	{Name = "mf_UndeadCamp01Destroyed"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "Convoy2"},
		},
	};


	
	
	
	
	-- Undead Camp 2	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Adept6"},	
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_SixthFlameLit" },  
			
		},
		
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmount	{Player = "pl_UndeadCamp2", Amount = 1},
			BuildingIsDead				{Tag    = "Mausoleum2"},
			BuildingIsDead				{Tag    = "Camp2Tower1"},
			BuildingIsDead				{Tag    = "Camp2Tower2"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_UndeadCamp02Destroyed"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "Convoy2"},
		},
	};

	
	
	-- Undead Camp 3	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Adept7"},		
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_SeventhFlameLit" },  
			
		},
		
	},
		OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmount	{Player = "pl_UndeadCamp3", Amount = 1},
			BuildingIsDead				{Tag    = "Mausoleum3"},
			BuildingIsDead				{Tag    = "Camp3Tower1"},
			BuildingIsDead				{Tag    = "Camp3Tower2"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_UndeadCamp03Destroyed"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "Convoy2"},
		},
	};


	-- Undead Camp 4
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Adept8"},		
		},
		Actions = 
		{
			-- hier wird auch das Feuer entzündet 
			MapFlagSetTrue	 {Name = "mf_EigthFlameLit" },  
			
		},
		
	},
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmount	{Player = "pl_UndeadCamp4", Amount = 1},
			BuildingIsDead				{Tag    = "Mausoleum4"},
			BuildingIsDead				{Tag    = "Camp4Tower1"},
			BuildingIsDead				{Tag    = "Camp4Tower2"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_UndeadCamp04Destroyed"},
		},
	};

	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureTeamIsInRange {Team = "tm_HumanTeam", X = 143, Y = 480,Range = 7},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_RunnerDelay"},
			FigureNpcSpawn	{Tag = "RunnerUndead1", Level = 2, UnitId = 82, X = 158, Y = 470, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "RunnerUndead2", Level = 2, UnitId = 82, X = 160, Y = 470, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "RunnerUndead3", Level = 2, UnitId = 82, X = 162, Y = 471, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "RunnerUndead4", Level = 2, UnitId = 82, X = 165, Y = 472, Team = "tm_BadGuys"},
			MapFlagSetTrue	{Name = "mf_RunnersSpawned"},
		},

	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			MapTimerIsElapsed {Name = "mt_RunnerDelay", Seconds = 1},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "RunnerUndead1", TextTag = "UndeadFlee1"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "UndeadFlee2"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "UndeadFlee3"},
			MinimapAlertSetToEntity	{Tag = "RunnerUndead2", Type = 2},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{	
			MapTimerIsElapsed {Name = "mt_RunnerDelay", Seconds = 6},
		},
		Actions = 
		{
			FigureForcedRunToEntity {Tag = "RunnerUndead1", TargetTag = "Thur"},
			FigureForcedRunToEntity {Tag = "RunnerUndead2", TargetTag = "Thur"},
			FigureForcedRunToEntity {Tag = "RunnerUndead3", TargetTag = "Thur"},
			FigureForcedRunToEntity {Tag = "RunnerUndead4", TargetTag = "Thur"},
		},
	},



	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange {Tag = "RunnerUndead1", TargetTag = "Thur", Range = 7},
				FigureIsInEntityRange {Tag = "RunnerUndead2", TargetTag = "Thur", Range = 7},
				FigureIsInEntityRange {Tag = "RunnerUndead3", TargetTag = "Thur", Range = 7},
				FigureIsInEntityRange {Tag = "RunnerUndead4", TargetTag = "Thur", Range = 7},
			},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_RunnersReachedNecro"},
		},
	
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			MapFlagIsTrue	{Name = "mf_RunnersSpawned"},
			OR
			{
				MapFlagIsTrue	{Name = "mf_RunnersReachedNecro"},		
				AND
				{
					FigureIsDead	  {Tag = "RunnerUndead1"},
					FigureIsDead	  {Tag = "RunnerUndead2"},
					FigureIsDead	  {Tag = "RunnerUndead3"},
					FigureIsDead	  {Tag = "RunnerUndead4"},
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Falkmar", TextTag = "UndeadFlee4"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "UndeadFlee5"},
			FigureOutcry	{Tag = "Falkmar", TextTag = "UndeadFlee6"},
			QuestSetActive	{Quest = "CloseCrypt"},     
		},                                           
	},
	
	
	
	-- GuardKonvoi Quest wird auf Solved gesetzt, sobald alle Pferde am Tor angekommen sind
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreater	{Name = "mv_HorsesAtGate", Value = 5},	
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "GuardKonvoi"},
			PortalEnable	{Tag   = "NorimarSued"},
			PortalEnable	{Tag   = "NorimarWest"},
		},
	}, 
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual {Name = "mv_HorsesAtGate", Value = 8},	
		},
		Actions = 
		{
			MapFlagSetTrue		{Name = "mf_AllHorsesAlive"}
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "CloseCrypt"},
    		AvatarIsNotTalking	{},	
			MapFlagIsTrue {Name = "mf_NecroIsBuddy"},
		},
		Actions = 
		{

			FigureOutcry {Tag = "Falkmar", TextTag = "Falkmar5b",},
			FigureOutcry {Tag = "pl_HumanNightSong", TextTag = "Nightsong8b",},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Avatar8b",},
			FigureOutcry {Tag = "Falkmar", TextTag = "Falkmar6b",},
			FigureOutcry {Tag = "Falkmar", TextTag = "Falkmar7b",},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_ThurKilled"},
			QuestIsSolved {Quest = "CloseCrypt"},
    		AvatarIsNotTalking	{},	
		},
		Actions = 
		{
			FigureOutcry {Tag = "Falkmar", TextTag = "Falkmar5a"  },
		},
	},

	
};




