
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			OR
			{
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
			},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 1},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch02", Tag = "Ragna"}, -- gelb & Schild
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 4},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 1},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch12", Tag = "Ragna"}, -- gelb & Eis
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			OR
			{
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 4},
			},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 2},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch03", Tag = "Ragna"}, -- blau & Feuer
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 2},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch05", Tag = "Ragna"}, -- blau & Erde
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 2},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch08", Tag = "Ragna"}, -- blau & Luft
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 3},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch10", Tag = "Ragna"}, -- grün & Eis
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 3},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch06", Tag = "Ragna"}, -- grün & Luft
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 3},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch09", Tag = "Ragna"}, -- grün & Erde
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 4},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 3},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch13", Tag = "Ragna"}, -- grün & Schild
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			OR
			{
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 4},
			},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 4},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch04", Tag = "Ragna"}, -- rot & Erde
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 4},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch07", Tag = "Ragna"}, -- rot & Feuer
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RagnaDoesOutcry"},
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
			MapValueIsEqual{Name = "mv_TowerClues", Value = 4},
		},
		Actions =
		{
			FigureOutcry{TextTag = "RagnaResearch01", Tag = "Ragna"},
			FigureOutcry{TextTag = "RagnaResearch11", Tag = "Ragna"}, -- rot & Eis
			MapFlagSetFalse{Name = "mf_RagnaDoesOutcry"},
		},
	}, 

}
