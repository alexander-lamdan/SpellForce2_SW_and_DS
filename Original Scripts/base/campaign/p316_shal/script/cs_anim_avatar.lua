State
{	
	StateName = "Avatar_Anim",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "special_prisoned",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Avatar_Anim_Prisoned"},
		},
		Actions = 
		{
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Misc_HeroEnprisonment"},
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanAvatar",
		Anim = "special_prisoned",
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_stopA"},
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 6.67},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim3",
		Tag = "pl_HumanAvatar",
		Anim = "special_prisoned_scream", -- 5s
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Avatar_Anim_Prisoned_Scream"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_stopA"},
			EntityTimerStart {Name = "et_AnimPlayB"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim4",
		Tag = "pl_HumanAvatar",
		Anim = "special_prisoned",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 7.5},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayC"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanAvatar",
		Anim = "special_prisoned",
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_stopB"},
			EntityTimerIsElapsed {Name = "et_AnimPlayC", Seconds = 6.67},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayC"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Avatar_Anim_Free"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_stopB"},
			EffectStop {Tag = "pl_HumanAvatar"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};