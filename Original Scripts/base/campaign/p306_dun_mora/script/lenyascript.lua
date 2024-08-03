-- LenyaScript.lua
State
{
	StateName = "LenyaState",
	
	OnOneTimeLeverEvent
	{
		Lever = LeverTag,
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = LenyaAmount},
			ObjectVanish	{},
		},
	},
};
