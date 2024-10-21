dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	-- Starten der MapQuesten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_StartMainQuest"},
		},
		Actions =
		{
			QuestSetActive {Quest = "SF2A1_1_Akt"},
			QuestSetActive {Quest = "SF2A1_1_Akt_Kapitel1"},
			QuestSetActive {Quest = "WinterlightPeak_TalkYsha"},
			QuestSetActive {Quest = "WinterlightPeak_TalkWhisper"},
		},
	},
	-- Das erst mal mit Yasha geredet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_FirstTalkWithYasha"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_TalkYsha"},
			QuestSetActive {Quest = "WinterlightPeak_SkillUp"},
		},
	},
	-- Skillpunkte vergeben
	OnOneTimeEvent
	{
		Conditions =
		{
			HeroHasNoSkillPointsLeft {Hero = 0, Player = "pl_Human"},
			QuestIsActive {Quest = "WinterlightPeak_SkillUp"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_SkillUp"},
			QuestSetActive {Quest = "WinterlightPeak_TakeEquipment"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasSkill {Skill = 79},
				AvatarHasSkill {Skill = 112},
			}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_PlayerIsMage"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			HeroHasNoSkillPointsLeft {Hero = 0, Player = "pl_Human"},
			MapFlagIsFalse {Name = "mf_P401_PlayerIsMage"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_PlayerIsWarrior"},
		},
	},
	-- Magier
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "WinterlightPeak_TakeEquipment"},
			MapFlagIsTrue {Name = "mf_P401_PlayerIsMage"},
		},
		Actions =
		{
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 891},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 892},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 306},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 451},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 1198},
		},
	},
	-- Krieger
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "WinterlightPeak_TakeEquipment"},
			MapFlagIsTrue {Name = "mf_P401_PlayerIsWarrior"},
		},
		Actions =
		{
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 956},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 957},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 306},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 451},
			ObjectLootItemEquipmentAdd {Tag = "Equipment", 	DropChance = 100, ItemId = 1198},
		},
	},
	
	-- Der Spieler hat das Equipment
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					AvatarHasItemEquipment {ItemId = 891, Amount = 1},
					AvatarHasItemEquipment {ItemId = 892, Amount = 1},
				},
				AND
				{
					AvatarHasItemEquipment {ItemId = 956, Amount = 1},
					AvatarHasItemEquipment {ItemId = 957, Amount = 1},
				},
			},
			AvatarHasItemEquipment {ItemId = 306, Amount = 1},
			AvatarHasItemEquipment {ItemId = 451, Amount = 1},
			AvatarHasItemEquipment {ItemId = 1198, Amount = 1},
		},
		Actions =
		{
			DialogSetDisabled {Tag = "Yasha"},
			QuestSetSolved {Quest = "WinterlightPeak_TakeEquipment"},
		}
	},
	-- Hat der Spieler die CS gesehen wird der nächste Questblock gestartet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndIntroCS"},
		},
		Actions =
		{
			QuestSetActive {Quest = "WinterlightPeak_CloseGate"},
			QuestSetActive {Quest = "WinterlightPeak_GetMoonsilverDevices"},
			QuestSetActive {Quest = "WinterlightPeak_TalkToWind"},
			MapTimerStart {Name = "mt_P401_SpringNotBeast"},
		},
	},
	-- Wind nach Dialog übergeben lassen ... 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndWindCS"},
			GameInterfaceIsVisible{},
			AvatarIsNotTalking{},
		},
		Actions =
		{
			AvatarItemMiscGive {ItemId = 293, Amount = 1},
			MapTimerStart {Name = "mt_P401_SpringNotBeast"},
			FigureVanish {Tag = "Wind"},
			PlayerHeroAdd {HeroId = 108},
			NoSpawnEffect {Spawn = FigureHeroSpawn {Tag = "HeroWind", X = 75.8771, Y = 90.6889, Direction = 0},},
		},
	},
	-- Teile für die Katapultquest
	-- gefunden
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 293, Amount = 1},
			QuestIsActive {Quest = "WinterlightPeak_TalkToWind"},
			MapFlagIsTrue {Name = "mf_P401_EndWindCS"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_TalkToWind"},
			MapFlagSetTrue {Name = "mf_P401_SparePart1"},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 293, Amount = 2},
			QuestIsActive {Quest = "WinterlightPeak_GetMoonsilverDevices"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_GetMoonsilverDevices"},
			QuestSetActive {Quest = "WinterlightPeak_FinallyCloseGate"},
			MapTimerStart {Name = "mt_P401_SpringNotBeast"},
			MapFlagSetTrue {Name = "mf_P401_SparePart2"},
			DialogSetEnabled {Tag = "Skjardir"},
		}
	},
	
	-- abgeben
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_SparePartOneGiven"},
			MapFlagIsTrue {Name = "mf_P401_SparePartTwoGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_GetMoonsilverDevices"},
			QuestSetSolved {Quest = "WinterlightPeak_FinallyCloseGate"},
			QuestSetActive {Quest = "WinterlightPeak_CloseIt"},
			AvatarItemMiscTake {ItemId = 292, Amount = 2},
			AvatarItemMiscTake {ItemId = 293, Amount = 2},
			LeverSetEnabled {Tag = "LeverGates"},
			DialogSetDisabled {Tag = "Skjardir"}
		},
	},
	-- Spieler hat den Hebel betätigt
	OnOneTimeLeverEvent
	{
		Lever = "LeverGates",
		OnConditions =
		{
			QuestIsActive {Quest = "WinterlightPeak_CloseIt"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WinterlightPeak_CloseIt"},
			QuestSetSolved {Quest = "WinterlightPeak_CloseGate"},
			QuestSetActive {Quest = "WinterlightPeak_LastStand"},
			EntityTimerStart {Name = "et_P401_LeverOff"},
			WeatherChange {File = "litAtmo_P401_Winterlight_Peak_storm"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P401_LeverOff", Seconds = 2},
		},
		Actions =
		{
			LeverSetDisabled {Tag = "LeverGates"},
		}
	},
	-- 20 Zwerge durch, Quest ist gelöst
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreater {Name = "mv_P401_GoneToAlluvyn", Value = 19}
		},
		Actions =
		{
			--PortalEnable {Tag = "Winterlight_Alluvyan"},
			QuestSetSolved {Quest = "WinterlightPeak_LastStand"},
			QuestSetActive {Quest = "WinterlightPeak_OnToAlluvyan"},
		},
	},
	-- Tote Gegner für XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Oger1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_Booth1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Oger2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_Booth2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Oger3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_Booth3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IceGolem"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_Icegolem"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "ChestGuard"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_ChestEnemy"},
		},
	},
	
}