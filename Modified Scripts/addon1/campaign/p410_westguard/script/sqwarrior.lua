local iNumEnemies = 5
local iEnemyLevelRTA = -6

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "WarriorEpicVeracity"},
			DebugQuestionYes	{Question = "Warrior Epic <Wahrhaftigkeit> aktivieren?", Caption = "Warrior Epic"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "WarriorEpicVeracity"},
			--QuestSetActive	{Quest = "WarriorEpicVeracityCraigsTrial"},
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
			QuestIsActive	{Quest = "WarriorEpicVeracity"},
		},
		Actions = 
		{
		},
		GotoState = "TalkToStatue",
	};
};

State
{
	StateName = "TalkToStatue",

	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "SQWarrior_Statue"},
		},
		GotoState = "TalkToCraig",
	};

};


local tSpawnEnemies = {}
local tEnemiesDead = {}
for i = 1, iNumEnemies do
	local sTag = "SQWarrior_Enemy" .. i
	table.insert(tSpawnEnemies, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iEnemyLevelRTA, UnitId = 1357, TargetTag = "SQWarrior_Craig", Team = "tm_Team2"})
	table.insert(tEnemiesDead, FigureIsDead	{Tag = sTag})
end

State
{
	StateName = "TalkToCraig",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnEnemy"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_SpawnEnemy"},
			unpack(tSpawnEnemies)	-- muss die letzte Action sein!
		},
		GotoState = "FightEnemies",
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "WarriorEpicVeracity"},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};



State
{
	StateName = "FightEnemies",

	OnEvent
	{
		Conditions = 
		{
			unpack(tEnemiesDead)	-- muss die letzte Condition sein!
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQWarrior_SpawnCraigsGhost"},
		},
		GotoState = "TalkToCraig",
	};
};


State	{StateName = "END"};

