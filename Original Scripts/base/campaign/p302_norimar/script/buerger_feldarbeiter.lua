-- Feldarbeiter knien auf Feld bis Attacke der DE anfaengt, dann Flucht in den Horst.

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Work",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_BuergerGo"},
		},
		Actions = 
		{
		},
		
	};


};


State
{
	StateName = "Work",
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_WorkAnim"},
			EntityFlagSetTrue {Name = "ef_WorkKneelDown"},
			
		},
		
	};


	
	
	OnEvent
	{
		
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_WorkAnim", Seconds = TimingFeldarbeiter},
			EntityFlagIsTrue {Name = "ef_WorkKneelDown"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"},
			EntityFlagSetFalse {Name = "ef_WorkKneelDown"},
		},
	};
	
	--OnEvent
	--{
	--	
	--	Conditions = 
	--	{
	--		EntityTimerIsElapsed {Name = "et_WorkAnim", Seconds = TimingFeldarbeiter + 2.17},
	--		
	--	},
	--	Actions = 
	--	{
	--		FigureAnimPlayLooped	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
	--		--EffectStart	{Tag = "default", File = "Effect_Spawn_Unit"}, --TEST!
	--	},
	--};
	
	OnEvent
	{
		
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_WorkAnim", Seconds = TimingFeldarbeiter + 2.17},
			
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
			EntityTimerStart	{Name = "et_WorkAnim"},
		},
	};
	


	
};

