local iWolfLevel = 6
local iNumSpawnUnits = 5
local sSpawnUnitTag = "SQWisper_Wolf"

local tActions_Spawn = 
{
	FigureOutcryImmediate	{TextTag = "SQWisper1", Tag = "pl_HumanHeroWind"},
}

for i = 1, iNumSpawnUnits do
	-- verschiedene unit id's für wölfe in tabelle ablegen
	local tUnitIds = {502, 788, 789, 790}
	
	-- Zufallswert zwischen 1 und Anzahl Werte in UnitId Tabelle generieren
	local iRandom = math.random(1, table.getn(tUnitIds))
	
	table.insert(tActions_Spawn, FigureNpcSpawnToEntity	
	{
		Tag = sSpawnUnitTag .. i, 
		Level = iWolfLevel,
		UnitId = tUnitIds[iRandom], -- zufällige unit id auswählen
		TargetTag = "pl_HumanHeroWhisper", 
		Team = "tm_Team2",
	})
	
	if i == 1 then
		table.insert(tActions_Spawn, FigureLootItemEquipmentAdd	{Tag = sSpawnUnitTag .. i, DropChance = 100, ItemId = 1161})
	end
end

State
{
	StateName = "INIT",

	-- quest auf jeden Fall aktivieren, unabhängig von den Outcries
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P401_EndEndCS"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeroWisper"},
			QuestSetActive	{Quest = "HeroWisperThreat"},
		},
		GotoState = "END",
	},

	-- Wenn delay abgelaufen, spawnen die Wölfe um Wisper
	OnEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQWisper_AttackMarker", Range = 12},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_AttackMarker", Range = 12},
				--MapValueIsGreater {Name = "mv_P401_GoneToAlluvyn", Value = 0},
			},
			QuestIsNotKnown	{Quest = "HeroWisper"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
			--FigureHasNotHate	{Tag = "pl_HumanHeroWhisper"},
			--FigureIsNotInCombat	{Tag = "pl_HumanHeroWhisper"},
		},
		Actions = tActions_Spawn,
		GotoState = "FIGHT",
	},
};


local tConditions_SpawnDead = 
{
	FigureIsAlive	{Tag = "pl_HumanHeroWind"},
	FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
}
for i = 1, iNumSpawnUnits do
	table.insert(tConditions_SpawnDead, FigureIsDead{Tag = sSpawnUnitTag .. i})
end

State
{
	StateName = "FIGHT",

	-- Alle Wölfe tot?
	OnOneTimeEvent
	{
		Conditions = tConditions_SpawnDead,
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWisper2", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWisper3", Tag = "pl_HumanHeroWhisper"},
			AvatarXPGive	{Amount = 528},
			EntityFlagSetTrue	{Name = "ef_OutcriesDone"},
		},
	},
	
	-- quest auf jeden Fall aktivieren, unabhängig von den Outcries
	OnEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P401_EndEndCS"},
				EntityFlagIsTrue	{Name = "ef_OutcriesDone"},
			},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeroWisper"},
			QuestSetActive	{Quest = "HeroWisperThreat"},
		},
		GotoState = "END",
	},
};

State {StateName = "END"};
