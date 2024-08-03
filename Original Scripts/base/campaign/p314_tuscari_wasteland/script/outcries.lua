if os then
	seed = tonumber(os.date("%S%S")) * tonumber(os.date("%H%M%S"))
	math.randomseed(seed)
end
Zufall = math.random(50)


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
			MapValueSet{Name = "mv_Random", Value = Zufall},
		},
		GotoState = "OUTCRIES"
	},
}

State
{
	StateName = "OUTCRIES",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsDead	{Tag = "GroupSpiderC02"},
				FigureIsDead	{Tag = "GroupSpiderB08"},
			},
			FigureIsAlive	{Tag = "pl_HumanHeroShae"},
			MapValueIsEqual{Name = "mv_Random", Value = 33},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Troopers01", Tag = "pl_HumanHeroShae"},
		},
	},

};
