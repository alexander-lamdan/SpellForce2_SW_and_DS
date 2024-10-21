if os then
	seed = tonumber(os.date("%S%S")) * tonumber(os.date("%H%M%S"))
	math.randomseed(seed)
end
Zufall = math.random(12)

--MessageBox("Seed ist: " .. tostring(seed) .. "\nZufall ist: " .. Zufall)

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
			MapValueSet{Name = "mv_HerbsAndFungi", Value = Zufall},
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
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 1},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 2},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 3},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},
	
	

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 4},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 5},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 6},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbD1"},
   			ObjectVanish{Tag = "HerbD2"},
   			ObjectVanish{Tag = "HerbD3"},
   			ObjectVanish{Tag = "HerbD4"},
   			ObjectVanish{Tag = "HerbD5"},
   			
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusD2"},
   			ObjectVanish{Tag = "FungusD3"},
   			ObjectVanish{Tag = "FungusD4"},
   			ObjectVanish{Tag = "FungusD5"},
		},
		GotoState = "END",
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 7},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 8},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 9},
		},
		Actions =
		{
			ObjectVanish{Tag = "Herb01"},
   			ObjectVanish{Tag = "Herb02"},
   			ObjectVanish{Tag = "Herb03"},
   			ObjectVanish{Tag = "Herb04"},
   			ObjectVanish{Tag = "Herb05"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "Fungus02"},
   			ObjectVanish{Tag = "Fungus03"},
   			ObjectVanish{Tag = "Fungus04"},
   			ObjectVanish{Tag = "Fungus05"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},
	
	

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 10},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 11},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbA1"},
   			ObjectVanish{Tag = "HerbA2"},
   			ObjectVanish{Tag = "HerbA3"},
   			ObjectVanish{Tag = "HerbA4"},
   			ObjectVanish{Tag = "HerbA5"},
   			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusA2"},
   			ObjectVanish{Tag = "FungusA3"},
   			ObjectVanish{Tag = "FungusA4"},
   			ObjectVanish{Tag = "FungusA5"},
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_HerbsAndFungi", Value = 12},
		},
		Actions =
		{
			ObjectVanish{Tag = "HerbB1"},
   			ObjectVanish{Tag = "HerbB2"},
   			ObjectVanish{Tag = "HerbB3"},
   			ObjectVanish{Tag = "HerbB4"},
   			ObjectVanish{Tag = "HerbB5"},
   			ObjectVanish{Tag = "HerbC1"},
   			ObjectVanish{Tag = "HerbC2"},
   			ObjectVanish{Tag = "HerbC3"},
   			ObjectVanish{Tag = "HerbC4"},
   			ObjectVanish{Tag = "HerbC5"},
   			ObjectVanish{Tag = "HerbE1"},
   			ObjectVanish{Tag = "HerbE2"},
   			ObjectVanish{Tag = "HerbE3"},
   			ObjectVanish{Tag = "HerbE4"},
   			ObjectVanish{Tag = "HerbE5"},
   			
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusB2"},
   			ObjectVanish{Tag = "FungusB3"},
   			ObjectVanish{Tag = "FungusB4"},
   			ObjectVanish{Tag = "FungusB5"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusC2"},
   			ObjectVanish{Tag = "FungusC3"},
   			ObjectVanish{Tag = "FungusC4"},
   			ObjectVanish{Tag = "FungusC5"},
   			ObjectVanish{Tag = "FungusE1"},
   			ObjectVanish{Tag = "FungusE2"},
   			ObjectVanish{Tag = "FungusE3"},
   			ObjectVanish{Tag = "FungusE4"},
   			ObjectVanish{Tag = "FungusE5"},
		},
		GotoState = "END",
	},	

}

State
{	
	StateName = "END",
};