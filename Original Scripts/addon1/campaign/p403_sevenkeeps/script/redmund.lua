

--*******************************************************
--***                                                 ***
--***             	Redmunds Army  	       			  ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "NewModelArmy",
--*******************************************************
--***                                                 ***
--***               	NewModelArmy   		          ***
--***                                                 ***
--*******************************************************		
	--DialogSwitcher
	OnToggleEvent	
	{
		EventName = "RedmundsDialog",
		OnConditions =
		{
			MapValueIsLess	{Name = "mv_RedmundsSoldatenAnzahl", Value = 20},
			QuestIsActive {Quest = "SevenkeepsA1_GetFood"},	
		},
		OnActions = 
		{
			DialogSetEnabled	{Tag = "Redmund" },
			DialogTypeSetMainQuest	{Tag = "Redmund"},
		},
		OffConditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_RedmundsSoldatenAnzahl", Value = 20},
			QuestIsActive {Quest = "SevenkeepsA1_GetFood"},	
		},
		OffActions = 
		{
			DialogSetDisabled	{Tag = "Redmund"},
		},
	},
	
};

 
