--*******************************************************
--***                                                 ***
--***               Citadel Addon1					  ***
--***			    Doors			                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	
	--MonsterGate
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsDead	{Tag = "GateMonster"},
			MapFlagIsTrue {Name = "mf_P406_StartIntroCS"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "CityGate1"},
			GateSetOpen	{Tag = "CityGate2"},
		},
		
	},
	
	--die beiden ersten Tore.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DoorCitadel1"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "DoorCitadel2"},
			DialogSetDisabled	{Tag = "GateCitadel2"},
		},
		
	},
	--die beiden ersten Tore.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DoorCitadel2"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "DoorCitadel1"},
			DialogSetDisabled	{Tag = "GateCitadel1"},
		},
		
	},
	
	OnOneTimeLeverEvent	
    {
    	Lever = "MainGateLever2", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 297.904, Y = 201.533},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "CityGate4"},
    		MapFlagSetTrue {Name = "mf_CityGate4Open"},
    	},
    },	
    
    OnOneTimeLeverEvent	
    {
    	Lever = "MainGateLever1", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 190.417, Y = 297.757},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "CityGate3"},
    		MapFlagSetTrue {Name = "mf_CityGate3Open"},
    	},
    },	
};