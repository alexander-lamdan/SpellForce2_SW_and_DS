------------------------------------------------------------------------
--
--	Platformskript Drah Lur
--
----------------------------------------------------------------------------

-- für copy&paste:
-- SingleMapLoadEvent einladen


State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PlayerTravelDisable {},
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
			-- Timer setzen, mit dem man immer gucken kann ob der Avatar ein Fallenitem hat
			MapTimerStart {Name = "mt_P407_TrapItem"},
		}
	},
	
	-- Wenn der GateBoss in den Kampf verwickelt wird können langsam die anderen Itemträger anfangen zu spawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasHate {Tag = "GateBoss"}
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P407_TrapItemCarrier"},
		},
	},
	-- Spawning der Armee langsam abschalten
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureTeamIsInRange {X = 342, Y = 547, Range = 20, Team = "tm_Team1"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P407_SlowerSpawning"}
		},
	},
	-- Da die Itemabfrage im Dialog nicht klappt hier verwalten
	OnToggleEvent
	{
		OnConditions =
		{
			--QuestIsKnown {Quest = "DraghLurA1_TheTraps"},
			--MapTimerIsElapsed {}
			AvatarHasItemMisc {Amount = 1, ItemId = 280}
		},
		OnActions =
		{
			MapFlagSetTrue {Name = "mf_P407_PlayerHasTrapItem"}
		},
		OffConditions =
		{
			AvatarHasNotItemMisc {Amount = 1, ItemId = 280}
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P407_PlayerHasTrapItem"}
		}
	},
	-- Das Portal für den Spieler de/aktivieren
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndIntroCS"},
		},
		Actions =
		{
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DraghLurA1_TalkToNightsong"},
		},
		Actions =
		{
			PlayerTravelEnable {},
			-- Teleporter wieder aktiv
			MapFlagSetFalse	{Name = "mf_PlayerTravelDisabled"},
		},
	},
	-- Der Titan spawnt, der Schattenkrieger warnt
	-- !!! Könnte woanders hin, mal im Auge behalten wegen schönerer Struktur
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_DefeatYsha"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "ShadowWarriorWarning1", Tag = "ShadowWarrior"},
			GateSetOpen {Tag = "YshaGate"},
			MapFlagSetTrue {Name = "mf_P407_TitanWarning"}
		}
		
	},
	-- Wenn die zweite Cutscene zu Ende ist oder der Spieler vorher zu weit läuft werden die Player eingeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P407_EndTrapsCS"},
				PlayerFigureIsInRange {X = 589,Y = 287, Range = 20},
				PlayerFigureIsInRange {X = 252.353, Y = 281.549, Range = 20},
			},
				
		},
		Actions =
		{
			PlayerActivate {Player = "pl_Enemy1"},
			PlayerActivate {Player = "pl_Enemy2"},
			PlayerActivate {Player = "pl_Enemy3"},
			PlayerActivate {Player = "pl_Enemy4"},
		},
	},
	-- Kisten zu den toten Campbossen
	
	-- Ist das MapFlag tot true und der Spieler hat nicht mehr als 2 Items am Start gibt es ne Kiste
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp1"},
			MapValueIsLess {Name = "mv_P407_ObsidianEyes", Value = 2},
			MapFlagIsTrue {Name = "mf_P407_ImSpawnedCamp1"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp1"},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Camp1_Dead", Tag = "Camp1LootChest", Direction = 0},
			ObjectLootItemMiscAdd {Tag = "Camp1LootChest", ItemId = 280},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
		},
	},
	-- Ist das EntityFlag tot true und der Spieler hat genug Items am start gibt es ne keine Kiste, das Flag wird aber zurückgesetzt
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp1"},
			MapValueIsGreaterOrEqual {Name = "mv_P407_ObsidianEyes", Value = 2},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp1"},
		},
	},	
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp2"},
			MapValueIsLess {Name = "mv_P407_ObsidianEyes", Value = 2},
			MapFlagIsTrue {Name = "mf_P407_ImSpawnedCamp2"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp2"},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Camp2_Dead", Tag = "Camp2LootChest", Direction = 0},
			ObjectLootItemMiscAdd {Tag = "Camp2LootChest", ItemId = 280},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
		},
	},
	-- Ist das EntityFlag tot true und der Spieler hat genug Items am start gibt es ne keine Kiste, das Flag wird aber zurückgesetzt
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp2"},
			MapValueIsGreaterOrEqual {Name = "mv_P407_ObsidianEyes", Value = 2},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp2"},
		},
	},	
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp3"},
			MapValueIsLess {Name = "mv_P407_ObsidianEyes", Value = 2},
			MapFlagIsTrue {Name = "mf_P407_ImSpawnedCamp3"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp3"},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Camp3_Dead", Tag = "Camp3LootChest", Direction = 0},
			ObjectLootItemMiscAdd {Tag = "Camp3LootChest", ItemId = 280},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
		},
	},
	-- Ist das EntityFlag tot true und der Spieler hat genug Items am start gibt es ne keine Kiste, das Flag wird aber zurückgesetzt
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp3"},
			MapValueIsGreaterOrEqual {Name = "mv_P407_ObsidianEyes", Value = 2},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp3"},
		},
	},	
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp4"},
			MapValueIsLess {Name = "mv_P407_ObsidianEyes", Value = 2},
			MapFlagIsTrue {Name = "mf_P407_ImSpawnedCamp4"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp4"},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Camp4_Dead", Tag = "Camp4LootChest", Direction = 0},
			ObjectLootItemMiscAdd {Tag = "Camp4LootChest", ItemId = 280},
			MapValueIncrease {Name = "mv_P407_ObsidianEyes"},
		},
	},
	-- Ist das EntityFlag tot true und der Spieler hat genug Items am start gibt es ne keine Kiste, das Flag wird aber zurückgesetzt
	OnEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			MapFlagIsTrue {Name = "mf_P407_ImDeadCamp4"},
			MapValueIsGreaterOrEqual {Name = "mv_P407_ObsidianEyes", Value = 2},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp4"},
		},
	},	
	-- Wenn der Spieler den ersten Haufen gelootet hat muss der natürlich weg
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P407_VanishJunk1"},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish {Tag = "Junk1"},
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P407_VanishJunk2"},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish {Tag = "Junk2"},
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P407_VanishJunk3"},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish {Tag = "Junk3"},
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P407_VanishJunk4"},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish {Tag = "Junk4"},
	--	},
	--},
}

