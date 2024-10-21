local Tag = GetScriptTag()
-- die Nummer aus dem ScriptTag extrahieren (letztes Zeichen)
local MyNumber = string.sub(Tag, string.len(Tag), string.len(Tag))

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "Init",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ActivateTwiddleTransformationLevers"},
		},
		Actions =
		{
		},
		GotoState = "OFF",
	};
}



-- ----------------------------------------------------------------------------------
-- Lever Zustand: off ... wartet aufs anschalten
-- ----------------------------------------------------------------------------------
State
{
	StateName = "OFF",

	-- remote toggle from other lever
	OnEvent
	{
		EventName = "RemoteToggleOn",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ToggleTransformLever" .. MyNumber},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ToggleTransformLever" .. MyNumber},
			LeverSetOn	{},
		},
		GotoState = "ON",
	};

	-- user toggles lever
	OnEvent
	{
		EventName = "UserToggleOn",
		Conditions =
		{
			LeverIsOn	{},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_TransformLeverUserInputDelay"},
			LeverSetDisabled	{},

			-- muss die letzte Action sein ...
			unpack(InfluenceLevers)
		},
		GotoState = "ON",
	};


	OnEvent
	{
		EventName = "Ende",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ProfessorIsBackToNormal"},
		},
		Actions =
		{
		},
		GotoState = "END",
	};
};

-- ----------------------------------------------------------------------------------
-- Lever Zustand: on ... wartet aufs ausschalten
-- ----------------------------------------------------------------------------------
State
{
	StateName = "ON",

	-- remote toggle from other lever
	OnEvent
	{
		EventName = "RemoteToggleOff",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ToggleTransformLever" .. MyNumber},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ToggleTransformLever" .. MyNumber},
			LeverSetDisabled	{},
			LeverSetOff	{},
		},
		GotoState = "OFF",
	};

	-- user toggles lever
	OnEvent
	{
		EventName = "UserToggleOff",
		Conditions =
		{
			LeverIsOff	{},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_TransformLeverUserInputDelay"},
			LeverSetDisabled	{},

			-- muss die letzte Action sein ...
			unpack(InfluenceLevers)
		},
		GotoState = "OFF",
	};


	OnEvent
	{
		EventName = "Ende",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ProfessorIsBackToNormal"},
		},
		Actions =
		{
			LeverSetDisabled	{},
		},
		GotoState = "END",
	};
};


-- ----------------------------------------------------------------------------------
-- Ende Gelände ...
-- ----------------------------------------------------------------------------------
State
{
	StateName = "END",
};
