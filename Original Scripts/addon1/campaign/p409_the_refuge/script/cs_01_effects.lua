State
{
	StateName = "INIT",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Effect_Fire_Start"},
			FigureIsIdle {Tag = "CS_01_Dragon"},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "CS_01_Dragon", File = "Effect_Misc_Cutscene_Firedragon_Resolve"},
			SoundGlobalPlayOnce	{File = "04_spells/fx_flying_death_fire"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Fireburst_Hit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.15},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroCaine", File = "Effect_Fireburst_Hit"},
			EffectStart {Tag = "pl_HumanHeroWhisper", File = "Effect_Fireburst_Hit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.15},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroWind", File = "Effect_Fireburst_Hit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroYasha", File = "Effect_Fireburst_Hit"},
			EffectStart {Tag = "pl_HumanHeroMordecay", File = "Effect_Fireburst_Hit"},
			EffectStart {Tag = "pl_HumanNightsong", File = "Effect_Fireburst_Hit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};

