--ScriptMain:ShowMessage("DEBUG = " .. tostring(DEBUG) .. "\nlib: debug = " .. tostring(debug))

State
{	
	StateName = "INIT",
	
	OnEvent
	{
		Conditions =
		{
			--DebugQuestionNo	{Question = "NEIN um Nebenquesten zu deaktivieren (für GC Version - das ist default in release builds!), ansonsten JA um die Karte ganz normal mit NQs zu spielen!", Caption = "Karte mit Nebenquesten spielen?"},
		},
		Actions =
		{
			--DebugMessage	{Message = "die Nebenquesten werden nun deaktiviert"},
			EntityTimerStart	{Name = "et_Delay"},
		},
		GotoState = "DisableQuests",
	},
}

State
{
	StateName = "DisableQuests",

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_Delay", Seconds = 0.3},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "SQPriest_Mo"},
			DialogSetDisabled	{Tag = "SQWarrior_Skeleton"},
			DialogSetDisabled	{Tag = "Mosaik"},
		},
		GotoState = "END",
	},
};

State
{
	StateName = "END",
};
