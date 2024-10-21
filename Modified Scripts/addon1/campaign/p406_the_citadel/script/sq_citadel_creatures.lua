-- Birnbaums Kreaturen zählen ...
-- muss ins Platformscript, da das zählen auch funktionieren muss, wenn die Quest nicht aktiv ist
for i = 1, 5 do
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "BirnbaumCreature" .. i, Range = 8},
		},
		Actions = 
		{
			MapValueAdd	{Name = "mv_BirnbaumCreaturesFound", Value = 1},
			MapFlagSetTrue	{Name = "mf_SQCitadel_FoundCreature" .. i},
			EffectStart	{Tag = "BirnbaumCreature" .. i, File = "Effect_Spawn_Unit"},
			--FigureVanish	{Tag = "BirnbaumCreature" .. i},
		},
	};
end


State
{
	StateName = "CountCreatures",
	
	OnEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual	{Name = "mv_BirnbaumCreaturesFound", Value = 5},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
}

State	{StateName = "END"};
