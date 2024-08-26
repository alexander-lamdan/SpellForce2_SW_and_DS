triggerRange = 5
killRange = 20

State
{
	StateName = "INIT",
	OnEvent
	{
		GotoState = "Second",
		Conditions =
		{
		},
		Actions =
		{
		},
	},
}
State
{
	StateName = "Second",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DraghLurA1_TheTraps"},
			EntityFlagIsFalse {Name = "ef_P407_TrapActive"}
		},
		Actions =
		{
			DialogSetEnabled {Tag = myTag},
		}
	},

	-- Wenn die Falle Aktiv ist und eine Einheit in der Nähe, dann macht es bumm und alle fallen tot um
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P407_TrapActive"},
			OR
			{
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Player2", Range = triggerRange},
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Enemy1", Range = triggerRange},
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Enemy2", Range = triggerRange},
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Enemy3", Range = triggerRange},
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Enemy4", Range = triggerRange},
				PlayerFigureIsInRangeToEntity {TargetTag = myTag, Player = "pl_Siege", Range = triggerRange},
				FigureIsInRangeToEntity {TargetTag = myTag, Tag = "Camp1", Range = triggerRange},
				FigureIsInRangeToEntity {TargetTag = myTag, Tag = "Camp2", Range = triggerRange},
				FigureIsInRangeToEntity {TargetTag = myTag, Tag = "Camp3", Range = triggerRange},
				FigureIsInRangeToEntity {TargetTag = myTag, Tag = "Camp4", Range = triggerRange},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P407_Explode"},
			EntityFlagSetFalse {Name = "ef_P407_TrapActive"},
			EntityFlagSetTrue {Name = "ef_P407_FirstTriggered"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_DL_magictrap_hit", X = myX, Y = 10, Z = myY, MaxRange = default, FallOffRange = default},
			EffectStartAddon1 {Tag = myTag, File = "Effect_Misc_Firetrap"},
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 1},
			EntityFlagIsTrue {Name = "ef_P407_FirstTriggered"},
		},
		Actions =
		{
			PlayerRtsUnitKillInRange	{Player = "pl_Player2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy1", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy3", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy4", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Siege", X = myX, Y = myY, Range = killRange},
			EntityFlagSetTrue {Name = "ef_P407_SecondTriggered"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_DL_magictrap_hit", X = myX, Y = 10, Z = myY, MaxRange = default, FallOffRange = default},
			EffectStartAddon1 {Tag = myTag, File = "Effect_Misc_Firetrap"},
			EntityFlagSetFalse {Name = "ef_P407_FirstTriggered"},
    	}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 3},
			EntityFlagIsTrue {Name = "ef_P407_SecondTriggered"},
		},
		Actions =
		{
			PlayerRtsUnitKillInRange	{Player = "pl_Player2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy1", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy3", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy4", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Siege", X = myX, Y = myY, Range = killRange},
			EntityFlagSetTrue {Name = "ef_P407_ThirdTriggered"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_DL_magictrap_hit", X = myX, Y = 10, Z = myY, MaxRange = default, FallOffRange = default},
			EffectStartAddon1 {Tag = myTag, File = "Effect_Misc_Firetrap"},
			EntityFlagSetFalse {Name = "ef_P407_SecondTriggered"},
    	}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 5},
			EntityFlagIsTrue {Name = "ef_P407_ThirdTriggered"},
		},
		Actions =
		{
			PlayerRtsUnitKillInRange	{Player = "pl_Player2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy1", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy2", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy3", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Enemy4", X = myX, Y = myY, Range = killRange},
			PlayerRtsUnitKillInRange	{Player = "pl_Siege", X = myX, Y = myY, Range = killRange},
			EntityTimerStop {Name = "et_P407_Explode"},
			DialogSetEnabled {Tag = myTag},
			DialogTypeSetMainQuest {},
			MapValueDecrease {Name = "mv_P407_NumberOfActiveTraps"},
			EffectStop {Tag = myTag},
			MapValueDecrease {Name = "mv_P407_ObsidianEyes"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "_OutrcyNoteNpc", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
    		FigureOutcry {Tag = "_OutrcyNoteNpc", TextTag = "TrapHint1"},
    		FigureVanish {Tag = "_OutrcyNoteNpc"},
    		EntityFlagSetFalse {Name = "ef_P407_ThirdTriggered"},
    	}
	},
	-- Wenn einer von den gescripteten Gebäudezerstörern in der Nähe ist auch killen
	OnEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = myTag, TargetTag = "Camp1", Range = killRange},
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 1},
		},
		Actions =
		{
			FigureKill {Tag = "Camp1"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = myTag, TargetTag = "Camp2", Range = killRange},
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 1},
		},
		Actions =
		{
			FigureKill {Tag = "Camp2"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = myTag, TargetTag = "Camp3", Range = killRange},
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 1},
		},
		Actions =
		{
			FigureKill {Tag = "Camp3"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = myTag, TargetTag = "Camp4", Range = killRange},
			EntityTimerIsElapsed {Name = "et_P407_Explode", Seconds = 1},
		},
		Actions =
		{
			FigureKill {Tag = "Camp4"},
		},
	},
	-- Wenn die Quest bekannt wird muss das erste Mal der Merker gesetzt werden, danach geht es über das Toggle Event
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		EntityFlagIsFalse {Name = "ef_P407_TrapActive"},
	--		AvatarHasItemMisc {ItemId = 280, Amount = 1},
	--	},
	--	Actions =
	--	{
	--		ObjectSpawn {Tag = myTag.."Marker", X = myX + myXOffset, Y = myY+ myYOffset, ObjectId = 518},
	--		EntityFlagSetTrue {Name = "ef_P407_ImSpawned"},
	--	},
	--},
	-- Wenn die Falle an ist erscheint kein Marker, dafür das Objekt entsprechend des zustandes spawnen/vanishen
	OnToggleEvent
	{
		OffConditions =
		{
			OR
			{
				EntityFlagIsTrue {Name = "ef_P407_TrapActive"},
				MapValueIsGreaterOrEqual {Value = 2, Name = "mv_P407_NumberOfActiveTraps"}
			},
		},
		OffActions =
		{
			ObjectVanish {Tag = myTag.."Marker"},
			EntityFlagSetFalse {Name = "ef_P407_ImSpawned"},
		},
		OnConditions =
		{
			MapValueIsLess {Value = 2, Name = "mv_P407_NumberOfActiveTraps"},
			EntityFlagIsFalse {Name = "ef_P407_TrapActive"},
			EntityFlagIsFalse {Name = "ef_P407_ImSpawned"},
			QuestIsActive {Quest = "DraghLurA1_TheTraps"}
		},
		OnActions =
		{
			ObjectSpawn {Tag = myTag.."Marker", X = myX + myXOffset, Y = myY+ myYOffset, ObjectId = 518},
		},
	},
	

}