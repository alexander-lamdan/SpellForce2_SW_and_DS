for i = 1, 4 do
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_TidalTone" .. i .. "Learned"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			FigureOutcryImmediate	{TextTag = "LearnedTidalTone" .. i, Tag = "pl_HumanAvatar"},
		},
	};
end

State
{	
	StateName = "CRYBABYCRY",

};
