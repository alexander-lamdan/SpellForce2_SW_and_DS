State
{
	StateName = "Cutscenes",
	-- Portalgeflackere im Portal
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--	},
	--	Actions =
	--	{
	--		EffectStartAddon1 {Tag = "Winterlight_Alluvyan", File = "Effect_Spawn_Gate_Damaged"},
	--		EntityTimerStart {Name = "et_PortalFlicker"},
	--	},
	--},
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		EntityTimerIsElapsed {Name = "et_PortalFlicker", Seconds = 5},
	--	},
	--	Actions =
	--	{
	--		EffectStartAddon1 {Tag = "Winterlight_Alluvyan", File = "Effect_Spawn_Gate_Damaged"},
	--		EntityTimerStart {Name = "et_PortalFlicker"},
	--	},
	--},
	-- Skjadir wird am Anfang vor das Tor teleportiert und nach der Cutscene
	--  zurück an seine Position aus dem Editor
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "Skjardir", X = 95.9, Y = 68.1},
			FigureLookAtDirection {Tag = "Skjardir", Direction = 39},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "WinterlightPeak_TakeEquipment"},
			QuestIsSolved {Quest = "WinterlightPeak_TalkWhisper"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_StartIntroCS"},
			-- Da der Spieler hier auf jeden Fall alle Aufgaben erledigt hat kann Yasha den Dialog ausmachen
			DialogSetDisabled {Tag = "Yasha"},
		},
	},
	-- Wenn die Cutscene vorbei ist werden Questen gesolved etc
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndIntroCS"}
		},
		Actions =
		{
			--GateSetOpen {Tag = "CellGate"}, -- geschieht nun in der Cutscene, damit Satras und
			-- seine Leute wegrennen können
			PlayerHeroAdd {HeroId = 107},
			NoSpawnEffect {Spawn = FigureHeroSpawn {Tag = "HeroWhisper", X = 99.4, Y = 56, Direction = 90},},
			-- NPC Wisper wird gelöscht
			FigureVanish {Tag = "HeroWhisper"},			
			-- Wisper gibt Hinweise zu den Mondsilberfedern
			FigureOutcry {Tag = "pl_HumanHeroWhisper", TextTag = "TheParts01"},
			FigureOutcry {Tag = "pl_HumanHeroWhisper", TextTag = "TheParts02"},
			ObjectSpawn {X = 191, Y = 317, ObjectId = 2253, Tag = "Effect"},
		},
	},
	-- Wind wird nach zweiter Cutscene übergeben, es gibt keinen Dialog mehr
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "WindsOpponent"},
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Wind", Range = 6},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
			--FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 6, TargetTag = "Wind"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_StartWindCS"},
			MapFlagSetTrue {Name = "mf_P401_WindsEnemy"},
		},
	},
	-- Die Tore werden geschlossen
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_02"},
				QuestIsActive {Quest = "WinterlightPeak_LastStand"},
			},
		},
		Actions =
		{
			BuildingHealthSet {Tag = "Beast1", Percent = 1},
			BuildingHealthSet {Tag = "Beast2", Percent = 1},
			BuildingDestroy {Tag = "Beast1"},
			BuildingDestroy {Tag = "Beast2"},
			FigureKill {Tag = "TentGuard1"},
			FigureKill {Tag = "TentGuard2"},
			FigureKill {Tag = "TentGuard3"},
			FigureKill {Tag = "TentGuard4"},
			--GateSetClosed {Tag = "MainGate1"},
			--GateSetClosed {Tag = "MainGate2"},
			MapFlagSetTrue {Name = "mf_P401_StartGateCS"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndGateCS"}
		},
		Actions =
		{
			GateSetOpen {Tag = "BackDoor"},
			FigureOutcry {Tag = "Skjardir", TextTag = "Pass01"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Pass02"},
			MapTimerStart {Name = "mt_P401_EnemyAtTheGates"}
		},
	},
	
	-- Genug Zwerge sind durch Portal. Auuuus, Auuus Auuus Auuuuus. Das Spiel ist aus
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "WinterlightPeak_LastStand"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_StartEndCS"},
			FigureKill {Tag = "Worker1"},
			FigureKill {Tag = "Worker2"},
			FigureKill {Tag = "Worker3"},
			FigureKill {Tag = "Worker4"},
			FigureKill {Tag = "Worker5"},
			FigureKill {Tag = "Worker6"},
			FigureKill {Tag = "Worker7"},
			FigureKill {Tag = "Worker8"},
			FigureKill {Tag = "Worker9"},
			FigureKill {Tag = "Worker10"},
			FigureKill {Tag = "Worker11"},
			FigureKill {Tag = "Worker12"},
			FigureKill {Tag = "Worker13"},
			FigureKill {Tag = "Worker14"},
			FigureKill {Tag = "Worker15"},
			FigureKill {Tag = "Worker16"},
			FigureKill {Tag = "Worker17"},
			FigureKill {Tag = "Worker18"},
			FigureKill {Tag = "Worker19"},
			FigureKill {Tag = "Worker20"},
			FigureKill {Tag = "Worker21"},
			FigureKill {Tag = "Worker22"},
			FigureKill {Tag = "Worker23"},
			FigureKill {Tag = "Worker24"},
			FigureKill {Tag = "Worker25"},
			FigureKill {Tag = "Worker26"},
			FigureKill {Tag = "Worker27"},
			FigureKill {Tag = "Worker28"},
			FigureKill {Tag = "Worker29"},
			FigureKill {Tag = "Worker30"},
			FigureKill {Tag = "Worker31"},
			FigureKill {Tag = "Worker32"},
			FigureKill {Tag = "Worker33"},
			FigureKill {Tag = "Worker34"},
			FigureKill {Tag = "Worker35"},
			FigureKill {Tag = "Worker36"},
			FigureKill {Tag = "Worker37"},
			FigureKill {Tag = "Worker38"},
			FigureKill {Tag = "Worker39"},
			FigureKill {Tag = "Worker40"},
			GateSetOpen {Tag = "MainGate1"},
			GateSetOpen {Tag = "MainGate2"},

			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndEndCS"},
			-- auf jeden Fall sicherstellen das Wisper Quest aktiv ist
			-- im worst case (< 1% der Fälle) geschieht dies erst wenn das EndEndCS flag true ist ...
			QuestIsActive	{Quest = "HeroWisper"},
		},
		Actions =
		{
			PlayerMapTravelAddon1 {Map = "Campaign/P402_Alluvyan", TargetTag = "Alluvyan_Winterlight"},
			ObjectVanish {Tag = "Effect"},
			PlayerTravelEnable {},
		},
	},
}