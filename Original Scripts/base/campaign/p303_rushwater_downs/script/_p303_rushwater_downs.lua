------------------------------------------------------------------------
--
--	Wie früher No, Handling von Vars, die für mehrere Entities gelten etc
--
----------------------------------------------------------------------------

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Ambush",
		Conditions =
		{
		},
		Actions =
		{
			FigureHoldPosition {Tag = "Osal"},
			-- Helger unkillable, damit er auf jeden Fall bis zur Cutscene überlebt
			FigureAbilityAdd {Tag = "Helger", AbilityId = Ability.Immortal},
			PlayerTravelDisable {},
			FogOfWarTeamAdd {Team = "tm_Convoi"}
		},
	},
	
}
-- Der Konvoi gilt hier als kompletter State, damit z.B nicht für jeden State geprüft werden muss ob noch Pferde aus dem Konvoi leben

State
{
	StateName = "Ambush",
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 MapTimerStart{Name = "mt_P303_ResidentTimer"},
    		 MapTimerStart{Name = "mt_P303_MapStartTimer"},
    		 AvatarValueSet	{Name = "av_P303_ResidentCounter", Value = 1},
    		 -- Die Bogenschützen auf den Hängen sollen auf Postiton bleiben
    		 FigureHoldPosition {Tag = "Ambush31"},
    		 FigureHoldPosition {Tag = "Ambush32"},
    		 FigureHoldPosition {Tag = "Ambush33"},
    		 FigureHoldPosition {Tag = "Ambush34"},
    		 FigureHoldPosition {Tag = "Ambush35"},
    		 FigureHoldPosition {Tag = "Ambush36"},
    		 FigureHoldPosition {Tag = "Ambush37"},
    		 FigureHoldPosition {Tag = "Ambush38"},
    		 FigureHoldPosition {Tag = "Osal"},
			-- Helger unkillable, damit er auf jeden Fall bis zur Cutscene überlebt
			FigureAbilityAdd {Tag = "Helger", AbilityId = Ability.Immortal},
			PlayerTravelDisable {},
			PortalDisable {Tag = "PortalNeedle"},
			PortalDisable {Tag = "RushwaterEnd"},
			PortalDisable {Tag = "StartPortal"},
			QuestSetSolved {Quest = "NorimarMainPart5Escort"},
			QuestSetActive {Quest = "RushwaterPart1ConvoiToTown"},
			FogOfWarTeamAdd {Team = "tm_Convoi"}
    		 
    	},
    },
    OnOneTimeEvent
   	{
   		Conditions =
   		{
   			OR
   			{
   				FigureIsInRange {Tag = "Ambush31", X = 230, Y = 209, Range = 3},
   				FigureIsInRange {Tag = "Ambush32", X = 233, Y = 209, Range = 3}, 
   				FigureIsInRange {Tag = "Ambush33", X = 236, Y = 209, Range = 3},
   				FigureIsInRange {Tag = "Ambush34", X = 225, Y = 206, Range = 3},
   				FigureIsInRange {Tag = "Ambush35", X = 216, Y = 230, Range = 3},
   				FigureIsInRange {Tag = "Ambush36", X = 222, Y = 232, Range = 3},
   				FigureIsInRange {Tag = "Ambush37", X = 224, Y = 234, Range = 3},
   				FigureIsInRange {Tag = "Ambush38", X = 229, Y = 234, Range = 3},
   			},
   			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushRiver"},
   		},
   		Actions =
   		{
   			FigureOutcry	{TextTag = "Falkmar7", Tag = "Falkmar"},	
			FigureOutcry	{TextTag = "Falkmar8", Tag = "Falkmar"},
   		}
   	},
    -- Um zu verhindern, daß alle Residents zum selben Zeitpunkt loslaufen (Performanceinbruch)
    -- zählt der Counter nicht wie bisher bis 20 hoch, sondern bis 200
    -- und die Residents laufen nicht bei 1,2,3,4,5 ... 10 los
    -- sondern bei 10*x + individualsumme
    -- wobei x von 0 bis 19 geht
    -- und individualsumme 1,2,3,4,5 ... 10 sein kann
    -- d.h. ein NPC mit individualsumme == 1 läuft also bei 1,11,21,31 etc. los
    -- ein NPC mit individualsumme == 7 bei 7,17,27,37 etc.
    
    
    OnEvent
    {
    	Conditions = 
    	{	
    		MapTimerIsElapsed {Name = "mt_P303_ResidentTimer", Seconds = 5},
    		AvatarValueIsLess{Name = "av_P303_ResidentCounter", Value = 100},
    	 },
    	Actions = 
    	{
    		 AvatarValueAdd{Name = "av_P303_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_P303_ResidentTimer"},
    	},
    },
    
    
    OnEvent
    {
    	Conditions = 
    	{
    		MapTimerIsElapsed {Name = "mt_P303_ResidentTimer", Seconds = 5},
    		AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = 100},
    	 },
    	Actions = 
    	{
    		 AvatarValueSet	{Name = "av_P303_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_P303_ResidentTimer"},
    	},
    },
	
	-- Sind alle Attentäter tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "AdditionalAttack1"},
			FigureIsDead {Tag = "AdditionalAttack2"},
			FigureIsDead {Tag = "AdditionalAttack3"},
			FigureIsDead {Tag = "AdditionalAttack4"},
			FigureIsDead {Tag = "AdditionalAttack5"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_FirstAmbushDead"},
		}
	},
	-- Third Additional
	-- Sind alle Attentäter des dritten Hinterhalts tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "ThirdAdditionalAttack1"},
			FigureIsDead	{Tag = "ThirdAdditionalAttack2"},
			FigureIsDead	{Tag = "ThirdAdditionalAttack3"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
			AvatarFlagSetTrue {Name = "af_P303_ThirdAmbushDead"},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P303_FigureOutcryDelay1", Seconds = 4},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Shadowsong1", Tag = "pl_HumanNightSong"},	
			FigureOutcry {TextTag = "Falkmar6", Tag = "Falkmar"},	
			FigureOutcry {TextTag = "Shadowsong2", Tag = "pl_HumanNightSong"},	
			MapTimerStop {Name = "mt_P303_FigureOutcryDelay1"},
			MapTimerStart {Name = "mt_P303_BitchTerror"},
		}
	},
	-- Grunt ist Tot XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Grunt"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_GruntDead"},
		},
		
	},
	-- Boss vor der Stadt ist tot XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "OrcAttack12"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_CityBossDead"},
		},
	},
	-- OrcCampBoss ist tot XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "OrcCampBoss"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_OrcBossDead"},
		},
	},
	-- Skelettboss
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P303_DumbSkeletonAlive"},
			FigureIsDead {Tag = "DumbSkeleton"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_DumbSkeletonDead"},
		},
	},
	-- Ist mindestens ein Teilnehmer des Konvois an seinem ersten Ziel angekommen, wird das Flag für den zweiten State des Konvois gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange {Range = 20, X = 215, Y = 121, Tag = "Horse1"},
				FigureIsInRange {Range = 20, X = 215, Y = 121, Tag = "Horse2"},
				FigureIsInRange {Range = 20, X = 215, Y = 121, Tag = "Horse3"},
				FigureIsInRange {Range = 20, X = 215, Y = 121, Tag = "Horse4"},
				FigureIsInRange {Range = 20, X = 215, Y = 121, Tag = "Horse5"},
			}
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_ReachedRiver"},
		},
	},
	-- Barbaren tot
	OnOneTimeEvent
	{
		EventName = "JaAlleSindTot",
		Conditions =
		{
			FigureIsDead	{Tag = "SecondAdditionalAttack1"},
			FigureIsDead	{Tag = "SecondAdditionalAttack2"},
			FigureIsDead	{Tag = "SecondAdditionalAttack3"},
			FigureIsDead	{Tag = "SecondAdditionalAttack4"},
			FigureIsDead	{Tag = "SecondAdditionalAttack5"},
			FigureIsDead	{Tag = "SecondAdditionalAttack6"},
			FigureIsDead	{Tag = "SecondAdditionalAttack7"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_SecondAmbushDead"},
		}
		
	},
	-- Brückenkopfbesatzung ist tot
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Ambush11"},
			FigureIsDead	{Tag = "Ambush12"},
			FigureIsDead	{Tag = "Ambush13"},
			FigureIsDead	{Tag = "Ambush14"},
			FigureIsDead	{Tag = "Grunt"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_FourthAmbushDead"},
		}
		
	},
	-- Kurvenstars tot
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Ambush21"},
			FigureIsDead	{Tag = "Ambush22"},
			FigureIsDead	{Tag = "Ambush23"},
			FigureIsDead	{Tag = "Ambush24"},
			FigureIsDead	{Tag = "Ambush25"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_FifthhAmbushDead"},
		}
		
	},
	-- Orks an den Hängen sind tot
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Ambush31"},
			FigureIsDead	{Tag = "Ambush32"},
			FigureIsDead	{Tag = "Ambush33"},
			FigureIsDead	{Tag = "Ambush34"},
			FigureIsDead	{Tag = "Ambush35"},
			FigureIsDead	{Tag = "Ambush36"},
			FigureIsDead	{Tag = "Ambush37"},
			FigureIsDead	{Tag = "Ambush38"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_BowAmbushDead"},
			MapTimerStart {Name = "mt_P303_ConvoyCutsceneDelay"},
		}
		
	},
	-- Ist mindestens ein Teilnehmer des Konvois an seinem zweiten Ziel angekommen, wird das Flag für den zweiten State des Konvois gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				-- !!! Wenn Helden oder Avatar in Range statt Pferde
				FigureIsInRange {Range = 7, X = 199, Y = 203, Tag = "Horse1"},
				FigureIsInRange {Range = 7, X = 199, Y = 203, Tag = "Horse2"},
				FigureIsInRange {Range = 7, X = 199, Y = 203, Tag = "Horse3"},
				FigureIsInRange {Range = 7, X = 199, Y = 203, Tag = "Horse4"},
				FigureIsInRange {Range = 7, X = 199, Y = 203, Tag = "Horse5"},
				PlayerFigureIsInRange {Range = 7, X = 199, Y = 203, Player = "pl_HumanAvatar"},
			},
			FigureIsAlive {Tag = "Ambush31"},
			FigureIsAlive {Tag = "Ambush32"},
			FigureIsAlive {Tag = "Ambush33"},
			FigureIsAlive {Tag = "Ambush34"},
			FigureIsAlive {Tag = "Ambush35"},
			FigureIsAlive {Tag = "Ambush36"},
			FigureIsAlive {Tag = "Ambush37"},
			FigureIsAlive {Tag = "Ambush38"},
	
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_SecondAmbushRiver"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			-- !!! Kann man am Ende des Pferdchenskriptes ein Flag setzen, denn wenn die Pferde da sind sind auch alle vorher tot, hier ist gerade doppelt gemoppelt
			OR
			{
				FigureIsAlive {Tag = "OrcAttack1"},
				FigureIsAlive {Tag = "OrcAttack2"},
				FigureIsAlive {Tag = "OrcAttack3"},
				FigureIsAlive {Tag = "OrcAttack4"},
				FigureIsAlive {Tag = "OrcAttack5"},
				FigureIsAlive {Tag = "OrcAttack6"},
				FigureIsAlive {Tag = "OrcAttack7"},
				FigureIsAlive {Tag = "OrcAttack8"},
				FigureIsAlive {Tag = "OrcAttack9"},
				FigureIsAlive {Tag = "OrcAttack10"},
				FigureIsAlive {Tag = "OrcAttack11"},
				FigureIsAlive {Tag = "OrcAttack12"},
			},
			OR
			{
				PlayerFigureIsInRange {Player = "pl_Human", Range = 5, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Horse1", Range = 4, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Horse2", Range = 4, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Horse3", Range = 4, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Horse4", Range = 4, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Horse5", Range = 4, X = 273, Y = 231},
				FigureIsInRange	{Tag = "Falkmar", Range = 4, X = 273, Y = 231},
			},
		},
		Actions =
		{
			FigureAttackEntity  {Tag = "OrcAttack1", TargetTag = "Helger"},
			FigureAttackEntity  {Tag = "OrcAttack2", TargetTag = "CronachGuards1"},
			FigureAttackEntity  {Tag = "OrcAttack3", TargetTag = "CronachGuards2"},
			FigureAttackEntity  {Tag = "OrcAttack4", TargetTag = "CronachGuards3"},
			FigureAttackEntity  {Tag = "OrcAttack5", TargetTag = "CronachGuards3"},
			FigureAttackEntity  {Tag = "OrcAttack6", TargetTag = "Helger"},
			            
			FigureAttackEntity  {Tag = "OrcAttack7", TargetTag = "Helger"},
			FigureAttackEntity  {Tag = "OrcAttack8", TargetTag = "CronachGuards1"},
			FigureAttackEntity  {Tag = "OrcAttack9", TargetTag = "CronachGuards2"},
			FigureAttackEntity  {Tag = "OrcAttack10", TargetTag = "CronachGuards3"},
			FigureAttackEntity  {Tag = "OrcAttack11", TargetTag = "CronachGuards3"},
			FigureAttackEntity  {Tag = "OrcAttack12", TargetTag = "Helger"},
			
			FigureRun {Tag = "CronachGuards1", X = 305, Y = 245},
			FigureRun {Tag = "CronachGuards2", X = 305, Y = 244},
			FigureRun {Tag = "CronachGuards3", X = 305, Y = 243},
			FigureRun {Tag = "CronachGuards4", X = 307, Y = 245},
			FigureRun {Tag = "LyrraineCrossbowmen1", X = 305, Y = 247},
			FigureRun {Tag = "LyrraineCrossbowmen2", X = 306, Y = 247},
			AvatarFlagSetTrue {Name = "af_P303_PlayerNearCity"},
			FigureOutcry	{TextTag = "Falkmar9", Tag = "Falkmar"},	
		}   
	},      
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			PlayerFigureIsInRange {Player = "pl_Human", Range = 5, X = 296, Y = 233},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P303_PlayerNearCity"},
		}   
	},  
	--- Nch dem Angriff kommen die Outcries, erst dann die Cutscene mit Matricus
	OnOneTimeEvent
	{       
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_BowAmbushDead"},
		},  
		Actions	=
		{   
			AvatarFlagSetTrue {Name = "af_P303_Cutscene"},
		},  
	},      
	-- Versucht der Spieler an der Stadt vorbei zu laufen, ohne die Karawane nach Hause gebracht zu haben, spawnen die Karawanenkiller
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = 344, Y = 257, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 252, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 247, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 242, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 237, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 232, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 227, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 222, Range = 7},
				PlayerFigureIsInRange {X = 344, Y = 215, Range = 7},
			},
			AvatarFlagIsFalse {Name = "af_P303_Cutscene"},
		},
		Actions =
		{
			MapFlagSetTrue  {Name = "mf_P303_ConvoyKiller"}
		}
	},
	-- Ist der Konvoi im Bereich der Stadt angekommen Flag setzen für zum Cutscene starten tun
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange {Range = 5, X = 301, Y = 238, Tag = "Horse1"},
				FigureIsInRange {Range = 5, X = 301, Y = 238, Tag = "Horse2"},
				FigureIsInRange {Range = 5, X = 301, Y = 238, Tag = "Horse3"},
				FigureIsInRange {Range = 5, X = 301, Y = 238, Tag = "Horse4"},
				FigureIsInRange {Range = 5, X = 301, Y = 238, Tag = "Horse5"},
			}
		},
		Actions =
		{
			FigureOutcry {TextTag = "Guard1", Tag = "Helger"},
			AvatarFlagSetTrue {Name = "af_P303_ReachedCity"},
		},
	},
	-- Spieler hat die Stadt erreicht und alle Pferde Leben noch
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_CutsceneShown"},
			FigureIsAlive {Tag = "Horse1"},
			FigureIsAlive {Tag = "Horse2"},
			FigureIsAlive {Tag = "Horse3"},
			FigureIsAlive {Tag = "Horse4"},
			FigureIsAlive {Tag = "Horse5"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_p303_AllHorsesAlive"}
		},	
		
	},

	-- Avatar hat die Stadt erreicht - jetzt startet der Aufbaupart
	OnOneTimeEvent
	{
		GotoState = "BuildUp",
		
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_CutsceneShown"},	
		},
		Actions = 
		{
			
		},	
		
	},
	
	
	-- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintRushwater"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 686, Y = 263, Direction = 0},
			FogOfWarRevealAtEntity	{Tag = "PaintingMarker", Range = 10, Height = default},
		}
	},
	-- Bild von Rushwater malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintRushwater"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintRushwater"},
			ObjectVanish	{Tag = "PaintingMarker"},
		}
	},
	-- Alle Bilder gemalt, Rückkehrquest starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyPaintRushwater"},
			QuestIsSolved {Quest = "HouseOfGreyPaintNeedle"},
			QuestIsSolved {Quest = "HouseOfGreyPaintGF"},
			QuestIsSolved {Quest = "HouseOfGreyPaintFireforge"},
			QuestIsSolved {Quest = "HouseOfGreyPaintMagnetStones"},
			QuestIsNotKnown  {Player = "pl_Human", Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			QuestSetActive {Quest = "HouseOfGreyReturnMyra"},
			AvatarItemMiscTake {ItemId = 222, Amount = 1},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
			FigureIsDead {Tag = "Falkmar"}
		},
		Actions =
		{
			PlayerGameOver {Tag = "Falkmar_DEAD", LocaTag = "GameOverSF2FalkmarDied"},
		}
	},
}

State
{
	StateName = "BuildUp",
	
	-- Erst mal noch ein paar Outcries, damit der SPieler den Dialog Npc Matricus findet
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
		}
	},
	
	
	-- Checken ob keine Wachen, aber dafür Orks in der Nähe des Gefangenen sind, damit man ihn als Frei betrachten kann
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange	{Tag = "PrisonerAttack1", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack2", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack3", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack4", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack5", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack6", Range = 3, X = 607, Y = 123},
				FigureIsInRange	{Tag = "PrisonerAttack7", Range = 3, X = 607, Y = 123},
			},
			FigureIsNotInRange	{Tag = "PrisonerGuard1", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonerGuard2", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonerGuard3", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard1", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard2", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard3", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard4", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard5", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard6", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard7", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard8", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard9", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "PrisonGuard10", Range = 15, X = 607, Y = 123},
			FigureIsNotInRange	{Tag = "Helger", Range = 15, X = 607, Y = 123},
			PlayerFigureIsNotInRangeToEntity	{Range = 15, TargetTag = "Osal"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P303_PrisonerFreedTimer"},
			QuestSetUnsolvable {Quest = "RushwaterPart4PrisonerConnach"},
		}
	},
	-- Da man nicht weiß, welcher Angreifer überlebt, müssen alle den Outcry machen können, aber nur einer machen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsAlive {Tag = "PrisonerAttack1"}
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack1"},		
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.1},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsAlive {Tag = "PrisonerAttack2"}
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack2"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.2},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsAlive {Tag = "PrisonerAttack3"}
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack3"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.3},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsAlive {Tag = "PrisonerAttack4"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack4"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.4},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsDead {Tag = "PrisonerAttack4"},
			FigureIsAlive {Tag = "PrisonerAttack5"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack5"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.5},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsDead {Tag = "PrisonerAttack4"},
			FigureIsDead {Tag = "PrisonerAttack5"},
			FigureIsAlive {Tag = "PrisonerAttack6"}
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack6"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 2.6},
			MapFlagIsFalse {Name = "mf_PrisonerOutcryBlocker"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsDead {Tag = "PrisonerAttack4"},
			FigureIsDead {Tag = "PrisonerAttack5"},
			FigureIsDead {Tag = "PrisonerAttack6"},
			FigureIsAlive {Tag = "PrisonerAttack7"}
		},
		Actions =
		{
			FigureOutcry {TextTag = "PrisonerFree", Tag = "PrisonerAttack7"},
			FigureOutcry {TextTag = "Osal", Tag = "Osal"},
			MapFlagSetTrue {Name = "mf_PrisonerOutcryBlocker"},
			MapTimerStart {Name = "mt_P303_OsalDelay" }
		}
	},
	-- Osal hat hoffentlich den Outcry gemacht, dann kann er auch verschwinden
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P303_OsalDelay", Seconds = 8}
		},
		Actions =
		{
			FigureVanish {Tag = "Osal"},
			AvatarFlagSetTrue {Name = "af_P303_PrisonerFreed"},
			QuestSetUnsolvable {Quest = "DefendLyraine"},
		}
	},
	-- SPieler hat den Orcaufbau (fast) zerstört
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotFigureAmountEx {Player  = "pl_Player2", Amount = 5, CountWorkers = false,  CountAvatarAndHeroes = false},
			PlayerHasNotBuildingAmount {Player =  "pl_Player2", Amount = 3, OnlyCompleted = yes},

			QuestIsActive {Quest = "RushwaterPart3FightOrcs"},
			AvatarFlagIsTrue {Name = "af_P303_CastleCutsceneEnd"},
			MapTimerIsElapsed {Name = "mt_P303_Brake", Seconds = 30},
			
			PlayerBuildingIsNotInRange {X = 554, Y = 555, Range = 20, Player = "pl_Clans", BuildingId = 0},
			PlayerBuildingIsNotInRange {X = 561, Y = 581, Range = 20, Player = "pl_Clans", BuildingId = 0},
			PlayerBuildingIsNotInRange {X = 596, Y = 575, Range = 20, Player = "pl_Clans", BuildingId = 0},
			PlayerBuildingIsNotInRange {X = 593, Y = 543, Range = 20, Player = "pl_Clans", BuildingId = 0},
			PlayerFigureIsNotInRange {X = 554, Y = 555, Range = 20, Player = "pl_Clans"},
			PlayerFigureIsNotInRange {X = 561, Y = 581, Range = 20, Player = "pl_Clans"},
			PlayerFigureIsNotInRange {X = 596, Y = 575, Range = 20, Player = "pl_Clans"},
			PlayerFigureIsNotInRange {X = 593, Y = 543, Range = 20, Player = "pl_Clans"},
		},
		Actions =
		{
			-- Game Geschafft Gegner Vernichtet
			AvatarFlagSetTrue {Name = "af_P303_OrcsDestroyed"},
			QuestSetSolved {Quest = "DestroyOrcCamps"},
			QuestSetSolved {Quest = "RushwaterPart3FightOrcs"},
			QuestSetActive {Quest = "RushwaterPart5ReturnToMatricus"},
			FigureOutcry {Tag = "Matricus", TextTag = "Matricus3"},
			FigureOutcry {Tag = "Matricus", TextTag = "Matricus4"},
			DialogSetEnabled {Tag = "Matricus"},
			AIPlayerDeactivate	{Player = "pl_Clans"},
		},
	},
	-- Nur wenn der Gefangene nicht schon befreit wurde kann man ihn natürlich gesichert haben
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotUnsolvable {Quest = "DefendLyraine"},
			AvatarFlagIsTrue {Name = "af_P303_OrcsDestroyed"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DefendLyraine"},
			MapFlagSetTrue {Name = "mf_P303_PrisonerSave"}
		}
		
	},
	-- Spieler hat den Orcaufbau zerstört und alle Gefangenenangreifer sind tot
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DestroyOrcCamps"},
			QuestIsNotUnsolvable {Quest = "RushwaterPart4PrisonerConnach"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsDead {Tag = "PrisonerAttack4"},
			FigureIsDead {Tag = "PrisonerAttack5"},
			FigureIsDead {Tag = "PrisonerAttack6"},
			FigureIsDead {Tag = "PrisonerAttack7"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RushwaterPart4PrisonerConnach"},
		},
	},

	-- Portalsteinquest
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SearchPortalStone"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar14", Tag = "Falkmar"},
			FigureOutcry {TextTag = "ShadowSong9a", Tag = "pl_HumanNightSong"},
			FigureOutcry {TextTag = "ShadowSong9b", Tag = "pl_HumanNightSong"},
			PlayerBuildingTeamTransfer {Team = "tm_HumanPlayer"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SearchPortalStone"},
			AvatarHasItemMisc {Player = "default", ItemId = 102, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default}
		},
		Actions =
		{
			QuestSetSolved {Quest = "SearchPortalStone"},
			QuestSetSolved {Quest = "RushwaterPart6UndeadZone"},
			QuestSetActive {Quest = "GotoGF"},
			DialogSetDisabled {Tag = "Matricus"},
			FigureOutcry {TextTag = "ShadowSong9", Tag = "pl_HumanNightSong"},
			FogOfWarRevealAtEntity {Tag = "RushwaterEnd", Range = 7},
			PlayerTravelEnable {},
			PortalEnable {Tag = "RushwaterEnd"},
			PortalEnable {Tag = "StartPortal"},
		},
	},
	-- Der Spieler hat den Schuldschein für die Rüstungsnebenquest
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SearchNearPortalForArmor"},
			AvatarHasItemMisc {Player = "default", ItemId = 104, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default}
		},
		Actions =
		{
			QuestSetSolved {Quest = "SearchNearPortalForArmor"},
			QuestSetActive {Quest = "TalkToUndergantAboutBill"}, 
			
		}
	},
	-- Folianten Nebenquest
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetFoliosFromOrderRuins"},
			AvatarHasItemMisc {Player = "default", ItemId = 105, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
			AvatarHasItemMisc {Player = "default", ItemId = 106, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
			AvatarHasItemMisc {Player = "default", ItemId = 107, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
			AvatarHasItemMisc {Player = "default", ItemId = 108, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetFoliosFromOrderRuins"},
			QuestSetActive {Quest = "BringFoliosToAskan"}, 
			
		}
	},
	-- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintRushwater"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 686, Y = 263, Direction = 0},
			FogOfWarRevealAtEntity	{Tag = "PaintingMarker", Range = 10, Height = default},
		}
	},
	-- Bild von Rushwater malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintRushwater"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintRushwater"},
			ObjectVanish	{Tag = "PaintingMarker"},
		}
	},
	-- Alle Bilder gemalt, Rückkehrquest starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyPaintRushwater"},
			QuestIsSolved {Quest = "HouseOfGreyPaintNeedle"},
			QuestIsSolved {Quest = "HouseOfGreyPaintGF"},
			QuestIsSolved {Quest = "HouseOfGreyPaintFireforge"},
			QuestIsSolved {Quest = "HouseOfGreyPaintMagnetStones"},
			QuestIsNotKnown  {Player = "pl_Human", Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			QuestSetActive {Quest = "HouseOfGreyReturnMyra"},
		}
	},
	-- Skelettboss
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P303_DumbSkeletonAlive"},
			FigureIsDead {Tag = "DumbSkeleton"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_DumbSkeletonDead"},
		},
	},
	-- OrcCampBoss ist tot XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "OrcCampBoss"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_OrcBossDead"},
		},
	},
	-- Alle Pferde in der Stadt
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_CutsceneShown"},
			FigureIsAlive {Tag = "Horse1"},
			FigureIsAlive {Tag = "Horse2"},
			FigureIsAlive {Tag = "Horse3"},
			FigureIsAlive {Tag = "Horse4"},
			FigureIsAlive {Tag = "Horse5"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_p303_AllHorsesAlive"}
		},	
		
	},
	-- Falkmar tot --> Game Over
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
			FigureIsDead {Tag = "Falkmar"}
		},
		Actions =
		{
			PlayerGameOver {Tag = "Falkmar_DEAD", LocaTag = "GameOverSF2FalkmarDied"},
		}
	},
	-- Der Spieler war auf Needle, das Portal geht auf
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "TravelToNeedle"},
		},
		Actions =
		{
			PortalEnable {Tag = "PortalNeedle"},
		}
	},
	-- Wenn der Spieler auf GoS Osal trifft sollte er nicht mehr in Rushwater rumstehen.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved  {Quest = "IronFieldsPart23FleeToGoS"},
		},
		Actions =
		{
			FigureVanish {Tag = "Osal"},
		}
	}
};


