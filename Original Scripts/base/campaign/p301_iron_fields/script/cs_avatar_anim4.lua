-- ANimationen des Avatars für fünfte Cutscene auf Part II der Karte

State
{	
	StateName = "INIT",
	OnPlayHeroAnimEvent
	{
		EventName = "Anim01",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold", -- 3.25
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_Anim01_NoNo"},
			MapFlagIsTrue {Name = "mf_CS_B_05_Avatar_Kneel_Hold"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_Anim01_NoNo"},
			EntityTimerStart	{Name = "et_anim_timer"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim02",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold", -- 3.25
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_anim_timer", Seconds = 3},
			EntityFlagIsFalse {Name = "ef_Anim02_NoNo"},
			MapFlagIsTrue {Name = "mf_CS_B_05_Avatar_Kneel_Hold"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_anim_timer"},
		},
	};
	
	OnPlayHeroAnimEvent
	{
		EventName = "Anim03",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_up", -- 1.79s
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_Anim03_NoNo"},
			MapFlagIsTrue {Name = "mf_CS_B_05_Avatar_Kneel_Up"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_Anim02_NoNo"},
			EntityFlagSetTrue {Name = "ef_Anim03_NoNo"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};