local iCatLevel = 10
local iBearLevel = 10
local iServantLevel = 12
local iHaakhLevel = 11

local iNumSpawnUnits = 8
local sSpawnUnitTag = "SQWisper_Cat"

local tActions_Spawn = {}

for i = 1, iNumSpawnUnits do
	-- verschiedene unit id's für Kätzchen in Tabelle ablegen
	local tUnitIds = {76, 122, 125, 187, 527}
	
	-- Zufallswert zwischen 1 und Anzahl Werte in UnitId Tabelle generieren
	local iRandom = math.random(1, table.getn(tUnitIds))
	
	table.insert(tActions_Spawn, FigureNpcSpawnToEntity	
	{
		Tag = sSpawnUnitTag .. i, 
		Level = iCatLevel, 
		UnitId = tUnitIds[iRandom], -- zufällige unit id auswählen
		TargetTag = "pl_HumanHeroWhisper", 
		Team = "tm_Team2",
	})
end


local tConditions_SpawnDead = {}
table.insert(tConditions_SpawnDead, FigureIsAlive{Tag = "pl_HumanHeroWhisper"})

for i = 1, iNumSpawnUnits do
	table.insert(tConditions_SpawnDead, FigureIsDead{Tag = sSpawnUnitTag .. i})
end


if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroWisper"},
			DebugQuestionYes	{Question = "Hero Sidequest von Whisper aktivieren?", Caption = "HeroQuest von Whisper"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroWisper"},
			QuestSetActive	{Quest = "HeroWisperThreat"},
    	},
    };
end

State
{
	StateName = "INIT",
	
	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperThreat"},
		},
		Actions =
		{
    	},
    	GotoState = "Attack1",
    },
};

State
{
	StateName = "Attack1",
	
	-- starte den spawntimer nach Caine attacke
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_SpawnEnemiesAroundWhisper"},
		},
	},

	-- Wenn delay abgelaufen, spawnen die Wölfe um Wisper
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SpawnEnemiesAroundWhisper", Seconds = 20},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			FigureHasNotHate	{Tag = "pl_HumanHeroWhisper"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroWhisper"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
	    	FigureOutcry	{TextTag = "SQWisperAttack1", Tag = "pl_HumanHeroWhisper"},
	    	FigureOutcry	{TextTag = "SQWisperAttack2", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWisperAttack3", Tag = "pl_HumanHeroWhisper"},
			unpack(tActions_Spawn)
		},
    	GotoState = "Attack1Dead",
    },
};


State
{
	StateName = "Attack1Dead",

	OnEvent
	{
		Conditions = tConditions_SpawnDead,
		Actions = 
		{
			EntityTimerStart	{Name = "et_SpawnEnemiesAroundWhisper"},
		},
    	GotoState = "Attack2Dead",	-- nur eine welle spawnen!
    },
};


State
{
	StateName = "Attack2",
	
	-- Wenn delay abgelaufen, spawnen die Katzen um Wisper
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SpawnEnemiesAroundWhisper", Seconds = 20},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			FigureHasNotHate	{Tag = "pl_HumanHeroWhisper"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroWhisper"},
			AvatarIsNotTalking	{},
		},
			Actions = tActions_Spawn,
    	GotoState = "Attack2Dead",
    },
};

State
{
	StateName = "Attack2Dead",

	OnEvent
	{
		Conditions = tConditions_SpawnDead,
		Actions = 
		{
			EntityTimerStart	{Name = "et_SpawnEnemiesAroundWhisper"},
			FigureOutcry	{TextTag = "SQWisperAttack4", Tag = "pl_HumanHeroWhisper"},
		},
    	GotoState = "Servant",
    	
    },
};


State
{
	StateName = "Servant",
	
	-- Wenn delay abgelaufen, spawnt Diener von Haakh
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SpawnEnemiesAroundWhisper", Seconds = 5},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			--FigureHasNotHate	{Tag = "pl_HumanHeroWhisper"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Servant", Level = iServantLevel, UnitId = 1174, TargetTag = "pl_HumanHeroWhisper", Team = "tm_Team2"},
			FigureLootItemMiscAdd	{Tag = "SQWisper_Servant", DropChance = 100, ItemId = 315},
		},
		GotoState = "FoundTotem",
    },
};

State
{
	StateName = "FoundTotem",
	
	-- Totem von Haakh gelootet?
	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			AvatarHasItemMisc	{ItemId = 315, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWisper1", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SQWisper3", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper4", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWisper5", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper6", Tag = "pl_HumanHeroWhisper"},
			--FigureOutcry	{TextTag = "SQWisper7", Tag = "pl_HumanHeroWhisper"},

			QuestSetSolved	{Quest = "HeroWisperThreat"},
			QuestSetActive	{Quest = "HeroWisperGotoLocation"},
		},
		GotoState = "SpawnHaakh",
    },
};


local WhisperRange = 12
local OutOfRange = 30

State
{
	StateName = "SpawnHaakh",
	
	-- Haakh spawnen
	OnEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_Location", Range = WhisperRange},
			
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQWisper_Location", Range = OutOfRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "SQWisper_Location", Range = OutOfRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWisper_Location", Range = OutOfRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQWisper_Location", Range = OutOfRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "SQWisper_Location", Range = OutOfRange},
			PlayerUnitRtsIsNotInRangeToEntity	{Player = "pl_Human", UnitId = 0, Range = OutOfRange, TargetTag = "SQWisper_Location"},

			FigureIsDead	{Tag = "SQWisper_Bear1"},
			FigureIsDead	{Tag = "SQWisper_Bear2"},
			FigureIsDead	{Tag = "SQWisper_Bear3"},
			FigureIsDead	{Tag = "SQWisper_Bear4"},

			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Haakh", Level = iHaakhLevel, UnitId = 1175, TargetTag = "SQWisper_Location", Team = "tm_Team2"},
			FigureLootItemMiscAdd	{Tag = "SQWisper_Haakh", DropChance = 100, ItemId = 316},
			FigureLootItemEquipmentAdd	{Tag = "SQWisper_Haakh", DropChance = 100, ItemId = 1168},
			FigureAbilityAdd	{Tag = "SQWisper_Haakh", AbilityId = Ability.Immortal},
			FigureHoldPosition	{Tag = "SQWisper_Haakh"},
		},
		GotoState = "HaakhAlive",
    },
};


State
{
	StateName = "HaakhAlive",
	
    -- Töte Haakh Quest aktivieren bei erstem Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperGotoLocation"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "HeroWisperGotoLocation"},
			QuestSetActive	{Quest = "HeroWisperKillHaakh"},
			FigureOutcry	{TextTag = "SQWisper10", Tag = "SQWisper_Haakh"},
		},
    },

	-- Haakh vanishen bei Annäherung von Spielereinheiten
	OnEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				PlayerUnitRtsIsInRangeToEntity	{Player = "pl_Human", UnitId = 0, TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
				--FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWisper11", Tag = "SQWisper_Haakh"},
			EffectStartAtEntityPosition	{Tag = "SQWisper_Haakh", File = "Effect_DeSpawn_Unit"},

			FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear1", Level = iBearLevel, UnitId = 77, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear2", Level = iBearLevel, UnitId = 697, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear3", Level = iBearLevel, UnitId = 77, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear4", Level = iBearLevel, UnitId = 697, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},

			FigureVanish	{Tag = "SQWisper_Haakh"},
		},
		GotoState = "SpawnHaakh",
    },
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_Haakh", Range = OutOfRange - 5},
	--	},
	--	Actions = 
	--	{
	--		EffectStartAtEntityPosition	{Tag = "SQWisper_Haakh", File = "Effect_DeSpawn_Unit"},
    --
	--		--FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear1", Level = iBearLevel, UnitId = 77, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
	--		--FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear2", Level = iBearLevel, UnitId = 697, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
	--		--FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear3", Level = iBearLevel, UnitId = 77, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
	--		--FigureNpcSpawnToEntity	{Tag = "SQWisper_Bear4", Level = iBearLevel, UnitId = 697, TargetTag = "SQWisper_Haakh", Team = "tm_Team2"},
    --
	--		FigureVanish	{Tag = "SQWisper_Haakh"},
	--	},
	--	GotoState = "SpawnHaakh",
    --},

	-- Haakh ist gestorben
	OnEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "SQWisper_Haakh", Percent = 11},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "SQWisper_Haakh", Team = "tm_Team1"},
			FigureHateClear	{Tag = "SQWisper_Haakh"},
			FigureHateClear	{Tag = "pl_HumanHeroWhisper"},
			FigureStop	{Tag = "SQWisper_Haakh"},
			FigureStop	{Tag = "pl_HumanHeroWhisper"},
			FigureAbilityRemove	{Tag = "SQWisper_Haakh", AbilityId = Ability.Immortal},

			FigureOutcry	{TextTag = "SQWisper20", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper21", Tag = "SQWisper_Haakh"},
			FigureOutcry	{TextTag = "SQWisper22", Tag = "SQWisper_Haakh"},
			FigureOutcry	{TextTag = "SQWisper23", Tag = "SQWisper_Haakh"},
			FigureOutcry	{TextTag = "SQWisper24", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart	{Name = "et_HaakhDies"},
			EntityTimerStart	{Name = "et_HaakhHealthLow"},
		},
		GotoState = "FinalOutcries",
    },
};


State
{
	StateName = "FinalOutcries",
	
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HaakhHealthLow", Seconds = 1},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_HaakhHealthLow"},
			FigureHealthSubtract	{Tag = "SQWisper_Haakh", Percent = 1},
		},
    },
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HaakhDies", Seconds = 30},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWisper25", Tag = "SQWisper_Haakh"},
			FigureKill	{Tag = "SQWisper_Haakh"},
			PlayerNPCKillCountIncrease	{UnitId = 1175},
			QuestSetSolved	{Quest = "HeroWisperKillHaakh"},
			QuestSetActive	{Quest = "HeroWisperSealSecret"},
		},
    },

	-- Haakh ist gestorben
	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "HeroWisperKillHaakh"},
			AvatarHasItemMisc	{ItemId = 316, Amount = 1},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWisper26", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper27", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWisper28", Tag = "pl_HumanHeroWhisper"},
			AvatarItemMiscTake	{ItemId = 315, Amount = 1},
		},
		GotoState = "END",
    },
};

State	{StateName = "END"};
