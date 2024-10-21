
 
MyPowerSourceMapFlag =      
{                        
	[1] = "mf_Source1Disabled",
	[2] = "mf_Source2Disabled",
	[3] = "mf_Source3Disabled",
	[4] = "mf_Source4Disabled",
	[5] = "mf_Source5Disabled",
}    

MyISpawnedMapFlag =      
{                        
	[1] = "mf_Blessed01Spawned",
	[2] = "mf_Blessed02Spawned",
	[3] = "mf_Blessed03Spawned",
	[4] = "mf_Blessed04Spawned",
	[5] = "mf_Blessed05Spawned",
}                     



State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = MyPowerSourceMapFlag[MyPowerSource]},
			GameInterfaceIsVisible{},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = MyISpawnedMapFlag[MyPowerSource]},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};


   
};
