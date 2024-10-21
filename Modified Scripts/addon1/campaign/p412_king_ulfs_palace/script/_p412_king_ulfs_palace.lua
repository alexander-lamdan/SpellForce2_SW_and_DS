
--*******************************************************
--***                                                 ***
--***               Palace Addon1  	                  ***
--***                                                 ***
--*******************************************************

--Die Mission ist wie folgt auf die Lua Scripte verteilt:

--*******************************************************
--***                                                 ***
--***               Globale Scripte		              ***
--***                                                 ***
--*******************************************************

--_P412_King_Ulfs_Palace
--MainQuest
--Outcries
--Rewards

--*******************************************************
--***                                                 ***
--***        		Gartenbereich				      ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***  				Küchenbereich			 		  ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***         			Keller				   	      ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***   			   Wohnbereich	 			      ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***   				Thronsaal				      ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "INIT",
	--Ur von Mistyc Coast wird entfernt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P411_PlayerHasUr"},
		},
		Actions =
		{
			PlayerHeroRemove{Player = "pl_Human", Tag = "Ur"},
			AvatarFlagSetFalse{Name = "af_P411_PlayerHasUr"},
		},
	},
		
	OnOneTimeEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
		},
		Actions =
		{
				--Cutszene wird gestartet			
    			MapFlagSetTrue {Name = "mf_P412_StartIntroCS"},
    			DialogTypeSetSideQuest	{Tag = "Thief"},
    			DialogSetEnabled	{Tag = "Thief"},
    			DialogTypeSetSideQuest	{Tag = "GhostBarrel1"},
    			DialogSetEnabled	{Tag = "GhostBarrel1"},
    			DialogTypeSetSideQuest	{Tag = "sqamulett"},
    			DialogSetEnabled	{Tag = "sqamulett"},
  
    			DialogTypeSetSideQuest	{Tag = "Karan"},
    			DialogSetEnabled	{Tag = "Karan"},
    			DialogTypeSetMainQuest	{Tag = "DeadKingDialog1"},
    			DialogSetEnabled	{Tag = "DeadKingDialog1"},
    			DialogTypeSetMainQuest	{Tag = "DeadKingDialog2"},
    			DialogSetEnabled	{Tag = "DeadKingDialog2"},
    			
    			FogOfWarReveal	{X = 176.4, Y = 147,  Range = 8, Height = 120},
    			FogOfWarReveal	{X = 193.2, Y = 144.2,  Range = 8, Height = 120},
		},
		
	},
	
	--Dialoge werden enabled sobald man den Schlüssel für die Tore hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 331, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "KingUlfSleepingRoomGate"},
    		DialogSetEnabled	{Tag = "KingUlfSleepingRoomGate"},
		},
		
	},
	--Dialoge werden enabled sobald man den Schlüssel für die Tore hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 333, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "AudienceRoomGate"},
    		DialogSetEnabled	{Tag = "AudienceRoomGate"},
		},
		
	},
	--Dialoge werden enabled sobald man den Schlüssel für die Tore hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 332, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "TempleGate"},
    		DialogSetEnabled	{Tag = "TempleGate"},
		},
		
	},
	--Dialoge werden enabled sobald man den Schlüssel für die Tore hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 380, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "ThroneRoomDoor"},
    		DialogSetEnabled	{Tag = "ThroneRoomDoor"},
		},
		
	},
	--Dialoge werden enabled sobald man den Schlüssel für die Tore hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 338, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 396, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "CellMainGate"},
    		DialogSetEnabled	{Tag = "CellMainGate"},
		},
		
	},
	
	
	--Karans Dialog wird enabled sobald der Spieler das Amulett des Königs besitzt..
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 365, Amount = 1},
		},
		Actions =
		{	
    		DialogTypeSetSideQuest	{Tag = "Karan"},
    		DialogSetEnabled	{Tag = "Karan"},
		},
		
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KingUlfSpoken"},
		},
		Actions =
		{	
    		AvatarItemMiscGive	{Player = "pl_Human", ItemId = 365, Amount = 1},	
		},
		
	},
	--Killcounts für Geweihte hochsetzen
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsDead	{Tag = "Illusionist"},
		},
		Actions =
		{	
    		PlayerNPCKillCountIncrease	{Player = "pl_Human", UnitId = 1206},
		},
		
	},
	--Killcounts für Geweihte hochsetzen
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsDead	{Tag = "Necromancer"},
		},
		Actions =
		{	
    		PlayerNPCKillCountIncrease	{Player = "pl_Human", UnitId = 1207},
		},
		
	},
	--MQ PalaceGuards		
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "FloorGate"},
		},
		Actions =
		{	
    		FigureTeamTransfer	{Tag = "PalaceGuard1", Team = "tm_Team2"},
    		FigureTeamTransfer	{Tag = "PalaceGuard2", Team = "tm_Team2"},
		},
		
	},		
	--SQ Prisoners		
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "GateCellNumber4"},
		},
		Actions =
		{	
    		FigureTeamTransfer	{Tag = "Prisoner1", Team = "tm_Team2"},
		},
		
	},		
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "GateCellNumber3"},
		},
		Actions =
		{	
    		FigureTeamTransfer	{Tag = "Prisoner3", Team = "tm_Team2"},
		},
		
	},		
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "GateCellNumber6"},
		},
		Actions =
		{	
    		FigureTeamTransfer	{Tag = "Prisoner2", Team = "tm_Team2"},
		},
		
	},		
	
	--Cutszene Geweihter1 wird gestartet			
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 5, X = 225, Y = 177},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_StartGeweihter1CS"},
		},
		
	},		
	
	--Cutszene Geweihter2 wird gestartet			
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 121, Y = 89},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_StartGeweihter2CS"},
		},
		
	},		

	--Cutszene Geweihter3 wird gestartet			
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "TempleDoor"},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_StartGeweihter3CS"},
		},
		
	},		

	--Cutszene Former wird gestartet		
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "GateThroneRoom"},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_Reached_Throne_Room_Start"},
		},
		
	},		

	--Nach der ersten Former Cutszene			
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Reached_Throne_Room_Ended"},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast1"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast2"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast3"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast4"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast5"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast6"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast7"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast8"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast9"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast10"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast11"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast12"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast13"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast14"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast15"},
    		MapFlagSetTrue {Name = "mf_FormerStatuenCast16"},
    		FigureAnimPlayLooped	{Tag = "EndGeweither2", File = "base/gfx/figures/hero/figure_hero_female_emote_pray.ska"},
    		FigureAnimPlayLooped	{Tag = "EndGeweither4", File = "base/gfx/figures/hero/figure_hero_female_emote_pray.ska"},
    		FigureAnimPlayLooped	{Tag = "EndGeweither1", File = "base/gfx/figures/hero/figure_hero_male_emote_pray.ska"},
    		FigureAnimPlayLooped	{Tag = "EndGeweither3", File = "base/gfx/figures/hero/figure_hero_male_emote_pray.ska"},
		},
		
	},		


	--Cutszene Former2 wird gestartet			
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Reached_Throne_Room_Ended"},
			FigureIsDead	{Tag = "EndGeweither1"},
			FigureIsDead	{Tag = "EndGeweither2"},
			FigureIsDead	{Tag = "EndGeweither3"},
			FigureIsDead	{Tag = "EndGeweither4"},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_King_Ulf_Appears_Start"},
    		ObjectVanish	{Tag = "DefendCicle"},
		},
		
	},		
	--Nach der 2 Formercutszene greift der Former selbst ein.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_King_Ulf_Appears_Ended"},
		},
		Actions =
		{	
			FigureVanish	{Tag = "Kingfighter1"},
			FigureVanish	{Tag = "Kingfighter2"},
			FigureVanish	{Tag = "Kingfighter3"},
			FigureVanish	{Tag = "Kingfighter4"},
			FigureVanish	{Tag = "Kingfighter5"},
			FigureVanish	{Tag = "Kingfighter6"},
			FigureVanish	{Tag = "Kingfighter7"},
			FigureVanish	{Tag = "Kingfighter8"},
			FigureVanish	{Tag = "Kingfighter9"},
			FigureVanish	{Tag = "Kingfighter10"},
			FigureVanish	{Tag = "Kingfighter11"},
			FigureVanish	{Tag = "Kingfighter12"},
			FigureVanish	{Tag = "Kingfighter13"},
			FigureVanish	{Tag = "Kingfighter14"},
    		FigureVanish	{Tag = "Kingfighter15"},
    		FigureVanish	{Tag = "Kingfighter16"},
    		FigureVanish	{Tag = "Guard6"},
    		FigureVanish	{Tag = "Guard7"},
    		FigureVanish	{Tag = "Guard8"},
    		FigureVanish	{Tag = "Guard9"},
    		FigureVanish	{Tag = "Guard10"},
    		FigureVanish	{Tag = "Guard11"},
    		FigureVanish	{Tag = "Guard12"},
    		FigureVanish	{Tag = "Guard13"},
    		FigureVanish	{Tag = "Ulf"},
    		FigureVanish	{Tag = "Karan"},
    		--ObjectVanish	{Tag = "DefendCicle"},
    		FigureTeamTransfer	{Tag = "Former", Team = "tm_Team2"},
    		MapFlagSetTrue {Name = "mf_FormerActiv"},
		},
		
	},				
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_King_Ulf_Appears_Ended"},
			FigureIsAlive	{Tag = "KingUlf"},
		},
		Actions =
		{	
    		FigureRunToEntity	{Tag = "CS_06_Soldier01", TargetTag = "KingUlf"},
    		FigureRunToEntity	{Tag = "CS_06_Soldier02", TargetTag = "KingUlf"},
    		FigureRunToEntity	{Tag = "CS_06_Soldier03", TargetTag = "KingUlf"},
		},
		
	},		
	

	
	--Wenn alle KingsGuards tot sind und der Former Karan angreift startet die nächste Cutszene.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "CS_06_Soldier01"},
			FigureIsDead	{Tag = "CS_06_Soldier02"},
			FigureIsDead	{Tag = "CS_06_Soldier03"},
			FigureIsDead	{Tag = "KingGuards1"},
			FigureIsDead	{Tag = "KingGuards2"},
			FigureIsDead	{Tag = "KingGuards3"},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_Archfire_Start"},
		},
		
	},		
	--Nach der Cutszene in der Karan stirbt.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Archfire_Ended"},
			
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_ArchfireStart"},
    		MapTimerStart	{Name = "mt_AvatarHealthTimer"},
    		FigureVanish	{Tag = "KaranGeneral"},
    		
    		--Buff für Avatar
    		TeamCastSpellToEntity	{Spell = 436, Power = 1, Team = "tm_Team2", TargetTag = "pl_HumanAvatar"},
    		FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = 517},
    		FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = 527},
		},
	},	
	
	--Nach der Cutszene wird dem Avatar 4*25% MaxHealth abgezogen, dann ist er tot.
    OnEvent
	{
    	
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AvatarHealthTimer", Seconds = 30},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "Former"},
		},
		Actions =
		{	
    		MapTimerStop	{Name = "mt_AvatarHealthTimer"},
    		EffectStartAddon1	{Tag = "pl_HumanAvatar", File = "Effect_Misc_Warming"},
    		FigureHealthSubtract	{Tag = "pl_HumanAvatar", Percent = 25},
    		MapTimerStart	{Name = "mt_AvatarHealthTimer"},
		},
	},	
  	--Stirbt der Former vor dem Avatar.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ArchfireStart"},
			FigureIsDead	{Tag = "Former"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{	
    		MapTimerStart	{Name = "mt_EndTimerStart"},
    		FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
		},
	},	
	--Letzte Cutszene wird gestartet.
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_EndTimerStart", Seconds = 2},
		},
		Actions =
		{	
    		MapFlagSetTrue {Name = "mf_P412_Its_Over_Now_Start"},
		},
	},	
   	--Stirbt der Avatar, gibt es einen GameOver.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ArchfireStart"},
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "Former"},
		},
		Actions =
		{	
    		PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverHeroDeath"},
		},
	},	
	
	
	-- BINK VIDEO WIRD JETZT IM CUTSCENE-SCRIPT GESTARTET!
	--
	--
	----[Nach der letzten Cutszene wird das bink video abgespielt.] NICHT MEHR GÜLTIG
    --OnOneTimeEvent
	--{
    --	
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P412_Its_Over_Now_Ended"},
	--	},
	--	Actions =
	--	{	
    --		CutscenePlayBinkVideo{File = "Addon1/video/extro_1.bik"},
	--	},
	--},	
		
};