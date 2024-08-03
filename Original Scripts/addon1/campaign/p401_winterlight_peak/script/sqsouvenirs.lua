local kiTotalSouvenirs = 20
local kiSouvenirsBaseId = (345 - 1)	-- Souvenir ItemId minus one, others follow in ascending order
local ksQuestSolverPlatform = "P405"	-- Platform auf der die finale Questabgabe stattfindet

local tSouvenirs =
{
	P401 = {2, 3},
	P402 = {1, 4},
	P403 = {5, 6, 7, 12, 13},
	P404 = {8, 10, 11, 14},
	P405 = {},
	P406 = {},
	P407 = {},
	P409 = {9, 17},
	P410 = {15, 16, 18},
	P411 = {19, 20},
	P412 = {},
}
local tSouvenirsXP =
{
	P401 = 50,
	P402 = 50,
	P403 = 60,
	P404 = 70,
	P405 = 0,
	P406 = 0,
	P407 = 0,
	P409 = 100,
	P410 = 130,
	P411 = 200,
	P412 = 0,
}


-- QuestStart Event auf Winterlight
if GetPlatform() == "P401" then

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_StartDelay"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_StartDelay", Seconds = 30},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "Souvenirs"},
		},
	};
end


local tSouvenirsOnThisMap = tSouvenirs[GetPlatform()]
local iSouvenirsXPOnThisMap = tSouvenirsXP[GetPlatform()]
local iNumSouvenirsOnThisMap = table.getn(tSouvenirsOnThisMap)

--if DEBUG then
--	local sItems = ""
--	for i, iSouvenirId in tSouvenirsOnThisMap do
--		if i == 1 then
--			sItems = tostring(iSouvenirId + kiSouvenirsBaseId)
--		else
--			sItems = sItems .. ", " .. tostring(iSouvenirId + kiSouvenirsBaseId)
--		end
--	end
--	
--	if GetPlatform() == ksQuestSolverPlatform then	-- das ist die Questsolver Platform
--		sItems = "QuestSolver Dialog"
--	end
--		
--	MessageBox("Souvenir Items which can be found on this map: " .. sItems)
--end

for i, iSouvenirId in tSouvenirsOnThisMap do
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = iSouvenirId + kiSouvenirsBaseId, Amount = 1},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "Souvenirs" .. iSouvenirId},
			AvatarValueIncrease	{Name = "av_P401_SouvenirsCollected"},
			EntityValueIncrease	{Name = "ev_NumSouvenirsFoundOnThisMap"},
			AvatarXPGive	{Amount = iSouvenirsXPOnThisMap},
		},
		GotoState = "QuestCheck",
	};
end



if GetPlatform() == ksQuestSolverPlatform then	-- das ist die Questsolver Platform
	OnEvent
	{
		Conditions = 
		{
			-- nur auf Questsolver map, sonst ende
			QuestIsActive	{Quest = "SouvenirsGotAllOfThem"},
		},
		Actions = 
		{
		},
		GotoState = "GotAllOfThem",
	};
else
	OnEvent
	{
		Conditions = 
		{
			-- nicht auf Questsolver map
			EntityValueIsEqual	{Name = "ev_NumSouvenirsFoundOnThisMap", Value = iNumSouvenirsOnThisMap},
		},
		Actions = 
		{
			DebugMessage	{Message = "You have found all Souvenir Items on this map!", Caption = "SQ Collection - Erinnerungen aus Eo"},
		},
		GotoState = "END",
	};
end

State
{
	StateName = "CollectSouvenirs",

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P401_SouvenirsCollected", Value = kiTotalSouvenirs},
			QuestIsActive	{Quest = "SouvenirsSearchForMore"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "SouvenirsSearchForMore"},
			QuestSetActive	{Quest = "SouvenirsGotAllOfThem"},
		},
	};
};


-- nur auf der Questsolver Platform auch den Solver State einbauen
if GetPlatform() == ksQuestSolverPlatform then	-- das ist die Questsolver Platform
	local tQuestSolveAll = {}
	for i = 1, kiTotalSouvenirs do
		table.insert(tQuestSolveAll, AvatarItemMiscTake	{ItemId = i + kiSouvenirsBaseId, Amount = 1})
		table.insert(tQuestSolveAll, QuestSetSolved	{Quest = "Souvenirs" .. i})
	end
	table.insert(tQuestSolveAll, QuestSetSolved	{Quest = "SouvenirsGotAllOfThem"})
	table.insert(tQuestSolveAll, QuestSetSolved	{Quest = "Souvenirs"})
	
	State
	{
		StateName = "GotAllOfThem",
		
		OnOneTimeEvent
		{
			Conditions = 
			{
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "SQSouvenir_Solver"},
			},
		};
		OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQSouvenirs_Solved"},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				unpack(tQuestSolveAll)	-- muss die letzte Action sein!
			},
			GotoState = "END",
		};
	};
end

State	
{
	StateName = "QuestCheck",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotKnown	{Quest = "SouvenirsSearchForMore"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "SouvenirsSearchForMore"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{UnitId = 1236},
		},
		GotoState = "CollectSouvenirs",
	};
};


State	{StateName = "END"};

