
 
TagMyLeader =      
{                        
	[1] = "IslandBlessed01",
	[2] = "IslandBlessed02",
	[3] = "IslandBlessed03",
	[4] = "IslandBlessed04",
	[5] = "IslandBlessed05",
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
			--FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = TagMyLeader[MyMaster], Range = 5},
			FigureIsAlive	{Tag = TagMyLeader[MyMaster]},
			FigureHasNotHealth	{Tag = TagMyLeader[MyMaster], Percent = 80},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};


   
};
