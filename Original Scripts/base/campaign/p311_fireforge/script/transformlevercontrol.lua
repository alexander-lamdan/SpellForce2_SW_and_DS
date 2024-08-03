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
			QuestIsActive	{Quest = "RightTwist2TransformProf"},
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
			LeverSetOff	{Tag = "TransformLever4"},
			LeverSetOff	{Tag = "TransformLever5"},
			LeverSetOff	{Tag = "TransformLever6"},
			LeverSetOff	{Tag = "TransformLever7"},

			MapFlagSetTrue	{Name = "mf_ActivateTwiddleTransformationLevers"},

			-- Wolf Form
			EntityValueSet			{Name = "ev_LastTwiddleForm", Value = 1},
			EntityValueSet			{Name = "ev_NewTwiddleForm", Value = 1},
		},
		GotoState = "LeverControl",
	};
};


-- wie lange Hebel inaktiv sind nach betätigen (in Sekunden) (sollte mind. 1 Sekunde sein)
local LeverUserInputDelay = 2.0

-- unit Ids und Outcry Tags für jede Verwandlung:
local TwiddleForms =
{
	{UnitId = 792, TextTag = "Twiddle6"}, -- Wolf
	{UnitId = 698, TextTag = "Twiddle1"}, -- Bär
	{UnitId = 682, TextTag = "Twiddle3"}, -- Pfährt
	{UnitId = 122, TextTag = "Twiddle2"}, -- Porsche
	{UnitId = 316, TextTag = "Twiddle5"}, -- "I'm so horny"
	{UnitId = 287, TextTag = "Twiddle4"}, -- "Iiiiiiiih!!"
}
local MaxTwiddleForms = table.getn(TwiddleForms)

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
			EntityValueAdd	{Name = "ev_TransformLeverToggleCounter", Value = 1},
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


	-- kurz nach Start des Input Delay wird geprüft, ob denn alle Hebel "on" sind
	-- das kann nicht sofort geschehen, denn wenn alle Hebel an sind, ausser einem,
	-- und der Spieler betätigt genau diesen einen, dann würden ein paar andere
	-- ausgeschaltet werden aber fürs Script wären vermutlich einen Step lang
	-- alle Hebel auf on ... deswegen lieber einen Moment damit warten
	OnEvent
	{
		EventName = "ProfessorGetsBackToNormal",
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_TransformLeverUserInputDelay", Seconds = 0.2},
			LeverIsOn	{Tag = "TransformLever1"},
			LeverIsOn	{Tag = "TransformLever2"},
			LeverIsOn	{Tag = "TransformLever3"},
			LeverIsOn	{Tag = "TransformLever4"},
			LeverIsOn	{Tag = "TransformLever5"},
			LeverIsOn	{Tag = "TransformLever6"},
			LeverIsOn	{Tag = "TransformLever7"},
		},
		Actions =
		{
			-- geschafft! Twiddle ist wieder menschlich!
			MapFlagSetTrue	{Name = "mf_ProfessorIsBackToNormal"},

			FigureUnitChange{Tag = "ProfessorTwiddle", UnitId = 429, Level = 20},
			EffectStart		{Tag = "ProfessorTwiddle", File = "Effect_Spawn_Unit"},
			FigureOutcry	{Tag = "ProfessorTwiddle", TextTag = "Twiddle7"},
			DialogSetEnabled	{Tag = "ProfessorTwiddle"},
			DialogTypeSetSideQuest	{Tag = "ProfessorTwiddle"},
		},
		GotoState = "END",
	};


	-- ------------------------------------------------------------------------------------
	-- Twiddle's Verwandlungen...
	-- ------------------------------------------------------------------------------------
	OnEvent
	{
		EventName = "TransformTwiddleNow",
		Conditions =
		{
			-- nur jedes dritte mal:
			EntityValueIsGreaterOrEqual	{Name = "ev_TransformLeverToggleCounter", Value = 3},
			-- gib der "back to normal" Abfrage etwas Zeit vorher wahr zu werden:
			MapTimerIsElapsed	{Name = "mt_TransformLeverUserInputDelay", Seconds = 0.3},
			-- denn verwandeln tun wir ihn nur, wenn die Sache nicht schon gelöst ist
			MapFlagIsFalse	{Name = "mf_ProfessorIsBackToNormal"},
		},
		Actions =
		{
			EntityValueSet	{Name = "ev_TransformLeverToggleCounter", Value = 0},
			EntityValueRandomize	{Name = "ev_NewTwiddleForm", MinValue = 1, MaxValue = MaxTwiddleForms},
		},
		GotoState = "TwiddleSelectNewForm",
	};
};


-- ------------------------------------------------------------------------------------
-- Twiddle's neue Form randomizen ...
-- ------------------------------------------------------------------------------------
State
{
	StateName = "TwiddleSelectNewForm",

	-- solange randomizen bis tatsächlich eine neue form rauskommt!
	-- eventuelle Warnungen "transition has triggered repeatedly" nehme ich bewusst in Kauf...
	-- ist hier nicht allzu tragisch
	OnEvent
	{
		EventName = "DieseWarnmeldungIstAnDieserStelleKeinFehler_Steffen",
		Conditions =
		{
			EntityValueIsEqualToVariable	{Name = "ev_NewTwiddleForm", Variable = "ev_LastTwiddleForm"},
		},
		Actions =
		{
			EntityValueRandomize	{Name = "ev_NewTwiddleForm", MinValue = 1, MaxValue = MaxTwiddleForms},
		},
	};

	OnEvent
	{
		EventName = "TwiddleSelectFormDoneOrTimeout",
		Conditions =
		{
			OR
			{
				EntityValueIsNotEqualToVariable	{Name = "ev_NewTwiddleForm", Variable = "ev_LastTwiddleForm"},
				-- zur Sicherheit ein timeout:
				MapTimerIsElapsed	{Name = "mt_TransformLeverUserInputDelay", Seconds = LeverUserInputDelay / 2},
			},
		},
		Actions =
		{
			-- die aktuelle Form speichern fürs nächste mal
			EntityValueSet			{Name = "ev_LastTwiddleForm", Value = 0},
			EntityValueAddVariable	{Name = "ev_LastTwiddleForm", Variable = "ev_NewTwiddleForm"},
		},
		GotoState = "TwiddleTransforms",
	};
};

-- ------------------------------------------------------------------------------------
-- Twiddle's neue Form ausführen ...
-- ------------------------------------------------------------------------------------
for i = 1, MaxTwiddleForms do
	OnEvent
	{
		EventName = "TwiddleForm" .. i,
		Conditions =
		{
			EntityValueIsEqual	{Name = "ev_NewTwiddleForm", Value = i},
		},
		Actions =
		{
			FigureUnitChange{Tag = "ProfessorTwiddle", UnitId = TwiddleForms[i].UnitId, Level = 20},
			FigureOutcry	{Tag = "ProfessorTwiddle", TextTag = TwiddleForms[i].TextTag},
			EffectStart		{Tag = "ProfessorTwiddle", File = "Effect_Spawn_Unit"},
		},
		GotoState = "LeverControl",
	};
end

State
{
	StateName = "TwiddleTransforms",
};


-- ------------------------------------------------------------------------------------
-- Ende, Peng!
-- ------------------------------------------------------------------------------------
State
{
	StateName = "END",
};
