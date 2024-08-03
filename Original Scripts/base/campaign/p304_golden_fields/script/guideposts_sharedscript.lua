State
{
	StateName = "MainState",
   
   	OnEvent
	{
		Conditions =
		{
			MapValueIsNotEqual	{Name = "mv_GuidepostInfo", Value = MyValue },
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7 , X = GetEntityX(), Y = GetEntityY()},
		},
		Actions =
		{
			FigureOutcry{TextTag = MyOutcryTag, Tag = "pl_HumanAvatar"},
			MapValueSet{Name = "mv_GuidepostInfo", Value = MyValue },
		},
	},
}
