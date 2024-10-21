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
			MapFlagSetTrue	{Name = "mf_DisableSideQuests"},
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
			DialogSetDisabled	{Tag = "Falida"},
			DialogSetDisabled	{Tag = "Niethalf"},
			DialogSetDisabled	{Tag = "SQPriest_Idara"},
			DialogSetDisabled	{Tag = "SQPriest_Well"},
			DialogSetDisabled	{Tag = "SQPriest_WillowTree"},
			DialogSetDisabled	{Tag = "SQWind_Aedar"},
			DialogSetDisabled	{Tag = "SQWind_Maira"},
			DialogSetDisabled	{Tag = "pl_HumanHeroWind"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWind"},
			QuestIsActive	{Quest = "HeroWindTalkToAedar"},
		},
		Actions =
		{
			QuestSetInactive	{Quest = "HeroWindTalkToAedar"},
			QuestSetInactive	{Quest = "HeroWind"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "SevenkeepsA1_GetFugitivesIntoTown"},
			QuestIsNotKnown	{Quest = "HeartOfIce"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "HeartOfIce"},
		},
		Actions =
		{
			QuestSetInactive	{Quest = "HeartOfIceFindCityShip"},
			QuestSetInactive	{Quest = "HeartOfIce"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_Delay2", Seconds = 0.3},
			QuestIsNotKnown	{Quest = "HeartOfIce"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Skjadir"},
		},
		GotoState = "END",
	},
};

State
{
	StateName = "END",
};
