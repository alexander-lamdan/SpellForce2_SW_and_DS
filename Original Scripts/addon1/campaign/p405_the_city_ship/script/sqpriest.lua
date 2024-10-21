iGhostSpawnDelay = 55
local iNumGhostsToSave = 15

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "PriestEpicLife"},
			DebugQuestionYes	{Question = "Priest Epic (Life) aktivieren?", Caption = "Priest Epic"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "PriestEpicLife"},
			QuestSetActive	{Quest = "PriestEpicLifeFindPsychoOil"},
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
			QuestIsActive	{Quest = "PriestEpicLifeFindPsychoOil"},
		},
		Actions =
		{
    		DialogSetEnabled	{Tag = "SQ_AlchemyTable"},
		},
		GotoState = "TalkToAlchemyTable",
	},
}

State
{
	StateName = "TalkToAlchemyTable",
		
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
    		DialogSetEnabled	{Tag = "SQ_AlchemyTable"},
		},
	},
	
    OnEvent
    {
    	Conditions =
    	{
			MapFlagIsTrue	{Name = "mf_SQPriest_TalkedToAlchemyTable"},
    	},
    	Actions =
    	{
			QuestSetSolved	{Quest = "PriestEpicLifeFindPsychoOil"},
			QuestSetActive	{Quest = "PriestEpicLifeConjureGaliusGhost"},
			GateSetOpen	{Tag = "Door03"},
			GateSetOpen	{Tag = "Gate03"},
   		},
		GotoState = "ConjureGalius",
    },
};

local iHolyGroundRange = 8
State
{
	StateName = "ConjureGalius",

    OnEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "SQPriest_HolyGround", Range = iHolyGroundRange},
    		},
    	},
    	Actions =
    	{
    		MapFlagSetTrue	{Name = "mf_SQPriest_SpawnGalius"},
			QuestSetSolved	{Quest = "PriestEpicLifeConjureGaliusGhost"},
			QuestSetActive	{Quest = "PriestEpicLifeTalkToGalius"},
   		},
		GotoState = "TalkToGalius",
    },
};


State
{
	StateName = "TalkToGalius",

    OnEvent
    {
    	Conditions =
    	{
			QuestIsActive	{Quest = "PriestEpicLifeProtectGhosts"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
    	},
    	Actions =
    	{
    		MapFlagSetTrue	{Name = "mf_SQPriest_StartProtectGhosts"},
    		MapValueSet	{Name = "mv_SQPriest_NumberOfGhostsDead", Value = 0},
    		MapValueSet	{Name = "mv_SQPriest_NumberOfGhostsSaved", Value = 0},
    		MapValueSet	{Name = "mv_SQPriest_NumberOfGhostsDead_Compare", Value = 0},
    		MapTimerStart	{Name = "mt_SQPriest_GhostSpawnDelayTimer"},
    		EntityTimerStart	{Name = "et_OutcryDelay"},
    		EntityValueSet	{Name = "ev_WhichOutcry", Value = 0},
    		FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "SQPriest_FoWReveal1",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 2, Tag = "SQPriest_FoWReveal2",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 3, Tag = "SQPriest_FoWReveal3",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 4, Tag = "SQPriest_FoWReveal4",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 5, Tag = "SQPriest_FoWReveal5",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 6, Tag = "SQPriest_SpawnDwarf",	Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 7, Tag = "SQPriest_DeSpawnDwarf", Range = 25, Height = 2},
    		FogOfWarRevealAtEntity	{FogOfWarId = 8, Tag = "SQPriest_HolyGround",	Range = 25, Height = 2},
   		},
		GotoState = "ProtectGhosts",
    },
};

    
for i = 1, 5 do
	local tConditions = {}
	local tActions = {}
	if i == 2 then
		table.insert(tConditions, MapFlagIsTrue	{Name = "mf_SQPriest_GhostNeedsHealing"})
	elseif (i == 3) or (i == 4) then
		table.insert(tConditions, MapValueIsGreaterThanVariable	{Name = "mv_SQPriest_NumberOfGhostsDead", Variable = "mv_SQPriest_NumberOfGhostsDead_Compare"})
	elseif i == 5 then
		table.insert(tConditions, MapValueIsGreaterOrEqual	{Name = "mv_SQPriest_NumberOfGhostsSaved", Value = 7})
		table.insert(tConditions, MapValueIsLess	{Name = "mv_SQPriest_NumberOfGhostsSaved", Value = 12})
	end
	
    OnEvent
    {
    	EventName = "PlayOutcry" .. i,
    	Conditions =
    	{
    		EntityValueIsEqual	{Name = "ev_WhichOutcry", Value = i},
    		unpack(tConditions)	-- muss die letzte Condition sein!
    	},
    	Actions =
    	{
    		EntityValueSet	{Name = "ev_WhichOutcry", Value = 0},
    		FigureOutcry	{TextTag = "SQPriest" .. i, Tag = "SQPriest_Galius"},
    		MapFlagSetFalse	{Name = "mf_SQPriest_GhostNeedsHealing"},
			MapValueSetVariable	{Name = "mv_SQPriest_NumberOfGhostsDead_Compare", Variable = "mv_SQPriest_NumberOfGhostsDead"},
    		--DebugMessage	{Message = "playing outcry: " .. i},
    		unpack(tActions)	-- muss die letzte Action sein!
   		},
    };
end

State
{
	StateName = "ProtectGhosts",

	-- den ersten gerettet ...
    OnEvent
    {
    	EventName = "FirstGhostSavedOutcry",
    	Conditions =
    	{
			MapValueIsGreaterOrEqual	{Name = "mv_SQPriest_NumberOfGhostsSaved", Value = 1},
			EntityFlagIsFalse	{Name = "ef_FirstGhostSavedOutcryPlayed"},
    	},
    	Actions =
    	{
			EntityFlagSetTrue	{Name = "ef_FirstGhostSavedOutcryPlayed"},
    		FigureOutcryImmediate	{TextTag = "SQPriest5", Tag = "SQPriest_Galius"},
   		},
    },

	-- zufälligen Outcry abspielen ...
    OnEvent
    {
    	EventName = "RandomizeOutcry",
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OutcryDelay", Seconds = 15},
    	},
    	Actions =
    	{
    		EntityTimerStart	{Name = "et_OutcryDelay"},
    		EntityValueRandomize	{Name = "ev_WhichOutcry", MinValue = 1, MaxValue = 5},
   		},
    },

    OnEvent
    {
    	EventName = "QuestFailed",
    	Conditions =
    	{
    		-- mehr als 10 tot (unschaffbar)
			MapValueIsGreater	{Name = "mv_SQPriest_NumberOfGhostsDead", Value = 30 - iNumGhostsToSave},
    	},
    	Actions =
    	{
    		FigureOutcryImmediate	{TextTag = "SQPriest8", Tag = "SQPriest_Galius"},
			EntityFlagSetFalse	{Name = "ef_FirstGhostSavedOutcryPlayed"},
    		MapFlagSetFalse	{Name = "mf_SQPriest_StartProtectGhosts"},
    		QuestSetInactive	{Quest = "PriestEpicLifeProtectGhosts"},
    		QuestSetActiveAgain	{Quest = "PriestEpicLifeTalkToGalius"},
    		DialogSetEnabled	{Tag = "SQPriest_Galius"},

    		DebugMessage	{Message = "mehr als 10 Geister tot - Quest unschaffbar, neustart!"},
   		},
		GotoState = "TalkToGalius",
    },
    
    OnEvent
    {
    	EventName = "QuestSolved",
    	Conditions =
    	{
    		-- 20 oder mehr gerettet, Bedingung erfüllt
			MapValueIsGreaterOrEqual	{Name = "mv_SQPriest_NumberOfGhostsSaved", Value = iNumGhostsToSave},
    	},
    	Actions =
    	{
    		FigureOutcryImmediate	{TextTag = "SQPriest7", Tag = "SQPriest_Galius"},
    		MapFlagSetFalse	{Name = "mf_SQPriest_StartProtectGhosts"},
    		QuestSetSolved	{Quest = "PriestEpicLifeProtectGhosts"},
    		QuestSetActive	{Quest = "PriestEpicLifeTalkToGaliusAgain"},
    		DialogSetEnabled	{Tag = "SQPriest_Galius"},

    		DebugMessage	{Message = "mehr als 20 Geister gerettet - Quest gelöst!"},
   		},
		GotoState = "END",
    },
};

State	{StateName = "END"};
