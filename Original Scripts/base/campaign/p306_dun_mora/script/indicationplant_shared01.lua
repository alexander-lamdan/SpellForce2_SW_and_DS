------------------------------------------------------------------------------------
			--Warnung durch Indikatorenpflanzen waehrend Attack1--
------------------------------------------------------------------------------------


State
{
	StateName = "Warning01",	
	
	--kurz nach Outcry Shae Warning
	--Pflanzenlampen AN: ObjectChange zu DemonPlant_effect
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IndicatorDemonAttack1_on"},		
		},
		
		Actions = 
		{
			
			ObjectChange	{Tag = "default", ObjectId = 1580, X = default, Y = default, Direction = default},
		},                      
	},                          
    


	

--Daemonen ziehen sich zurueck
--Pflanzenlampen AUS: ObjectChange zu DemonPlant
	OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IndicatorDemonAttack1_off"},		
		},
		Actions = 
		{
			ObjectChange	{Tag = "default", ObjectId = 1083, X = default, Y = default, Direction = default},
		},
	},
	
}
	

------------------------------------------------------------------------------------
			--Warnung durch Indikatorenpflanzen waehrend Attack2--
------------------------------------------------------------------------------------


State
{
	StateName = "Warning02",	
	
	--kurz nach Outcry Shae Warning
	--Pflanzenlampen AN: ObjectChange zu DemonPlant_effect
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IndicatorDemonAttack2_on"},		
		},
		
		Actions = 
		{
			
			ObjectChange	{Tag = "default", ObjectId = 1580, X = default, Y = default, Direction = default},
			
		},                      
	},                          
    


	

--Daemonen ziehen sich zurueck
--Pflanzenlampen AUS: ObjectChange zu DemonPlant
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IndicatorDemonAttack2_off"},		
		},
		Actions = 
		{
	
			
			ObjectChange	{Tag = "default", ObjectId = 1083, X = default, Y = default, Direction = default},
			
			
			
		},
	},
	
}
	


State
{
	StateName = "Off",	
	OnOneTimeEvent	
	{	
		GotoState = "Warning02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IndicatorDemonAttack2_on"},	
		}, 
		Actions = 
		{
			--MapFlagSetFalse	{Name = "mf_IndicatorDemonAttack2_on"},	
		}, 
		
	},
}


State
{
	StateName = "End",	
	
}