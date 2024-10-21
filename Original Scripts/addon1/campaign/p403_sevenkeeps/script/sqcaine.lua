local Victims = 
{
	{Name = "Ainur", UnitId = 1154, Contract = 310, Reward = 307, GenericLevel = 18, GenericSkillParole = 0, GenericSkillProsecute = 0},
	{Name = "Eisen", UnitId = 1155, Contract = 311, Reward = 308, GenericLevel = 21, GenericSkillParole = 0, GenericSkillProsecute = 0},
	{Name = "Una",   UnitId = 1156, Contract = 312, Reward = 309, GenericLevel = 24, GenericSkillParole = 0, GenericSkillProsecute = 0},
}

if DEBUG and QUESTDEBUG then
	OnEvent
	{
		EventName = "GotoMain",
		Conditions = 
		{
			DebugQuestionYes	{Caption = "Nebenquesten von Held Caine", Question = "Gleich alle 3 Questen aktivieren? (momentan kein anderer Queststart möglich)"},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "pl_HumanAvatar"},

			QuestSetActive	{Quest = "HeroCaineVictim1"},
			QuestSetActive	{Quest = "HeroCaineVictim1Talk"},
			QuestSetActive	{Quest = "HeroCaineVictim2"},
			QuestSetActive	{Quest = "HeroCaineVictim2Talk"},
			QuestSetActive	{Quest = "HeroCaineVictim3"},
			QuestSetActive	{Quest = "HeroCaineVictim3Talk"},

			MapFlagSetTrue	{Name = "mf_EnableDialog_Ainur"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Eisen"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Una"},
			
			AvatarItemMiscGive	{ItemId = 310, Amount = 1},
			AvatarItemMiscGive	{ItemId = 311, Amount = 1},
			AvatarItemMiscGive	{ItemId = 312, Amount = 1},
		},
	};
end

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "Init",
		Conditions = 
		{
		},
		Actions = 
		{
			FigureHoldPosition	{Tag = "SQCaine_Ainur"},
			FigureHoldPosition	{Tag = "SQCaine_Eisen"},
			FigureHoldPosition	{Tag = "SQCaine_Una"},
			FigureSwappingDisable	{Tag = "SQCaine_Ainur"},
			FigureSwappingDisable	{Tag = "SQCaine_Eisen"},
			FigureSwappingDisable	{Tag = "SQCaine_Una"},
		},
	};

	OnEvent
	{
		EventName = "GotoMain",
		Conditions = 
		{
			OR
			{
				QuestIsActive 	{Quest = "HeroCaineVictim1"},
				QuestIsActive 	{Quest = "HeroCaineVictim2"},
				QuestIsActive 	{Quest = "HeroCaineVictim3"},
			},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Delay"},
			--DebugMessage	{Message = "SQ Caine begins..."},
		},
		GotoState = "MAIN",
	};
};


for i, Params in ipairs(Victims) do
	---------------------------------------------------------
	-- Dialoge anschalten
	---------------------------------------------------------
	OnEvent
	{
		EventName = "DialogEnable_" .. Params.Name,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EnableDialog_" .. Params.Name},
			FigureIsAlive	{Tag = "SQCaine_" .. Params.Name},
			OR
			{
				QuestIsActive 	{Quest = "HeroCaineVictim" .. i .. "Talk"},
				QuestIsActive 	{Quest = "HeroCaineVictim" .. i .. "Judge"},
			},
			EntityTimerIsElapsed	{Name = "et_Delay", Seconds = 0.3},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_EnableDialog_" .. Params.Name},
			DialogSetEnabled	{Tag = "SQCaine_" .. Params.Name},
			--DebugMessage	{Message = "DialogSetEnabled	SQCaine_" .. Params.Name},
		},
	};

	---------------------------------------------------------
	-- Opfer richten oder begnadigen (seperater State)
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "Judge" .. Params.Name,
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_SQCaine_GotProsecuted_" .. Params.Name},
				MapFlagIsTrue	{Name = "mf_SQCaine_GotParoled_" .. Params.Name},
			},
		},
		Actions = 
		{
			-- Dialoge kurzzeitig abschalten
			DialogSetDisabled	{Tag = "SQCaine_Ainur"},
			DialogSetDisabled	{Tag = "SQCaine_Eisen"},
			DialogSetDisabled	{Tag = "SQCaine_Una"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Ainur"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Eisen"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Una"},
		},
		GotoState = "Judge" .. Params.Name,
	};
end

State
{
	StateName = "MAIN",

	---------------------------------------------------------
	-- Dialoge initial anschalten
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "StartQuestVictim1",
		Conditions = 
		{
			QuestIsActive 	{Quest = "HeroCaineVictim1"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EnableDialog_Ainur"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "StartQuestVictim2",
		Conditions = 
		{
			QuestIsActive 	{Quest = "HeroCaineVictim2"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EnableDialog_Eisen"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "StartQuestVictim3",
		Conditions = 
		{
			QuestIsActive 	{Quest = "HeroCaineVictim3"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EnableDialog_Una"},
		},
	};

	---------------------------------------------------------
	-- Questschritt "Beweise sammeln" beendet
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "EnoughEvidence_Ainur",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQCaine_EvidenceCounter_Ainur", Value = 4},
		},
		Actions = 
		{
			QuestSetSolved 	{Quest = "HeroCaineVictim1Evidence"},
			QuestSetActive 	{Quest = "HeroCaineVictim1Judge"},
			DialogSetEnabled	{Tag = "SQCaine_Ainur"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnoughEvidence_Eisenbauch",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQCaine_EvidenceCounter_Eisen", Value = 7},
		},
		Actions = 
		{
			QuestSetSolved 	{Quest = "HeroCaineVictim2Evidence"},
			QuestSetActive 	{Quest = "HeroCaineVictim2Lure"},
			DialogSetEnabled	{Tag = "SQCaine_Bait"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnoughEvidence_Una",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQCaine_EvidenceCounter_Una", Value = 9},
		},
		Actions = 
		{
			QuestSetSolved 	{Quest = "HeroCaineVictim3Evidence"},
			QuestSetActive 	{Quest = "HeroCaineVictim3Lure"},
			DialogSetEnabled	{Tag = "SQCaine_Table"},
		},
	};

	---------------------------------------------------------
	-- Eisenbauch weglocken
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "LuringEisenbauchAway",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_Luring_Eisen"},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "SQCaine_Bait", TargetTag = "SQCaine_Eisen"},

			-- Dialoge kurzzeitig abschalten
			DialogSetDisabled	{Tag = "SQCaine_Ainur"},
			DialogSetDisabled	{Tag = "SQCaine_Eisen"},
			DialogSetDisabled	{Tag = "SQCaine_Una"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Ainur"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Eisen"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Una"},
		},
		GotoState = "LuringEisenbauch",
	};

	---------------------------------------------------------
	-- Una weglocken
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "LuringUnaAway",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_Luring_Una"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_SQCaine_Luring_Una_Delay"},

			-- Dialoge kurzzeitig abschalten
			DialogSetDisabled	{Tag = "SQCaine_Ainur"},
			DialogSetDisabled	{Tag = "SQCaine_Eisen"},
			DialogSetDisabled	{Tag = "SQCaine_Una"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Ainur"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Eisen"},
			MapFlagSetTrue	{Name = "mf_EnableDialog_Una"},
		},
		GotoState = "LuringUna",
	};

	---------------------------------------------------------
	-- Quest komplett abgeschlossen
	---------------------------------------------------------
	OnEvent
	{
		EventName = "QuestComplete_RewardAvatar",
		Conditions = 
		{
			QuestIsSolved 	{Quest = "HeroCaineVictim3"},
			QuestIsSolved 	{Quest = "HeroCaineVictim2"},
			QuestIsSolved 	{Quest = "HeroCaineVictim1"},
			AvatarHasItemMisc	{ItemId = 307, Amount = 1},
			AvatarHasItemMisc	{ItemId = 308, Amount = 1},
			AvatarHasItemMisc	{ItemId = 309, Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 400},
			DebugMessage	{Message = "Caine Quest completed"},
		},
		GotoState = "REWARD",
	};
};

State
{
	StateName = "REWARD",
	
	---------------------------------------------------------
	-- Belohnung geben, je nach Urteilen
	---------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "QuestFinished_Mercyful",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQCaine_ParoleCounter", Value = 3},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQCaine_GiveMercyReward"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "QuestFinished_Justice",
		Conditions = 
		{
			MapValueIsGreaterOrEqual	{Name = "mv_SQCaine_ParoleCounter", Value = 1},
			MapValueIsLessOrEqual		{Name = "mv_SQCaine_ParoleCounter", Value = 2},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQCaine_GiveJusticeReward"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "QuestFinished_Bloodthirsty",
		Conditions = 
		{
			MapValueIsEqual		{Name = "mv_SQCaine_ParoleCounter", Value = 0},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQCaine_GiveExecutionReward"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "QuestComplete_AllDoneTakeItems",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_SQCaine_GiveMercyReward"},
				MapFlagIsTrue	{Name = "mf_SQCaine_GiveJusticeReward"},
				MapFlagIsTrue	{Name = "mf_SQCaine_GiveExecutionReward"},
			},
		},
		Actions = 
		{
			AvatarItemMiscTake	{ItemId = 307, Amount = 1},
			AvatarItemMiscTake	{ItemId = 308, Amount = 1},
			AvatarItemMiscTake	{ItemId = 309, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P400_GiveHeroAbilityToCaine"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaineSolved1"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaineSolved2"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "SQCaineSolved3"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "SQCaineSolved4"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaineSolved5"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaineSolved6"},
		},
		GotoState = "ENDE",
	};
};

State{StateName = "ENDE"};


---------------------------------------------------------
-- States für den Strafvollzug
---------------------------------------------------------
for i, Params in ipairs(Victims) do
	State
	{
		StateName = "Judge" .. Params.Name,
	
		-- Hinrichtung
		OnOneTimeEvent
		{
			EventName = "CaineTeleportsTo_" .. Params.Name,
			Conditions = 
			{
				FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			},
			Actions = 
			{
				FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			},
		};
		OnOneTimeEvent
		{
			EventName = "CaineTeleportsTo_" .. Params.Name,
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQCaine_GotProsecuted_" .. Params.Name},
			},
			Actions = 
			{
				FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			},
		};
		OnOneTimeEvent
		{
			EventName = "CaineTeleportsTo_" .. Params.Name,
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQCaine_GotProsecuted_" .. Params.Name},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				FigureWalkToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQCaine_" .. Params.Name},
				EntityFlagSetTrue	{Name = "ef_CaineWalksTo_" .. Params.Name},
				FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine"..i.."0"},
				FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine"..i.."1"},
			},
		};
		OnOneTimeEvent
		{
			EventName = "CaineTeleportsTo_" .. Params.Name,
			Conditions = 
			{
				EntityFlagIsTrue	{Name = "ef_CaineWalksTo_" .. Params.Name},
				FigureIsIdle	{Tag = "pl_HumanHeroCaine"},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQCaine_" .. Params.Name},
				FigureDirectionSetToEntity	{TargetTag = "pl_HumanHeroCaine", Tag = "SQCaine_" .. Params.Name},
				EntityFlagSetTrue	{Name = "ef_CaineGetsToKill_" .. Params.Name},
			},
		};
		OnOneTimeEvent
		{
			EventName = "CaineAttacks_" .. Params.Name,
			Conditions = 
			{
				EntityFlagIsTrue	{Name = "ef_CaineGetsToKill_" .. Params.Name},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				EntityTimerStart	{Name = "et_Kill" .. Params.Name},
				FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQCaine_" .. Params.Name},
				FigureDirectionSetToEntity	{TargetTag = "pl_HumanHeroCaine", Tag = "SQCaine_" .. Params.Name},
				FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_1.ska"},
			},
		};
		OnOneTimeEvent
		{
			EventName = "CaineKilled_" .. Params.Name,
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_Kill" .. Params.Name, Seconds = 0.7},
			},
			Actions = 
			{
				PlayerNPCKillCountIncrease	{UnitId = Params.UnitId},
				QuestSetSolved 	{Quest = "HeroCaineVictim" .. i .. "Judge"},
				QuestSetSolved 	{Quest = "HeroCaineVictim" .. i},

				FigureLootItemMiscAdd	{Tag = "SQCaine_" .. Params.Name, DropChance = 100, ItemId = Params.Reward},
				FigureLootItemGenericAdd	{Tag = "SQCaine_" .. Params.Name, DropChance = 100, Level = Params.GenericLevel, Skill = Params.GenericSkillProsecute},
				FigureKill	{Tag = "SQCaine_" .. Params.Name},
			},
		};
		OnOneTimePlayHeroAnimEvent
		{
			EventName = "KneelDown",
			Tag = "pl_HumanHeroCaine",
			Anim = "emote_kneel_down",
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_Kill" .. Params.Name, Seconds = 2.6},
			},
			Actions = 
			{
				EntityTimerStart {Name = "et_AnimPlayA"},
			},
		};
		OnOneTimePlayHeroAnimEvent
		{
			EventName = "KneelHold",
			Tag = "pl_HumanHeroCaine",
			Anim = "emote_kneel_hold",
			Conditions = 
			{
				EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 2.17},
			},
			Actions = 
			{
				EntityTimerStart {Name = "et_AnimPlayB"},
			},
		};
		OnOneTimePlayHeroAnimEvent
		{
			EventName = "KneelUp",
			Tag = "pl_HumanHeroCaine",
			Anim = "emote_kneel_up",
			Conditions = 
			{
				EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 2},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_CaineHasKilled_" .. Params.Name},
			},
		};
		OnEvent
		{
			EventName = "BackToMain",
			Conditions = 
			{
				EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 4.5},
			},
			Actions = 
			{
				EntityTimerStop {Name = "et_AnimPlayA"},
				EntityTimerStop {Name = "et_AnimPlayB"},
				EntityTimerStop	{Name = "et_Kill" .. Params.Name},
				
				FigureWalkToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
				AvatarItemMiscTake	{ItemId = Params.Contract, Amount = 1},
			},
			GotoState = "MAIN",
		};
	
		-- Begnadigung
		OnEvent
		{
			EventName = "AvatarParoled_" .. Params.Name,
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQCaine_GotParoled_" .. Params.Name},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine"..i.."2"},
				
				MapValueIncrease	{Name = "mv_SQCaine_ParoleCounter"},
				QuestSetSolved 	{Quest = "HeroCaineVictim" .. i .. "Judge"},
				QuestSetSolved 	{Quest = "HeroCaineVictim" .. i},
				AvatarItemMiscTake	{ItemId = Params.Contract, Amount = 1},
				--AvatarItemMiscGive	{ItemId = Params.Reward, Amount = 1},
				
				ObjectSpawnToEntity	{ObjectId = 1433, TargetTag = "SQCaine_"..Params.Name.."_SpawnLoot", Direction = math.random(0,360), Tag = "SQCaine_" .. Params.Name .. "_Reward"},
				ObjectLootItemMiscAdd	{Tag = "SQCaine_" .. Params.Name .. "_Reward", DropChance = 100, ItemId = Params.Reward},
				ObjectLootItemGenericAdd	{Tag = "SQCaine_" .. Params.Name .. "_Reward", DropChance = 100, Level = Params.GenericLevel, Skill = Params.GenericSkillParole},
				--DebugMessage	{Caption = "Marc kommt es so vor als würde hier ein Item nicht übergeben worden sein würde soll ...", Message = "Misc Item " .. Params.Reward .. " übergeben! Bruäääärgh!"},
				
				FigureStop	{Tag = "SQCaine_" .. Params.Name},
				FigureSwappingEnable	{Tag = "SQCaine_" .. Params.Name},
				FigureRoamingEnable	{Tag = "SQCaine_" .. Params.Name},
			},
			GotoState = "MAIN",
		};
	};
end


State
{
	StateName = "LuringEisenbauch",
	
	OnOneTimeEvent
	{
		EventName = "LookAtEachOther",
		Conditions = 
		{
			FigureIsIdle	{Tag = "SQCaine_Bait"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EisenbauchTalkingWithAssistant"},
			FigureDirectionSetToEntity	{Tag = "SQCaine_Bait", TargetTag = "SQCaine_Eisen"},
			FigureDirectionSetToEntity	{TargetTag = "SQCaine_Bait", Tag = "SQCaine_Eisen"},
			EntityTimerStart	{Name = "et_EisenbauchGotoMeetingPlace"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EisenbauchGotoMeetingPlace",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_EisenbauchGotoMeetingPlace", Seconds = 6},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "SQCaine_Eisen", TargetTag = "SQCaine_EisenMarker"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EisenbauchAtMeetingPlace",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "SQCaine_Eisen", TargetTag = "SQCaine_EisenMarker", Range = 2},
		},
		Actions = 
		{
			FigureStop	{Tag = "SQCaine_Eisen"},
			FigureDirectionSet	{Tag = "SQCaine_Eisen", Direction = 0},
			QuestSetSolved	{Quest = "HeroCaineVictim2Lure"},
			QuestSetActive	{Quest = "HeroCaineVictim2Judge"},
			DialogSetEnabled	{Tag = "SQCaine_Eisen"},
		},
		GotoState = "MAIN",
	};
};


State
{
	StateName = "LuringUna",

	OnOneTimeEvent
	{
		EventName = "UnaOutcry",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCaine_Luring_Una_Delay", Seconds = 4},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "SQCaine_Una", TargetTag = "SQCaine_Table"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "UnaAtMeetingPlace",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "SQCaine_Una", TargetTag = "SQCaine_Table", Range = 3},
		},
		Actions = 
		{
			FigureStop	{Tag = "SQCaine_Una"},
			FigureDirectionSetToEntity	{Tag = "SQCaine_Una", TargetTag = "SQCaine_Table"},
			QuestSetSolved	{Quest = "HeroCaineVictim3Lure"},
			QuestSetActive	{Quest = "HeroCaineVictim3Judge"},
			DialogSetEnabled	{Tag = "SQCaine_Una"},
		},
		GotoState = "MAIN",
	};
};
