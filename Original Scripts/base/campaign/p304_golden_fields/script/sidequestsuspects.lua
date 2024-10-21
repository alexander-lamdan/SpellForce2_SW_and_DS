if os then
	seed = tonumber(os.date("%S%S")) * tonumber(os.date("%H%M%S"))
	math.randomseed(seed)
end
Zufall = math.random(12)


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
			MapValueSet{Name = "mv_SuspectsZufall", Value = Zufall},
		},
		GotoState = "Main"
	},
}




State
{
	StateName = "Main",
	   
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 1},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 2},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 3},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 5},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 6},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 7},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 8},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 9},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 10},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetTrue{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 11},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetTrue{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetFalse{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetFalse{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetTrue{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetFalse{Name = "mf_Suspect07Guilty"}, -- Tuva
			MapFlagSetTrue{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SuspectsZufall", Value = 12},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_Suspect01Guilty"}, -- Gunnar
			MapFlagSetFalse{Name = "mf_Suspect02Guilty"}, -- Bente
			MapFlagSetTrue{Name = "mf_Suspect03Guilty"}, -- Haldor
			MapFlagSetFalse{Name = "mf_Suspect04Guilty"}, -- Ingvert
			MapFlagSetTrue{Name = "mf_Suspect05Guilty"}, -- Hedda
			MapFlagSetFalse{Name = "mf_Suspect06Guilty"}, -- Ole
			MapFlagSetTrue{Name = "mf_Suspect07Guilty"}, -- Tuva/Turja
			MapFlagSetFalse{Name = "mf_Suspect08Guilty"}, -- Freja
		},
		GotoState = "END",
	},

}

State
{
	StateName = "END",
}