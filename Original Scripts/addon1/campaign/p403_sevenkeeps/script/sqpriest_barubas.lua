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
			LeverSetOff	{Tag = "SQPriest_GraveMarcia"},
			LeverSetOff	{Tag = "SQPriest_GraveElyria"},
			LeverSetOff	{Tag = "SQPriest_GraveJoshua"},
			LeverSetOff	{Tag = "SQPriest_GraveMo"},
			LeverSetDisabled	{Tag = "SQPriest_GraveMarcia"},
			LeverSetDisabled	{Tag = "SQPriest_GraveElyria"},
			LeverSetDisabled	{Tag = "SQPriest_GraveJoshua"},
			LeverSetDisabled	{Tag = "SQPriest_GraveMo"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal},
		},
	};

	OnEvent
	{
		EventName = "DialogEnableFirstTime",
		Conditions = 
		{
			QuestIsSolved {Quest = "SevenkeepsA1_BreakSiege"},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_EnableDialog"},
			LeverSetOff	{Tag = "SQPriest_GraveMarcia"},
			LeverSetOff	{Tag = "SQPriest_GraveElyria"},
			LeverSetOff	{Tag = "SQPriest_GraveJoshua"},
			LeverSetOff	{Tag = "SQPriest_GraveMo"},
			LeverSetDisabled	{Tag = "SQPriest_GraveMarcia"},
			LeverSetDisabled	{Tag = "SQPriest_GraveElyria"},
			LeverSetDisabled	{Tag = "SQPriest_GraveJoshua"},
			LeverSetDisabled	{Tag = "SQPriest_GraveMo"},
		},
		GotoState = "WaitForQuestStart",
	};
};

State
{
	StateName = "WaitForQuestStart",

	OnEvent
	{
		EventName = "BarubasFollows",
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_GoForAWalkWithAvatar"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_GoForAWalkWithAvatar"},
			EntityTimerStart	{Name = "et_BarubasFollowsForSomeTime"},
			FigureStop	{},
			FigureFollowEntity	{TargetTag = "pl_HumanAvatar"},
			DialogSetDisabled	{},
		},
	};

	OnEvent
	{
		EventName = "BarubasStopsFollowing",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_BarubasFollowsForSomeTime", Seconds = 20},
			QuestIsActive	{Quest = "PriestEpicDeath"},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_BarubasFollowsForSomeTime"},
			FigureWalk	{X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetTrue	{Name = "ef_EnableDialog"},
		},
	};
	OnEvent
	{
		EventName = "BarubasStopsFollowing",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_BarubasFollowsForSomeTime", Seconds = 120},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_BarubasFollowsForSomeTime"},
			FigureWalk	{X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetTrue	{Name = "ef_EnableDialog"},
		},
	};

	OnEvent
	{
		EventName = "DialogEnable",
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_EnableDialog"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_EnableDialog"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
	};
	
	OnEvent
	{
		EventName = "BeginFight",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_FightingBarubas"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			EntityValueSet	{Name = "ev_Gestalt", Value = 1},
			FigureRoamingDisable	{},
		},
		GotoState = "FightGestalt1",
	};
};

local tLeverSetOff = {}
local tLeverTags =
{
	"SQPriest_GraveMarcia",
	"SQPriest_GraveElyria",
	"SQPriest_GraveJoshua",
	"SQPriest_GraveMo",
}
local tGhostTags =
{
	"SQPriest_Marcia",
	"SQPriest_Elyria",
	"SQPriest_Joshua",
	"SQPriest_Mo",
}

local iBaseGestalt = 1297

for iGestalt = 1, 4 do
	for iLever, sLeverTag in tLeverTags do
		table.insert(tLeverSetOff, LeverSetOff	{Tag = sLeverTag})
		table.insert(tLeverSetOff, LeverSetDisabled	{Tag = sLeverTag})
	end
	
	for iLever, sLeverTag in tLeverTags do
		-- es wurde der richtige Hebel betätigt:
		if iLever == iGestalt then
			OnEvent
			{
				EventName = "PulledCorrectLever",
				Conditions = 
				{
					LeverIsOn	{Tag = sLeverTag},
				},
				Actions = 
				{
					--DebugMessage	{Message = "Hebel " .. sLeverTag .. " betätigt - KORREKTER Hebel!"},
					EntityTimerStart	{Name = "et_EnableLevers"},
					EntityFlagSetTrue	{Name = "ef_AvatarDefeatedGestalt" .. iGestalt},
					unpack(tLeverSetOff)	-- muss die letzte Action sein!
				},
			};
		else	-- falscher Hebel !!!
			OnEvent
			{
				EventName = "PulledWrongLever",
				Conditions = 
				{
					LeverIsOn	{Tag = sLeverTag},
				},
				Actions = 
				{
					--DebugMessage	{Message = "Hebel " .. sLeverTag .. " betätigt - FALSCHER Hebel!"},
					FigureCastSpellToEntity	{Spell = 60, Power = 999, TargetTag = "pl_HumanAvatar"},
					EntityTimerStart	{Name = "et_EnableLevers"},
					unpack(tLeverSetOff)	-- muss die letzte Action sein!
				},
			};
		end
	end
	
	local sNextGestaltState = "FightGestalt" .. iGestalt + 1
	if iGestalt == 4 then
		sNextGestaltState = "FightOver"
	end
	
	State
	{
		StateName = "FightGestalt" .. iGestalt,
		
		OnEvent
		{
			EventName = "TransformOutcry",
			Conditions = 
			{
				EntityValueIsEqual	{Name = "ev_Gestalt", Value = iGestalt},
			},
			Actions = 
			{
				EntityValueIncrease	{Name = "ev_Gestalt"},
				EntityTimerStart	{Name = "et_WaitForOutcriesDone"},
				EntityTimerStart	{Name = "et_EnableLevers"},
				FigureOutcryImmediate	{TextTag = "SQPriest" .. iGestalt .. "1"},
			},
		};

		OnEvent
		{
			EventName = "Transform",
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_WaitForOutcriesDone", Seconds = 6},
				EntityFlagIsFalse	{Name = "ef_OutcriesDoneForGestalt" .. iGestalt},
			},
			Actions = 
			{
				EntityTimerStop	{Name = "et_WaitForOutcriesDone"},
				EntityFlagSetTrue	{Name = "ef_OutcriesDoneForGestalt" .. iGestalt},
				FigureUnitChange	{UnitId = iBaseGestalt + iGestalt, Level = GetEntityLevel()},
				FigureTeamTransfer	{Team = "tm_Team2"},
				FigureAbilityAdd	{AbilityId = Ability.Immortal},
				EntityTimerStart	{Name = "et_GiveHealth"},
			},
		};

		OnEvent
		{
			EventName = "EnableLevers",
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_EnableLevers", Seconds = 6},
				EntityFlagIsTrue	{Name = "ef_OutcriesDoneForGestalt" .. iGestalt},
			},
			Actions = 
			{
				EntityTimerStop	{Name = "et_EnableLevers"},
				LeverSetEnabled	{Tag = "SQPriest_GraveMarcia"},
				LeverSetEnabled	{Tag = "SQPriest_GraveElyria"},
				LeverSetEnabled	{Tag = "SQPriest_GraveJoshua"},
				LeverSetEnabled	{Tag = "SQPriest_GraveMo"},
			},
		};

		OnEvent
		{
			EventName = "GiveHealth",
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_GiveHealth", Seconds = 5},
				FigureHasNotHealth	{Percent = 40},
			},
			Actions = 
			{
				EntityTimerStart	{Name = "et_GiveHealth"},
				FigureCastSpellToEntity	{Spell = 52, Power = 30, TargetTag = "SQPriest_Barubas"},
			},
		};
				
		OnEvent
		{
			EventName = "ThisRoundOver",
			Conditions = 
			{
				EntityFlagIsTrue	{Name = "ef_AvatarDefeatedGestalt" .. iGestalt},
			},
			Actions = 
			{
			},
			GotoState = "AvatarDefeatedGestalt" .. iGestalt,
		};
		
		--OnEvent
		--{
		--	EventName = "StopFightAvatarLost",
		--	Conditions = 
		--	{
		--		EntityFlagIsFalse	{Name = "ef_Fighting"},
		--	},
		--	Actions = 
		--	{
		--		EntityFlagSetTrue	{Name = "ef_EnableDialog"},
		--	},
		--	GotoState = "WaitForQuestStart",
		--};	
	};

	State
	{
		StateName = "AvatarDefeatedGestalt" .. iGestalt,

		OnEvent
		{
			EventName = "ThisRoundOverBarubasNeutral",
			Conditions = 
			{
				EntityFlagIsTrue	{Name = "ef_AvatarDefeatedGestalt" .. iGestalt},
			},
			Actions = 
			{
				EntityFlagSetFalse	{Name = "ef_AvatarDefeatedGestalt" .. iGestalt},
				EntityTimerStart	{Name = "et_DefeatSequence"},

				FigureTeamTransfer	{Team = "tm_Neutral"},
				
				FigureHateClear	{},
				FigureHateClear	{Tag = "pl_HumanAvatar"},
				FigureHateClear	{Tag = "pl_HumanHeroMordecay"},
				FigureHateClear	{Tag = "pl_HumanHeroCaine"},
				FigureHateClear	{Tag = "pl_HumanHeroYasha"},
				FigureHateClear	{Tag = "pl_HumanHeroWhisper"},
				FigureHateClear	{Tag = "pl_HumanHeroWind"},
				FigureHateClear	{Tag = "pl_HumanNightsong"},
				FigureHateClear	{Tag = "pl_HumanUr"},
				FigureStop	{},
				FigureStop	{Tag = "pl_HumanAvatar"},
				FigureStop	{Tag = "pl_HumanHeroMordecay"},
				FigureStop	{Tag = "pl_HumanHeroCaine"},
				FigureStop	{Tag = "pl_HumanHeroYasha"},
				FigureStop	{Tag = "pl_HumanHeroWhisper"},
				FigureStop	{Tag = "pl_HumanHeroWind"},
				FigureStop	{Tag = "pl_HumanNightsong"},
				FigureStop	{Tag = "pl_HumanUr"},
				
				--FigureHoldPosition	{},
				FigureSwappingDisable	{},
				FigureTeleportToEntity	{Tag = tGhostTags[iGestalt], TargetTag = "SQPriest_Barubas"},
				FigureDirectionSetToEntity	{Tag = tGhostTags[iGestalt], TargetTag = "SQPriest_Barubas"},
				FigureDirectionSetToEntity	{TargetTag = tGhostTags[iGestalt], Tag = "SQPriest_Barubas"},

				EntityFlagSetTrue {Name = "ef_PlayAnimFirst"},
			},
		};

		OnPlayHeroAnimEvent
		{
			EventName = "special_prisoned",
			Tag = "SQPriest_Barubas",
			Anim = "special_prisoned",
			Conditions = 
			{
				OR
				{
					EntityFlagIsTrue {Name = "ef_PlayAnimFirst"},
					EntityTimerIsElapsed {Name = "et_RepeatAnimFirst", Seconds = 6.6},
				}
			},
			Actions = 
			{
				EntityFlagSetFalse {Name = "ef_PlayAnimFirst"},
				EntityTimerStart {Name = "et_RepeatAnimFirst"},
				MapFlagSetTrue	{Name = "mf_SQPriest_BarubasIsPrisoned"},
			},
		};
		OnPlayHeroAnimEvent
		{
			EventName = "special_prisoned_scream",
			Tag = "SQPriest_Barubas",
			Anim = "special_prisoned_scream",
			Conditions = 
			{
				OR
				{
					EntityFlagIsTrue {Name = "ef_PlayAnim"},
					EntityTimerIsElapsed {Name = "et_RepeatAnim", Seconds = 7.5},
				}
			},
			Actions = 
			{
				EntityFlagSetFalse {Name = "ef_PlayAnim"},
				EntityTimerStart {Name = "et_RepeatAnim"},
				MapFlagSetFalse	{Name = "mf_SQPriest_BarubasIsPrisoned"},
				MapFlagSetTrue	{Name = "mf_SQPriest_BarubasIsScreaming"},
			},
		};

		OnEvent
		{
			EventName = "DefeatOutcriesAvatarAlive",
			Conditions = 
			{
				FigureIsAlive	{Tag = "pl_HumanAvatar"},
				EntityFlagIsFalse	{Name = "ef_PlayedDefeatOutcries" .. iGestalt},
			},
			Actions = 
			{
				EntityFlagSetTrue	{Name = "ef_PlayedDefeatOutcries" .. iGestalt},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "2", Tag = "pl_HumanAvatar"},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "3", Tag = tGhostTags[iGestalt]},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "4"},
			},
		};
		OnEvent
		{
			EventName = "DefeatOutcriesAvatarDead",
			Conditions = 
			{
				FigureIsDead	{Tag = "pl_HumanAvatar"},
				EntityFlagIsFalse	{Name = "ef_PlayedDefeatOutcries" .. iGestalt},
			},
			Actions = 
			{
				EntityFlagSetTrue	{Name = "ef_PlayedDefeatOutcries" .. iGestalt},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "2", Tag = "pl_HumanAvatar_DEAD"},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "3", Tag = tGhostTags[iGestalt]},
				FigureOutcry	{TextTag = "SQPriest" .. iGestalt .. "4"},
			},
		};

		OnEvent
		{
			EventName = "GhostWalksIntoBarubas",
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_DefeatSequence", Seconds = 10.0},
				EntityFlagIsFalse	{Name = "ef_GhostWalk" .. tGhostTags[iGestalt]},
			},
			Actions = 
			{
				EntityFlagSetTrue {Name = "ef_PlayAnim"},
				EntityFlagSetTrue	{Name = "ef_GhostWalk" .. tGhostTags[iGestalt]},
				FigureSimpleWalkToEntity	{Tag = tGhostTags[iGestalt], TargetTag = "SQPriest_Barubas"},
				EffectStart	{Tag = tGhostTags[iGestalt], File = "Effect_DeSpawn_Unit"},
			},
		};
		
		OnEvent
		{
			EventName = "GhostExplodesInsideBarubas",
			Conditions = 
			{
				FigureIsAlive	{Tag = tGhostTags[iGestalt]},
				EntityTimerIsElapsed	{Name = "et_DefeatSequence", Seconds = 12.0},
			},
			Actions = 
			{
				EffectStart	{Tag = "SQPriest_Barubas", File = "Effect_DivineBolt_Hit"},
				EffectStart	{Tag = "SQPriest_Barubas", File = "Effect_DivineBolt_Impact"},
				FigureVanish	{Tag = tGhostTags[iGestalt]},
			},
		};

		OnEvent
		{
			EventName = "GotoState_" .. sNextGestaltState,
			Conditions = 
			{
				EntityTimerIsElapsed	{Name = "et_DefeatSequence", Seconds = 18},
			},
			Actions = 
			{
				EntityTimerStop {Name = "et_RepeatAnimFirst"},
				EntityTimerStop {Name = "et_RepeatAnim"},
				MapFlagSetFalse	{Name = "mf_SQPriest_BarubasIsScreaming"},
				FigureStop	{Tag = "SQPriest_Barubas"},
			},
			GotoState = sNextGestaltState,
		};
	};
end


State
{
	StateName = "FightOver",

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQPriest_BarubasDefeated"},
			FigureUnitChange	{UnitId = 1292, Level = 20},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_BarubasMustDie"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
