-----------------------------------------------------------
--
--	Katapulte
--
-----------------------------------------------------------

State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SF2A1_1_Akt"},
		},
		Actions =
		{
			FigureHoldPosition {},
			FigureSwappingDisable {},
		},
	},
}