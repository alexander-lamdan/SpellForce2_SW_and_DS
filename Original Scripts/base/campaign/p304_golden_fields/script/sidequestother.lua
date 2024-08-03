


State
{
	StateName = "Main",
	   
	
	OnOneTimeEvent
	{
	   	Conditions =
	   	{
	   		AvatarFlagIsTrue{Name = "af_P304_QuarryQuestGiven"},
	   		FigureIsDead{Tag = "GolemCamp01"},
	   		FigureIsDead{Tag = "GolemCamp02"},
	   		FigureIsDead{Tag = "GolemCamp03"},
	   		FigureIsDead{Tag = "GolemCamp04"},
	   		FigureIsDead{Tag = "GolemCamp05"},
	   		FigureIsDead{Tag = "GolemCamp06"},
	   	},
	   	Actions =
	   	{
	   		AvatarFlagSetTrue{Name = "af_P304_QuarryCleared"},
	   	},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_QuarryQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFMonsterInTheQuarry"},
			QuestSetActive {Quest = "KillTheMonsterInTheQuarry"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 10, Tag = "MonsterQuarry", Range = 25, Height = default},
		},
	},	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "KillTheMonsterInTheQuarry"},
			AvatarFlagIsTrue{Name = "af_P304_QuarryCleared"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "KillTheMonsterInTheQuarry"},
			QuestSetActive{Quest = "ReportTosie"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GFMonsterInTheQuarry"},
			AvatarFlagIsTrue{Name = "af_P304_QuarryQuestSolved"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "ReportTosie"},
			QuestSetSolved {Quest = "GFMonsterInTheQuarry"},
		},
	},	
	
	--- Harpyenquest
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_HarpyQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFHarpyTerror"},
			QuestSetActive {Quest = "KillTenHarpys"},
			
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneSouth"},
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneWest"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "KillTenHarpys"},
			AvatarValueIsGreaterOrEqual{Name = "av_P304_HarpysKilled", Value = 10},
		},
		Actions =
		{
			QuestSetSolved {Quest = "KillTenHarpys"},
			QuestSetActive {Quest = "ReportSemion"},
		},
	},	
	
	
	--- Ogrequest
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_OgreQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFOgreHunt"},
			QuestSetActive {Quest = "KillTenOgres"},
			
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneSouth"},
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneWest"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "KillTenOgres"},
			AvatarValueIsGreaterOrEqual{Name = "av_P304_OgreKilled", Value = 10},
		},
		Actions =
		{
			QuestSetSolved {Quest = "KillTenOgres"},
			QuestSetActive {Quest = "ReportFalida"},
		},
	},	
	
	
	
	-- VERSCHOLLENE LIEFERUNGEN
	-- Die restlichen Sachen werden im Script und den Dialogfiles von GondersenChest
	-- und Siobhan gestartet/gesolved
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "GFLostDeliveries"},
			AvatarValueIsEqual
			{Name = "av_P304_DeliveriesDeliveredOrOpened", Value = 6},
		},
		Actions =
		{
			QuestSetSolved{Quest = "GFLostDeliveries"},
		},
	},
	
	
	--- SIDEQUEST: DAS VERSCHOLLENE BANNER
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_BannerQuestGiven"}, 
		},
		Actions =
		{
			QuestSetActive{Quest = "GFLostBanner"},
			QuestSetActive{Quest = "FindTheBanner"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_DialogWithHermit", Value = 1},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindTheBanner"},
			QuestSetActive{Quest = "DecideAboutBanner"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_DialogWithHermit", Value = 2},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DecideAboutBanner"},
			QuestSetActive{Quest = "ReportBannerSemion"},
		},
	},
	
	-- QUEST wird gesolved im Script von Semion
	
	
	
	--- SIDEQUEST: STÄTTE VON UNTOTEN SÄUBERN
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_UndeadQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFCleanHolyPlace"},
			QuestSetActive {Quest = "KillTheUndeadInvaders"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 11, Tag = "HolyShrine", Range = 25, Height = default},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_HolyPlace"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "KillTheUndeadInvaders"},
			AvatarValueIsGreaterOrEqual {Name = "av_P204_UndeadCampKillCounter", Value = 30},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "UndeadCleaned", Tag = "pl_Human"},
			QuestSetSolved {Quest = "KillTheUndeadInvaders"},
			QuestSetActive {Quest = "ReportSephis"},
		},
	},	
	
	-- Rest der Quest wird in Script von Sephis gesolved
	
	
	
	--- SIDEQUEST: DIE GLASHARFE
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SonarQuestGiven"}, 
		},
		Actions =
		{
			QuestSetActive {Quest = "GFGlassHarp"},
			QuestSetActive {Quest = "FindGlassHarp"},
			
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstonePeasant"},
			FogOfWarRevealAtEntity	{FogOfWarId = 46, Tag = "RS_BindstonePeasant", Range = 15, Height = default},
			ObjectVanish{Tag = "ZaunTor01"},
			ObjectVanish{Tag = "ZaunTor02"},
			ObjectVanish{Tag = "SplinterFence01"},
			ObjectVanish{Tag = "SplinterFence02"},
			ObjectVanish{Tag = "SplinterFence03"},
			MapTimerStart {Name = "mt_GlassHarpTimer"},
		},
	},	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindGlassHarp"},
			AvatarHasItemMisc{ItemId = 97, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindGlassHarp"},
			QuestSetActive {Quest = "ReportTalienne"},
			
		},
	},	
	--- Quest wird dann komplett im Script von Talienne gesolved
	
	
	
	
	
	
	OnEvent
	{
		EventName = "Range30_50",
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 98, Amount = 1},
			AvatarHasNotItemMisc{ItemId = 97, Amount = 1},
			MapTimerIsElapsed {Name = "mt_GlassHarpTimer", Seconds = 6},
			FigureIsInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 50},
			FigureIsNotInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 30},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_gf_01_geiger_counter1"},
			FigureOutcry{TextTag = "Sonar01", Tag = "pl_HumanAvatar"},
			MapTimerStart {Name = "mt_GlassHarpTimer"},
		},
	},
	
	OnEvent
	{
		EventName = "Range20_30",
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 98, Amount = 1},
			AvatarHasNotItemMisc{ItemId = 97, Amount = 1},
			MapTimerIsElapsed {Name = "mt_GlassHarpTimer", Seconds = 6},
			FigureIsInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 30},
			FigureIsNotInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 20},
		},
		Actions =
		{            
			SoundGlobalPlayOnce	{File = "06_level/map_gf_02_geiger_counter2"},       
			FigureOutcry{TextTag = "Sonar02", Tag = "pl_HumanAvatar"},
			MapTimerStart {Name = "mt_GlassHarpTimer"},
		},
	},
	
	OnEvent
	{
		EventName = "Range10_20",
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 98, Amount = 1},
			AvatarHasNotItemMisc{ItemId = 97, Amount = 1},
			MapTimerIsElapsed {Name = "mt_GlassHarpTimer", Seconds = 6},
			FigureIsInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 20},
			FigureIsNotInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 10},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_gf_03_geiger_counter3"},
			FigureOutcry{TextTag = "Sonar03", Tag = "pl_HumanAvatar"},
			MapTimerStart {Name = "mt_GlassHarpTimer"},
		},
	},
	
	OnEvent
	{
		EventName = "Range5_10",
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 98, Amount = 1},
			AvatarHasNotItemMisc{ItemId = 97, Amount = 1},
			MapTimerIsElapsed {Name = "mt_GlassHarpTimer", Seconds = 6},
			FigureIsInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 10},
			FigureIsNotInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 5},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_gf_04_geiger_counter4"},
			FigureOutcry{TextTag = "Sonar04", Tag = "pl_HumanAvatar"},
			MapTimerStart {Name = "mt_GlassHarpTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "Range0_5",
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 98, Amount = 1},
			AvatarHasNotItemMisc{ItemId = 97, Amount = 1},
			MapTimerIsElapsed {Name = "mt_GlassHarpTimer", Seconds = 6},
			FigureIsInEntityRange{Tag = "GlassHarp", TargetTag = "pl_HumanAvatar", Range = 5},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 98, Amount = 1},
			SoundGlobalPlayOnce	{File = "06_level/map_gf_05_geiger_counter5"},
			MapFlagSetTrue{Name = "mf_GlassHarpDiscovered"},
		},
	}, -- SPIELER ENTDECKT GLASHARFE
	-- Splitter sofort abnehmen, damit nicht weiterhin Töne kommen
	
	
	
	
	
	
	
	
	
	
	--- SIDEQUEST: DER RICHTIGE DREH
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P305_LelaFree"},
		},
		Actions =
		{
			AvatarValueSet{Name = "av_P304_TalkWithDrehlein", Value = 3},
		},
		-- Sobald Lela frei ist, schaltet Professor Drehlein in einen
		-- neuen Dialogpart (oder schaltet überhaupt erst seinen Dialog wieder frei, falls man vorher
		-- noch nicht mit ihm gesprochen hatte)
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_LelaQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "TheRightTwistPart1"},
			QuestSetActive {Quest = "SaveLelaFromUnderhall"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "SaveLelaFromUnderhall"},
			AvatarFlagIsTrue{Name = "af_P305_LelaFree"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "SaveLelaFromUnderhall"},
			QuestSetActive{Quest = "ReturnToTwiddleGF"},
		},
		--- NONSENS FÜR DIE QA
		--- kann wieder rausgelöscht werden, sobald Kartenwechsel möglich
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithDrehlein", Value = 5},
		},
		Actions =
		{
			QuestSetSolved {Quest = "ReturnToTwiddleGF"},
			QuestSetSolved {Quest = "TheRightTwistPart1"},
		},
	},	

	
	--- SIDEQUEST: WARRADS TOCHTER
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "TalkToBaruGF"},
			QuestSetActive {Quest = "RescueKaraFromNeedle"},
		},
	},	
	
	----------------------------------------------------------
	
	
	-- SIDEQUEST: VERDÄCHTIGE
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_SuspectQuestGiven"},
		},
		Actions = 
		{
			QuestSetActive {Quest = "GFUnholySect"},
			QuestSetActive {Quest = "WatchBente"},
			QuestSetActive {Quest = "WatchFreja"},
			QuestSetActive {Quest = "WatchGunnar"},
			QuestSetActive {Quest = "WatchHaldor"},
			QuestSetActive {Quest = "WatchHedda"},
			QuestSetActive {Quest = "WatchIngvert"},
			QuestSetActive {Quest = "WatchOle"},
			QuestSetActive {Quest = "WatchTuva"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_HeddaWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchHedda"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_FrejaWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchFreja"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_TuvaWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchTuva"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_BenteWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchBente"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_GunnarWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchGunnar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_HaldorWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchHaldor"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_IngvertWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchIngvert"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_OleWatched"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "WatchOle"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_OleWatched"},
			MapFlagIsTrue{Name = "mf_IngvertWatched"},
			MapFlagIsTrue{Name = "mf_HaldorWatched"},
			MapFlagIsTrue{Name = "mf_GunnarWatched"},
			MapFlagIsTrue{Name = "mf_BenteWatched"},
			MapFlagIsTrue{Name = "mf_FrejaWatched"},
			MapFlagIsTrue{Name = "mf_TuvaWatched"},
			MapFlagIsTrue{Name = "mf_HeddaWatched"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_AllSuspectsWatched"},
			QuestSetActive {Quest = "ReportSectMembersToSephis"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SuspectQuestEnded"},
		},
		Actions = 
		{
			QuestSetSolved{Quest = "ReportSectMembersToSephis"},
			QuestSetSolved{Quest = "GFUnholySect"},
		},
	},

--------------------------------------------------------------------------------

	-- SIDEQUEST: ALBA: Steinherzen
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_StoneHeartsQuestGiven"},
		},
		Actions = 
		{
			QuestSetActive {Quest = "GFStoneHearts"},
			QuestSetActive {Quest = "LootFiveStoneHearts"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "LootFiveStoneHearts"},
			AvatarHasItemMisc{ItemId = 249, Amount = 5},
		},
		Actions = 
		{
			QuestSetSolved {Quest = "LootFiveStoneHearts"},
			QuestSetActive {Quest = "BringHeartsToAlba"},
		},
	},
	
	-- Quest wird dann im LSD-File von Alba komplett gelöst
	
	
	
	--------------------------------------------------------------------------------

	-- SIDEQUEST: Buch der Roten Horde
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive{Player = "pl_Human", Quest = "CultBookOfTheRedHorde"},
		},
		Actions = 
		{
			ObjectLootItemMiscAdd{Tag = "MuseumBookholder", DropChance = 100, ItemId = 158},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "default", ItemId = 158, Amount = 1},
		},
		Actions = 
		{
			FigureTeamTransfer{Tag = "MuseumWarden01", Team = "tm_Team2"},
			FigureTeamTransfer{Tag = "MuseumWarden02", Team = "tm_Team2"},
			FigureTeamTransfer{Tag = "MuseumWarden03", Team = "tm_Team2"},
			FigureTeamTransfer{Tag = "MuseumWarden04", Team = "tm_Team2"},
		},
	};

	
}

