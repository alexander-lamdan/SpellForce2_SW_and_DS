State
{	
	StateName = "InitState",
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya01", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya01"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya02", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya02"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya03", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			MapFlagSetTrue {Name = "mf_SpawnGardenMonster1"},	
			ObjectVanish	{Tag = "LeverLenya03"},
			
		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya04", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya04"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya05", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya05"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya06", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			MapFlagSetTrue {Name = "mf_SpawnGardenMonster2"},	
			ObjectVanish	{Tag = "LeverLenya06"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya07", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya07"},

		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "LeverLenya08", 
		OnConditions = 
		{

		}, 
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			ObjectVanish	{Tag = "LeverLenya08"},

		},
	},

};