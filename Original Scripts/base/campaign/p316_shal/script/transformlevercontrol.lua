-- TheRightTwistPart2
--	RightTwist2SearchProf
--	RightTwist2TransformProf
--	RightTwist2MeetProfGoS

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			LeverSetDisabled	{Tag = "TransformLever1"},
			LeverSetDisabled	{Tag = "TransformLever2"},
			LeverSetDisabled	{Tag = "TransformLever3"},
			LeverSetDisabled	{Tag = "TransformLever4"},
			LeverSetDisabled	{Tag = "TransformLever5"},
			LeverSetDisabled	{Tag = "TransformLever6"},
			LeverSetDisabled	{Tag = "TransformLever7"},
		},
		GotoState = "WaitForStart",
	};
}

State
{
	StateName = "WaitForStart",

	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			LeverSetEnabled	{Tag = "TransformLever1"},
			LeverSetEnabled	{Tag = "TransformLever2"},
			LeverSetEnabled	{Tag = "TransformLever3"},
			LeverSetEnabled	{Tag = "TransformLever4"},
			LeverSetEnabled	{Tag = "TransformLever5"},
			LeverSetEnabled	{Tag = "TransformLever6"},
			LeverSetEnabled	{Tag = "TransformLever7"},
			
			LeverSetOff	{Tag = "TransformLever1"},
			LeverSetOff	{Tag = "TransformLever2"},
			LeverSetOff	{Tag = "TransformLever3"},
			LeverSetOn	{Tag = "TransformLever4"},
			LeverSetOff	{Tag = "TransformLever5"},
			LeverSetOff	{Tag = "TransformLever6"},
			LeverSetOff	{Tag = "TransformLever7"},

			MapFlagSetTrue	{Name = "mf_ActivateTwiddleTransformationLevers"},

		},
		GotoState = "LeverControl",
	};
};


-- wie lange Hebel inaktiv sind nach betätigen (in Sekunden) (sollte mind. 1 Sekunde sein)
local LeverUserInputDelay = 2.0


State
{
	StateName = "LeverControl",

	-- die Hebel werden bei betätigen des Users ein paar Sekunden lang deaktiviert
	-- nur damit er nicht mit Dauer-rechtsklicken (== Lieblingsbeschäftigung der QA *g*)
	-- irgendwas kaputtmachen kann (z.b. seinen Verstand)
	OnEvent
	{
		EventName = "DisableLeversAfterUserInput",
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_TransformLeverUserInputDelay", Seconds = 0.0},
			MapFlagIsFalse	{Name = "mf_LeversAreDisabled"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_LeversAreDisabled"},
			LeverSetDisabled	{Tag = "TransformLever1"},
			LeverSetDisabled	{Tag = "TransformLever2"},
			LeverSetDisabled	{Tag = "TransformLever3"},
			LeverSetDisabled	{Tag = "TransformLever4"},
			LeverSetDisabled	{Tag = "TransformLever5"},
			LeverSetDisabled	{Tag = "TransformLever6"},
			LeverSetDisabled	{Tag = "TransformLever7"},
		},
	};

	-- sobald die Zeit abgelaufen ist, einfach wieder alle Hebel anschalten
	-- und natürlich den Timer stoppen
	OnEvent
	{
		EventName = "ReEnableLeversAfterUserInput",
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_TransformLeverUserInputDelay", Seconds = LeverUserInputDelay},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_TransformLeverUserInputDelay"},
			MapFlagSetFalse	{Name = "mf_LeversAreDisabled"},
			LeverSetEnabled	{Tag = "TransformLever1"},
			LeverSetEnabled	{Tag = "TransformLever2"},
			LeverSetEnabled	{Tag = "TransformLever3"},
			LeverSetEnabled	{Tag = "TransformLever4"},
			LeverSetEnabled	{Tag = "TransformLever5"},
			LeverSetEnabled	{Tag = "TransformLever6"},
			LeverSetEnabled	{Tag = "TransformLever7"},
		},
	};
}

	