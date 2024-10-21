State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "GotoMain",
		Conditions = 
		{
			QuestIsActive 	{Quest = "HeroCaineVictim3Evidence"},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_GotEvidence_Ainur"},	-- damit das Toggle Event funzt
			EntityFlagSetTrue	{Name = "ef_GotEvidence_Eisen"},	-- damit das Toggle Event funzt
		},
		GotoState = "MAIN",
	};

};


-- Folgende Events kommen automatisch in den MAIN State (s.u.)

OnEvent
{
	EventName = "GotoEnde",
	Conditions = 
	{
		QuestIsSolved 	{Quest = "HeroCaineVictim3"},
	},
	Actions = 
	{
		DialogSetDisabled	{},	-- just in case
	},
	GotoState = "ENDE",
};

-- enthält State "MAIN" mit dem Dialogtoggle, sowie den State "ENDE"
dofile(GetScriptPath() .. "SQCaine_DialogsShared.lua")
