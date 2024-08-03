-- ANimationen des Avatars für dritte Cutscene auf Part II der Karte

State
{	
	StateName = "INIT",
	OnPlayHeroAnimEvent
	{
		EventName = "Anim01",
		Tag = "pl_HumanAvatar",
		Anim = "attack_1h_right_1", --1.42s
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_Anim01_NoNo"},
			MapFlagIsTrue {Name = "mf_CS_B_03_Avatar_Anim_Attack_01"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_Anim01_NoNo"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim02",
		Tag = "pl_HumanAvatar",
		Anim = "attack_1h_right_1", -- 1.42s
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_Anim02_NoNo"},
			MapFlagIsTrue {Name = "mf_CS_B_03_Avatar_Anim_Attack_02"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_Anim02_NoNo"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};